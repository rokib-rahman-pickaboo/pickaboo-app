import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/error_filters.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_option_item.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_order_summary.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/saved_wallet_item.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/card_bin_applied_view.dart';
import 'package:pickaboo/presentation/ui/pages/cart/bottom_sheet/card_bin_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/cart/bottom_sheet/emi_selection_bottom_sheet.dart';
import 'package:collection/collection.dart';

class PaymentMethodPage extends StatefulWidget {
  final String? selectedMethod;
  final String? orderId;
  final String? cartId;
  final List<PaymentMethodEntity>? availablePaymentMethods;

  const PaymentMethodPage({
    super.key,
    this.selectedMethod,
    this.orderId,
    this.cartId,
    this.availablePaymentMethods,
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
    _currentSelection = widget.selectedMethod ?? '';
    if (widget.availablePaymentMethods != null &&
        widget.availablePaymentMethods!.isNotEmpty) {
      _availablePaymentMethods = widget.availablePaymentMethods!;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSavedAgreements();
      _getCardBinStatus();
    });
    Future.microtask(_loadPaymentInfo);
  }

  void _loadPaymentInfo() {
    final cartId = widget.cartId;
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

  void _getCardBinStatus(){
    context.read<CardBinBloc>().add(CardBinEvent.getStatus(orderId: widget.orderId));
  }

  String? _resolveCustomerId() {
    return context.read<CheckoutBloc>().state.maybeMap(
      checkoutLoaded: (s) => s.checkout.cart.customer?.id.toString(),
      orElse: () => null,
    );
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
    if (widget.orderId != null) {
      _beginSelectionSync();
      context.read<CheckoutBloc>().add(
        CheckoutEvent.syncOrderPaymentMethod(
          orderId: widget.orderId!,
          paymentMethod: 'bkash',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return MultiBlocListener(
      listeners: [
        BlocListener<OrderBloc, OrderState>(
          listenWhen: (prev, curr) => prev.orderDetails != curr.orderDetails,
          listener: (context, orderState) {
            final details = orderState.orderDetails;
            if (details != null) {
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
          emiDetailsLoaded: (emiData) {
            if (kDebugMode) {
              print('💳 PaymentMethodPage: emiDetailsLoaded received — ${emiData.bankEmiData.length} banks');
            }
            EmiSelectionBottomSheet.show(
              context,
              emiData: emiData,
              initialBank: _selectedEmiBank,
              initialTenure: _selectedEmiTenure,
              initialMode: _emiPaymentMode,
              isCheckoutFlow: widget.orderId == null,
              onConfirm: (bank, tenure, mode) {
                setState(() {
                  _selectedEmiBank   = bank;
                  _selectedEmiTenure = tenure;
                  _emiPaymentMode    = mode;
                });
                _logAddPaymentInfo();
                if (widget.orderId == null) {
                  _storeEmiSelection(context);
                } else {
                  _dispatchConfirmEmi(context);
                }
              },
            );
          },
          orderPaymentMethodSynced: (success, method) {
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
                'Failed to update payment method. Please try again.',
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
            context.goToPaymentWebView(
              url: url,
              title: title,
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
            context.goToOrderPlaced(orderId: orderId);
          },
          paymentFailed: (orderId, errorMessage) {
            context.goToOrderFailed(orderId: orderId);
            SnackBarUtils.showError(context, errorMessage);
          },
          orderConfirmed: (success, _) {
            if (success && widget.orderId != null) {
              context.read<CheckoutBloc>().add(
                const CheckoutEvent.resetCheckout(),
              );

              context.read<CartBloc>().add(const CartEvent.getCart());

              context.goToOrderPlaced(orderId: widget.orderId!);
            } else if (!success) {
              if (widget.orderId != null) {
                context.goToOrderFailed(orderId: widget.orderId);
              }
              SnackBarUtils.showError(
                context,
                'Failed to confirm order. Please try again.',
              );
            }
          },
          error: (error, lastCheckout) {
            if (kDebugMode) {
              print(
                '❌ PaymentMethodPage: CheckoutState.error — "${error.message}" '
                '(hasLastCheckout=${lastCheckout != null}, '
                'orderId=${widget.orderId}, cartId=${widget.cartId})',
              );
            }
            if (isSilentCartError(error.message)) return;
            SnackBarUtils.showError(context, error.message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        state.mapOrNull(
          checkoutLoaded: (loaded) {
            if (loaded.selectedPaymentMethod != null) {
              _currentSelection = loaded.selectedPaymentMethod!;
            }
            if (!_isTotalsFromOrderApi) {
              _lastTotals = loaded.checkout.cartTotals;
              _lastItemsCount = loaded.checkout.cart.itemsCount;
            }
            _availablePaymentMethods = loaded.availablePaymentMethods;
          },
          paymentMethodsLoaded: (loaded) {
            _availablePaymentMethods = loaded.availablePaymentMethods;
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
          appBar: AppBar(
            leading: AppBarButton(
              iconPath: 'assets/new/svg/back_nav_icon.svg',
              width: 7.w,
              height: 14.h,
              onPressed: () => Navigator.of(context).pop(),
              iconColor: colors.text,
            ),
            title: Text("Payment Method", style: context.textStyle.appBarTitle),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSavedWalletsSection(colors, textStyle),
                      Text(
                        'Select Payment Method',
                        style: textStyle.bodyMediumBold.copyWith(
                          color: colors.text,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ..._buildPaymentMethodItems(context, colors, textStyle),
                      SizedBox(height: 24.h),

                      BlocBuilder<CardBinBloc, CardBinState>(
                        builder: (context, cardBinState) {
                          final isApplied = cardBinState.cardBinResponse?.success == true ||
                              cardBinState.cardBinVerifyResponse?.success == true;

                          if (!isApplied) return const SizedBox.shrink();

                          final discountAmount = cardBinState.cardBinResponse?.discountAmount ??
                              cardBinState.cardBinVerifyResponse?.discountAmount ?? 0;
                          final binCode = cardBinState.appliedBinNumber ?? '';

                          return Padding(
                            padding: EdgeInsets.only(bottom: 24.h),
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

                      if (_lastTotals != null)
                        PaymentOrderSummary(
                          totals: _lastTotals!,
                          itemsCount: _lastItemsCount,
                          emiTenure: _selectedEmiTenure,
                        )
                      else
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: CircularProgressIndicator(
                              color: colors.primary,
                            ),
                          ),
                        ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BlocBuilder<CardBinBloc, CardBinState>(
            builder: (context, cardBinState) =>
                _buildBottomBar(colors, textStyle, state, cardBinState),
          ),
        );

        final isProcessing = _isSyncingSelection ||
            state.maybeMap(
              paymentProcessing: (_) => true,
              loading: (_) => true,
              orElse: () => false,
            );

        if (!isProcessing) return scaffold;
        return Stack(
          children: [
            scaffold,
            Positioned.fill(
              child: Container(
                color: colors.black.withValues(alpha: 0.35),
                child: Center(
                  child: CircularProgressIndicator(color: colors.primary),
                ),
              ),
            ),
          ],
        );
      },
    ),
    );
  }

  String _assetForCode(String code) {
    switch (code.toLowerCase()) {
      case 'pickabooeblmastercard':
        return 'assets/new/svg/payment/pickaboo_mastercard_icon.svg';
      case 'visamaster':
        return 'assets/new/svg/payment/visa_mastercard_icon.svg';
      case 'cashondelivery':
        return 'assets/new/svg/payment/cash_on_delivery_icon.svg';
      case 'emi':
        return 'assets/new/svg/payment/emi_icon.svg';
      case 'bkash':
        return 'assets/new/svg/payment/bkash_icon.svg';
      case 'nagad':
        return 'assets/new/svg/payment/nagad_icon.svg';
      case 'amex':
        return 'assets/new/svg/payment/amex_icon.svg';
      default:
        return 'assets/new/svg/payment/cash_on_delivery_icon.svg';
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

  List<Widget> _buildPaymentMethodItems(
    BuildContext context,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    if (_availablePaymentMethods.isEmpty) {
      return [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h),
          child: Center(
            child: CircularProgressIndicator(color: colors.primary),
          ),
        ),
      ];
    }

    final methods = _visiblePaymentMethods(_availablePaymentMethods);
    if (methods.isEmpty) return [];

    final items = <Widget>[];
    for (int i = 0; i < methods.length; i++) {
      items.add(_buildSingleMethodItem(context, colors, methods[i]));
      if (i != methods.length - 1) items.add(SizedBox(height: 12.h));
    }
    return items;
  }

  Widget _buildSingleMethodItem(
    BuildContext context,
    AppColors colors,
    PaymentMethodEntity method,
  ) {
    final code = method.code;
    final asset = _assetForCode(code);

    if (code == 'emi') {
      final eligible = _isEmiEligible();
      return PaymentOptionItem(
        id: code,
        title: method.title,
        asset: asset,
        isSelected: _currentSelection == code,
        isEnabled: eligible,
        subtitle: eligible
            ? (_selectedEmiBank != null && _selectedEmiTenure != null
                ? '${_selectedEmiBank!.name} · ${_selectedEmiTenure!.tenure} months · ৳${_selectedEmiTenure!.monthlyPayable}/mo · $_emiPaymentMode'
                : 'Press Pay Now to select bank & tenure')
            : 'Add BDT ${(AppConstants.minEmiAmount - (_lastTotals?.grandTotal ?? 0)).toStringAsFixed(0)} more to unlock EMI',
        onTap: () => _updateSelection('emi'),
      );
    }

    if (code == 'bkash') {
      return PaymentOptionItem(
        id: code,
        title: method.title,
        subtitle: method.subtitle.isNotEmpty ? method.subtitle : null,
        asset: asset,
        isSelected: _currentSelection == code ||
            (_currentSelection == 'dynamicpaymentgateway' &&
                _selectedAgreementId != null),
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
            subtitle: method.subtitle.isNotEmpty ? method.subtitle : null,
            asset: asset,
            isSelected: _currentSelection == code,
            badge: isApplied ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFF00C853),
                borderRadius: BorderRadius.circular(12.r),
              ),              child: Text(
                'DISCOUNT APPLIED',
                style: context.textStyle.bodySmall.copyWith(
                  color: colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp,
                ),
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
      subtitle: method.subtitle.isNotEmpty ? method.subtitle : null,
      asset: asset,
      isSelected: _currentSelection == code,
      onTap: () => _updateSelection(code),
    );
  }

  Widget _buildSavedWalletsSection(AppColors colors, AppTextStyles textStyle) {
    return BlocBuilder<SavedPaymentBloc, SavedPaymentState>(
      builder: (context, savedState) {
        if (savedState.isLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Center(
              child: SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  color: colors.primary,
                  strokeWidth: 2,
                ),
              ),
            ),
          );
        }
        if (savedState.savedPayments.isEmpty) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved Payment Methods',
              style: textStyle.bodyMediumBold.copyWith(
                color: colors.text,
              ),
            ),
            SizedBox(height: 16.h),
            ...savedState.savedPayments.map((agreement) {
              return Column(
                children: [
                  SavedWalletItem(
                    linkedMasked: _maskLast4(agreement.phoneNumber),
                    last4: _last4(agreement.phoneNumber),
                    isSelected: _currentSelection == 'dynamicpaymentgateway' &&
                        _selectedAgreementId == agreement.agreementId,
                    onTap: () => _selectSavedAgreement(agreement),
                  ),
                  SizedBox(height: 12.h),
                ],
              );
            }),
            SizedBox(height: 4.h),
          ],
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

  void _openEmiSheet() {
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
    context.read<CheckoutBloc>().add(
      CheckoutEvent.loadEmiDetails(
        quoteId: quoteId,
        orderId: widget.orderId ?? '',
      ),
    );
  }

  String? _resolveQuoteId() {
    final navCartId = widget.cartId;
    if (navCartId != null && navCartId.isNotEmpty && navCartId != '0') {
      if (kDebugMode) {
        print('💳 PaymentMethodPage: _resolveQuoteId → "$navCartId" (from widget.cartId)');
      }
      return navCartId;
    }

    final bloc = context.read<CheckoutBloc>();
    final cartId = bloc.state.maybeMap(
      checkoutLoaded: (s) => s.checkout.cart.id.toString(),
      orderPlaced: (s) => s.checkout.cart.id.toString(),
      placingOrder: (s) => s.checkout.cart.id.toString(),
      orElse: () => null,
    );
    final resolved = (cartId != null && cartId.isNotEmpty && cartId != '0')
        ? cartId
        : null;
    if (kDebugMode) {
      print('💳 PaymentMethodPage: _resolveQuoteId → "$resolved" (blocCartId=$cartId, orderId=${widget.orderId})');
    }
    return resolved;
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
        orderId:        widget.orderId!,
        quoteId:        quoteId,
        bankName:       _selectedEmiBank!.name,
        tenure:         _selectedEmiTenure!.tenure,
        paymentGateway: _selectedEmiBank!.paymentGateway,
        paymentMode:    _emiPaymentMode,
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
        bankName:       _selectedEmiBank!.name,
        tenure:         _selectedEmiTenure!.tenure,
        paymentGateway: _selectedEmiBank!.paymentGateway,
        paymentMode:    _emiPaymentMode,
        quoteId:        quoteId,
      ),
    );
  }

  Widget _buildBottomBar(
    AppColors colors,
    AppTextStyles textStyle,
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

    if (_lastTotals != null) {
      total += PaymentOrderSummary.convenienceFeeFor(
        _lastTotals!,
        _selectedEmiTenure,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: colors.lightYellowBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Center(
                child: Text(
                  "100% Safe and Secure Payments",
                  style: textStyle.listCaption.copyWith(
                    color: colors.textLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total",
                        style: textStyle.bodySmall.copyWith(
                          color: colors.textLight,
                        ),
                      ),
                      Text(
                        "৳ ${total.toStringAsFixed(0)}",
                        style: textStyle.productPriceLarge.copyWith(
                          color: colors.text,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                  width: 150.w,
                  child: ElevatedButton(
                    onPressed: state.maybeWhen(
                      loading: (_) => null,
                      orElse: () => () {
                        if (_currentSelection.isEmpty) {
                          SnackBarUtils.showWarning(
                            context,
                            'Please select payment method',
                          );
                          return;
                        }

                        if (_currentSelection == 'emi') {
                          _openEmiSheet();
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
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.button,
                      foregroundColor: colors.white,
                      minimumSize: Size(0, 48.h),
                      disabledBackgroundColor: colors.button.withValues(
                        alpha: 0.6,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: state.maybeWhen(
                      loading: (_) => SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: CircularProgressIndicator(
                          color: context.colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                      orElse: () => FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _confirmButtonLabel(),
                          maxLines: 1,
                          softWrap: false,
                          style: textStyle.buttonMedium.copyWith(
                            color: colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
    return (_lastTotals?.grandTotal ?? 0) >= AppConstants.minEmiAmount;
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
    final state = context.read<CheckoutBloc>().state;
    final stateGateway = state.maybeMap(
      checkoutLoaded: (loaded) => loaded.availablePaymentMethods
          .firstWhereOrNull((e) => e.code == methodCode)
          ?.paymentGateway,
      orElse: () => null,
    );
    if (stateGateway != null && stateGateway.isNotEmpty) return stateGateway;

    final method = methodCode.toLowerCase().trim();
    if (method == 'amex') return 'citybank';
    if (method == 'visamaster') return 'mtb';
    if (method == 'pickabooeblmastercard' || method.contains('eblmastercard')) {
      return 'eblbank';
    }
    if (method == 'bkash') return 'bkash';
    if (method == 'dynamicpaymentgateway') return 'bkash';
    if (method == 'nagad') return 'nagad';
    if (method == 'sslcommerz') return 'sslcommerz';

    return null;
  }
}

