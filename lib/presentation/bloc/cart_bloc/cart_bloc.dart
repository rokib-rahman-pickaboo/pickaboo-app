import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/repository/cart_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;
  final AuthCacheManager _cacheManager;
  final AnalyticsService _analytics;

  CartEntity? _currentCart;
  String? _guestCartId;

  CartBloc(this.repository, this._cacheManager, this._analytics)
    : super(const CartState.initial()) {
    on<_GetCart>(_onGetCart, transformer: restartable());
    on<_RefreshCart>(_onRefreshCart, transformer: droppable());
    on<_AddToCart>(_onAddToCart, transformer: sequential());
    on<_AddItemSmart>(_onAddItemSmart, transformer: sequential());
    on<_UpdateItemQuantity>(_onUpdateItemQuantity, transformer: sequential());
    on<_RemoveItem>(_onRemoveItem, transformer: sequential());
    on<_EmptyCart>(_onEmptyCart, transformer: sequential());
    on<_ApplyCoupon>(_onApplyCoupon, transformer: sequential());
    on<_RemoveCoupon>(_onRemoveCoupon, transformer: sequential());
    on<_ApplyRewardPoints>(_onApplyRewardPoints, transformer: sequential());
    on<_RemoveRewardPoints>(_onRemoveRewardPoints, transformer: sequential());
    on<_SaveForLater>(_onSaveForLater, transformer: sequential());
    on<_CreateGuestCart>(_onCreateGuestCart, transformer: sequential());
    on<_AddToGuestCart>(_onAddToGuestCart, transformer: sequential());
    on<_LoadGuestCart>(_onLoadGuestCart, transformer: restartable());
    on<_MergeGuestCart>(_onMergeGuestCart, transformer: sequential());
    on<_InitializeSession>(_onInitializeSession, transformer: sequential());
  }

  Future<void> _onGetCart(_GetCart event, Emitter<CartState> emit) async {
    if (kDebugMode) print('🔵 CartBloc: _onGetCart called');
    emit(const CartState.loading());

    final token = await _cacheManager.getToken();
    final isGuest = token == null || token.isEmpty;

    if (kDebugMode) {
      print('🔍 CartBloc: User is ${isGuest ? "GUEST" : "AUTHENTICATED"}');
    }

    if (isGuest) {
      final guestCartId = await _cacheManager.getGuestCartId();

      if (guestCartId != null && guestCartId.isNotEmpty) {
        if (kDebugMode) {
          print('📋 CartBloc: Loading existing guest cart: $guestCartId');
        }
        add(CartEvent.loadGuestCart(guestCartId: guestCartId));
      } else {
        if (kDebugMode) print('➕ CartBloc: Creating new guest cart');
        add(const CartEvent.createGuestCart());
      }
      return;
    }

    final result = await repository.getBasicCart();

    await result.fold(
      (error) async {
        if (kDebugMode) print('❌ CartBloc: Load cart error - ${error.message}');

        if (kDebugMode) print('➕ CartBloc: Cart not found, creating new one');

        final createResult = await repository.createCart();
        await createResult.fold(
          (createError) async {
            if (kDebugMode) print('❌ CartBloc: Cart creation failed - ${createError.message}');
            emit(const CartState.empty());
          },
          (quoteId) async {
            if (kDebugMode) print('✅ CartBloc: New cart created: $quoteId');
            await _cacheManager.setAuthQuoteId(quoteId: quoteId);
            emit(const CartState.empty());
          },
        );
      },
      (cart) async {
        _currentCart = cart;
        if (kDebugMode) {
          print('✅ CartBloc: Cart loaded successfully');
          print('  Cart ID: ${cart.id}');
          print('  Items count: ${cart.itemsCount}');
          print('  Items length: ${cart.items.length}');
        }
        await _cacheManager.setAuthQuoteId(quoteId: cart.id);

        if (cart.items.isEmpty) {
          if (kDebugMode) {
            print('📭 CartBloc: Emitting empty state');
          }
          emit(const CartState.empty());
          _forgetCart();
        } else {
          if (kDebugMode) {
            print(
              '📦 CartBloc: Emitting loaded state with ${cart.items.length} items',
            );
          }
          emit(CartState.loaded(await _withCheckoutTotals(cart)));
        }
      },
    );
  }

  Future<CartEntity> _withCheckoutTotals(CartEntity cart) async {
    final result = await repository.getCartCheckout();
    return result.fold(
      (_) => cart,
      (checkout) => _checkoutToCartEntity(checkout),
    );
  }

  void _forgetCart() {
    _currentCart = null;
  }

  Future<void> _releaseRewardPoints(
    String cartId, {
    required String reason,
  }) async {
    if (cartId.isEmpty) {
      if (kDebugMode) {
        print('🎁 CartBloc: skip point release ($reason) — no cart id');
      }
      return;
    }

    final token = await _cacheManager.getToken();
    if (token == null || token.isEmpty) {
      if (kDebugMode) {
        print('🎁 CartBloc: skip point release ($reason) — guest');
      }
      return;
    }

    final result = await repository.applyRewardPoints(
      cartId: cartId,
      pointAmount: 0,
    );

    if (kDebugMode) {
      result.fold(
        (error) => print(
          '🎁 CartBloc: point release FAILED ($reason) — ${error.message}',
        ),
        (_) => print('🎁 CartBloc: points released ($reason) on cart $cartId'),
      );
    }
  }

  Future<void> _releaseRewardPointsBeforeDrain(String reason) async {
    final cart = _currentCart;
    if (cart == null || cart.items.length != 1) return;

    await _releaseRewardPoints(cart.id, reason: reason);
  }

  Future<void> _onRefreshCart(
    _RefreshCart event,
    Emitter<CartState> emit,
  ) async {
    final result = await repository.getBasicCart();

    await result.fold(
      (error) async {
        if (kDebugMode) print('❌ CartBloc: Refresh cart error - ${error.message}');

        final createResult = await repository.createCart();
        await createResult.fold(
          (createError) async {
            if (kDebugMode) {
              print('❌ CartBloc: Cart creation failed - ${createError.message}');
            }
            emit(const CartState.empty());
          },
          (quoteId) async {
            await _cacheManager.setAuthQuoteId(quoteId: quoteId);
            emit(const CartState.empty());
          },
        );
      },
      (cart) async {
        _currentCart = cart;
        await _cacheManager.setAuthQuoteId(quoteId: cart.id);

        if (cart.items.isEmpty) {
          emit(const CartState.empty());
          _forgetCart();
        } else {
          emit(CartState.loaded(cart));
        }
      },
    );
  }

  Future<void> clearGuestCart() async {
    await _cacheManager.clearGuestCartId();
    _guestCartId = null;
  }

  Future<void> _onMergeGuestCart(
    _MergeGuestCart event,
    Emitter<CartState> emit,
  ) async {
    if (kDebugMode) {
      print('🔄 CartBloc: Merging guest cart ${event.guestCartId}');
    }

    int customerId = 0;

    if (_currentCart?.customer?.id != null) {
      customerId = _currentCart!.customer!.id;
    } else {
      final cartResult = await repository.getBasicCart();

      bool cartLoaded = false;
      await cartResult.fold(
        (error) async {
        },
        (cart) async {
          _currentCart = cart;
          if (cart.customer?.id != null) {
            customerId = cart.customer!.id;
            cartLoaded = true;
          }
        },
      );

      if (!cartLoaded || customerId == 0) {
        emit(
          const CartState.error(
            error: AppErrorEntity(
              message:
                  'Customer ID not found for merge. Please ensure you are logged in.',
            ),
          ),
        );
        return;
      }
    }

    emit(const CartState.loading());

    final result = await repository.mergeGuestCart(
      guestCartId: event.guestCartId,
      customerId: customerId,
      storeId: 1,
    );

    await result.fold(
      (error) async {
        emit(CartState.error(error: error));
      },
      (success) async {
        if (success) {
          await _cacheManager.clearGuestCartId();
          _guestCartId = null;

          add(const CartEvent.getCart());
        } else {
          emit(
            const CartState.error(
              error: AppErrorEntity(message: 'Failed to merge cart'),
            ),
          );
        }
      },
    );
  }

  Future<void> _onAddToCart(_AddToCart event, Emitter<CartState> emit) async {
    final error = _validateAddToCart(
      event.productType,
      event.configurableOptions,
    );
    if (error != null) {
      emit(
        CartState.error(
          error: AppErrorEntity(message: error),
          lastCart: _currentCart,
        ),
      );
      return;
    }

    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'adding_item',
        ),
      );
    } else {
      emit(const CartState.loading());
    }

    final result = await repository.addItem(
      sku: event.sku,
      qty: event.qty,
      quoteId: event.quoteId,
      productType: event.productType,
      configurableOptions: event.configurableOptions,
    );

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (item) async {
        final cartResult = await repository.getBasicCart();
        cartResult.fold(
          (error) =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (cart) {
            _currentCart = cart;
            _analytics.logAddToCart(
              id: item.sku,
              name: item.name,
              price: item.price,
              quantity: item.qty,
            );
            emit(
              CartState.itemAdded(cart: cart, message: 'Item added to cart'),
            );

            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  Future<void> _onUpdateItemQuantity(
    _UpdateItemQuantity event,
    Emitter<CartState> emit,
  ) async {
    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'updating_quantity',
        ),
      );
    }

    final token = await _cacheManager.getToken();
    final isGuest = token == null || token.isEmpty;

    if (kDebugMode) {
      print('🔄 Updating item quantity - Guest: $isGuest');
    }

    String? guestCartId = _guestCartId;
    if (isGuest && guestCartId == null && _currentCart != null) {
      guestCartId = await _cacheManager.getGuestCartId();
    }

    if (isGuest && (guestCartId == null || guestCartId.isEmpty)) {
      emit(CartState.error(
        error: AppErrorEntity(message: 'Guest cart session not found'),
        lastCart: _currentCart,
      ));
      return;
    }

    final result = isGuest
        ? await repository.updateGuestItem(
            cartId: guestCartId!,
            itemId: event.itemId,
            qty: event.qty,
            quoteId: guestCartId,
          )
        : await repository.updateItem(
            itemId: event.itemId,
            qty: event.qty,
            quoteId: event.quoteId,
          );

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (item) async {
        final cartResult = isGuest
            ? await repository.getGuestCart(cartId: guestCartId!)
            : await repository.getBasicCart();

        await cartResult.fold(
          (error) async =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (cart) async {
            if (cart.items.isEmpty) {
              emit(const CartState.empty());
              _forgetCart();
            } else {
              _currentCart = cart;
              emit(CartState.loaded(cart));
            }
          },
        );
      },
    );
  }

  Future<void> _onRemoveItem(_RemoveItem event, Emitter<CartState> emit) async {
    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'removing_item',
        ),
      );
    }

    final token = await _cacheManager.getToken();
    final isGuest = token == null || token.isEmpty;

    if (kDebugMode) {
      print('🗑️ Removing item - Guest: $isGuest, ItemID: ${event.itemId}');
    }

    String? guestCartId = _guestCartId;
    if (isGuest && guestCartId == null) {
      guestCartId = await _cacheManager.getGuestCartId();
    }

    if (isGuest && (guestCartId == null || guestCartId.isEmpty)) {
      emit(CartState.error(
        error: AppErrorEntity(message: 'Guest cart session not found'),
        lastCart: _currentCart,
      ));
      return;
    }

    if (!isGuest) {
      await _releaseRewardPointsBeforeDrain('removing last item');
    }

    final result = isGuest
        ? await repository.deleteGuestItem(
            cartId: guestCartId!,
            itemId: event.itemId,
          )
        : await repository.deleteItem(itemId: event.itemId);

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (_) async {
        final cartResult = isGuest
            ? await repository.getGuestCart(cartId: guestCartId!)
            : await repository.getBasicCart();

        await cartResult.fold(
          (error) async =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (cart) async {
            if (cart.items.isEmpty) {
              emit(const CartState.empty());
              _forgetCart();
            } else {
              _currentCart = cart;
              emit(CartState.loaded(cart));
            }
          },
        );
      },
    );
  }

  Future<void> _onEmptyCart(_EmptyCart event, Emitter<CartState> emit) async {
    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'emptying_cart',
        ),
      );
    }

    await _releaseRewardPoints(event.quoteId, reason: 'emptying cart');

    final result = await repository.emptyCart(quoteId: event.quoteId);

    await result.fold(
      (error) async =>
          emit(CartState.error(error: error, lastCart: _currentCart)),
      (_) async {
        emit(const CartState.empty());
        _forgetCart();
      },
    );
  }

  Future<void> _onApplyCoupon(
    _ApplyCoupon event,
    Emitter<CartState> emit,
  ) async {
    if (kDebugMode) {
      print('🎟️ CartBloc: Applying coupon "${event.coupon}" to cart "${event.cartId}"');
    }

    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'applying_coupon',
        ),
      );
    }

    final result = await repository.applyCoupon(
      cartId: event.cartId,
      coupon: event.coupon,
    );

    await result.fold(
      (error) async {
        if (kDebugMode) {
          print('❌ CartBloc: Apply coupon FAILED - ${error.message}');
        }
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (success) async {
        if (kDebugMode) {
          print('✅ CartBloc: Apply coupon API returned success=$success');
          print('🔄 CartBloc: Reloading cart via checkout API to get totals...');
        }
        if (!success) {
          emit(
            CartState.error(
              error: const AppErrorEntity(
                message:
                    "This discount code isn't valid. Please check the code "
                    "and try again.",
              ),
              lastCart: _currentCart,
            ),
          );
          return;
        }
        final checkoutResult = await repository.getCartCheckout();
        checkoutResult.fold(
          (error) {
            if (kDebugMode) {
              print('❌ CartBloc: Reload checkout after coupon FAILED - ${error.message}');
            }
            emit(CartState.error(error: error, lastCart: _currentCart));
          },
          (checkout) {
            final cart = _checkoutToCartEntity(checkout);
            if (kDebugMode) {
              print('✅ CartBloc: Cart reloaded after coupon apply');
              print('  couponCode: "${cart.couponCode}"');
              print('  discountAmount: ${cart.discountAmount}');
              print('  grandTotal: ${cart.grandTotal}');
              print('  subtotal: ${cart.subtotal}');
            }
            _currentCart = cart;
            emit(CartState.couponApplied(cart: cart, couponCode: cart.couponCode.isNotEmpty ? cart.couponCode : event.coupon));
            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  Future<void> _onRemoveCoupon(
    _RemoveCoupon event,
    Emitter<CartState> emit,
  ) async {
    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'removing_coupon',
        ),
      );
    }

    final result = await repository.removeCoupon(cartId: event.cartId);

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (_) async {
        final checkoutResult = await repository.getCartCheckout();
        checkoutResult.fold(
          (error) =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (checkout) {
            final cart = _checkoutToCartEntity(checkout);
            _currentCart = cart;
            emit(CartState.couponRemoved(cart: cart));
            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  Future<void> _onApplyRewardPoints(
    _ApplyRewardPoints event,
    Emitter<CartState> emit,
  ) async {
    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'applying_points',
        ),
      );
    }

    final result = await repository.applyRewardPoints(
      cartId: event.cartId,
      pointAmount: event.pointAmount,
    );

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (_) async {
        final checkoutResult = await repository.getCartCheckout();
        checkoutResult.fold(
          (error) =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (checkout) {
            final cart = _checkoutToCartEntity(checkout);
            _currentCart = cart;
            emit(
              CartState.rewardPointsApplied(
                cart: cart,
                pointsUsed: event.pointAmount,
              ),
            );
            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  Future<void> _onRemoveRewardPoints(
    _RemoveRewardPoints event,
    Emitter<CartState> emit,
  ) async {
    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'removing_points',
        ),
      );
    }

    final result = await repository.applyRewardPoints(
      cartId: event.cartId,
      pointAmount: 0,
    );

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (_) async {
        final checkoutResult = await repository.getCartCheckout();
        checkoutResult.fold(
          (error) =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (checkout) {
            final cart = _checkoutToCartEntity(checkout);
            _currentCart = cart;
            emit(CartState.rewardPointsRemoved(cart: cart));
            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  Future<void> _onSaveForLater(
    _SaveForLater event,
    Emitter<CartState> emit,
  ) async {
    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'saving_for_later',
        ),
      );
    }

    await _releaseRewardPointsBeforeDrain('saving last item for later');

    final result = await repository.saveForLater(
      customerId: event.customerId,
      cartId: event.cartId,
      itemId: event.itemId,
    );

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (_) async {
        final cartResult = await repository.getBasicCart();
        await cartResult.fold(
          (error) async =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (cart) async {
            if (cart.items.isEmpty) {
              emit(const CartState.empty());
              _forgetCart();
            } else {
              _currentCart = cart;
              emit(CartState.loaded(cart));
            }
          },
        );
      },
    );
  }

  Future<void> _onCreateGuestCart(
    _CreateGuestCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());

    final result = await repository.createGuestCart();

    await result.fold((error) async => emit(CartState.error(error: error)), (
      cartId,
    ) async {
      await _cacheManager.setGuestCartId(cartId: cartId);
      _guestCartId = cartId;
      emit(const CartState.empty());
    });
  }

  Future<void> _onAddToGuestCart(
    _AddToGuestCart event,
    Emitter<CartState> emit,
  ) async {
    final error = _validateAddToCart(
      event.productType,
      event.configurableOptions,
    );
    if (error != null) {
      emit(
        CartState.error(
          error: AppErrorEntity(message: error),
          lastCart: _currentCart,
        ),
      );
      return;
    }

    if (_currentCart != null) {
      emit(
        CartState.operationInProgress(
          cart: _currentCart!,
          operation: 'adding_item',
        ),
      );
    } else {
      emit(const CartState.loading());
    }

    final result = await repository.addGuestItem(
      cartId: event.guestCartId,
      sku: event.sku,
      qty: event.qty,
      quoteId: event.quoteId,
      productType: event.productType,
      configurableOptions: event.configurableOptions,
    );

    await result.fold(
      (error) async {
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (item) async {
        if (_guestCartId == null) {
          await _cacheManager.setGuestCartId(cartId: event.guestCartId);
          _guestCartId = event.guestCartId;
        }

        final cartResult = await repository.getGuestCart(
          cartId: event.guestCartId,
        );
        cartResult.fold(
          (error) =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (cart) {
            _currentCart = cart;
            _analytics.logAddToCart(
              id: item.sku,
              name: item.name,
              price: item.price,
              quantity: item.qty,
            );
            emit(
              CartState.itemAdded(cart: cart, message: 'Item added to cart'),
            );

            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  Future<void> _onLoadGuestCart(
    _LoadGuestCart event,
    Emitter<CartState> emit,
  ) async {
    if (kDebugMode) {
      print(
        '🔵 CartBloc: _onLoadGuestCart called with ID: ${event.guestCartId}',
      );
    }
    emit(const CartState.loading());

    final result = await repository.getGuestCart(cartId: event.guestCartId);

    await result.fold(
      (error) async {
        if (kDebugMode) {
          print('❌ CartBloc: Load guest cart error - ${error.message}');
        }

        if (error.message.contains('No such entity') ||
            error.message.contains('404')) {
          if (kDebugMode) {
            print('➕ CartBloc: Guest cart not found, creating new one');
          }

          final createResult = await repository.createGuestCart();
          await createResult.fold(
            (createError) async => emit(CartState.error(error: createError)),
            (cartId) async {
              await _cacheManager.setGuestCartId(cartId: cartId);
              _guestCartId = cartId;
              emit(const CartState.empty());
            },
          );
        } else {
          emit(CartState.error(error: error));
        }
      },
      (cart) {
        _currentCart = cart;
        _guestCartId = event.guestCartId;
        if (kDebugMode) {
          print('✅ CartBloc: Guest cart loaded successfully');
          print('  Cart ID: ${cart.id}');
          print('  Items count: ${cart.itemsCount}');
          print('  Items length: ${cart.items.length}');
        }
        if (cart.items.isEmpty) {
          if (kDebugMode) {
            print('📭 CartBloc: Emitting empty state');
          }
          emit(const CartState.empty());
        } else {
          if (kDebugMode) {
            print(
              '📦 CartBloc: Emitting loaded state with ${cart.items.length} items',
            );
          }
          emit(CartState.loaded(cart));
        }
      },
    );
  }

  Future<String?> get storedGuestCartId async {
    if (_guestCartId != null) return _guestCartId;
    _guestCartId = await _cacheManager.getGuestCartId();
    return _guestCartId;
  }

  Future<void> _onAddItemSmart(
    _AddItemSmart event,
    Emitter<CartState> emit,
  ) async {
    emit(
      _currentCart != null
          ? CartState.operationInProgress(
              cart: _currentCart!,
              operation: 'adding_item',
            )
          : const CartState.loading(),
    );

    final token = await _cacheManager.getToken();

    if (token != null && token.isNotEmpty) {
      await _addItemForAuthUser(event, emit);
    } else {
      await _addItemForGuestUser(event, emit);
    }
  }

  Future<void> _addItemForAuthUser(
    _AddItemSmart event,
    Emitter<CartState> emit,
  ) async {
    final cartResult = await repository.getBasicCart();

    await cartResult.fold(
      (error) async {
        final String quoteId = _currentCart?.id ?? '';
        await _performAddItem(event, emit, quoteId, isGuest: false);
      },
      (cart) async {
        await _performAddItem(event, emit, cart.id, isGuest: false);
      },
    );
  }

  Future<void> _addItemForGuestUser(
    _AddItemSmart event,
    Emitter<CartState> emit,
  ) async {
    String? guestCartId = await _cacheManager.getGuestCartId();

    if (guestCartId == null || guestCartId.isEmpty) {
      final result = await repository.createGuestCart();
      await result.fold((error) async => emit(CartState.error(error: error)), (
        cartId,
      ) async {
        await _cacheManager.setGuestCartId(cartId: cartId);
        _guestCartId = cartId;

        await _performAddItem(event, emit, cartId, isGuest: true);
      });
    } else {
      await _performAddItem(event, emit, guestCartId, isGuest: true);
    }
  }

  Future<void> _performAddItem(
    _AddItemSmart event,
    Emitter<CartState> emit,
    String quoteId, {
    required bool isGuest,
    bool isRetry = false,
  }) async {
    final error = _validateAddToCart(
      event.productType,
      event.configurableOptions,
    );
    if (error != null) {
      emit(
        CartState.error(
          error: AppErrorEntity(message: error),
          lastCart: _currentCart,
        ),
      );
      return;
    }

    final result = isGuest
        ? await repository.addGuestItem(
            cartId: quoteId,
            sku: event.sku,
            qty: event.qty,
            quoteId: quoteId,
            productType: event.productType,
            configurableOptions: event.configurableOptions,
          )
        : await repository.addItem(
            sku: event.sku,
            qty: event.qty,
            quoteId: quoteId,
            productType: event.productType,
            configurableOptions: event.configurableOptions,
          );

    await result.fold(
      (error) async {
        if (!isRetry &&
            (error.message.toLowerCase().contains('expired') ||
                error.message.toLowerCase().contains('invalid') ||
                error.message.toLowerCase().contains('unauthorized'))) {
          if (isGuest) {
            await _cacheManager.clearGuestCartId();
            _guestCartId = null;
            final result = await repository.createGuestCart();
            await result.fold(
              (createError) async =>
                  emit(CartState.error(error: createError, lastCart: _currentCart)),
              (cartId) async {
                await _cacheManager.setGuestCartId(cartId: cartId);
                _guestCartId = cartId;
                await _performAddItem(event, emit, cartId, isGuest: true, isRetry: true);
              },
            );
          } else {
            emit(CartState.error(error: error, lastCart: _currentCart));
          }
        } else {
          emit(CartState.error(error: error, lastCart: _currentCart));
        }
      },
      (item) async {
        final cartResult = isGuest
            ? await repository.getGuestCart(cartId: quoteId)
            : await repository.getBasicCart();

        cartResult.fold(
          (error) =>
              emit(CartState.error(error: error, lastCart: _currentCart)),
          (cart) {
            _currentCart = cart;
            emit(
              CartState.itemAdded(cart: cart, message: 'Item added to cart'),
            );
            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  Future<void> _onInitializeSession(
    _InitializeSession event,
    Emitter<CartState> emit,
  ) async {
    final token = await _cacheManager.getToken();

    if (token != null && token.isNotEmpty) {
      final result = await repository.getBasicCart();
      await result.fold(
        (error) async {
          final createResult = await repository.createCart();
          await createResult.fold(
            (createError) async {
            },
            (quoteId) async {
              await _cacheManager.setAuthQuoteId(quoteId: quoteId);
            },
          );
        },
        (cart) async {
          _currentCart = cart;
          await _cacheManager.setAuthQuoteId(quoteId: cart.id);
          if (cart.items.isNotEmpty) {
            emit(CartState.loaded(cart));
          } else {
            emit(const CartState.empty());
            _forgetCart();
          }
        },
      );
    } else {
      final guestCartId = await _cacheManager.getGuestCartId();
      if (guestCartId != null) {
        add(CartEvent.loadGuestCart(guestCartId: guestCartId));
      }
    }
  }

  String? _validateAddToCart(
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  ) {
    if (productType == null || productType.isEmpty) {
      return 'Product type is required';
    }

    if (productType == 'configurable') {
      if (configurableOptions == null || configurableOptions.isEmpty) {
        return 'Please choose product options';
      }
    }
    return null;
  }

  CartEntity _checkoutToCartEntity(CheckoutEntity checkout) {
    final totals = checkout.cartTotals;

    double rewardPointsDiscount = 0;
    int maxSpendablePoints = 0;
    int minSpendablePoints = 0;
    int appliedPoints = 0;
    String discountTitle = '';
    double? segmentDiscount;
    for (final segment in totals.totalSegments) {
      switch (segment.code) {
        case 'rewards-spend':
          appliedPoints = segment.value.abs().round();
        case 'rewards-spend-amount':
          rewardPointsDiscount = segment.value.abs();
        case 'rewards-spend-max-points':
          maxSpendablePoints = segment.value.abs().round();
        case 'rewards-spend-min-points':
          minSpendablePoints = segment.value.abs().round();
        case 'discount':
          discountTitle = segment.title;
          segmentDiscount = segment.value;
      }
    }

    final pointsToEarn = checkout.cart.items.fold<int>(
      0,
      (sum, item) => sum + item.earnPoints * item.qty,
    );

    return CartEntity(
      id: checkout.cart.id.toString(),
      itemsCount: checkout.cart.itemsCount,
      items: checkout.cart.items,
      subtotal: totals.subtotal,
      grandTotal: totals.grandTotal,
      discountAmount: segmentDiscount ?? totals.discountAmount,
      shippingAmount: totals.shippingAmount,
      taxAmount: totals.taxAmount,
      couponCode: totals.couponCode,
      rewardPointsDiscount: rewardPointsDiscount,
      maxSpendablePoints: maxSpendablePoints,
      minSpendablePoints: minSpendablePoints,
      appliedPoints: appliedPoints,
      pointsToEarn: pointsToEarn,
      discountTitle: discountTitle,
      customer: checkout.cart.customer,
      billingAddress: checkout.cart.billingAddress,
      shippingAddress: checkout.cart.shippingAddress,
    );
  }
}
