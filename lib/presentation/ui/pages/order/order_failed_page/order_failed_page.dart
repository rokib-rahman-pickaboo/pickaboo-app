// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
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
  @override
  void initState() {
    super.initState();
    final orderId = widget.orderNumber;
    if (orderId != null && orderId.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadOrderDetails());
    }
  }

  void _loadOrderDetails() {
    final orderId = widget.orderNumber;
    if (orderId == null || orderId.isEmpty) return;
    context.read<OrderBloc>().add(OrderEvent.loadOrderDetails(orderId));
  }

  @override
  Widget build(BuildContext context) {
    final hasOrderId =
        widget.orderNumber != null && widget.orderNumber!.isNotEmpty;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) widget.onContinueShopping();
      },
      child: Scaffold(
      backgroundColor: AppColors.pageBg,
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

                    if (hasOrderId) ...[
                      SizedBox(height: 20.h),
                      BlocBuilder<OrderBloc, OrderState>(
                        builder: (context, orderState) {
                          final orderDetails = orderState.orderDetails;
                          final displayOrderNumber = orderDetails?.orderNumber;
                          final failedToLoad =
                              !orderState.isLoading &&
                              orderDetails == null &&
                              orderState.errorMessage != null;

                          if (orderState.isLoading && orderDetails == null) {
                            return const AppLoader.inline(size: 20);
                          }

                          if (failedToLoad) {
                            return Column(
                              children: [
                                Text(
                                  "We couldn't load your order number right now.",
                                  style: AppTypography.bodyMuted,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 6.h),
                                TextButton(
                                  onPressed: _loadOrderDetails,
                                  child: Text(
                                    "Retry",
                                    style: AppTypography.brandActionText,
                                  ),
                                ),
                              ],
                            );
                          }

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
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: AppTypography.bodyLarge,
                                children: [
                                  const TextSpan(text: "Your order number is: "),
                                  TextSpan(
                                    text: displayOrderNumber ?? '',
                                    style: AppTypography.brandActionText,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],

                    SizedBox(height: 16.h),
                    Text(
                      "We'll email you an order confirmation with the order details.",
                      style: AppTypography.bodyMutedLight,
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
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navy,
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
        ),
      ),
    ),
    );
  }
}
