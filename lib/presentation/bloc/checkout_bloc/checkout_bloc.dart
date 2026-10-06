import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/checkout/shipping_method_entity.dart';
import 'package:pickaboo/domain/repository/cart_repository.dart';
import 'package:pickaboo/data/services/analytics_service.dart';

part 'checkout_bloc.freezed.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartRepository repository;
  final AnalyticsService _analytics;

  CheckoutEntity? _currentCheckout;

  AddressEntity? _selectedShippingAddress;
  AddressEntity? _selectedBillingAddress;
  String? _selectedPaymentMethod;
  String? _selectedShippingMethodCode;
  List<ShippingMethodEntity> _availableShippingMethods = [];
  List<PaymentMethodEntity> _availablePaymentMethods = [];
  static List<PaymentMethodEntity> _cachedPaymentMethods = [];
  static List<PaymentMethodEntity> get cachedPaymentMethods => _cachedPaymentMethods;
  static String? _cachedCartId;
  static String? get cachedCartId => _cachedCartId;

  int _estimateToken = 0;
  int _shippingMethodToken = 0;

  String? _selectedBkashAgreementId;

  String? _externalCustomerId;

  String? _bkashIdToken;
  String? _bkashOrderId;
  String? _bkashAmount;
  // ignore: unused_field
  String? _bkashAgreementId;
  // ignore: unused_field
  bool _bkashIsSavedAgreement = false;

  String? _pendingEmiBankName;
  int?    _pendingEmiTenure;
  String? _pendingEmiGateway;
  String? _pendingEmiMode;
  String? _pendingEmiQuoteId;

  CheckoutBloc(this.repository, this._analytics)
    : super(const CheckoutState.initial()) {
    on<_LoadCheckout>(_onLoadCheckout);
    on<_UpdateShippingAddress>(_onUpdateShippingAddress);
    on<_UpdateBillingAddress>(_onUpdateBillingAddress);
    on<_EstimateShipping>(_onEstimateShipping, transformer: restartable());
    on<_SelectShippingMethod>(
      _onSelectShippingMethod,
      transformer: restartable(),
    );
    on<_SelectPaymentMethod>(_onSelectPaymentMethod);
    on<_PlaceOrder>(_onPlaceOrder, transformer: droppable());
    on<_ProcessPayment>(_onProcessPayment);
    on<_ConfirmPayment>(_onConfirmPayment);
    on<_UpdateOrderPayment>(_onUpdateOrderPayment);
    on<_SyncOrderPaymentMethod>(
      _onSyncOrderPaymentMethod,
      transformer: sequential(),
    );
    on<_ConfirmOrder>(_onConfirmOrder);
    on<_OnPaymentWebViewResult>(_onOnPaymentWebViewResult);
    on<_BkashAgreementCallback>(_onBkashAgreementCallback);
    on<_BkashPaymentCallback>(_onBkashPaymentCallback);
    on<_NagadCallback>(_onNagadCallback);
    on<_PathaoPayCallback>(_onPathaoPayCallback, transformer: droppable());
    on<_SelectSavedBkashAgreement>(_onSelectSavedBkashAgreement);
    on<_ClearSavedBkashAgreement>(_onClearSavedBkashAgreement);
    on<_LoadPaymentInfo>(_onLoadPaymentInfo);
    on<_ResetCheckout>(_onResetCheckout);
    on<_LoadEmiDetails>(_onLoadEmiDetails);
    on<_StoreEmiSelection>(_onStoreEmiSelection);
    on<_ConfirmEmiSelection>(_onConfirmEmiSelection);
  }

  void storeCustomerId(String customerId) {
    if (customerId.isNotEmpty) {
      _externalCustomerId = customerId;
    }
  }

  Future<void> _onLoadCheckout(
    _LoadCheckout event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.getCartCheckout();

    result.fold(
      (error) {
        emit(CheckoutState.error(error: error));
      },
      (checkout) {
        _currentCheckout = checkout;
        _cachedCartId = checkout.cart.id.toString();
        _selectedShippingMethodCode = null;
        _availableShippingMethods = [];
        _availablePaymentMethods = [];

        if (_selectedShippingAddress == null) {
          if (checkout.cart.shippingAddress != null &&
              checkout.cart.shippingAddress?.firstname?.isNotEmpty == true) {
            _selectedShippingAddress = checkout.cart.shippingAddress;
          } else if (checkout.cart.customer?.addresses.isNotEmpty ?? false) {
            _selectedShippingAddress = checkout.cart.customer!.addresses
                .firstWhere(
                  (element) => element.defaultShipping,
                  orElse: () => checkout.cart.customer!.addresses.first,
                );
          }
        }

        if (_selectedBillingAddress == null) {
          if (checkout.cart.customer?.addresses.isNotEmpty ?? false) {
            try {
              _selectedBillingAddress = checkout.cart.customer!.addresses
                  .firstWhere((element) => element.defaultBilling);
            } catch (_) {}
          }

          if (_selectedBillingAddress == null &&
              checkout.cart.billingAddress?.firstname?.isNotEmpty == true) {
            _selectedBillingAddress = checkout.cart.billingAddress;
          }

          if (_selectedBillingAddress == null &&
              _selectedShippingAddress != null) {
            _selectedBillingAddress = _selectedShippingAddress;
          }
        }

        if (kDebugMode) {
          if (_selectedShippingAddress != null) {
          }
          if (_selectedBillingAddress != null) {
          }
        }

        if (_selectedShippingAddress != null) {
          add(
            CheckoutEvent.estimateShipping(address: _selectedShippingAddress!),
          );
        }

        emit(
          CheckoutState.checkoutLoaded(
            checkout: checkout,
            selectedShippingAddress: _selectedShippingAddress,
            selectedBillingAddress: _selectedBillingAddress,
            selectedPaymentMethod: _selectedPaymentMethod,
            selectedShippingMethodCode: _selectedShippingMethodCode,
            availableShippingMethods: _availableShippingMethods,
            availablePaymentMethods: _availablePaymentMethods,
          ),
        );
      },
    );
  }

  void _onUpdateShippingAddress(
    _UpdateShippingAddress event,
    Emitter<CheckoutState> emit,
  ) {

    _selectedShippingAddress = event.address;
    _selectedBillingAddress ??= event.address;
    _availableShippingMethods = [];
    _availablePaymentMethods = [];

    add(CheckoutEvent.estimateShipping(address: event.address));

    if (_currentCheckout != null) {
      emit(
        CheckoutState.checkoutLoaded(
          checkout: _currentCheckout!,
          selectedShippingAddress: _selectedShippingAddress,
          selectedBillingAddress: _selectedBillingAddress,
          selectedPaymentMethod: _selectedPaymentMethod,
          selectedShippingMethodCode: _selectedShippingMethodCode,
          availableShippingMethods: _availableShippingMethods,
          availablePaymentMethods: _availablePaymentMethods,
        ),
      );
    }
  }

  void _onUpdateBillingAddress(
    _UpdateBillingAddress event,
    Emitter<CheckoutState> emit,
  ) {

    _selectedBillingAddress = event.address;

    if (_currentCheckout != null) {
      emit(
        CheckoutState.checkoutLoaded(
          checkout: _currentCheckout!,
          selectedShippingAddress: _selectedShippingAddress,
          selectedBillingAddress: _selectedBillingAddress,
          selectedPaymentMethod: _selectedPaymentMethod,
          selectedShippingMethodCode: state is _CheckoutLoaded
              ? (state as _CheckoutLoaded).selectedShippingMethodCode
              : null,
          availableShippingMethods: state is _CheckoutLoaded
              ? (state as _CheckoutLoaded).availableShippingMethods
              : [],
          availablePaymentMethods: state is _CheckoutLoaded
              ? (state as _CheckoutLoaded).availablePaymentMethods
              : [],
        ),
      );

      if (_selectedShippingMethodCode != null &&
          _selectedShippingAddress != null) {
        final parts = _selectedShippingMethodCode!.split('_');
        if (parts.length >= 2) {
          final carrierCode = parts[0];
          final methodCode = parts.sublist(1).join('_');

          add(
            CheckoutEvent.selectShippingMethod(
              carrierCode: carrierCode,
              methodCode: methodCode,
            ),
          );
        }
      }
    }
  }

  Future<void> _onEstimateShipping(
    _EstimateShipping event,
    Emitter<CheckoutState> emit,
  ) async {

    final token = ++_estimateToken;

    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.estimateShippingMethods(
      address: event.address,
    );

    if (token != _estimateToken) {
      return;
    }

    result.fold(
      (error) {
        _availableShippingMethods = [];
        _selectedShippingMethodCode = null;
        emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
        if (_currentCheckout != null) emit(_checkoutLoadedState());
      },
      (methods) {
        _availableShippingMethods = methods;

        if (methods.isNotEmpty) {
          final isCurrentValid = _selectedShippingMethodCode != null &&
              methods.any(
                (m) =>
                    "${m.carrierCode}_${m.methodCode}" ==
                    _selectedShippingMethodCode,
              );

          if (isCurrentValid) {
            // Keep user's selection and ensure it is saved with the current address
            final parts = _selectedShippingMethodCode!.split('_');
            if (parts.length >= 2) {
              add(
                CheckoutEvent.selectShippingMethod(
                  carrierCode: parts[0],
                  methodCode: parts.sublist(1).join('_'),
                ),
              );
            }
          } else {
            final first = methods.first;
            _selectedShippingMethodCode =
                "${first.carrierCode}_${first.methodCode}";

            add(
              CheckoutEvent.selectShippingMethod(
                carrierCode: first.carrierCode,
                methodCode: first.methodCode,
              ),
            );
          }
        } else {
          _selectedShippingMethodCode = null;
        }

        if (_currentCheckout != null) {
          emit(
            CheckoutState.checkoutLoaded(
              checkout: _currentCheckout!,
              selectedShippingAddress: _selectedShippingAddress,
              selectedBillingAddress: _selectedBillingAddress,
              selectedPaymentMethod: _selectedPaymentMethod,
              availableShippingMethods: _availableShippingMethods,
              availablePaymentMethods: _availablePaymentMethods,
              selectedShippingMethodCode: _selectedShippingMethodCode,
            ),
          );
        }
      },
    );
  }

  CheckoutState _checkoutLoadedState() => CheckoutState.checkoutLoaded(
    checkout: _currentCheckout!,
    selectedShippingAddress: _selectedShippingAddress,
    selectedBillingAddress: _selectedBillingAddress,
    selectedPaymentMethod: _selectedPaymentMethod,
    availableShippingMethods: _availableShippingMethods,
    availablePaymentMethods: _availablePaymentMethods,
    selectedShippingMethodCode: _selectedShippingMethodCode,
  );

  Future<void> _onSelectShippingMethod(
    _SelectShippingMethod event,
    Emitter<CheckoutState> emit,
  ) async {

    if (_selectedShippingAddress == null) {
      emit(
        const CheckoutState.error(
          error: AppErrorEntity(
            message: 'Please select a shipping address first',
          ),
        ),
      );
      return;
    }

    final previousCode = _selectedShippingMethodCode;
    final newCode = "${event.carrierCode}_${event.methodCode}";

    final isKnownMethod = _availableShippingMethods.any(
      (m) => m.carrierCode == event.carrierCode && m.methodCode == event.methodCode,
    );
    if (!isKnownMethod) {
      return;
    }

    final token = ++_shippingMethodToken;

    _selectedShippingMethodCode = newCode;
    if (_currentCheckout != null) {
      emit(_checkoutLoadedState());
    }

    final result = await repository.saveShippingInformation(
      address: _selectedShippingAddress!,
      carrierCode: event.carrierCode,
      methodCode: event.methodCode,
      billingAddress: _selectedBillingAddress,
    );

    if (token != _shippingMethodToken) {
      return;
    }

    await result.fold(
      (error) async {
        if (token != _shippingMethodToken) return;
        _selectedShippingMethodCode = previousCode;
        if (_currentCheckout != null) {
          emit(_checkoutLoadedState());
        } else {
          emit(
            CheckoutState.error(error: error, lastCheckout: _currentCheckout),
          );
        }
      },
      (paymentInfo) async {
        if (token != _shippingMethodToken) return;
        if (_currentCheckout != null && paymentInfo.totals != null) {
          _currentCheckout = CheckoutEntity(
            cart: _currentCheckout!.cart,
            cartTotals: paymentInfo.totals!,
          );
        }

        if (_currentCheckout != null) {
          _selectedShippingMethodCode = newCode;
          _availablePaymentMethods = paymentInfo.paymentMethods;
          if (paymentInfo.paymentMethods.isNotEmpty) {
            _cachedPaymentMethods = paymentInfo.paymentMethods;
          }
          _cachedCartId = _currentCheckout!.cart.id.toString();
          emit(_checkoutLoadedState());

          final cartId = _currentCheckout!.cart.id.toString();
          final hasSubtitles = _availablePaymentMethods.any(
            (m) => m.subtitle.trim().isNotEmpty,
          );
          if (cartId.isNotEmpty && cartId != '0' && !hasSubtitles) {
            final richInfoResult = await repository.getPaymentInfo(cartId: cartId);
            if (token != _shippingMethodToken) return;
            richInfoResult.fold(
              (_) {},
              (richInfo) {
                if (token != _shippingMethodToken) return;
                final hasNewSubtitles = richInfo.paymentMethods.any(
                  (m) => m.subtitle.trim().isNotEmpty,
                );
                final hasNewTotals = richInfo.totals != null &&
                    richInfo.totals != _currentCheckout?.cartTotals;
                if ((richInfo.paymentMethods.isNotEmpty && hasNewSubtitles) ||
                    hasNewTotals) {
                  if (richInfo.paymentMethods.isNotEmpty) {
                    _availablePaymentMethods = richInfo.paymentMethods;
                    _cachedPaymentMethods = richInfo.paymentMethods;
                  }
                  if (_currentCheckout != null) {
                    if (richInfo.totals != null) {
                      _currentCheckout = CheckoutEntity(
                        cart: _currentCheckout!.cart,
                        cartTotals: richInfo.totals!,
                      );
                    }
                    emit(_checkoutLoadedState());
                  }
                }
              },
            );
          }
        }
      },
    );
  }

  Future<void> _onLoadPaymentInfo(
    _LoadPaymentInfo event,
    Emitter<CheckoutState> emit,
  ) async {

    final result = await repository.getPaymentInfo(cartId: event.cartId);

    result.fold(
      (error) {
        emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
      },
      (paymentInfo) {
        _availablePaymentMethods = paymentInfo.paymentMethods;
        if (paymentInfo.paymentMethods.isNotEmpty) {
          _cachedPaymentMethods = paymentInfo.paymentMethods;
        }
        _cachedCartId = event.cartId;

        if (_currentCheckout != null && paymentInfo.totals != null) {
          _currentCheckout = CheckoutEntity(
            cart: _currentCheckout!.cart,
            cartTotals: paymentInfo.totals!,
          );
        }

        if (kDebugMode) {
          for (final m in _availablePaymentMethods) {
            if (m.subtitle.isNotEmpty) {
            }
          }
        }

        if (_currentCheckout != null) {
          emit(
            CheckoutState.checkoutLoaded(
              checkout: _currentCheckout!,
              selectedShippingAddress: _selectedShippingAddress,
              selectedBillingAddress: _selectedBillingAddress,
              selectedPaymentMethod: _selectedPaymentMethod,
              availableShippingMethods: _availableShippingMethods,
              availablePaymentMethods: _availablePaymentMethods,
              selectedShippingMethodCode: _selectedShippingMethodCode,
            ),
          );
        } else {
          emit(
            CheckoutState.paymentMethodsLoaded(
              availablePaymentMethods: _availablePaymentMethods,
              totals: paymentInfo.totals,
            ),
          );
        }
      },
    );
  }

  Future<void> _onSelectPaymentMethod(
    _SelectPaymentMethod event,
    Emitter<CheckoutState> emit,
  ) async {

    _selectedPaymentMethod = event.paymentMethod;

    if (_currentCheckout != null) {
      emit(
        CheckoutState.checkoutLoaded(
          checkout: _currentCheckout!,
          selectedShippingAddress: _selectedShippingAddress,
          selectedBillingAddress: _selectedBillingAddress,
          selectedPaymentMethod: _selectedPaymentMethod,
          selectedShippingMethodCode: _selectedShippingMethodCode,
          availableShippingMethods: _availableShippingMethods,
          availablePaymentMethods: _availablePaymentMethods,
        ),
      );
    }

    final targetCartId = _currentCheckout?.cart.id.toString() ?? _cachedCartId;
    if (targetCartId != null && targetCartId.isNotEmpty && targetCartId != '0') {
      final result = await repository.selectPaymentMethod(
        cartId: targetCartId,
        method: event.paymentMethod,
      );

      result.fold(
        (error) {
          emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
        },
        (success) {
          add(CheckoutEvent.loadPaymentInfo(cartId: targetCartId));
        },
      );
    }
  }

  Future<void> _onPlaceOrder(
    _PlaceOrder event,
    Emitter<CheckoutState> emit,
  ) async {
    if (_currentCheckout == null) {
      emit(
        const CheckoutState.error(
          error: AppErrorEntity(message: 'Checkout data not loaded'),
        ),
      );
      return;
    }

    if (_selectedShippingAddress == null) {
      emit(
        const CheckoutState.error(
          error: AppErrorEntity(message: 'Please select a shipping address'),
        ),
      );
      return;
    }

    emit(CheckoutState.placingOrder(checkout: _currentCheckout!));

    final selectResult = await repository.selectPaymentMethod(
      cartId: _currentCheckout!.cart.id.toString(),
      method: "paymentpending",
    );

    await selectResult.fold(
      (error) async {
        emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
      },
      (success) async {
        final result = await repository.placeOrder(
          cartId: _currentCheckout!.cart.id.toString(),
          paymentMethodCode: "paymentpending",
        );

        result.fold(
          (error) => emit(
            CheckoutState.error(error: error, lastCheckout: _currentCheckout),
          ),
          (orderId) {
            final totalAmount = _currentCheckout!.cartTotals.grandTotal;
            final quoteId = _currentCheckout!.cart.id.toString();

            _analytics.logPurchase(
              orderId: orderId,
              total: totalAmount,
              items: _currentCheckout!.cart.items
                  .map(
                    (e) => {
                      'id': e.sku,
                      'name': e.name,
                      'price': e.price,
                      'qty': e.qty,
                    },
                  )
                  .toList(),
            );

            if (_selectedPaymentMethod == 'emi' &&
                _pendingEmiBankName != null &&
                _pendingEmiTenure   != null &&
                _pendingEmiGateway  != null &&
                _pendingEmiMode     != null) {
              add(CheckoutEvent.confirmEmiSelection(
                orderId:        orderId,
                quoteId:        _pendingEmiQuoteId ?? quoteId,
                bankName:       _pendingEmiBankName!,
                tenure:         _pendingEmiTenure!,
                paymentGateway: _pendingEmiGateway!,
                paymentMode:    _pendingEmiMode!,
              ));
              _pendingEmiBankName = null;
              _pendingEmiTenure   = null;
              _pendingEmiGateway  = null;
              _pendingEmiMode     = null;
              _pendingEmiQuoteId  = null;
              return;
            }

            emit(
              CheckoutState.orderPlaced(
                orderId: orderId,
                totalAmount: totalAmount,
                paymentMethod: _selectedPaymentMethod ?? '',
                checkout: _currentCheckout!,
                availablePaymentMethods: _availablePaymentMethods,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onProcessPayment(
    _ProcessPayment event,
    Emitter<CheckoutState> emit,
  ) async {
    final method = event.paymentMethod.toLowerCase();
    final gateway = event.paymentGateway?.toLowerCase() ?? '';

    emit(
      CheckoutState.paymentProcessing(
        orderId: event.orderId,
        paymentMethod: event.paymentMethod,
      ),
    );

    if (method == 'bkash') {
      final agreementId =
          event.paymentData?['agreementId']?.toString() ??
          event.paymentData?['agreement_id']?.toString() ??
          _selectedBkashAgreementId;
      if (agreementId != null && agreementId.isNotEmpty) {
        await _handleBkashSavedAgreementPayment(
          orderId: event.orderId,
          agreementId: agreementId,
          emit: emit,
        );
        return;
      }
      await _handleBkashPayment(event.orderId, emit);
      return;
    }

    if (method == 'dynamicpaymentgateway') {
      final agreementId =
          event.paymentData?['agreementId']?.toString() ??
          event.paymentData?['agreement_id']?.toString() ??
          _selectedBkashAgreementId;
      await _handleBkashSavedAgreementPayment(
        orderId: event.orderId,
        agreementId: agreementId,
        emit: emit,
      );
      return;
    }

    final isEbl = gateway.contains('ebl') ||
        (method.contains('ebl') && !method.contains('mastercard'));

    if (isEbl) {
      final eblResult = await repository.createEblOrder(
        orderId: event.orderId,
      );
      eblResult.fold(
        (error) => emit(
          CheckoutState.paymentFailed(
            orderId: event.orderId,
            errorMessage: error.message,
          ),
        ),
        (eblData) {
          final url = eblData['url']?.toString() ?? '';
          final formFields =
              (eblData['formFields'] as Map<String, String>?) ?? {};
          final exactTitle = _resolvePaymentMethodTitle(
            event.paymentMethod,
            fallback: 'Pickaboo EBL Mastercard',
          );
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: url,
              title: exactTitle,
              formFields: formFields.isEmpty ? null : formFields,
            ),
          );
        },
      );
      return;
    }

    final String? nagadReturnPath = method == 'nagad'
        ? ApiEndpoints.nagadCallbackUrl
        : null;

    final result = await repository.createDigitalOrder(
      orderId: event.orderId,
      paymentMethodCode: method,
      paymentGateway: event.paymentGateway,
      returnPath: nagadReturnPath,
    );

    result.fold(
      (error) {
        emit(
          CheckoutState.paymentFailed(
            orderId: event.orderId,
            errorMessage: error.message,
          ),
        );
      },
      (gatewayUrl) {
        final exactTitle = _resolvePaymentMethodTitle(
          event.paymentMethod,
          fallback: 'Payment',
        );
        emit(
          CheckoutState.navigateToPaymentGateway(
            url: gatewayUrl,
            title: exactTitle,
          ),
        );
      },
    );
  }

  Future<void> _handleBkashPayment(
    String orderId,
    Emitter<CheckoutState> emit,
  ) async {

    final tokenResult = await repository.bkashGetInitialToken();
    final String? idToken = tokenResult.fold((_) => null, (t) => t);

    if (idToken == null) {
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: 'bKash initialization failed: could not get token',
        ),
      );
      return;
    }

    _bkashIdToken = idToken;
    _bkashOrderId = orderId;
    _bkashAmount =
        _currentCheckout?.cartTotals.grandTotal.toString() ?? '0';

    final userId =
        _currentCheckout?.cart.customer?.id.toString() ??
        _externalCustomerId ??
        '';
    final agreementResult = await repository.bkashCreateAgreement(
      idToken: idToken,
      userId: userId,
      returnPath: ApiEndpoints.bkashAgreementCallbackUrl,
    );

    agreementResult.fold(
      (error) => emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: error.message,
        ),
      ),
      (data) {
        final bkashUrl = data['bkashURL'] as String?;
        if (bkashUrl != null) {
          final exactTitle = _resolvePaymentMethodTitle(
            'bkash',
            fallback: 'bKash Payment',
          );
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: bkashUrl,
              title: exactTitle,
            ),
          );
        } else {
          emit(
            CheckoutState.paymentFailed(
              orderId: orderId,
              errorMessage: 'bKash returned no redirect URL',
            ),
          );
        }
      },
    );
  }

  Future<void> _handleBkashSavedAgreementPayment({
    required String orderId,
    required String? agreementId,
    required Emitter<CheckoutState> emit,
  }) async {
    if (agreementId == null || agreementId.isEmpty) {
      await _handleBkashPayment(orderId, emit);
      return;
    }

    final tokenResult = await repository.bkashGetInitialToken();
    final String? idToken = tokenResult.fold((_) => null, (t) => t);

    if (idToken == null) {
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: 'bKash initialization failed: could not get token',
        ),
      );
      return;
    }

    _bkashIdToken = idToken;
    _bkashOrderId = orderId;
    _bkashAmount =
        _currentCheckout?.cartTotals.grandTotal.toString() ?? '0';

    _bkashAgreementId = agreementId;
    _bkashIsSavedAgreement = true;

    final paymentResult = await repository.bkashCreatePayment(
      idToken: idToken,
      agreementId: agreementId,
      amount: _bkashAmount!,
      orderId: orderId,
      returnPath: ApiEndpoints.bkashPaymentCallbackUrl,
    );

    paymentResult.fold(
      (error) => emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: error.message,
        ),
      ),
      (data) {
        final bkashUrl = data['bkashURL'] as String?;
        if (bkashUrl != null) {
          final exactTitle = _resolvePaymentMethodTitle(
            'bkash',
            fallback: 'bKash Payment',
          );
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: bkashUrl,
              title: exactTitle,
            ),
          );
        } else {
          emit(
            CheckoutState.paymentFailed(
              orderId: orderId,
              errorMessage: 'bKash returned no redirect URL',
            ),
          );
        }
      },
    );
  }

  Future<void> _onBkashAgreementCallback(
    _BkashAgreementCallback event,
    Emitter<CheckoutState> emit,
  ) async {
    final idToken = _bkashIdToken;
    final orderId = _bkashOrderId;
    final amount = _bkashAmount;

    if (idToken == null || orderId == null) {
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId ?? '',
          errorMessage: 'bKash session expired. Please try again.',
        ),
      );
      return;
    }

    emit(CheckoutState.paymentProcessing(
      orderId: orderId,
      paymentMethod: 'bkash',
    ));

    final execResult = await repository.bkashExecuteAgreement(
      idToken: idToken,
      paymentId: event.paymentId,
    );

    final Map<String, dynamic>? agreementData = execResult.fold(
      (error) {
        return null;
      },
      (data) => data,
    );

    if (agreementData == null) {
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: 'bKash agreement execution failed',
        ),
      );
      return;
    }

    final agreementId =
        agreementData['agreementID']?.toString() ??
        agreementData['agreementId']?.toString() ?? '';

    if (agreementId.isEmpty) {
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: 'bKash did not return an agreementID',
        ),
      );
      return;
    }

    _bkashAgreementId = agreementId;
    _bkashIsSavedAgreement = false;

    final paymentResult = await repository.bkashCreatePayment(
      idToken: idToken,
      agreementId: agreementId,
      amount: amount ?? '0',
      orderId: orderId,
      returnPath: ApiEndpoints.bkashPaymentCallbackUrl,
    );

    paymentResult.fold(
      (error) => emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: error.message,
        ),
      ),
      (data) {
        final bkashUrl = data['bkashURL'] as String?;
        if (bkashUrl != null) {
          final exactTitle = _resolvePaymentMethodTitle(
            'bkash',
            fallback: 'bKash Payment',
          );
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: bkashUrl,
              title: exactTitle,
            ),
          );
        } else {
          emit(
            CheckoutState.paymentFailed(
              orderId: orderId,
              errorMessage: 'bKash payment returned no redirect URL',
            ),
          );
        }
      },
    );
  }

  Future<void> _onBkashPaymentCallback(
    _BkashPaymentCallback event,
    Emitter<CheckoutState> emit,
  ) async {
    final idToken = _bkashIdToken;
    final orderId = _bkashOrderId;

    if (idToken == null || orderId == null) {
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId ?? '',
          errorMessage: 'bKash session expired. Please try again.',
        ),
      );
      return;
    }

    emit(CheckoutState.paymentProcessing(
      orderId: orderId,
      paymentMethod: 'bkash',
    ));

    final execResult = await repository.bkashExecutePayment(
      idToken: idToken,
      paymentId: event.paymentId,
    );

    await execResult.fold(
      (error) async => emit(
        CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: error.message,
        ),
      ),
      (data) async {
        final statusCode = data['statusCode']?.toString() ?? '';
        final trxId = data['trxID']?.toString() ?? event.paymentId;
        if (statusCode == '0000' || data['transactionStatus'] == 'Completed') {

          _bkashIdToken = null;
          _bkashOrderId = null;
          _bkashAmount = null;
          _bkashAgreementId = null;
          _bkashIsSavedAgreement = false;

          emit(
            CheckoutState.paymentSuccess(
              orderId: orderId,
              transactionId: trxId,
              totalAmount: _currentCheckout?.cartTotals.grandTotal ?? 0.0,
            ),
          );
        } else {
          emit(
            CheckoutState.paymentFailed(
              orderId: orderId,
              errorMessage: data['statusMessage']?.toString() ??
                  'bKash payment execution failed',
            ),
          );
        }
      },
    );
  }

  Future<void> _onNagadCallback(
    _NagadCallback event,
    Emitter<CheckoutState> emit,
  ) async {
    final orderId =
        event.callbackParams['order_id'] ?? _bkashOrderId ?? '';
    final status =
        (event.callbackParams['status'] ?? '').toLowerCase();

    emit(CheckoutState.paymentProcessing(
      orderId: orderId,
      paymentMethod: 'nagad',
    ));

    final finalizeResult = await repository.nagadFinalizePayment(
      callbackParams: event.callbackParams,
    );

    final isSuccess = status == 'success' || status == 'successful';

    await finalizeResult.fold(
      (error) async {
        emit(CheckoutState.paymentFailed(
          orderId: orderId,
          errorMessage: error.message,
        ));
      },
      (_) async {
        if (isSuccess) {
          await repository.confirmOrder(orderId: orderId);

          emit(CheckoutState.paymentSuccess(
            orderId: orderId,
            transactionId:
                event.callbackParams['payment_ref_id'] ??
                event.callbackParams['order_id'] ??
                orderId,
            totalAmount: _currentCheckout?.cartTotals.grandTotal ?? 0.0,
          ));
        } else {
          emit(CheckoutState.paymentFailed(
            orderId: orderId,
            errorMessage:
                event.callbackParams['message'] ?? 'Nagad payment failed',
          ));
        }
      },
    );
  }

  Future<void> _onPathaoPayCallback(
    _PathaoPayCallback event,
    Emitter<CheckoutState> emit,
  ) async {
    final params = event.callbackParams;
    final orderId = params['order_id'] ?? params['orderId'] ?? '';
    final ppayStatus =
        (params['ppay_status'] ?? params['status'] ?? '').toUpperCase();
    final isCompleted = ppayStatus == 'COMPLETED' || ppayStatus == 'SUCCESS';

    if (!isCompleted) {
      emit(CheckoutState.paymentFailed(
        orderId: orderId,
        errorMessage: params['message'] ?? 'Pathao Pay payment was not completed',
      ));
      return;
    }

    emit(CheckoutState.paymentProcessing(
      orderId: orderId,
      paymentMethod: 'pathaopay',
    ));

    final captureResult = await repository.pathaoPayCapture(
      callbackParams: params,
    );

    captureResult.fold(
      (error) => emit(CheckoutState.paymentFailed(
        orderId: orderId,
        errorMessage: error.message.isNotEmpty
            ? error.message
            : 'Pathao Pay payment could not be verified',
      )),
      (captured) {
        if (!captured) {
          emit(CheckoutState.paymentFailed(
            orderId: orderId,
            errorMessage: 'Pathao Pay payment could not be verified',
          ));
          return;
        }
        emit(CheckoutState.paymentSuccess(
          orderId: orderId,
          transactionId: params['transaction_id'] ??
              params['trx_id'] ??
              params['payment_id'] ??
              orderId,
          totalAmount: _currentCheckout?.cartTotals.grandTotal ?? 0.0,
        ));
      },
    );
  }

  Future<void> _onOnPaymentWebViewResult(
    _OnPaymentWebViewResult event,
    Emitter<CheckoutState> emit,
  ) async {

    if (!event.success) {
      emit(
        CheckoutState.paymentFailed(
          orderId: event.orderId,
          errorMessage: event.message ?? 'Payment cancelled',
        ),
      );
      return;
    }

    emit(
      CheckoutState.paymentSuccess(
        orderId: event.orderId,
        transactionId: 'GATEWAY_APPROVED',
        totalAmount: _currentCheckout?.cartTotals.grandTotal ?? 0.0,
      ),
    );
  }

  void _onConfirmPayment(_ConfirmPayment event, Emitter<CheckoutState> emit) {
    final totalAmount = _currentCheckout?.cartTotals.grandTotal ?? 0.0;

    emit(
      CheckoutState.paymentSuccess(
        orderId: event.orderId,
        transactionId: event.transactionId,
        totalAmount: totalAmount,
      ),
    );
  }

  void _onSelectSavedBkashAgreement(
    _SelectSavedBkashAgreement event,
    Emitter<CheckoutState> emit,
  ) {
    _selectedBkashAgreementId = event.agreementId;
    _selectedPaymentMethod = 'bkash';
    if (_currentCheckout != null) {
      emit(CheckoutState.checkoutLoaded(
        checkout: _currentCheckout!,
        selectedShippingAddress: _selectedShippingAddress,
        selectedBillingAddress: _selectedBillingAddress,
        selectedPaymentMethod: _selectedPaymentMethod,
        selectedShippingMethodCode: _selectedShippingMethodCode,
        availableShippingMethods: _availableShippingMethods,
        availablePaymentMethods: _availablePaymentMethods,
      ));
    }
  }

  void _onClearSavedBkashAgreement(
    _ClearSavedBkashAgreement event,
    Emitter<CheckoutState> emit,
  ) {
    _selectedBkashAgreementId = null;
  }

  void _onStoreEmiSelection(
    _StoreEmiSelection event,
    Emitter<CheckoutState> emit,
  ) {
    _pendingEmiBankName = event.bankName;
    _pendingEmiTenure   = event.tenure;
    _pendingEmiGateway  = event.paymentGateway;
    _pendingEmiMode     = event.paymentMode;
    _pendingEmiQuoteId  = event.quoteId;

    if (_currentCheckout != null) {
      emit(CheckoutState.checkoutLoaded(
        checkout: _currentCheckout!,
        selectedShippingAddress: _selectedShippingAddress,
        selectedBillingAddress: _selectedBillingAddress,
        selectedPaymentMethod: 'emi',
        selectedShippingMethodCode: _selectedShippingMethodCode,
        availableShippingMethods: _availableShippingMethods,
        availablePaymentMethods: _availablePaymentMethods,
      ));
    }
  }

  Future<void> _onLoadEmiDetails(
    _LoadEmiDetails event,
    Emitter<CheckoutState> emit,
  ) async {

    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.getEmiDetails(
      quoteId: event.quoteId,
      orderId: event.orderId,
    );

    result.fold(
      (error) {
        emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
      },
      (emiData) {
        emit(CheckoutState.emiDetailsLoaded(emiData: emiData));
      },
    );
  }

  Future<void> _onConfirmEmiSelection(
    _ConfirmEmiSelection event,
    Emitter<CheckoutState> emit,
  ) async {

    emit(CheckoutState.paymentProcessing(
      orderId: event.orderId,
      paymentMethod: 'emi',
    ));

    final isCardOnDelivery = event.paymentMode == 'Card On Delivery';
    final quoteResult = await repository.updateEmiQuote(
      quoteId: event.quoteId,
      orderId: event.orderId,
      bankName: event.bankName,
      tenureMonths: event.tenure.toString(),
      paymentMethod: 'emi',
      paymentMode: isCardOnDelivery ? 'Card On Delivery' : 'Pay Online',
    );

    final quoteOk = quoteResult.fold((_) => false, (_) => true);
    if (!quoteOk) {
      emit(CheckoutState.paymentFailed(
        orderId: event.orderId,
        errorMessage: 'Failed to update EMI details. Please try again.',
      ));
      return;
    }

    if (isCardOnDelivery) {
      final confirmResult = await repository.confirmOrder(orderId: event.orderId);
      await confirmResult.fold(
        (error) async {
          emit(CheckoutState.paymentFailed(
            orderId: event.orderId,
            errorMessage: error.message,
          ));
        },
        (_) async {
          emit(CheckoutState.paymentSuccess(
            orderId: event.orderId,
            transactionId: 'EMI_COD',
            totalAmount: _currentCheckout?.cartTotals.grandTotal ?? 0.0,
          ));
        },
      );
      return;
    }

    final gateway = event.paymentGateway.toLowerCase().trim();
    if (gateway.contains('ebl')) {
      final eblResult = await repository.createEblOrder(orderId: event.orderId);
      eblResult.fold(
        (error) {
          emit(CheckoutState.paymentFailed(
            orderId: event.orderId,
            errorMessage: error.message,
          ));
        },
        (eblData) {
          final url = eblData['url']?.toString() ?? '';
          final formFields = (eblData['formFields'] as Map<String, String>?) ?? {};
          final emiTitle = event.bankName.isNotEmpty
              ? event.bankName
              : _resolvePaymentMethodTitle('emi', fallback: 'EMI Payment');
          emit(CheckoutState.navigateToPaymentGateway(
            url: url,
            title: emiTitle,
            formFields: formFields.isEmpty ? null : formFields,
          ));
        },
      );
      return;
    }

    final orderResult = await repository.createDigitalOrder(
      orderId: event.orderId,
      paymentMethodCode: 'emi',
      paymentGateway: event.paymentGateway,
    );

    orderResult.fold(
      (error) {
        emit(CheckoutState.paymentFailed(
          orderId: event.orderId,
          errorMessage: error.message,
        ));
      },
      (gatewayUrl) {
        final emiTitle = event.bankName.isNotEmpty
            ? event.bankName
            : _resolvePaymentMethodTitle('emi', fallback: 'EMI Payment');
        emit(CheckoutState.navigateToPaymentGateway(
          url: gatewayUrl,
          title: emiTitle,
        ));
      },
    );
  }

  String _resolvePaymentMethodTitle(
    String methodCode, {
    String fallback = 'Payment',
  }) {
    final cleanCode = methodCode.toLowerCase().trim();
    for (final m in _availablePaymentMethods) {
      if (m.code.toLowerCase().trim() == cleanCode && m.title.trim().isNotEmpty) {
        return m.title.trim();
      }
    }
    for (final m in _cachedPaymentMethods) {
      if (m.code.toLowerCase().trim() == cleanCode && m.title.trim().isNotEmpty) {
        return m.title.trim();
      }
    }
    const knownTitles = {
      'pickabooeblmastercard': 'Pickaboo EBL Mastercard',
      'visamaster': 'Visa/Master',
      'bkash': 'bKash Payment',
      'nagad': 'Nagad',
      'amex': 'AMEX',
      'cashondelivery': 'Cash On Delivery',
      'cardondelivery': 'Card On Delivery',
    };
    if (knownTitles.containsKey(cleanCode)) {
      return knownTitles[cleanCode]!;
    }
    if (cleanCode.contains('eblmastercard')) {
      return 'Pickaboo EBL Mastercard';
    }
    return fallback;
  }

  void _onResetCheckout(_ResetCheckout event, Emitter<CheckoutState> emit) {

    _currentCheckout = null;
    _selectedShippingAddress = null;
    _selectedBillingAddress = null;
    _selectedPaymentMethod = null;
    _selectedBkashAgreementId = null;
    _bkashIdToken = null;
    _bkashOrderId = null;
    _bkashAmount = null;
    _bkashAgreementId = null;
    _bkashIsSavedAgreement = false;
    _pendingEmiBankName = null;
    _pendingEmiTenure   = null;
    _pendingEmiGateway  = null;
    _pendingEmiMode     = null;
    _pendingEmiQuoteId  = null;

    emit(const CheckoutState.initial());
  }

  Future<void> _onUpdateOrderPayment(
    _UpdateOrderPayment event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.updateOrderPayment(
      orderId: event.orderId,
      paymentMethod: event.paymentMethod,
      paymentGateway: event.paymentGateway,
    );

    result.fold(
      (error) => emit(CheckoutState.error(error: error)),
      (success) => emit(
        CheckoutState.paymentMethodUpdated(
          success: success,
          checkout: _currentCheckout,
        ),
      ),
    );
  }

  Future<void> _onSyncOrderPaymentMethod(
    _SyncOrderPaymentMethod event,
    Emitter<CheckoutState> emit,
  ) async {
    _selectedPaymentMethod = event.paymentMethod;

    final result = await repository.updateOrderPayment(
      orderId: event.orderId,
      paymentMethod: event.paymentMethod,
      paymentGateway: event.paymentGateway,
    );

    result.fold(
      (error) {
        emit(
          CheckoutState.orderPaymentMethodSynced(
            success: false,
            paymentMethod: event.paymentMethod,
          ),
        );
      },
      (success) => emit(
        CheckoutState.orderPaymentMethodSynced(
          success: success,
          paymentMethod: event.paymentMethod,
        ),
      ),
    );
  }

  Future<void> _onConfirmOrder(
    _ConfirmOrder event,
    Emitter<CheckoutState> emit,
  ) async {

    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.confirmOrder(orderId: event.orderId);

    result.fold(
      (error) => emit(CheckoutState.error(error: error)),
      (success) => emit(
        CheckoutState.orderConfirmed(
          success: success,
          checkout: _currentCheckout,
        ),
      ),
    );
  }
}
