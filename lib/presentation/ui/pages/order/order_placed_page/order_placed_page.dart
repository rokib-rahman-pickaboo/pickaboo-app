// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modern OrderPlacedPage matching Pickaboo-App-UI design language.
class OrderPlacedPage extends StatefulWidget {
  final String orderNumber;
  final int earnedPoints;
  final VoidCallback onContinueShopping;

  const OrderPlacedPage({
    super.key,
    required this.orderNumber,
    this.earnedPoints = 0,
    required this.onContinueShopping,
  });

  @override
  State<OrderPlacedPage> createState() => _OrderPlacedPageState();
}

class _OrderPlacedPageState extends State<OrderPlacedPage> {
  static const int _maxAutoRetries = 4;
  int _autoRetries = 0;
  Timer? _retryTimer;

  bool _listFallbackRequested = false;
  bool _successLogged = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartBloc>().add(const CartEvent.refreshCart());
      _loadOrderDetails();
    });
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    super.dispose();
  }

  void _loadOrderDetails() {
    context.read<OrderBloc>().add(
      OrderEvent.loadOrderDetails(widget.orderNumber),
    );
  }

  void _scheduleAutoRetry() {
    if (_autoRetries >= _maxAutoRetries || (_retryTimer?.isActive ?? false)) {
      return;
    }
    _autoRetries++;
    _retryTimer = Timer(
      Duration(milliseconds: 800 * _autoRetries),
      () {
        if (mounted) _loadOrderDetails();
      },
    );
  }

  void _logOrderSuccess(OrderDetailEntity details) {
    if (_successLogged) return;
    _successLogged = true;
    getIt<AnalyticsService>().logOrderSuccess(
      transactionId: details.orderNumber.isNotEmpty
          ? details.orderNumber
          : widget.orderNumber,
      value: details.orderSummary.grandTotal,
      items: details.items
          .map(
            (item) => {
              'id': item.productId.toString(),
              'name': item.itemName,
              'price': item.finalPrice,
              'quantity': item.qty,
              'category': item.productCategoryNames.isNotEmpty
                  ? item.productCategoryNames.first
                  : null,
            },
          )
          .toList(),
    );
  }

  void _onManualRetry() {
    _autoRetries = 0;
    _listFallbackRequested = false;
    _loadOrderDetails();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) widget.onContinueShopping();
      },
      child: Scaffold(
        backgroundColor: AppColors.pageBg,
        body: SafeArea(
          child: BlocConsumer<OrderBloc, OrderState>(
            listener: (context, orderState) {
              if (orderState.orderDetails != null) {
                _retryTimer?.cancel();
                _logOrderSuccess(orderState.orderDetails!);
                return;
              }
              final failed =
                  !orderState.isLoading && orderState.errorMessage != null;
              if (!failed) return;

              if (_autoRetries < _maxAutoRetries) {
                _scheduleAutoRetry();
              } else if (!_listFallbackRequested) {
                _listFallbackRequested = true;
                context.read<OrderBloc>().add(const OrderEvent.refresh());
              }
            },
            builder: (context, orderState) {
              final orderDetails = orderState.orderDetails;

              String? listOrderNumber;
              if (orderDetails == null && _listFallbackRequested) {
                final items = orderState.pagingState.pages
                    ?.expand((page) => page)
                    .toList();
                if (items != null && items.isNotEmpty) {
                  final newest = items.reduce(
                    (a, b) => a.orderId >= b.orderId ? a : b,
                  );
                  if (newest.orderNumber.isNotEmpty) {
                    listOrderNumber = newest.orderNumber;
                  }
                }
              }

              final displayOrderNumber =
                  orderDetails?.orderNumber ?? listOrderNumber;
              final hasOrderNumber =
                  displayOrderNumber != null && displayOrderNumber.isNotEmpty;

              final earnedPoints =
                  orderDetails?.orderSummary.rewardEarned ??
                  widget.earnedPoints;

              final listFallbackExhausted =
                  _listFallbackRequested &&
                  !orderState.pagingState.isLoading &&
                  orderState.pagingState.pages != null;

              final failedToLoad =
                  !hasOrderNumber &&
                  _autoRetries >= _maxAutoRetries &&
                  listFallbackExhausted;

              final retrying = !hasOrderNumber && !failedToLoad;

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sameGroupItemSpacing.w * 2,
                        vertical: 24.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20.h),
                          // ── Success Image / Graphic ──
                          Image.asset(
                            'assets/images/success_cart.png',
                            height: 140.h,
                            width: 140.w,
                            errorBuilder: (_, __, ___) => Container(
                              height: 120.w,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: AppColors.green.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check_circle_rounded,
                                size: 80.sp,
                                color: AppColors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),

                          // ── Title & Status ──
                          Text(
                            "Thank you for shopping with Pickaboo!",
                            style: AppTypography.heroTitle.size(18.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 16.sp,
                                color: AppColors.green,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "Order placed successfully",
                                style: AppTypography.badgeInStock,
                              ),
                            ],
                          ),

                          SizedBox(height: 20.h),

                          // ── Order Number Card ──
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppRadius.cardRadius,
                              border: Border.all(color: AppColors.border),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.navy.withValues(alpha: 0.03),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 2.h),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                if (retrying) ...[
                                  const AppLoader.inline(size: 20),
                                ] else if (failedToLoad) ...[
                                  Text(
                                    "We couldn't load your order number right now.",
                                    style: AppTypography.bodyMuted,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 6.h),
                                  TextButton(
                                    onPressed: _onManualRetry,
                                    child: Text(
                                      "Retry",
                                      style: AppTypography.brandActionText,
                                    ),
                                  ),
                                ] else ...[
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: AppTypography.bodyLarge,
                                      children: [
                                        const TextSpan(
                                          text: "Your order number is: ",
                                        ),
                                        TextSpan(
                                          text: displayOrderNumber ?? '',
                                          style: AppTypography.brandActionText,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),

                          // ── Club Points Banner ──
                          if (earnedPoints > 0) ...[
                            SizedBox(height: 14.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(14.w),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceBlue,
                                borderRadius: AppRadius.cardRadius,
                                border: Border.all(
                                  color: AppColors.pickabooBlue.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.stars_rounded,
                                    size: 22.sp,
                                    color: AppColors.pickabooBlue,
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Text(
                                      "You earned $earnedPoints Club Points for this order.\n"
                                      "Earned points will be enrolled to your account after we finish processing your order.",
                                      style: AppTypography.bodyRegular,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          SizedBox(height: 16.h),
                          // ── Email confirmation note ──
                          Text(
                            "We'll email you an order confirmation with the order details.",
                            style: AppTypography.bodyMutedLight,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── Bottom Sticky Bar ──
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sameGroupItemSpacing.w * 2,
                      vertical: 12.h,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      border: Border(top: BorderSide(color: AppColors.border)),
                    ),
                    child: SafeArea(
                      top: false,
                      child: SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.pickabooBlue,
                            foregroundColor: AppColors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: AppRadius.cardRadius,
                            ),
                            elevation: 0,
                          ),
                          onPressed: widget.onContinueShopping,
                          child: Text(
                            "Continue Shopping",
                            style: AppTypography.buttonPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
