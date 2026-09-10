// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/cart/checkout_entity.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/domain/entity/checkout/payment_methods_entity.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/saved_payment/saved_payment_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_option_item.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/payment_order_summary.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/payment_method_page/card_bin_applied_view.dart';
import 'package:pickaboo/presentation/bloc/card_bin_bloc/card_bin_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/cart/bottom_sheet/card_bin_bottom_sheet.dart';
import 'package:collection/collection.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/pages/order/bottom_sheet/emi_selection_bottom_sheet.dart';

class OrderPaymentPage extends StatefulWidget {
  final String? selectedMethod;
  final String? orderId;
  final double? grandTotal;
  final double? subtotal;
  final double? shippingAmount;
  final double? discountAmount;
  final int? itemsCount;
  final String? quoteId;

  const OrderPaymentPage({
    super.key,
    this.selectedMethod,
    this.orderId,
    this.grandTotal,
    this.subtotal,
    this.shippingAmount,
    this.discountAmount,
    this.itemsCount,
    this.quoteId,
  });

  @override
  State<OrderPaymentPage> createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends State<OrderPaymentPage> {
  late String _currentSelection;
  String? _selectedAgreementId;
  CartTotalsEntity? _lastTotals;
  int _lastItemsCount = 0;

  BankEmiDataEntity? _selectedEmiBank;
  EmiTenureDetailEntity? _selectedEmiTenure;
  String _emiPaymentMode = 'Pay online';
  String? _resolvedQuoteId;
  List<PaymentMethodEntity> _availablePaymentMethods = [];

  @override
  void initState() {
    super.initState();
    _currentSelection = widget.selectedMethod ?? '';
    _resolvedQuoteId = widget.quoteId;

    Future.microtask(() {
      if (!mounted) return;

      final checkoutState = context.read<CheckoutBloc>().state;
      String? customerId = checkoutState.maybeMap(
        checkoutLoaded: (s) => s.checkout.cart.customer?.id.toString(),
        orElse: () => null,
      );
      if (customerId == null || customerId.isEmpty) {
        final authState = context.read<AuthBloc>().state;
        customerId = authState.maybeMap(
          authenticated: (s) => s.user.id.toString(),
          orElse: () => null,
        );
      }
      if (customerId != null && customerId.isNotEmpty) {
        context.read<CheckoutBloc>().storeCustomerId(customerId);
        context.read<SavedPaymentBloc>().add(
          SavedPaymentEvent.getSavedPayments(customerId),
        );
      }

      if (_resolvedQuoteId != null) {
        _loadPaymentInfo();
      } else if (widget.orderId != null) {
        context.read<OrderBloc>().add(
          OrderEvent.loadOrderDetails(widget.orderId!),
        );
      }

      _getCardBinStatus();
    });

    if (widget.grandTotal != null) {
      _lastTotals = CartTotalsEntity(
        grandTotal: widget.grandTotal!,
        baseGrandTotal: widget.grandTotal!,
        subtotal: widget.subtotal ?? widget.grandTotal!,
        baseSubtotal: widget.subtotal ?? widget.grandTotal!,
        discountAmount: widget.discountAmount ?? 0,
        baseDiscountAmount: widget.discountAmount ?? 0,
        subtotalWithDiscount:
            (widget.subtotal ?? widget.grandTotal!) -
            (widget.discountAmount ?? 0),
        baseSubtotalWithDiscount:
            (widget.subtotal ?? widget.grandTotal!) -
            (widget.discountAmount ?? 0),
        shippingAmount: widget.shippingAmount ?? 0,
        baseShippingAmount: widget.shippingAmount ?? 0,
        shippingDiscountAmount: 0,
        baseShippingDiscountAmount: 0,
        taxAmount: 0,
        baseTaxAmount: 0,
        shippingTaxAmount: 0,
        baseShippingTaxAmount: 0,
        subtotalInclTax: widget.subtotal ?? widget.grandTotal!,
        shippingInclTax: widget.shippingAmount ?? 0,
        baseShippingInclTax: widget.shippingAmount ?? 0,
        baseCurrencyCode: 'BDT',
        quoteCurrencyCode: 'BDT',
        itemsQty: widget.itemsCount ?? 1,
        items: [],
        totalSegments: [],
      );
      _lastItemsCount = widget.itemsCount ?? 1;
    }
  }

  void _getCardBinStatus(){
    context.read<CardBinBloc>().add(CardBinEvent.getStatus(orderId: widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return MultiBlocListener(
      listeners: [
        BlocListener<OrderBloc, OrderState>(
          listenWhen: (prev, curr) => prev.orderDetails != curr.orderDetails,
          listener: (context, orderState) {
            final details = orderState.orderDetails;
            if (details != null) {
              setState(() {
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

              final quoteId = details.paymentAddress?.quoteId;
              if (quoteId != null && quoteId.isNotEmpty && _resolvedQuoteId == null) {
                if (kDebugMode) {
                  print('💳 OrderPaymentPage: Got quoteId from order details: $quoteId');
                }
                setState(() => _resolvedQuoteId = quoteId);
                _loadPaymentInfo();
              }
            }
          },
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
      ],
      child: BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        state.maybeWhen(
          emiDetailsLoaded: (emiData) {
            if (kDebugMode) {
              print('💳 OrderPaymentPage: emiDetailsLoaded — ${emiData.bankEmiData.length} banks');
            }
            EmiSelectionBottomSheet.show(
              context,
              emiData: emiData,
              initialBank: _selectedEmiBank,
              initialTenure: _selectedEmiTenure,
              initialMode: _emiPaymentMode,
              orderId: widget.orderId ?? '',
              resolvedQuoteId: _resolvedQuoteId ?? widget.orderId ?? '',
              onConfirm: (bank, tenure, mode) {
                setState(() {
                  _selectedEmiBank = bank;
                  _selectedEmiTenure = tenure;
                  _emiPaymentMode = mode;
                });
                if (widget.orderId != null) {
                  context.read<CheckoutBloc>().add(
                    CheckoutEvent.confirmEmiSelection(
                      orderId: widget.orderId!,
                      quoteId: _resolvedQuoteId ?? widget.orderId!,
                      bankName: bank.name,
                      tenure: tenure.tenure,
                      paymentGateway: bank.paymentGateway,
                      paymentMode: mode,
                    ),
                  );
                }
              },
            );
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
            context.goToPaymentWebView(
              url: url,
              title: title,
              formFields: formFields,
              onPaymentResult: (success, message) {
                if (kDebugMode) {
                  print('💳 OrderPaymentPage: WebView result — success=$success, message=$message, orderId=${widget.orderId}');
                }
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
            SnackBarUtils.showError(
              context,
              errorMessage.isNotEmpty
                  ? errorMessage
                  : AppStrings.somethingWentWrong,
            );
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
                AppStrings.failedToConfirmOrder,
              );
            }
          },
          error: (error, lastCheckout) {
            if (kDebugMode) {
              print(
                '❌ OrderPaymentPage: CheckoutState.error — "${error.message}" '
                '(hasLastCheckout=${lastCheckout != null}, '
                'orderId=${widget.orderId}, quoteId=$_resolvedQuoteId)',
              );
            }
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
            if (loaded.selectedPaymentMethod != null) {
              _currentSelection = loaded.selectedPaymentMethod!;
            }
            _lastTotals = loaded.checkout.cartTotals;
            _lastItemsCount = loaded.checkout.cart.itemsCount;
            _availablePaymentMethods = loaded.availablePaymentMethods;
          },
          paymentMethodsLoaded: (loaded) {
            _availablePaymentMethods = loaded.availablePaymentMethods;
          },
          placingOrder: (placing) {
            _lastTotals = placing.checkout.cartTotals;
            _lastItemsCount = placing.checkout.cart.itemsCount;
          },
          orderPlaced: (placed) {
            _lastTotals = placed.checkout.cartTotals;
            _lastItemsCount = placed.checkout.cart.itemsCount;
          },
          loading: (loading) {
            if (loading.lastCheckout != null) {
              _lastTotals = loading.lastCheckout!.cartTotals;
              _lastItemsCount = loading.lastCheckout!.cart.itemsCount;
            }
          },
          paymentMethodUpdated: (updated) {
            if (updated.checkout != null) {
              _lastTotals = updated.checkout!.cartTotals;
              _lastItemsCount = updated.checkout!.cart.itemsCount;
            }
          },
          orderConfirmed: (confirmed) {
            if (confirmed.checkout != null) {
              _lastTotals = confirmed.checkout!.cartTotals;
              _lastItemsCount = confirmed.checkout!.cart.itemsCount;
            }
          },
        );

        final scaffold = Scaffold(
          backgroundColor: AppColors.pageBg,
          appBar: const PickabooAppBar(
            title: AppStrings.paymentMethod,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.sameGroupItemSpacing.w,
                    vertical: AppSpacing.sameGroupItemSpacing.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSavedWalletsSection(textStyle),
                      Text(
                        AppStrings.selectPaymentMethod,
                        style: textStyle.listTitle.copyWith(color: AppColors.text),
                      ),
                      AppSpacing.groupToGroupGap,
                      ..._buildPaymentMethodItems(context, textStyle),
                      AppSpacing.groupToGroupGap,

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
                        AppLoader.inline(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
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
                _buildBottomBar(textStyle, state, cardBinState),
          ),
        );

        final isProcessing = state.maybeMap(
          paymentProcessing: (_) => true,
          loading: (_) => true,
          orElse: () => false,
        );

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(Routes.cart);
            }
          },
          child: AppLoader.overlay(
            isLoading: isProcessing,
            child: scaffold,
          ),
        );
      },
    ),
    );
  }

  void _loadPaymentInfo() {
    final cartId = _resolvedQuoteId;
    if (kDebugMode) {
      print('💳 OrderPaymentPage: _loadPaymentInfo cartId=$cartId');
    }
    if (cartId != null && cartId.isNotEmpty && cartId != '0') {
      context.read<CheckoutBloc>().add(
        CheckoutEvent.loadPaymentInfo(cartId: cartId),
      );
    } else {
      if (kDebugMode) {
        print('⚠️ OrderPaymentPage: quoteId is null — loadPaymentInfo skipped');
      }
    }
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
    AppTextStyles textStyle,
  ) {
    if (_availablePaymentMethods.isEmpty) {
      return [
        AppLoader.inline(
          padding: EdgeInsets.symmetric(vertical: 32.h),
        ),
      ];
    }

    final methods = _visiblePaymentMethods(_availablePaymentMethods);
    if (methods.isEmpty) return [];

    final items = <Widget>[];
    for (int i = 0; i < methods.length; i++) {
      items.add(_buildSingleMethodItem(context, methods[i]));
      if (i != methods.length - 1) items.add(SizedBox(height: 12.h));
    }
    return items;
  }

  Widget _buildSingleMethodItem(
    BuildContext context,
    PaymentMethodEntity method,
  ) {
    final code = method.code;
    final asset = _assetForCode(code);

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
        subtitle: eligible
            ? (_selectedEmiBank != null && _selectedEmiTenure != null
                ? '${_selectedEmiBank!.name} · ${_selectedEmiTenure!.tenure} months · ৳${_selectedEmiTenure!.monthlyPayable}/mo · $_emiPaymentMode'
                : 'Tap to select bank & tenure')
            : (remaining > 0
                ? 'Add BDT ${remaining.toStringAsFixed(0)} more to unlock EMI'
                : 'Minimum BDT ${AppConstants.minEmiAmount.toStringAsFixed(0)} required for EMI'),
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
        subtitle: method.subtitle.isNotEmpty ? method.subtitle : null,
        asset: asset,
        isSelected: _currentSelection == code,
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
                color: AppColors.green,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'BIN APPLIED',
                style: context.textStyle.bodySmall.copyWith(
                  color: AppColors.white,
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

  Widget _buildSavedWalletsSection(AppTextStyles textStyle) {
    return BlocBuilder<SavedPaymentBloc, SavedPaymentState>(
      builder: (context, savedState) {
        if (savedState.isLoading) {
          return AppLoader.inline(
            size: 20.h,
            padding: EdgeInsets.symmetric(vertical: 8.h),
          );
        }
        if (savedState.savedPayments.isEmpty) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
              child: Text(
                'Saved Payments',
                style: textStyle.bodySmall.copyWith(
                  color: AppColors.mutedLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...savedState.savedPayments.map((agreement) {
              final isSelected =
                  _currentSelection == 'dynamicpaymentgateway' &&
                  _selectedAgreementId == agreement.agreementId;
              return Column(
                children: [
                  PaymentOptionItem(
                    id: 'saved_${agreement.agreementId}',
                    title: _maskPhone(agreement.phoneNumber),
                    subtitle: 'bKash Saved Wallet',
                    asset: 'assets/new/svg/payment/bkash_icon.svg',
                    isSelected: isSelected,
                    onTap: () => _selectSavedAgreement(agreement),
                  ),
                  SizedBox(height: 12.h),
                ],
              );
            }),
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
    setState(() {
      _currentSelection = id;
      _selectedAgreementId = null;
    });
    if (widget.orderId == null) {
      context.read<CheckoutBloc>().add(
        CheckoutEvent.selectPaymentMethod(paymentMethod: id),
      );
    }
  }

  String _maskPhone(String phone) {
    if (phone.length < 7) return phone;
    return '${phone.substring(0, 3)}****${phone.substring(phone.length - 3)}';
  }

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
    if (widget.orderId == null) {
      context.read<CheckoutBloc>().add(
        const CheckoutEvent.selectPaymentMethod(
          paymentMethod: 'dynamicpaymentgateway',
        ),
      );
    }
  }

  Widget _buildBottomBar(
    AppTextStyles textStyle,
    CheckoutState state,
    CardBinState cardBinState,
  ) {
    double total = _lastTotals?.grandTotal ?? 0.0;
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

    if (_lastTotals != null) {
      total += PaymentOrderSummary.convenienceFeeFor(
        _lastTotals!,
        _selectedEmiTenure,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
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
                color: AppColors.amberBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Center(
                child: Text(
                  "100% Safe and Secure Payments",
                  style: textStyle.listCaption.copyWith(
                    color: AppColors.mutedLight,
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
                          color: AppColors.mutedLight,
                        ),
                      ),
                      Text(
                        "৳ ${total.toStringAsFixed(0)}",
                        style: textStyle.productPriceLarge.copyWith(
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 48.h,
                    width: 160.w,
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
                            if (_selectedEmiBank == null || _selectedEmiTenure == null) {
                              _openEmiSheet();
                              return;
                            }
                            _dispatchConfirmEmi(context);
                            return;
                          }

                          if (widget.orderId != null) {
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
                        backgroundColor: AppColors.navy,
                        foregroundColor: AppColors.white,
                        disabledBackgroundColor: AppColors.navy.withValues(
                          alpha: 0.6,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: state.maybeWhen(
                        loading: (_) => const AppLoader.button(),
                        orElse: () => FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            _confirmButtonLabel(),
                            maxLines: 1,
                            softWrap: false,
                            style: textStyle.buttonLarge.copyWith(
                              color: AppColors.white,
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
    if (confirmOrderMethods.contains(_currentSelection)) return AppStrings.confirmOrder;
    if (_currentSelection == 'emi' && _emiPaymentMode == 'Card On Delivery') {
      return AppStrings.confirmOrder;
    }
    return AppStrings.payNow;
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

  void _dispatchConfirmEmi(BuildContext context) {
    if (_selectedEmiBank == null || _selectedEmiTenure == null) return;
    if (widget.orderId == null) return;

    context.read<CheckoutBloc>().add(
      CheckoutEvent.confirmEmiSelection(
        orderId: widget.orderId!,
        quoteId: _resolvedQuoteId ?? widget.orderId!,
        bankName: _selectedEmiBank!.name,
        tenure: _selectedEmiTenure!.tenure,
        paymentGateway: _selectedEmiBank!.paymentGateway,
        paymentMode: _emiPaymentMode,
      ),
    );
  }

  String? _getGatewayForMethod(BuildContext context, String methodCode) {
    final localGateway = _availablePaymentMethods
        .firstWhereOrNull((e) => e.code == methodCode)
        ?.paymentGateway;
    if (localGateway != null && localGateway.isNotEmpty) return localGateway;

    final method = methodCode.toLowerCase().trim();
    if (method == 'amex') return 'citybank';
    if (method == 'visamaster') return 'mtb';
    if (method == 'pickabooeblmastercard' || method.contains('eblmastercard')) {
      return 'eblbank';
    }
    if (method == 'emi') return null;
    if (method == 'bkash') return 'bkash';
    if (method == 'nagad') return 'nagad';
    if (method == 'sslcommerz') return 'sslcommerz';

    return null;
  }

  void _openEmiSheet() {
    final bloc = context.read<CheckoutBloc>();
    final cartId = bloc.state.maybeMap(
      checkoutLoaded: (s) => s.checkout.cart.id.toString(),
      orderPlaced: (s) => s.checkout.cart.id.toString(),
      placingOrder: (s) => s.checkout.cart.id.toString(),
      orElse: () => null,
    );
    final quoteId = _resolvedQuoteId ?? widget.quoteId ?? cartId ?? widget.orderId ?? '';
    _resolvedQuoteId = quoteId;

    if (kDebugMode) {
      print('💳 OrderPaymentPage: _openEmiSheet called, quoteId=$quoteId (resolved=$_resolvedQuoteId, widget=${widget.quoteId}), orderId=${widget.orderId}');
    }
    context.read<CheckoutBloc>().add(
      CheckoutEvent.loadEmiDetails(
        quoteId: quoteId,
        orderId: widget.orderId ?? '',
      ),
    );
  }
}
