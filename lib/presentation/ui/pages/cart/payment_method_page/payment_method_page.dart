// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/error_filters.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/pages/cart/bottom_sheet/card_bin_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/cart/bottom_sheet/emi_selection_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/card_bin_applied_view.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_method_skeleton_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_option_item.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_order_summary.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/saved_wallet_item.dart';
import 'package:pickaboo/presentation/ui/widgets/common/unified_checkout_bottom_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

/// Modernized PaymentMethodPage matching Pickaboo-App-UI design language.
class PaymentMethodPage extends StatefulWidget {
  final String? selectedMethod;
  final String? orderId;
  final String? cartId;
  final List<PaymentMethodEntity>? availablePaymentMethods;
  final CartTotalsEntity? initialTotals;
  final int? initialItemsCount;
  final double? grandTotal;
  final double? subtotal;
  final double? shippingAmount;
  final double? discountAmount;
  final int? itemsCount;

  const PaymentMethodPage({
    super.key,
    this.selectedMethod,
    this.orderId,
    this.cartId,
    this.availablePaymentMethods,
    this.initialTotals,
    this.initialItemsCount,
    this.grandTotal,
    this.subtotal,
    this.shippingAmount,
    this.discountAmount,
    this.itemsCount,
  });

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  late String _currentSelection;
  String? _selectedAgreementId;
  CartTotalsEntity? _lastTotals;
  int _lastItemsCount = 0;
  bool _isTotalsFromOrderApi = false;

  BankEmiDataEntity? _selectedEmiBank;
  EmiTenureDetailEntity? _selectedEmiTenure;
  String _emiPaymentMode = 'Pay online';
  String? _cachedEmiQuoteId;
  String? _resolvedCartId;
  CheckoutEmiEntity? _loadedEmiData;
  bool _isLoadingEmi = false;
  List<PaymentMethodEntity> _availablePaymentMethods = [];
  bool _savedAgreementsRequested = false;
  bool _isSyncingSelection = false;
  Timer? _selectionSyncTimeout;

  @override
  void dispose() {
    _selectionSyncTimeout?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _resolvedCartId = widget.cartId;
    _currentSelection = widget.selectedMethod ?? '';
    if (widget.initialTotals != null) {
      _lastTotals = widget.initialTotals;
    } else if (widget.grandTotal != null || widget.subtotal != null) {
      final gTotal = widget.grandTotal ?? 0.0;
      final sTotal = widget.subtotal ?? gTotal;
      final dAmount = widget.discountAmount ?? 0.0;
      final shipAmount = widget.shippingAmount ?? 0.0;
      _lastTotals = CartTotalsEntity(
        grandTotal: gTotal,
        baseGrandTotal: gTotal,
        subtotal: sTotal,
        baseSubtotal: sTotal,
        discountAmount: dAmount,
        baseDiscountAmount: dAmount,
        subtotalWithDiscount: sTotal + dAmount,
        baseSubtotalWithDiscount: sTotal + dAmount,
        shippingAmount: shipAmount,
        baseShippingAmount: shipAmount,
        shippingDiscountAmount: 0,
        baseShippingDiscountAmount: 0,
        taxAmount: 0,
        baseTaxAmount: 0,
        shippingTaxAmount: 0,
        baseShippingTaxAmount: 0,
        subtotalInclTax: sTotal,
        shippingInclTax: shipAmount,
        baseShippingInclTax: shipAmount,
        baseCurrencyCode: 'BDT',
        quoteCurrencyCode: 'BDT',
        couponCode: '',
        itemsQty: widget.itemsCount ?? widget.initialItemsCount ?? 1,
        items: const [],
        totalSegments: const [],
      );
    }
    _lastItemsCount = widget.initialItemsCount ?? widget.itemsCount ?? 0;
    if (widget.availablePaymentMethods != null &&
        widget.availablePaymentMethods!.isNotEmpty) {
      _availablePaymentMethods = List.from(widget.availablePaymentMethods!);
    } else {
      _availablePaymentMethods = [];
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSavedAgreements();
      _getCardBinStatus();
    });
    if (widget.orderId != null) {
      context.read<OrderBloc>().add(
        OrderEvent.loadOrderDetails(widget.orderId!),
      );
    }
    final initialCartId = _resolveCartId();
    if (_availablePaymentMethods.isEmpty &&
        initialCartId != null &&
        initialCartId.isNotEmpty &&
        initialCartId != '0') {
      Future.microtask(_loadPaymentInfo);
    }
  }

  String? _resolveCartId() {
    if (widget.cartId != null &&
        widget.cartId!.isNotEmpty &&
        widget.cartId != '0') {
      return widget.cartId;
    }
    if (_resolvedCartId != null &&
        _resolvedCartId!.isNotEmpty &&
        _resolvedCartId != '0') {
      return _resolvedCartId;
    }
    final stateCheckout = context.read<CheckoutBloc>().state.maybeMap(
      checkoutLoaded: (s) => s.checkout.cart.id.toString(),
      placingOrder: (s) => s.checkout.cart.id.toString(),
      orderPlaced: (s) => s.checkout.cart.id.toString(),
      orElse: () => null,
    );
    if (stateCheckout != null &&
        stateCheckout.isNotEmpty &&
        stateCheckout != '0') {
      return stateCheckout;
    }
    final orderQuoteId = context.read<OrderBloc>().state.orderDetails?.paymentAddress?.quoteId;
    if (orderQuoteId != null &&
        orderQuoteId.isNotEmpty &&
        orderQuoteId != '0') {
      return orderQuoteId;
    }
    if (widget.orderId == null) {
      return CheckoutBloc.cachedCartId;
    }
    return null;
  }

  void _loadPaymentInfo() {
    final cartId = _resolveCartId();
    if (kDebugMode) {
      print('💳 PaymentMethodPage: _loadPaymentInfo cartId=$cartId');
    }
    if (cartId != null && cartId.isNotEmpty && cartId != '0') {
      context.read<CheckoutBloc>().add(
        CheckoutEvent.loadPaymentInfo(cartId: cartId),
      );
    } else {
      if (kDebugMode) {
        print('⚠️ PaymentMethodPage: cartId is null — loadPaymentInfo skipped');
      }
    }
  }

  void _loadSavedAgreements() {
    if (_savedAgreementsRequested) return;
    final customerId = _resolveCustomerId();
    if (customerId != null && customerId.isNotEmpty) {
      _savedAgreementsRequested = true;
      context.read<SavedPaymentBloc>().add(
        SavedPaymentEvent.getSavedPayments(customerId),
      );
    }
  }

  void _getCardBinStatus() {
    context.read<CardBinBloc>().add(CardBinEvent.getStatus(orderId: widget.orderId));
  }

  String? _resolveCustomerId() {
    final checkoutCustId = context.read<CheckoutBloc>().state.maybeMap(
      checkoutLoaded: (s) => s.checkout.cart.customer?.id.toString(),
      orElse: () => null,
    );
    if (checkoutCustId != null && checkoutCustId.isNotEmpty) {
      return checkoutCustId;
    }
    try {
      final authState = context.read<AuthBloc>().state;
      return authState.maybeMap(
        authenticated: (s) => s.user.id.toString(),
        orElse: () => null,
      );
    } catch (_) {
      return null;
    }
  }

  String _maskLast4(String phone) => phone.length <= 4
      ? phone
      : ('*' * (phone.length - 4)) + phone.substring(phone.length - 4);

  String _last4(String phone) =>
      phone.length <= 4 ? phone : phone.substring(phone.length - 4);

  void _selectSavedAgreement(SavedPaymentEntity agreement) {
    _checkAndRemoveCardBin('dynamicpaymentgateway');
    setState(() {
      _currentSelection = 'dynamicpaymentgateway';
      _selectedAgreementId = agreement.agreementId;
    });
    context.read<CheckoutBloc>().add(
      CheckoutEvent.selectSavedBkashAgreement(
        agreementId: agreement.agreementId,
      ),
    );
    _beginSelectionSync();
    if (widget.orderId != null) {
      context.read<CheckoutBloc>().add(
        CheckoutEvent.syncOrderPaymentMethod(
          orderId: widget.orderId!,
          paymentMethod: 'dynamicpaymentgateway',
        ),
      );
    } else {
      context.read<CheckoutBloc>().add(
        const CheckoutEvent.selectPaymentMethod(
          paymentMethod: 'dynamicpaymentgateway',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderBloc, OrderState>(
          listenWhen: (prev, curr) => prev.orderDetails != curr.orderDetails,
          listener: (context, orderState) {
            final details = orderState.orderDetails;
            if (details != null) {
              final quoteId = details.paymentAddress?.quoteId;
              if (quoteId != null && quoteId.isNotEmpty && quoteId != '0') {
                _resolvedCartId = quoteId;
                context.read<CheckoutBloc>().add(
                  CheckoutEvent.loadPaymentInfo(cartId: quoteId),
                );
              }
              setState(() {
                _isTotalsFromOrderApi = true;
                _lastTotals = CartTotalsEntity(
                  grandTotal: details.orderSummary.grandTotal,
                  baseGrandTotal: details.orderSummary.grandTotal,
                  subtotal: details.orderSummary.subtotal,
                  baseSubtotal: details.orderSummary.subtotal,
                  discountAmount: details.orderSummary.discountAmount.abs(),
                  baseDiscountAmount: details.orderSummary.discountAmount.abs(),
                  subtotalWithDiscount: details.orderSummary.subtotal - details.orderSummary.discountAmount.abs(),
                  baseSubtotalWithDiscount: details.orderSummary.subtotal - details.orderSummary.discountAmount.abs(),
                  shippingAmount: details.orderSummary.shippingFee,
                  baseShippingAmount: details.orderSummary.shippingFee,
                  shippingDiscountAmount: 0,
                  baseShippingDiscountAmount: 0,
                  taxAmount: 0,
                  baseTaxAmount: 0,
                  shippingTaxAmount: 0,
                  baseShippingTaxAmount: 0,
                  subtotalInclTax: details.orderSummary.subtotal,
                  shippingInclTax: details.orderSummary.shippingFee,
                  baseShippingInclTax: details.orderSummary.shippingFee,
                  baseCurrencyCode: 'BDT',
                  quoteCurrencyCode: 'BDT',
                  couponCode: details.couponCode ?? '',
                  itemsQty: details.orderSummary.totalOrderQty,
                  items: [],
                  totalSegments: [],
                );
                _lastItemsCount = details.orderSummary.totalOrderQty;
              });
              _endSelectionSync();
            }
          },
        ),
        BlocListener<OrderBloc, OrderState>(
          listenWhen: (prev, curr) =>
              prev.errorMessage != curr.errorMessage && curr.errorMessage != null,
          listener: (context, _) => _endSelectionSync(),
        ),
        BlocListener<CardBinBloc, CardBinState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.status == CardBinStatus.success && widget.orderId != null) {
              context.read<OrderBloc>().add(
                OrderEvent.loadOrderDetails(widget.orderId!),
              );
            }
          },
        ),
        BlocListener<CheckoutBloc, CheckoutState>(
          listenWhen: (prev, curr) =>
              !prev.maybeMap(checkoutLoaded: (_) => true, orElse: () => false) &&
              curr.maybeMap(checkoutLoaded: (_) => true, orElse: () => false),
          listener: (context, state) => _loadSavedAgreements(),
        ),
      ],
      child: BlocConsumer<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          state.maybeWhen(
            checkoutLoaded: (
              checkout,
              selectedShippingAddress,
              selectedBillingAddress,
              selectedPaymentMethod,
              selectedShippingMethodCode,
              availableShippingMethods,
              availablePaymentMethods,
            ) {
              setState(() {
                if (availablePaymentMethods.isNotEmpty) {
                  _availablePaymentMethods = List.from(availablePaymentMethods);
                }
                if (!_isTotalsFromOrderApi) {
                  _lastTotals = checkout.cartTotals;
                }
              });
              if (_isSyncingSelection) {
                _endSelectionSync();
              }
            },
            paymentMethodsLoaded: (availablePaymentMethods, totals) {
              setState(() {
                _availablePaymentMethods = List.from(availablePaymentMethods);
                if (totals != null) {
                  _lastTotals = totals;
                }
              });
              _endSelectionSync();
            },
            emiDetailsLoaded: (emiData) {
              if (kDebugMode) {
                print('💳 PaymentMethodPage: emiDetailsLoaded received — ${emiData.bankEmiData.length} banks');
              }
              setState(() {
                _isLoadingEmi = false;
                _loadedEmiData = emiData;
              });
              _showEmiBottomSheet(emiData);
            },
            orderPaymentMethodSynced: (success, method) {
              if (kDebugMode) {
                print('💳 PaymentMethodPage: orderPaymentMethodSynced success=$success method=$method');
              }
              if (success && widget.orderId != null) {
                context.read<OrderBloc>().add(
                  OrderEvent.loadOrderDetails(widget.orderId!),
                );
                return;
              }
              _endSelectionSync();
              if (!success) {
                SnackBarUtils.showError(
                  context,
                  'Could not apply that payment method. Please try again.',
                );
              }
            },
            paymentMethodUpdated: (success, checkout) {
              if (!success) {
                if (widget.orderId != null) {
                  context.goToOrderFailed(orderId: widget.orderId);
                }
                SnackBarUtils.showError(
                  context,
                  AppStrings.failedToUpdatePaymentMethod,
                );
                return;
              }
              if (widget.orderId != null) {
                if (_currentSelection == 'emi') return;

                if (_currentSelection == 'cashondelivery') {
                  context.read<CheckoutBloc>().add(
                    CheckoutEvent.confirmOrder(orderId: widget.orderId!),
                  );
                } else {
                  final gateway = _getGatewayForMethod(
                    context,
                    _currentSelection,
                  );
                  context.read<CheckoutBloc>().add(
                    CheckoutEvent.processPayment(
                      orderId: widget.orderId!,
                      paymentMethod: _currentSelection,
                      paymentGateway: gateway,
                      paymentData: _selectedAgreementId != null
                          ? {'agreementId': _selectedAgreementId!}
                          : null,
                    ),
                  );
                }
              }
            },
            navigateToPaymentGateway: (url, title, formFields) {
              final selectedMethod = _availablePaymentMethods.firstWhereOrNull(
                (m) =>
                    m.code.toLowerCase().trim() ==
                    _currentSelection.toLowerCase().trim(),
              );
              String exactTitle = selectedMethod?.title.trim() ?? '';
              if (exactTitle.isEmpty &&
                  title.isNotEmpty &&
                  title != 'Secure Payment' &&
                  title != 'EBL Payment') {
                exactTitle = title.trim();
              }
              if (exactTitle.isEmpty) {
                const knownTitles = {
                  'pickabooeblmastercard': 'Pickaboo EBL Mastercard',
                  'visamaster': 'Visa/Master',
                  'bkash': 'bKash Payment',
                  'nagad': 'Nagad',
                  'amex': 'AMEX',
                  'cashondelivery': 'Cash On Delivery',
                  'cardondelivery': 'Card On Delivery',
                };
                exactTitle =
                    knownTitles[_currentSelection.toLowerCase().trim()] ??
                        (title.isNotEmpty ? title : 'Payment');
              }

              context.goToPaymentWebView(
                url: url,
                title: exactTitle,
                formFields: formFields,
                onPaymentResult: (success, message) {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  context.read<CheckoutBloc>().add(
                    CheckoutEvent.onPaymentWebViewResult(
                      orderId: widget.orderId!,
                      success: success,
                      message: message,
                    ),
                  );
                },
                onBkashCallback: (type, paymentId) {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  if (type == 'agreement') {
                    context.read<CheckoutBloc>().add(
                      CheckoutEvent.bkashAgreementCallback(paymentId: paymentId),
                    );
                  } else if (type == 'payment') {
                    context.read<CheckoutBloc>().add(
                      CheckoutEvent.bkashPaymentCallback(paymentId: paymentId),
                    );
                  }
                },
                onNagadCallback: (params) {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  context.read<CheckoutBloc>().add(
                    CheckoutEvent.nagadCallback(callbackParams: params),
                  );
                },
                onUserClosed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              );
            },
            paymentSuccess: (orderId, transactionId, totalAmount) {
              context.read<CheckoutBloc>().add(
                const CheckoutEvent.resetCheckout(),
              );
              context.read<CartBloc>().add(const CartEvent.getCart());
              final targetOrderId = orderId.isNotEmpty
                  ? orderId
                  : (widget.orderId ?? '');
              context.goToOrderPlaced(orderId: targetOrderId);
            },
            paymentFailed: (orderId, errorMessage) {
              final targetOrderId = orderId.isNotEmpty
                  ? orderId
                  : (widget.orderId ?? '');
              context.goToOrderFailed(orderId: targetOrderId);
              SnackBarUtils.showError(
                context,
                errorMessage.isNotEmpty
                    ? errorMessage
                    : AppStrings.somethingWentWrong,
              );
            },
            orderConfirmed: (success, _) {
              final targetOrderId = widget.orderId ?? '';
              if (success) {
                context.read<CheckoutBloc>().add(
                  const CheckoutEvent.resetCheckout(),
                );

                context.read<CartBloc>().add(const CartEvent.getCart());

                context.goToOrderPlaced(orderId: targetOrderId);
              } else {
                if (targetOrderId.isNotEmpty) {
                  context.goToOrderFailed(orderId: targetOrderId);
                }
                SnackBarUtils.showError(
                  context,
                  AppStrings.failedToConfirmOrder,
                );
              }
            },
            error: (error, lastCheckout) {
              if (_isLoadingEmi) {
                setState(() => _isLoadingEmi = false);
              }
              if (kDebugMode) {
                print(
                  '❌ PaymentMethodPage: CheckoutState.error — "${error.message}" '
                  '(hasLastCheckout=${lastCheckout != null}, '
                  'orderId=${widget.orderId}, cartId=${widget.cartId})',
                );
              }
              if (isSilentCartError(error.message)) return;
              SnackBarUtils.showError(
                context,
                error.message.isNotEmpty
                    ? error.message
                    : AppStrings.somethingWentWrong,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          state.mapOrNull(
            checkoutLoaded: (loaded) {
              if (loaded.selectedPaymentMethod != null &&
                  loaded.selectedPaymentMethod!.isNotEmpty &&
                  _currentSelection.isEmpty) {
                _currentSelection = loaded.selectedPaymentMethod!;
              }
              if (!_isTotalsFromOrderApi) {
                _lastTotals = loaded.checkout.cartTotals;
                _lastItemsCount = loaded.checkout.cart.itemsCount;
              }
              if (loaded.availablePaymentMethods.isNotEmpty) {
                _availablePaymentMethods = List.from(loaded.availablePaymentMethods);
              }
            },
            paymentMethodsLoaded: (loaded) {
              if (loaded.availablePaymentMethods.isNotEmpty) {
                _availablePaymentMethods = List.from(loaded.availablePaymentMethods);
              }
            },
            placingOrder: (placing) {
              if (!_isTotalsFromOrderApi) {
                _lastTotals = placing.checkout.cartTotals;
                _lastItemsCount = placing.checkout.cart.itemsCount;
              }
            },
            orderPlaced: (placed) {
              if (!_isTotalsFromOrderApi) {
                _lastTotals = placed.checkout.cartTotals;
                _lastItemsCount = placed.checkout.cart.itemsCount;
              }
            },
            loading: (loading) {
              if (loading.lastCheckout != null && !_isTotalsFromOrderApi) {
                _lastTotals = loading.lastCheckout!.cartTotals;
                _lastItemsCount = loading.lastCheckout!.cart.itemsCount;
              }
            },
            paymentMethodUpdated: (updated) {
              if (updated.checkout != null && !_isTotalsFromOrderApi) {
                _lastTotals = updated.checkout!.cartTotals;
                _lastItemsCount = updated.checkout!.cart.itemsCount;
              }
            },
            orderConfirmed: (confirmed) {
              if (confirmed.checkout != null && !_isTotalsFromOrderApi) {
                _lastTotals = confirmed.checkout!.cartTotals;
                _lastItemsCount = confirmed.checkout!.cart.itemsCount;
              }
            },
          );

          final scaffold = Scaffold(
            backgroundColor: AppColors.pageBg,
            appBar: const PickabooAppBar(
              title: "Payment Method",
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.sameGroupItemSpacing.w,
                      0,
                      AppSpacing.sameGroupItemSpacing.w,
                      AppSpacing.groupToGroupSpacing.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSavedWalletsSection(),
                        _buildPaymentMethodSection(context),
                        SizedBox(height: AppSpacing.groupToGroupSpacing.h),

                        BlocBuilder<CardBinBloc, CardBinState>(
                          builder: (context, cardBinState) {
                            final isApplied = cardBinState.cardBinResponse?.success == true ||
                                cardBinState.cardBinVerifyResponse?.success == true;

                            if (!isApplied) return const SizedBox.shrink();

                            final discountAmount = cardBinState.cardBinResponse?.discountAmount ??
                                cardBinState.cardBinVerifyResponse?.discountAmount ?? 0;
                            final binCode = cardBinState.appliedBinNumber ?? '';

                            return Padding(
                              padding: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
                              child: CardBinAppliedView(
                                discountAmount: discountAmount,
                                binCode: binCode,
                                isRemoving: cardBinState.status == CardBinStatus.loading,
                                onRemove: () {
                                  if (widget.orderId != null) {
                                    context.read<CardBinBloc>().add(CardBinEvent.remove(orderId: widget.orderId!));
                                  }
                                },
                              ),
                            );
                          },
                        ),

                        BlocBuilder<CardBinBloc, CardBinState>(
                          builder: (context, cardBinState) {
                            if (_lastTotals != null) {
                              return PaymentOrderSummary(
                                totals: _lastTotals!,
                                itemsCount: _lastItemsCount,
                                emiTenure: _selectedEmiTenure,
                                cardBinResponse: cardBinState.cardBinResponse,
                                cardBinVerifyResponse:
                                    cardBinState.cardBinVerifyResponse,
                              );
                            }
                            return const PaymentSummarySkeleton();
                          },
                        ),

                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BlocBuilder<CardBinBloc, CardBinState>(
              builder: (context, cardBinState) =>
                  _buildBottomBar(state, cardBinState),
            ),
          );

          final isInitialLoading = _availablePaymentMethods.isEmpty;
          final isProcessing = !isInitialLoading &&
              state.maybeMap(
                paymentProcessing: (_) => true,
                placingOrder: (_) => true,
                loading: (_) => true,
                orElse: () => false,
              );

          return AppLoader.overlay(
            isLoading: isProcessing,
            child: scaffold,
          );
        },
      ),
    );
  }

  String _assetForCode(String code) {
    switch (code.toLowerCase()) {
      case 'pickabooeblmastercard':
        return AppAssets.pickabooMastercard;
      case 'visamaster':
        return AppAssets.visaMastercard;
      case 'cashondelivery':
        return AppAssets.cashOnDelivery;
      case 'emi':
        return AppAssets.emiPayment;
      case 'bkash':
        return AppAssets.bkash;
      case 'nagad':
        return AppAssets.nagad;
      case 'amex':
        return AppAssets.amex;
      default:
        return AppAssets.cashOnDelivery;
    }
  }

  static const _hiddenPaymentCodes = {
    'dynamicpaymentgateway',
    'eblbank',
    'paymentpending',
  };

  List<PaymentMethodEntity> _visiblePaymentMethods(
    List<PaymentMethodEntity> methods,
  ) {
    return methods
        .where((m) => !_hiddenPaymentCodes.contains(m.code))
        .toList();
  }

  Widget _buildPaymentMethodSection(BuildContext context) {
    if (_availablePaymentMethods.isEmpty) {
      return const PaymentMethodListSkeleton();
    }

    final methods = _visiblePaymentMethods(_availablePaymentMethods);
    if (methods.isEmpty) return const SizedBox.shrink();

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Text(
              'Select Payment Method',
              style: AppTypography.titleMedium,
            ),
          ),
          Divider(
            height: 1.h,
            thickness: 1.h,
            color: AppColors.border,
          ),
          for (int i = 0; i < methods.length; i++) ...[
            _buildSingleMethodItem(context, methods[i]),
            if (i < methods.length - 1)
              Divider(
                height: 1.h,
                thickness: 1.h,
                indent: 62.w,
                color: AppColors.border,
              ),
          ],
        ],
      ),
    );
  }

  String? _subtitleForMethod(PaymentMethodEntity method) {
    final sub = method.subtitle.trim();
    return sub.isNotEmpty ? sub : null;
  }

  Widget _buildSingleMethodItem(
    BuildContext context,
    PaymentMethodEntity method,
  ) {
    final code = method.code;
    final asset = _assetForCode(code);
    final subtitle = _subtitleForMethod(method);

    if (code == 'emi') {
      final eligible = _isEmiEligible();
      final double grandTotal = _lastTotals?.grandTotal ?? 0;
      final remaining = AppConstants.minEmiAmount - grandTotal;
      return PaymentOptionItem(
        id: code,
        title: method.title,
        asset: asset,
        isSelected: _currentSelection == code,
        isEnabled: eligible,
        subtitle: _isLoadingEmi
            ? 'Loading EMI options...'
            : (eligible
                ? (_selectedEmiBank != null && _selectedEmiTenure != null
                    ? '${_selectedEmiBank!.name} · ${_selectedEmiTenure!.tenure} months · ৳${_selectedEmiTenure!.monthlyPayable}/mo · $_emiPaymentMode'
                    : 'Tap to select bank & tenure')
                : (remaining > 0
                    ? 'Add BDT ${remaining.toStringAsFixed(0)} more to unlock EMI'
                    : 'Minimum BDT ${AppConstants.minEmiAmount.toStringAsFixed(0)} required for EMI')),
        onTap: () {
          _updateSelection('emi');
          _openEmiSheet();
        },
      );
    }

    if (code == 'bkash') {
      return PaymentOptionItem(
        id: code,
        title: method.title,
        subtitle: subtitle,
        asset: asset,
        isSelected: _currentSelection == code && _selectedAgreementId == null,
        onTap: () => _updateSelection(code),
      );
    }

    if (code == 'visamaster') {
      return BlocBuilder<CardBinBloc, CardBinState>(
        builder: (context, cardBinState) {
          final isApplied = cardBinState.cardBinResponse?.success == true ||
              cardBinState.cardBinVerifyResponse?.success == true;
          return PaymentOptionItem(
            id: code,
            title: method.title,
            subtitle: subtitle,
            asset: asset,
            isSelected: _currentSelection == code,
            badge: isApplied ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: const BoxDecoration(
                color: AppColors.green,
                borderRadius: AppRadius.badgeRadius,
              ),
              child: Text(
                'DISCOUNT APPLIED',
                style: AppTypography.bodyLarge.extraBold().white,
              ),
            ) : null,
            onTap: () {
              _updateSelection(code);
              final isActive = cardBinState.cardBinStatus?.isActive ?? false;
              if (isActive && widget.orderId != null && !isApplied) {
                CardBinBottomSheet.show(context, widget.orderId!);
              }
            },
          );
        },
      );
    }

    return PaymentOptionItem(
      id: code,
      title: method.title,
      subtitle: subtitle,
      asset: asset,
      isSelected: _currentSelection == code,
      onTap: () => _updateSelection(code),
    );
  }

  Widget _buildSavedWalletsSection() {
    return BlocBuilder<SavedPaymentBloc, SavedPaymentState>(
      builder: (context, savedState) {
        if (savedState.isLoading) {
          return AppLoader.inline(
            size: 20,
            padding: EdgeInsets.symmetric(vertical: 8.h),
          );
        }
        if (savedState.savedPayments.isEmpty) return const SizedBox.shrink();
        final payments = savedState.savedPayments;
        return Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.groupToGroupSpacing.h),
          child: AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  child: Text(
                    'Saved Payment Methods',
                    style: AppTypography.titleMedium,
                  ),
                ),
                Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: AppColors.border,
                ),
                for (int i = 0; i < payments.length; i++) ...[
                  SavedWalletItem(
                    linkedMasked: _maskLast4(payments[i].phoneNumber),
                    last4: _last4(payments[i].phoneNumber),
                    isSelected: _currentSelection == 'dynamicpaymentgateway' &&
                        _selectedAgreementId == payments[i].agreementId,
                    onTap: () => _selectSavedAgreement(payments[i]),
                  ),
                  if (i < payments.length - 1)
                    Divider(
                      height: 1.h,
                      thickness: 1.h,
                      indent: 62.w,
                      color: AppColors.border,
                    ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _checkAndRemoveCardBin(String newSelection) {
    if (newSelection != 'visamaster' && widget.orderId != null) {
      final cardBinState = context.read<CardBinBloc>().state;
      final isApplied = cardBinState.cardBinResponse?.success == true ||
          cardBinState.cardBinVerifyResponse?.success == true;
      if (isApplied) {
        context.read<CardBinBloc>().add(CardBinEvent.remove(orderId: widget.orderId!));
      }
    }
  }

  void _updateSelection(String id) {
    _checkAndRemoveCardBin(id);
    context.read<CheckoutBloc>().add(
      const CheckoutEvent.clearSavedBkashAgreement(),
    );
    setState(() {
      _currentSelection = id;
      _selectedAgreementId = null;
      if (id != 'emi') {
        _selectedEmiBank = null;
        _selectedEmiTenure = null;
        _emiPaymentMode = 'Pay online';
      }
    });
    if (widget.orderId == null) {
      _beginSelectionSync();
      context.read<CheckoutBloc>().add(
        CheckoutEvent.selectPaymentMethod(paymentMethod: id),
      );
      return;
    }

    _beginSelectionSync();
    context.read<CheckoutBloc>().add(
      CheckoutEvent.syncOrderPaymentMethod(
        orderId: widget.orderId!,
        paymentMethod: id,
        paymentGateway: _getGatewayForMethod(context, id),
      ),
    );
    final quoteId = _resolvedCartId ?? CheckoutBloc.cachedCartId;
    if (quoteId != null && quoteId.isNotEmpty && quoteId != '0') {
      context.read<CheckoutBloc>().add(
        CheckoutEvent.selectPaymentMethod(paymentMethod: id),
      );
    }
  }

  void _beginSelectionSync() {
    _selectionSyncTimeout?.cancel();
    setState(() => _isSyncingSelection = true);
    _selectionSyncTimeout = Timer(const Duration(seconds: 20), () {
      if (mounted) _endSelectionSync();
    });
  }

  void _endSelectionSync() {
    _selectionSyncTimeout?.cancel();
    _selectionSyncTimeout = null;
    if (_isSyncingSelection) {
      setState(() => _isSyncingSelection = false);
    }
  }

  void _showEmiBottomSheet(CheckoutEmiEntity emiData) {
    if (!mounted) return;
    EmiSelectionBottomSheet.show(
      context,
      emiData: emiData,
      initialBank: _selectedEmiBank,
      initialTenure: _selectedEmiTenure,
      initialMode: _emiPaymentMode,
      isCheckoutFlow: widget.orderId == null,
      onConfirm: (bank, tenure, mode) {
        setState(() {
          _selectedEmiBank = bank;
          _selectedEmiTenure = tenure;
          _emiPaymentMode = mode;
        });
        _logAddPaymentInfo();
        if (widget.orderId == null) {
          _storeEmiSelection(context);
        } else {
          _dispatchConfirmEmi(context);
        }
      },
    );
  }

  void _openEmiSheet() {
    if (_loadedEmiData != null && _loadedEmiData!.bankEmiData.isNotEmpty) {
      if (kDebugMode) {
        print('💳 PaymentMethodPage: _openEmiSheet — using cached EMI data (${_loadedEmiData!.bankEmiData.length} banks)');
      }
      _showEmiBottomSheet(_loadedEmiData!);
      return;
    }

    if (_isLoadingEmi) return;

    final quoteId = _resolveQuoteId();
    if (kDebugMode) {
      print('💳 PaymentMethodPage: _openEmiSheet called, quoteId=$quoteId, orderId=${widget.orderId}');
    }
    if (quoteId == null || quoteId.isEmpty) {
      SnackBarUtils.showError(
        context,
        'Could not load EMI options. Please try again.',
      );
      return;
    }
    _cachedEmiQuoteId = quoteId;
    setState(() => _isLoadingEmi = true);
    context.read<CheckoutBloc>().add(
      CheckoutEvent.loadEmiDetails(
        quoteId: quoteId,
        orderId: widget.orderId ?? '',
      ),
    );
  }

  String? _resolveQuoteId() {
    if (_cachedEmiQuoteId != null && _cachedEmiQuoteId!.isNotEmpty) {
      return _cachedEmiQuoteId;
    }

    final cartId = _resolveCartId();
    if (cartId != null && cartId.isNotEmpty && cartId != '0') {
      if (kDebugMode) {
        print('💳 PaymentMethodPage: _resolveQuoteId → "$cartId" (from _resolveCartId)');
      }
      return cartId;
    }

    if (widget.orderId != null && widget.orderId!.isNotEmpty) {
      if (kDebugMode) {
        print('💳 PaymentMethodPage: _resolveQuoteId → "${widget.orderId}" (from widget.orderId)');
      }
      return widget.orderId;
    }

    return null;
  }

  void _dispatchConfirmEmi(BuildContext context) {
    if (_selectedEmiBank == null || _selectedEmiTenure == null) return;
    if (widget.orderId == null) return;

    final quoteId = _cachedEmiQuoteId ?? _resolveQuoteId();
    if (quoteId == null || quoteId.isEmpty) {
      SnackBarUtils.showError(
        context,
        'Could not load EMI options. Please try again.',
      );
      return;
    }

    context.read<CheckoutBloc>().add(
      CheckoutEvent.confirmEmiSelection(
        orderId: widget.orderId!,
        quoteId: quoteId,
        bankName: _selectedEmiBank!.name,
        tenure: _selectedEmiTenure!.tenure,
        paymentGateway: _selectedEmiBank!.paymentGateway,
        paymentMode: _emiPaymentMode,
      ),
    );
  }

  void _storeEmiSelection(BuildContext context) {
    if (_selectedEmiBank == null || _selectedEmiTenure == null) return;

    final quoteId = _cachedEmiQuoteId ?? _resolveQuoteId();
    if (quoteId == null || quoteId.isEmpty) {
      SnackBarUtils.showError(
        context,
        'Could not load EMI options. Please try again.',
      );
      return;
    }

    context.read<CheckoutBloc>().add(
      CheckoutEvent.storeEmiSelection(
        bankName: _selectedEmiBank!.name,
        tenure: _selectedEmiTenure!.tenure,
        paymentGateway: _selectedEmiBank!.paymentGateway,
        paymentMode: _emiPaymentMode,
        quoteId: quoteId,
      ),
    );
  }

  Widget _buildBottomBar(
    CheckoutState state,
    CardBinState cardBinState,
  ) {
    double total = _lastTotals?.grandTotal ?? 0.0;
    if (!_isTotalsFromOrderApi) {
      state.mapOrNull(
        checkoutLoaded: (loaded) => total = loaded.checkout.cartTotals.grandTotal,
        placingOrder: (placing) => total = placing.checkout.cartTotals.grandTotal,
        orderPlaced: (placed) => total = placed.checkout.cartTotals.grandTotal,
        loading: (loading) =>
            total = loading.lastCheckout?.cartTotals.grandTotal ?? total,
        paymentMethodUpdated: (updated) =>
            total = updated.checkout?.cartTotals.grandTotal ?? total,
        orderConfirmed: (confirmed) =>
            total = confirmed.checkout?.cartTotals.grandTotal ?? total,
      );
    }

    double extraDiscount = 0.0;
    if (cardBinState.cardBinResponse?.success == true) {
      extraDiscount = cardBinState.cardBinResponse!.discountAmount.toDouble();
    } else if (cardBinState.cardBinVerifyResponse?.success == true) {
      extraDiscount =
          cardBinState.cardBinVerifyResponse!.discountAmount.toDouble();
    }
    total -= extraDiscount;

    if (_lastTotals != null) {
      total += PaymentOrderSummary.convenienceFeeFor(
        _lastTotals!,
        _selectedEmiTenure,
      );
    }

    return UnifiedCheckoutBottomBar(
      trustText: '100% Safe and Secure Payments',
      trustIcon: Icons.shield_outlined,
      priceLabel: 'Total Payable',
      totalPrice: total,
      buttonText: _confirmButtonLabel(),
      showArrow: false,
      isLoading: _isSyncingSelection || state.maybeWhen(
        loading: (_) => true,
        orElse: () => false,
      ),
      onPressed: () {
        if (_currentSelection.isEmpty) {
          SnackBarUtils.showWarning(
            context,
            'Please select payment method',
          );
          return;
        }

        if (_currentSelection == 'emi') {
          if (_selectedEmiBank == null || _selectedEmiTenure == null) {
            _openEmiSheet();
            return;
          }
          if (widget.orderId == null) {
            _storeEmiSelection(context);
          } else {
            _dispatchConfirmEmi(context);
          }
          return;
        }

        if (widget.orderId != null) {
          _logAddPaymentInfo();
          final gateway = _getGatewayForMethod(
            context,
            _currentSelection,
          );
          context.read<CheckoutBloc>().add(
            CheckoutEvent.updateOrderPayment(
              orderId: widget.orderId!,
              paymentMethod: _currentSelection,
              paymentGateway: gateway,
            ),
          );
        }
      },
    );
  }

  String _confirmButtonLabel() {
    const confirmOrderMethods = {'cashondelivery', 'cardondelivery', 'free'};
    if (confirmOrderMethods.contains(_currentSelection)) return 'Confirm Order';
    if (_currentSelection == 'emi' && _emiPaymentMode == 'Card On Delivery') {
      return 'Confirm Order';
    }
    return 'Pay Now';
  }

  bool _isEmiEligible() {
    double total = _lastTotals?.grandTotal ?? 0;
    if (total == 0) {
      final checkoutState = context.read<CheckoutBloc>().state;
      total = checkoutState.maybeMap(
        checkoutLoaded: (s) => s.checkout.cartTotals.grandTotal,
        orderPlaced: (s) => s.checkout.cartTotals.grandTotal,
        placingOrder: (s) => s.checkout.cartTotals.grandTotal,
        loading: (s) => s.lastCheckout?.cartTotals.grandTotal ?? 0,
        paymentMethodUpdated: (s) => s.checkout?.cartTotals.grandTotal ?? 0,
        orderConfirmed: (s) => s.checkout?.cartTotals.grandTotal ?? 0,
        orElse: () => 0,
      );
    }
    if (total == 0) {
      final cartState = context.read<CartBloc>().state;
      total = cartState.maybeMap(
        loaded: (s) => s.cart.grandTotal,
        orElse: () => 0,
      );
    }
    return total >= AppConstants.minEmiAmount;
  }

  void _logAddPaymentInfo() {
    final totals = _lastTotals;
    if (totals == null) return;
    final items = totals.items
        .map(
          (item) => {
            'id': (item.productId ?? item.itemId).toString(),
            'name': item.name,
            'price': item.price,
            'quantity': item.qty,
          },
        )
        .toList();
    getIt<AnalyticsService>().logAddPaymentInfo(
      value: totals.grandTotal,
      coupon: totals.couponCode.isNotEmpty ? totals.couponCode : null,
      paymentType: _currentSelection,
      items: items,
    );
  }

  String? _getGatewayForMethod(BuildContext context, String methodCode) {
    final method = methodCode.toLowerCase().trim();
    const directMethods = {
      'nagad',
      'bkash',
      'dynamicpaymentgateway',
      'cashondelivery',
      'free',
    };
    if (directMethods.contains(method)) return null;

    final localGateway = _availablePaymentMethods
        .firstWhereOrNull((e) => e.code == methodCode)
        ?.paymentGateway;
    if (localGateway != null &&
        localGateway.isNotEmpty &&
        !directMethods.contains(localGateway.toLowerCase().trim())) {
      return localGateway;
    }

    final state = context.read<CheckoutBloc>().state;
    final stateGateway = state.maybeMap(
      checkoutLoaded: (loaded) => loaded.availablePaymentMethods
          .firstWhereOrNull((e) => e.code == methodCode)
          ?.paymentGateway,
      orElse: () => null,
    );
    if (stateGateway != null &&
        stateGateway.isNotEmpty &&
        !directMethods.contains(stateGateway.toLowerCase().trim())) {
      return stateGateway;
    }

    if (method == 'amex') return 'citybank';
    if (method == 'visamaster') return 'mtb';
    if (method == 'pickabooeblmastercard' || method.contains('eblmastercard')) {
      return 'eblbank';
    }
    if (method == 'sslcommerz') return 'sslcommerz';

    return null;
  }
}
