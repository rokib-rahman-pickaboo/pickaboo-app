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
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modern OrderFailedPage matching Pickaboo-App-UI design language.
class OrderFailedPage extends StatefulWidget {
  final String? orderNumber;
  final VoidCallback onContinueShopping;

  const OrderFailedPage({
    super.key,
    this.orderNumber,
    required this.onContinueShopping,
  });

  @override
  State<OrderFailedPage> createState() => _OrderFailedPageState();
}

class _OrderFailedPageState extends State<OrderFailedPage> {
  static const int _maxAutoRetries = 3;
  int _autoRetries = 0;
  Timer? _retryTimer;
  bool _listFallbackRequested = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.orderNumber != null &&
          widget.orderNumber!.isNotEmpty &&
          widget.orderNumber != 'Unknown') {
        _loadOrderDetails();
      } else {
        _listFallbackRequested = true;
        context.read<OrderBloc>().add(const OrderEvent.refresh());
      }
    });
  }

  @override
  void dispose() {
    _retryTimer?.cancel();
    super.dispose();
  }

  void _loadOrderDetails() {
    final orderId = widget.orderNumber;
    if (orderId == null || orderId.isEmpty || orderId == 'Unknown') return;
    context.read<OrderBloc>().add(OrderEvent.loadOrderDetails(orderId));
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
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
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
                      SizedBox(height: 40.h),
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.red.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.error_outline_rounded,
                          size: 60.sp,
                          color: AppColors.red,
                        ),
                      ),
                      SizedBox(height: 24.h),

                      Text(
                        "We couldn't process your payment.",
                        style: AppTypography.heroTitle.size(18.sp),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 20.h),
                      BlocConsumer<OrderBloc, OrderState>(
                        listener: (context, orderState) {
                          if (orderState.orderDetails != null) {
                            _retryTimer?.cancel();
                            return;
                          }
                          final failed = !orderState.isLoading &&
                              orderState.errorMessage != null;
                          if (!failed) return;

                          if (_autoRetries < _maxAutoRetries) {
                            _scheduleAutoRetry();
                          } else if (!_listFallbackRequested) {
                            _listFallbackRequested = true;
                            context
                                .read<OrderBloc>()
                                .add(const OrderEvent.refresh());
                          }
                        },
                        builder: (context, orderState) {
                          final orderDetails = orderState.orderDetails;
                          String? listOrderNumber;
                          int? listOrderId;
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
                                listOrderId = newest.orderId;
                              }
                            }
                          }

                          final displayOrderNumber =
                              orderDetails?.orderNumber ?? listOrderNumber;
                          final hasOrderNumber = displayOrderNumber != null &&
                              displayOrderNumber.isNotEmpty;

                          final listFallbackExhausted =
                              _listFallbackRequested &&
                                  !orderState.pagingState.isLoading &&
                                  orderState.pagingState.pages != null;

                          final failedToLoad = !hasOrderNumber &&
                              _autoRetries >= _maxAutoRetries &&
                              listFallbackExhausted;

                          final retrying = !hasOrderNumber && !failedToLoad;

                          final targetOrderId =
                              (orderDetails != null && orderDetails.orderId > 0)
                                  ? orderDetails.orderId.toString()
                                  : (listOrderId != null && listOrderId > 0)
                                      ? listOrderId.toString()
                                      : (widget.orderNumber != null &&
                                              widget.orderNumber!.isNotEmpty &&
                                              widget.orderNumber != 'Unknown'
                                          ? widget.orderNumber!
                                          : (displayOrderNumber ?? ''));

                          return Container(
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
                                    AppStrings.couldNotLoadOrderNumber,
                                    style: AppTypography.bodySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 6.h),
                                  AppButton.ghost(
                                    shrinkWrap: true,
                                    onPressed: _onManualRetry,
                                    text: AppStrings.retry,
                                    textStyle: AppTypography.brandAction,
                                  ),
                                ] else ...[
                                  InkWell(
                                    onTap: () {
                                      if (targetOrderId.isNotEmpty) {
                                        context.goToOrderDetails(targetOrderId);
                                      }
                                    },
                                    borderRadius: AppRadius.cardRadius,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.h),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: AppTypography.bodyLarge,
                                              children: [
                                                const TextSpan(
                                                  text:
                                                      "Your order number is: ",
                                                ),
                                                TextSpan(
                                                  text:
                                                      displayOrderNumber ?? '',
                                                  style: AppTypography
                                                      .brandAction
                                                      .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        AppColors.pickabooBlue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 6.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Tap to view order details',
                                                style: AppTypography.bodySmall
                                                    .copyWith(
                                                  color: AppColors.pickabooBlue,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11.5.sp,
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 11.sp,
                                                color: AppColors.pickabooBlue,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 16.h),
                      Text(
                        "We'll email you an order confirmation with the order details.",
                        style: AppTypography.bodySmall.mutedLight,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

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
                  child: AppButton.primary(
                    text: "Continue Shopping",
                    height: 48.h,
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      size: 18.sp,
                      color: AppColors.white,
                    ),
                    borderRadius: AppRadius.cardRadius,
                    onPressed: widget.onContinueShopping,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
