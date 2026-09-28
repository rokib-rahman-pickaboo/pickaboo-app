import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/cache/auth_cache_manager.dart';
import 'package:pickaboo/core/cache/fast_cache_manager.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/repository/cart_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

/// Central Shopping Cart BLoC.
///
/// Manages both guest carts (`guest-carts/{cartId}`) and customer carts (`/carts/mine`),
/// line-item mutations, promotional coupons, reward point deductions, and checkout calculations.
///
/// ### Concurrency Architecture:
/// - **Mutating Operations (`sequential()`):** Events modifying quote contents ([_AddToCart],
///   [_AddItemSmart], [_UpdateItemQuantity], [_RemoveItem], [_EmptyCart], [_ApplyCoupon],
///   [_ApplyRewardPoints], [_MergeGuestCart]) are processed sequentially to prevent backend quote
///   version conflicts and race conditions.
/// - **Query Operations (`restartable()`):** Quote fetching ([_GetCart], [_LoadGuestCart])
///   cancels outdated in-flight network requests when a newer fetch is triggered.
/// - **Pull-to-Refresh (`droppable()`):** [_RefreshCart] ignores rapid repeated gestures
///   until the ongoing refresh completes.
///
/// ### Performance & UX Optimizations:
/// - **Zero-Latency Badge Count:** Persists [currentCartCount] to [FastCacheManager] synchronously,
///   allowing navigation bars and headers to display badge counts instantly on app cold start.
/// - **Empty-State Flash Prevention:** Uses [_isPendingAddition] and [markAdditionPending]
///   so [CartPage] knows an addition is in flight and never flashes [EmptyCartView] during route transitions.
/// - **Point Lock Safety:** [_releaseRewardPointsBeforeDrain] automatically resets applied club points
///   before draining or emptying the cart to prevent orphan locked points on backend quotes.
@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;
  final AuthCacheManager _cacheManager;
  final AnalyticsService _analytics;

  static const String _cachedCartCountKey = 'CACHED_CART_COUNT';

  CartEntity? __currentCart;
  set _currentCart(CartEntity? cart) {
    __currentCart = cart;
    FastCacheManager.setInt(_cachedCartCountKey, cart?.itemsCount ?? 0);
  }
  CartEntity? get _currentCart => __currentCart;

  /// Synchronously returns current cart count, falling back to persisted cache on cold start.
  int get currentCartCount =>
      __currentCart?.itemsCount ?? FastCacheManager.getInt(_cachedCartCountKey) ?? 0;

  String? _guestCartId;
  bool _isMerging = false;
  bool _isPendingAddition = false;

  /// In-memory cached cart getter for immediate instant-open screen rendering.
  CartEntity? get currentCart => _currentCart;

  /// Whether an item addition (Buy Now / Add to Cart / Reorder) is in flight.
  /// CartPage uses this to guarantee it NEVER flashes EmptyCartView while items are being added.
  bool get isPendingAddition => _isPendingAddition;

  /// Synchronously marks that an item addition is in progress before pushing Cart route.
  void markAdditionPending() {
    _isPendingAddition = true;
  }

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
    on<_ClearCartSession>(_onClearCartSession, transformer: sequential());
  }

  /// Fetches cart for either guest or authenticated user.
  ///
  /// Dispatches guest cart creation/loading if unauthenticated. If authenticated,
  /// verifies whether a pending guest cart needs to be merged before fetching the user's cart.
  Future<void> _onGetCart(_GetCart event, Emitter<CartState> emit) async {

    final token = await _cacheManager.getToken();
    final isGuest = token == null || token.isEmpty;

    if (isGuest) {
      final guestCartId = await _cacheManager.getGuestCartId() ?? _guestCartId;

      if (guestCartId != null && guestCartId.isNotEmpty) {
        add(CartEvent.loadGuestCart(guestCartId: guestCartId));
      } else {
        _forgetCart();
        add(const CartEvent.createGuestCart());
      }
      return;
    }

    // Authenticated user flow:
    if (_isMerging) {
      emit(const CartState.loading());
      return;
    }

    final guestCartId = await _cacheManager.getGuestCartId();
    if (guestCartId != null && guestCartId.isNotEmpty) {
      _forgetCart();
      emit(const CartState.loading());
      add(CartEvent.mergeGuestCart(guestCartId: guestCartId));
      return;
    }

    if (_currentCart != null && _currentCart!.items.isNotEmpty) {
      emit(CartState.loaded(_currentCart!));
    } else {
      emit(const CartState.loading());
    }

    await _fetchAndEmitAuthCart(emit);
  }

  /// Fetches basic customer cart, recreates quote if expired or missing,
  /// enriches items with checkout calculations, and emits [CartState.loaded] or [CartState.empty].
  Future<void> _fetchAndEmitAuthCart(Emitter<CartState> emit) async {
    final result = await repository.getBasicCart();

    await result.fold(
      (error) async {
        _isPendingAddition = false;

        final createResult = await repository.createCart();
        await createResult.fold(
          (createError) async {
            _isPendingAddition = false;
            emit(const CartState.empty());
          },
          (quoteId) async {
            _isPendingAddition = false;
            await _cacheManager.setAuthQuoteId(quoteId: quoteId);
            emit(const CartState.empty());
          },
        );
      },
      (cart) async {
        await _cacheManager.setAuthQuoteId(quoteId: cart.id);

        if (cart.items.isEmpty) {
          _isPendingAddition = false;
          emit(const CartState.empty());
          _forgetCart();
        } else {
          final enrichedCart = await _withCheckoutTotals(cart);
          _currentCart = enrichedCart;
          _isPendingAddition = false;
          emit(CartState.loaded(enrichedCart));
        }
      },
    );
  }

  /// Augments basic cart items with backend-calculated checkout totals
  /// (discounts, taxes, shipping estimations, and grand totals).
  Future<CartEntity> _withCheckoutTotals(CartEntity cart) async {
    final result = await repository.getCartCheckout();
    return result.fold(
      (_) => cart,
      (checkout) {
        final mergedCart = _checkoutToCartEntity(checkout);
        _currentCart = mergedCart;
        return mergedCart;
      },
    );
  }

  /// Clears in-memory cart cache and sets persisted count to 0.
  void _forgetCart() {
    _currentCart = null;
  }

  /// Wipes all cart session state (guest cart ID, auth quote ID, memory caches)
  /// and prepares a fresh guest quote.
  Future<void> _onClearCartSession(
    _ClearCartSession event,
    Emitter<CartState> emit,
  ) async {
    _forgetCart();
    _guestCartId = null;
    await _cacheManager.clearGuestCartId();
    await _cacheManager.clearAuthQuoteId();
    emit(const CartState.empty());
    add(const CartEvent.createGuestCart());
  }

  /// Releases applied reward points on the specified cart.
  Future<void> _releaseRewardPoints(
    String cartId, {
    required String reason,
  }) async {
    if (cartId.isEmpty) {
      return;
    }

    final token = await _cacheManager.getToken();
    if (token == null || token.isEmpty) {
      return;
    }

    await repository.applyRewardPoints(
      cartId: cartId,
      pointAmount: 0,
    );
  }

  /// Safeguard: If the cart has only 1 remaining item and it is about to be removed,
  /// this resets applied club points to 0 to prevent locked points on backend quotes.
  Future<void> _releaseRewardPointsBeforeDrain(String reason) async {
    final cart = _currentCart;
    if (cart == null || cart.items.length != 1) return;

    await _releaseRewardPoints(cart.id, reason: reason);
  }

  /// Refreshes current cart without resetting UI into full-screen loading.
  Future<void> _onRefreshCart(
    _RefreshCart event,
    Emitter<CartState> emit,
  ) async {
    final token = await _cacheManager.getToken();
    final isGuest = token == null || token.isEmpty;

    if (isGuest) {
      final guestCartId = await _cacheManager.getGuestCartId() ?? _guestCartId;
      if (guestCartId != null && guestCartId.isNotEmpty) {
        final result = await repository.getGuestCart(cartId: guestCartId);
        result.fold(
          (error) {},
          (cart) {
            _currentCart = cart;
            _guestCartId = guestCartId;
            if (cart.items.isEmpty) {
              emit(const CartState.empty());
              _forgetCart();
            } else {
              emit(CartState.loaded(cart));
            }
          },
        );
      } else {
        _forgetCart();
        emit(const CartState.empty());
      }
      return;
    }

    final result = await repository.getBasicCart();

    await result.fold(
      (error) async {

        final createResult = await repository.createCart();
        await createResult.fold(
          (createError) async {
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
          final enrichedCart = await _withCheckoutTotals(cart);
          _currentCart = enrichedCart;
          emit(CartState.loaded(enrichedCart));
        }
      },
    );
  }

  /// Clears stored guest quote ID.
  Future<void> clearGuestCart() async {
    await _cacheManager.clearGuestCartId();
    _guestCartId = null;
  }

  /// Merges guest cart items into authenticated user quote on login.
  ///
  /// Resolves customer ID, calls the backend merge endpoint, clears guest quote cache,
  /// and refetches the authenticated cart with updated items and totals.
  Future<void> _onMergeGuestCart(
    _MergeGuestCart event,
    Emitter<CartState> emit,
  ) async {
    if (_isMerging) {
      return;
    }
    _isMerging = true;

    // Immediately clear in-memory cart and emit loading so no screen shows
    // the partial/unmerged guest items.
    _forgetCart();
    emit(const CartState.loading());

    try {

      int customerId = 0;

      final cachedUserId = await _cacheManager.getUserId();
      if (cachedUserId != null && cachedUserId.isNotEmpty) {
        customerId = int.tryParse(cachedUserId) ?? 0;
      }

      if (customerId == 0) {
        final cartResult = await repository.getBasicCart();
        cartResult.fold(
          (_) {},
          (cart) {
            if (cart.customer?.id != null) {
              customerId = cart.customer!.id;
            }
          },
        );
      }

      if (customerId == 0) {
        await _cacheManager.clearGuestCartId();
        _guestCartId = null;
        await _fetchAndEmitAuthCart(emit);
        return;
      }

      final result = await repository.mergeGuestCart(
        guestCartId: event.guestCartId,
        customerId: customerId,
        storeId: 1,
      );

      await result.fold(
        (error) async {
          await _cacheManager.clearGuestCartId();
          _guestCartId = null;
          await _fetchAndEmitAuthCart(emit);
        },
        (success) async {
          await _cacheManager.clearGuestCartId();
          _guestCartId = null;
          await _fetchAndEmitAuthCart(emit);
        },
      );
    } finally {
      _isMerging = false;
    }
  }

  /// Adds an item to the authenticated user's cart.
  ///
  /// Validates configurable options, marks addition as pending to protect [CartPage]
  /// from flashing empty state, logs analytics on success, and re-fetches enriched checkout totals.
  Future<void> _onAddToCart(_AddToCart event, Emitter<CartState> emit) async {
    _isPendingAddition = true;
    try {
      final error = _validateAddToCart(
        event.productType,
        event.configurableOptions,
      );
      if (error != null) {
        _isPendingAddition = false;
        emit(
          CartState.error(
            error: AppErrorEntity(message: error),
            lastCart: _currentCart,
          ),
        );
        return;
      }

      if (_currentCart != null && _currentCart!.items.isNotEmpty) {
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
          _isPendingAddition = false;
          emit(CartState.error(error: error, lastCart: _currentCart));
        },
        (item) async {
          final cartResult = await repository.getBasicCart();
          await cartResult.fold(
            (error) async {
              _isPendingAddition = false;
              emit(CartState.error(error: error, lastCart: _currentCart));
            },
            (cart) async {
              final enrichedCart = await _withCheckoutTotals(cart);
              _currentCart = enrichedCart;
              _isPendingAddition = false;
              _analytics.logAddToCart(
                id: item.sku,
                name: item.name,
                price: item.price,
                quantity: item.qty,
              );
              emit(
                CartState.itemAdded(cart: enrichedCart, message: 'Item added to cart'),
              );

              emit(CartState.loaded(enrichedCart));
            },
          );
        },
      );
    } catch (e) {
      _isPendingAddition = false;
      emit(
        CartState.error(
          error: AppErrorEntity(message: e.toString()),
          lastCart: _currentCart,
        ),
      );
    }
  }

  /// Updates line item quantity for either guest or authenticated user cart.
  ///
  /// Performs an optimistic local recalculation of subtotal and grand total so the UI
  /// updates immediately, then sends the update to the backend and recalculates authoritative checkout totals.
  Future<void> _onUpdateItemQuantity(
    _UpdateItemQuantity event,
    Emitter<CartState> emit,
  ) async {
    final previousCart = _currentCart;

    // 1. Calculate interim cart state with updated quantity and estimated row total
    CartEntity? interimCart = previousCart;
    if (previousCart != null) {
      final updatedItems = previousCart.items.map((cartItem) {
        if (cartItem.itemId == event.itemId) {
          final unitPrice = cartItem.specialPrice > 0
              ? cartItem.specialPrice
              : cartItem.price;
          final newRowTotal = unitPrice * event.qty;
          return cartItem.copyWith(
            qty: event.qty,
            rowTotal: newRowTotal,
          );
        }
        return cartItem;
      }).toList();

      final newSubtotal = updatedItems.fold<double>(
        0.0,
        (sum, item) => sum + item.rowTotal,
      );
      final newGrandTotal = newSubtotal -
          previousCart.discountAmount -
          previousCart.rewardPointsDiscount +
          previousCart.shippingAmount +
          previousCart.taxAmount;

      interimCart = previousCart.copyWith(
        items: updatedItems,
        subtotal: newSubtotal,
        grandTotal: newGrandTotal > 0 ? newGrandTotal : 0.0,
      );

      _currentCart = interimCart;
      // Immediately emit operationInProgress so the UI displays the loader
      emit(CartState.operationInProgress(
        cart: interimCart,
        operation: 'updating_quantity',
      ));
    }

    final token = await _cacheManager.getToken();
    final isGuest = token == null || token.isEmpty;

    String? guestCartId = _guestCartId;
    if (isGuest && guestCartId == null) {
      guestCartId = await _cacheManager.getGuestCartId();
    }
    final effectiveQuoteId = event.quoteId.isNotEmpty
        ? event.quoteId
        : (_currentCart?.id ?? '');

    // 2. Synchronize with backend and recheck authoritative price & totals
    try {
      final updateResult = isGuest
          ? (guestCartId != null && guestCartId.isNotEmpty
              ? await repository.updateGuestItem(
                  cartId: guestCartId,
                  itemId: event.itemId,
                  qty: event.qty,
                  quoteId: guestCartId,
                )
              : null)
          : await repository.updateItem(
              itemId: event.itemId,
              qty: event.qty,
              quoteId: effectiveQuoteId,
            );

      if (updateResult != null) {
        await updateResult.fold(
          (error) async {
            if (previousCart != null) {
              _currentCart = previousCart;
            }
            emit(CartState.error(error: error, lastCart: previousCart));
          },
          (_) async {
            // Backend update succeeded: fetch fresh cart to recalculate prices & checkout totals
            final cartResult = isGuest
                ? await repository.getGuestCart(cartId: guestCartId!)
                : await repository.getBasicCart();

            await cartResult.fold(
              (error) async {
                emit(CartState.loaded(_currentCart ?? interimCart ?? previousCart!));
              },
              (freshCart) async {
                final enrichedCart = isGuest
                    ? freshCart
                    : await _withCheckoutTotals(freshCart);
                _currentCart = enrichedCart;
                emit(CartState.loaded(enrichedCart));
              },
            );
          },
        );
      } else {
        if (interimCart != null) {
          emit(CartState.loaded(interimCart));
        }
      }
    } catch (e) {
      if (interimCart != null) {
        emit(CartState.loaded(interimCart));
      }
    }
  }

  /// Removes a line item from the cart.
  ///
  /// Automatically releases applied reward points if removing the final item, preventing
  /// orphaned points on backend quotes. Emits empty state if no items remain.
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

    String? guestCartId = _guestCartId;
    if (isGuest && guestCartId == null) {
      guestCartId = await _cacheManager.getGuestCartId();
    }

    if (isGuest && (guestCartId == null || guestCartId.isEmpty)) {
      _forgetCart();
      emit(const CartState.empty());
      add(const CartEvent.createGuestCart());
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
              final finalCart = isGuest ? cart : await _withCheckoutTotals(cart);
              _currentCart = finalCart;
              emit(CartState.loaded(finalCart));
            }
          },
        );
      },
    );
  }

  /// Completely empties the cart and releases any applied club reward points.
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

  /// Applies a promo or coupon code to the active cart quote and recalculates totals.
  Future<void> _onApplyCoupon(
    _ApplyCoupon event,
    Emitter<CartState> emit,
  ) async {

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
        emit(CartState.error(error: error, lastCart: _currentCart));
      },
      (success) async {
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
            emit(CartState.error(error: error, lastCart: _currentCart));
          },
          (checkout) {
            final cart = _checkoutToCartEntity(checkout);
            _currentCart = cart;
            emit(CartState.couponApplied(cart: cart, couponCode: cart.couponCode.isNotEmpty ? cart.couponCode : event.coupon));
            emit(CartState.loaded(cart));
          },
        );
      },
    );
  }

  /// Removes an applied coupon code and refreshes checkout totals.
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

  /// Applies customer club reward points as a monetary discount on the active quote.
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

  /// Removes applied reward points (resets point deduction to 0) and refreshes totals.
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

  /// Moves an item from cart to wishlist / saved-for-later.
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

  /// Creates a fresh guest quote on the backend and caches its masked ID.
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
      _forgetCart();
      emit(const CartState.empty());
    });
  }

  /// Adds an item to a guest cart quote.
  ///
  /// Persists the guestCartId if not previously saved, emits operation in progress,
  /// logs analytics upon success, and updates loaded cart state.
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

    if (_currentCart != null && _currentCart!.items.isNotEmpty) {
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

  /// Loads guest cart contents from the backend.
  ///
  /// Resilient recovery: If the quote has expired or was removed on the backend
  /// (HTTP 404 / "No such entity"), automatically creates a fresh guest quote.
  Future<void> _onLoadGuestCart(
    _LoadGuestCart event,
    Emitter<CartState> emit,
  ) async {
    if (_currentCart != null &&
        _currentCart!.items.isNotEmpty &&
        _guestCartId == event.guestCartId) {
      emit(CartState.loaded(_currentCart!));
    } else {
      emit(const CartState.loading());
    }

    final result = await repository.getGuestCart(cartId: event.guestCartId);

    await result.fold(
      (error) async {
        _isPendingAddition = false;

        if (error.message.contains('No such entity') ||
            error.message.contains('404')) {

          final createResult = await repository.createGuestCart();
          await createResult.fold(
            (createError) async => emit(CartState.error(error: createError, lastCart: _currentCart)),
            (cartId) async {
              await _cacheManager.setGuestCartId(cartId: cartId);
              _guestCartId = cartId;
              emit(const CartState.empty());
            },
          );
        } else {
          emit(CartState.error(error: error, lastCart: _currentCart));
        }
      },
      (cart) {
        _currentCart = cart;
        _guestCartId = event.guestCartId;
        if (cart.items.isEmpty) {
          _isPendingAddition = false;
          emit(const CartState.empty());
        } else {
          _isPendingAddition = false;
          emit(CartState.loaded(cart));
        }
      },
    );
  }

  /// Returns cached guest cart ID from memory or persistent storage.
  Future<String?> get storedGuestCartId async {
    if (_guestCartId != null) return _guestCartId;
    _guestCartId = await _cacheManager.getGuestCartId();
    return _guestCartId;
  }

  /// Unified smart entry point for adding items to cart across auth & guest sessions.
  ///
  /// Sets [_isPendingAddition] to true to prevent [CartPage] empty-state flicker,
  /// inspects auth token, and routes to either customer or guest addition flow.
  Future<void> _onAddItemSmart(
    _AddItemSmart event,
    Emitter<CartState> emit,
  ) async {
    _isPendingAddition = true;
    try {
      emit(
        _currentCart != null && _currentCart!.items.isNotEmpty
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
    } catch (e) {
      _isPendingAddition = false;
      emit(
        CartState.error(
          error: AppErrorEntity(message: e.toString()),
          lastCart: _currentCart,
        ),
      );
    }
  }

  /// Adds item for authenticated user using active customer cart quote.
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

  /// Adds item for guest user, auto-creating a guest cart quote if none exists yet.
  Future<void> _addItemForGuestUser(
    _AddItemSmart event,
    Emitter<CartState> emit,
  ) async {
    String? guestCartId = await _cacheManager.getGuestCartId();

    if (guestCartId == null || guestCartId.isEmpty) {
      final result = await repository.createGuestCart();
      await result.fold(
        (error) async {
          _isPendingAddition = false;
          emit(CartState.error(error: error));
        },
        (cartId) async {
          await _cacheManager.setGuestCartId(cartId: cartId);
          _guestCartId = cartId;

          await _performAddItem(event, emit, cartId, isGuest: true);
        },
      );
    } else {
      await _performAddItem(event, emit, guestCartId, isGuest: true);
    }
  }

  /// Core execution for adding an item with automatic recovery on expired quote IDs.
  ///
  /// If the quote has expired on the backend, guest carts are recreated and the addition
  /// is retried once seamlessly ([isRetry] = true).
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
      _isPendingAddition = false;
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
              (createError) async {
                _isPendingAddition = false;
                emit(CartState.error(error: createError, lastCart: _currentCart));
              },
              (cartId) async {
                await _cacheManager.setGuestCartId(cartId: cartId);
                _guestCartId = cartId;
                await _performAddItem(event, emit, cartId, isGuest: true, isRetry: true);
              },
            );
          } else {
            _isPendingAddition = false;
            emit(CartState.error(error: error, lastCart: _currentCart));
          }
        } else {
          _isPendingAddition = false;
          emit(CartState.error(error: error, lastCart: _currentCart));
        }
      },
      (item) async {
        final cartResult = isGuest
            ? await repository.getGuestCart(cartId: quoteId)
            : await repository.getBasicCart();

        await cartResult.fold(
          (error) async {
            _isPendingAddition = false;
            emit(CartState.error(error: error, lastCart: _currentCart));
          },
          (cart) async {
            final enrichedCart =
                isGuest ? cart : await _withCheckoutTotals(cart);
            _currentCart = enrichedCart;
            _isPendingAddition = false;
            _analytics.logAddToCart(
              id: item.sku,
              name: item.name,
              price: item.price,
              quantity: item.qty,
            );
            emit(
              CartState.itemAdded(
                cart: enrichedCart,
                message: 'Item added to cart',
              ),
            );
            emit(CartState.loaded(enrichedCart));
          },
        );
      },
    );
  }

  /// Initializes cart session during cold start or user authentication transitions.
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
      } else {
        _forgetCart();
        emit(const CartState.empty());
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
    double? segmentGrandTotal;
    double? segmentSubtotal;
    double? segmentShipping;
    for (final segment in totals.totalSegments) {
      switch (segment.code) {
        case 'grand_total':
          segmentGrandTotal = segment.value;
        case 'subtotal':
          segmentSubtotal = segment.value;
        case 'shipping':
          segmentShipping = segment.value;
        case 'rewards-spend':
        case 'rewards_spend':
          appliedPoints = segment.value.abs().round();
        case 'rewards-spend-amount':
        case 'rewards_spend_amount':
          rewardPointsDiscount = segment.value.abs();
        case 'rewards-spend-max-points':
        case 'rewards_spend_max_points':
          maxSpendablePoints = segment.value.abs().round();
        case 'rewards-spend-min-points':
        case 'rewards_spend_min_points':
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
      subtotal: segmentSubtotal ?? totals.subtotal,
      grandTotal: segmentGrandTotal ?? totals.grandTotal,
      discountAmount: segmentDiscount ?? totals.discountAmount,
      shippingAmount: segmentShipping ?? totals.shippingAmount,
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
