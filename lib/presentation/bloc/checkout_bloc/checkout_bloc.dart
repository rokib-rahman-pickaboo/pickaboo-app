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

  int _estimateToken = 0;

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
    on<_SelectShippingMethod>(_onSelectShippingMethod);
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
    if (kDebugMode) print('🔵 CheckoutBloc: _onLoadCheckout called');
    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.getCartCheckout();

    result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ CheckoutBloc: Load checkout error - ${error.message}');
        }
        emit(CheckoutState.error(error: error));
      },
      (checkout) {
        _currentCheckout = checkout;
        _selectedShippingMethodCode = null;
        _availableShippingMethods = [];
        _availablePaymentMethods = [];

        if (checkout.cart.shippingAddress != null &&
            checkout.cart.shippingAddress?.firstname?.isNotEmpty == true) {
          _selectedShippingAddress = checkout.cart.shippingAddress;
          if (kDebugMode) {
            print(
              "✅ CheckoutBloc: Auto-selected shipping from CART: ${_selectedShippingAddress!.firstname}",
            );
          }
        } else if (checkout.cart.customer?.addresses.isNotEmpty ?? false) {
          _selectedShippingAddress = checkout.cart.customer!.addresses
              .firstWhere(
                (element) => element.defaultShipping,
                orElse: () => checkout.cart.customer!.addresses.first,
              );
        }

        _selectedBillingAddress = null;

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

        if (kDebugMode) {
          print('✅ CheckoutBloc: Checkout loaded successfully');
          print('  Cart ID: ${checkout.cart.id}');
          print('  Items count: ${checkout.cart.itemsCount}');
          print('  Grand Total: ${checkout.cartTotals.grandTotal}');
          if (_selectedShippingAddress != null) {
            print(
              '  Auto-selected Shipping: ${_selectedShippingAddress!.firstname} ${_selectedShippingAddress!.lastname}',
            );
          }
          if (_selectedBillingAddress != null) {
            print(
              '  Auto-selected Billing: ${_selectedBillingAddress!.firstname} ${_selectedBillingAddress!.lastname}',
            );
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
    if (kDebugMode) {
      print('📍 CheckoutBloc: Updating shipping address');
      print('  City: ${event.address.city}');
    }

    _selectedShippingAddress = event.address;
    _selectedShippingMethodCode = null;
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
    if (kDebugMode) {
      print('📍 CheckoutBloc: Updating billing address');
      print('  City: ${event.address.city}');
    }

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
    if (kDebugMode) {
      print('🚚 CheckoutBloc: Estimating shipping...');
      print('  Address: ${event.address.city}, ${event.address.postcode}');
    }

    final token = ++_estimateToken;

    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.estimateShippingMethods(
      address: event.address,
    );

    if (token != _estimateToken) {
      if (kDebugMode) {
        print('🚚 CheckoutBloc: dropping stale estimate #$token');
      }
      return;
    }

    result.fold(
      (error) {
        if (kDebugMode) print('Error estimating shipping: ${error.message}');
        _availableShippingMethods = [];
        _selectedShippingMethodCode = null;
        emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
        if (_currentCheckout != null) emit(_checkoutLoadedState());
      },
      (methods) {
        if (kDebugMode) print('Shipping methods estimated: ${methods.length}');
        _availableShippingMethods = methods;

        if (methods.isNotEmpty) {
          final first = methods.first;
          _selectedShippingMethodCode =
              "${first.carrierCode}_${first.methodCode}";
          if (kDebugMode) {
            print(
              '✅ CheckoutBloc: Auto-selected shipping method: $_selectedShippingMethodCode',
            );
          }

          add(
            CheckoutEvent.selectShippingMethod(
              carrierCode: first.carrierCode,
              methodCode: first.methodCode,
            ),
          );
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
    if (kDebugMode) {
      print('🚚 CheckoutBloc: Selecting shipping method');
      print('  Carrier: ${event.carrierCode}, Method: ${event.methodCode}');
    }

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
      if (kDebugMode) {
        print('🚚 CheckoutBloc: ignoring stale method selection $newCode');
      }
      return;
    }

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

    result.fold(
      (error) {
        _selectedShippingMethodCode = previousCode;
        if (_currentCheckout != null) {
          emit(_checkoutLoadedState());
        } else {
          emit(
            CheckoutState.error(error: error, lastCheckout: _currentCheckout),
          );
        }
      },
      (paymentInfo) {
        if (_currentCheckout != null && paymentInfo.totals != null) {
          _currentCheckout = CheckoutEntity(
            cart: _currentCheckout!.cart,
            cartTotals: paymentInfo.totals!,
          );
        }

        if (_currentCheckout != null) {
          _selectedShippingMethodCode = newCode;
          _availablePaymentMethods = paymentInfo.paymentMethods;
          emit(_checkoutLoadedState());
        }
      },
    );
  }

  Future<void> _onLoadPaymentInfo(
    _LoadPaymentInfo event,
    Emitter<CheckoutState> emit,
  ) async {
    if (kDebugMode) {
      print('💳 CheckoutBloc: _onLoadPaymentInfo cartId=${event.cartId}');
    }

    final result = await repository.getPaymentInfo(cartId: event.cartId);

    result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ CheckoutBloc: getPaymentInfo error — ${error.message}');
        }
        emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
      },
      (paymentInfo) {
        _availablePaymentMethods = paymentInfo.paymentMethods;

        if (_currentCheckout != null && paymentInfo.totals != null) {
          _currentCheckout = CheckoutEntity(
            cart: _currentCheckout!.cart,
            cartTotals: paymentInfo.totals!,
          );
        }

        if (kDebugMode) {
          print(
            '✅ CheckoutBloc: getPaymentInfo — ${_availablePaymentMethods.length} methods',
          );
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
          if (kDebugMode) {
            print('💳 CheckoutBloc: _onLoadPaymentInfo — emitting paymentMethodsLoaded (no checkout)');
          }
          emit(
            CheckoutState.paymentMethodsLoaded(
              availablePaymentMethods: _availablePaymentMethods,
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
    if (kDebugMode) {
      print('💳 CheckoutBloc: Selecting payment method');
      print('  Method: ${event.paymentMethod}');
    }

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

      final result = await repository.selectPaymentMethod(
        cartId: _currentCheckout!.cart.id.toString(),
        method: event.paymentMethod,
      );

      result.fold(
        (error) {
          if (kDebugMode) {
            print(
              '❌ CheckoutBloc: Failed to select payment method API: ${error.message}',
            );
          }
        },
        (success) {
          if (kDebugMode) {
            print('✅ CheckoutBloc: Payment method selected on server');
          }
        },
      );
    }
  }

  Future<void> _onPlaceOrder(
    _PlaceOrder event,
    Emitter<CheckoutState> emit,
  ) async {
    if (_currentCheckout == null) {
      if (kDebugMode) print('❌ CheckoutBloc: Checkout data not loaded');
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

    if (kDebugMode) {
      print('📦 CheckoutBloc: Placing order...');
      print('  Payment Method: paymentpending');
      print('  Shipping City: ${_selectedShippingAddress!.city}');
      print('  Total: ${_currentCheckout!.cartTotals.grandTotal}');
    }

    emit(CheckoutState.placingOrder(checkout: _currentCheckout!));

    final selectResult = await repository.selectPaymentMethod(
      cartId: _currentCheckout!.cart.id.toString(),
      method: "paymentpending",
    );

    await selectResult.fold(
      (error) async {
        if (kDebugMode) {
          print('❌ CheckoutBloc: Failed to select paymentpending');
        }
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

            if (kDebugMode) {
              print('✅ CheckoutBloc: Order placed successfully');
              print('  Order ID: $orderId');
            }

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
              if (kDebugMode) {
                print('💳 CheckoutBloc: EMI pending selection found — continuing payment');
                print('   Bank: $_pendingEmiBankName, Tenure: $_pendingEmiTenure, Gateway: $_pendingEmiGateway');
              }
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

    if (kDebugMode) {
      print(
        '💳 CheckoutBloc: Processing digital payment - Method: $method, Gateway: $gateway',
      );
    }

    emit(
      CheckoutState.paymentProcessing(
        orderId: event.orderId,
        paymentMethod: event.paymentMethod,
      ),
    );

    if (method == 'bkash') {
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
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: url,
              title: 'EBL Payment',
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
      (error) => emit(
        CheckoutState.paymentFailed(
          orderId: event.orderId,
          errorMessage: error.message,
        ),
      ),
      (gatewayUrl) {
        var gatewayTitle = 'Secure Payment';
        for (final m in _availablePaymentMethods) {
          if (m.code == method && m.title.isNotEmpty) {
            gatewayTitle = m.title;
            break;
          }
        }
        emit(
          CheckoutState.navigateToPaymentGateway(
            url: gatewayUrl,
            title: gatewayTitle,
          ),
        );
      },
    );
  }

  Future<void> _handleBkashPayment(
    String orderId,
    Emitter<CheckoutState> emit,
  ) async {
    if (kDebugMode) print('💳 CheckoutBloc: bKash step 1 — getToken');

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

    if (kDebugMode) print('💳 CheckoutBloc: bKash step 2 — createAgreement');

    final userId =
        _currentCheckout?.cart.customer?.id.toString() ??
        _externalCustomerId ??
        '';
    if (kDebugMode) print('💳 CheckoutBloc: bKash userId (raw): $userId');
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
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: bkashUrl,
              title: 'bKash Payment',
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
      if (kDebugMode) {
        print('💳 CheckoutBloc: No saved agreementId — falling back to full bKash flow');
      }
      await _handleBkashPayment(orderId, emit);
      return;
    }

    if (kDebugMode) print('💳 CheckoutBloc: bKash saved agreement — getToken');

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

    if (kDebugMode) print('💳 CheckoutBloc: bKash saved agreement — createPayment');

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
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: bkashUrl,
              title: 'bKash Payment',
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
      if (kDebugMode) {
        print('❌ CheckoutBloc: bKash session lost — cannot execute agreement');
      }
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId ?? '',
          errorMessage: 'bKash session expired. Please try again.',
        ),
      );
      return;
    }

    if (kDebugMode) {
      print('💳 CheckoutBloc: bKash step 3 — executeAgreement paymentId=${event.paymentId}');
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
        if (kDebugMode) {
          print('❌ CheckoutBloc: bKash executeAgreement failed: ${error.message}');
        }
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

    if (kDebugMode) {
      print('💳 CheckoutBloc: bKash step 4 — createPayment agreementId=$agreementId');
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
          emit(
            CheckoutState.navigateToPaymentGateway(
              url: bkashUrl,
              title: 'bKash Payment',
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
      if (kDebugMode) {
        print('❌ CheckoutBloc: bKash session lost — cannot execute payment');
      }
      emit(
        CheckoutState.paymentFailed(
          orderId: orderId ?? '',
          errorMessage: 'bKash session expired. Please try again.',
        ),
      );
      return;
    }

    if (kDebugMode) {
      print('💳 CheckoutBloc: bKash step 5 — executePayment paymentId=${event.paymentId}');
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

    if (kDebugMode) {
      print(
        '🟠 CheckoutBloc: Nagad callback — orderId=$orderId  status=$status  params=${event.callbackParams}',
      );
    }

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

  Future<void> _onOnPaymentWebViewResult(
    _OnPaymentWebViewResult event,
    Emitter<CheckoutState> emit,
  ) async {
    if (kDebugMode) {
      print('🌐 CheckoutBloc: WebView Result - Success: ${event.success}, orderId: ${event.orderId}');
    }

    if (!event.success) {
      emit(
        CheckoutState.paymentFailed(
          orderId: event.orderId,
          errorMessage: event.message ?? 'Payment cancelled',
        ),
      );
      return;
    }

    if (kDebugMode) {
      print('✅ CheckoutBloc: Digital payment SUCCESS — navigating to order placed');
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

    if (kDebugMode) {
      print('✅ CheckoutBloc: Payment confirmed');
      print('  Order ID: ${event.orderId}');
      print('  Transaction ID: ${event.transactionId}');
      print('  Total Amount: $totalAmount');
    }

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
    if (kDebugMode) {
      print('💳 CheckoutBloc: saved bKash agreement selected — ${event.agreementId}');
    }
    _selectedBkashAgreementId = event.agreementId;
    _selectedPaymentMethod = 'dynamicpaymentgateway';
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
    if (kDebugMode) {
      print('💳 CheckoutBloc: saved bKash agreement cleared');
    }
    _selectedBkashAgreementId = null;
    if (_selectedPaymentMethod == 'dynamicpaymentgateway') {
      _selectedPaymentMethod = null;
    }
  }

  void _onStoreEmiSelection(
    _StoreEmiSelection event,
    Emitter<CheckoutState> emit,
  ) {
    if (kDebugMode) {
      print('💳 CheckoutBloc: Storing pending EMI selection');
      print('   Bank: ${event.bankName}, Tenure: ${event.tenure}m, Gateway: ${event.paymentGateway}, Mode: ${event.paymentMode}');
    }
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
    if (kDebugMode) {
      print('💳 CheckoutBloc: Loading EMI details quoteId=${event.quoteId} orderId=${event.orderId}');
    }

    emit(CheckoutState.loading(lastCheckout: _currentCheckout));

    final result = await repository.getEmiDetails(
      quoteId: event.quoteId,
      orderId: event.orderId,
    );

    result.fold(
      (error) {
        if (kDebugMode) print('❌ CheckoutBloc: loadEmiDetails failed — ${error.message}');
        emit(CheckoutState.error(error: error, lastCheckout: _currentCheckout));
      },
      (emiData) {
        if (kDebugMode) {
          print('✅ CheckoutBloc: EMI details loaded — ${emiData.bankEmiData.length} banks');
        }
        emit(CheckoutState.emiDetailsLoaded(emiData: emiData));
      },
    );
  }

  Future<void> _onConfirmEmiSelection(
    _ConfirmEmiSelection event,
    Emitter<CheckoutState> emit,
  ) async {
    if (kDebugMode) {
      print('💳 CheckoutBloc: EMI selection confirmed');
      print('   Bank: ${event.bankName}, Tenure: ${event.tenure}m, Gateway: ${event.paymentGateway}, Mode: ${event.paymentMode}');
    }

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
      if (kDebugMode) print('❌ CheckoutBloc: updateEmiQuote failed');
      emit(CheckoutState.paymentFailed(
        orderId: event.orderId,
        errorMessage: 'Failed to update EMI details. Please try again.',
      ));
      return;
    }

    if (kDebugMode) print('✅ CheckoutBloc: EMI quote updated');

    if (isCardOnDelivery) {
      if (kDebugMode) print('💳 CheckoutBloc: EMI Card On Delivery — confirming order');
      final confirmResult = await repository.confirmOrder(orderId: event.orderId);
      await confirmResult.fold(
        (error) async {
          if (kDebugMode) print('❌ CheckoutBloc: EMI Card On Delivery confirmOrder failed — ${error.message}');
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

    if (kDebugMode) {
      print('💳 CheckoutBloc: Creating EMI digital order (gateway=${event.paymentGateway})...');
    }

    final gateway = event.paymentGateway.toLowerCase().trim();
    if (gateway.contains('ebl')) {
      final eblResult = await repository.createEblOrder(orderId: event.orderId);
      eblResult.fold(
        (error) {
          if (kDebugMode) print('❌ CheckoutBloc: EMI createEblOrder failed — ${error.message}');
          emit(CheckoutState.paymentFailed(
            orderId: event.orderId,
            errorMessage: error.message,
          ));
        },
        (eblData) {
          final url = eblData['url']?.toString() ?? '';
          final formFields = (eblData['formFields'] as Map<String, String>?) ?? {};
          if (kDebugMode) print('✅ CheckoutBloc: EMI EBL form-post ready — $url');
          emit(CheckoutState.navigateToPaymentGateway(
            url: url,
            title: 'EMI Payment',
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
        if (kDebugMode) print('❌ CheckoutBloc: createDigitalOrder failed — ${error.message}');
        emit(CheckoutState.paymentFailed(
          orderId: event.orderId,
          errorMessage: error.message,
        ));
      },
      (gatewayUrl) {
        if (kDebugMode) print('✅ CheckoutBloc: EMI gateway URL — $gatewayUrl');
        emit(CheckoutState.navigateToPaymentGateway(
          url: gatewayUrl,
          title: 'EMI Payment',
        ));
      },
    );
  }

  void _onResetCheckout(_ResetCheckout event, Emitter<CheckoutState> emit) {
    if (kDebugMode) print('🔄 CheckoutBloc: Resetting checkout');

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
    if (kDebugMode) {
      print('💳 CheckoutBloc: Updating order payment...');
      print('  Order ID: ${event.orderId}');
      print('  Payment Method: ${event.paymentMethod}');
      print('  Payment Gateway: ${event.paymentGateway}');
    }

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
    if (kDebugMode) {
      print('💳 CheckoutBloc: syncing selected method → ${event.paymentMethod}');
    }

    _selectedPaymentMethod = event.paymentMethod;

    final result = await repository.updateOrderPayment(
      orderId: event.orderId,
      paymentMethod: event.paymentMethod,
      paymentGateway: event.paymentGateway,
    );

    result.fold(
      (error) {
        if (kDebugMode) {
          print('❌ CheckoutBloc: sync failed — ${error.message}');
        }
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
    if (kDebugMode) {
      print('✅ CheckoutBloc: Confirming order...');
      print('  Order ID: ${event.orderId}');
    }

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
