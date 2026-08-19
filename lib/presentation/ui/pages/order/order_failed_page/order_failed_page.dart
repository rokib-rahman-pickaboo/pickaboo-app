import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';

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
    final colors = context.colors;
    final textTheme = context.textStyle;
    final hasOrderId =
        widget.orderNumber != null && widget.orderNumber!.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 120.sp,
                      color: colors.salmon,
                    ),
                    SizedBox(height: 30.h),

                    Text(
                      "We couldn't process your payment.",
                      style: textTheme.headingMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colors.primary,
                      ),
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
                            return SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colors.primary,
                              ),
                            );
                          }

                          if (failedToLoad) {
                            return Column(
                              children: [
                                Text(
                                  "We couldn't load your order number right now.",
                                  style: textTheme.bodyMedium.copyWith(
                                    color: colors.textLight,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8.h),
                                TextButton(
                                  onPressed: _loadOrderDetails,
                                  child: Text(
                                    "Retry",
                                    style: textTheme.bodyMedium.copyWith(
                                      color: colors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }

                          return RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: textTheme.bodyLarge.copyWith(
                                color: colors.text,
                              ),
                              children: [
                                const TextSpan(text: "Your order number is: "),
                                TextSpan(
                                  text: displayOrderNumber ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],

                    SizedBox(height: 20.h),
                    Text(
                      "We'll email you an order confirmation with the order details.",
                      style: textTheme.bodyMedium.copyWith(
                        color: colors.gray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(16.w),
              color: colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.button,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: widget.onContinueShopping,
                  child: Text(
                    "Continue Shopping",
                    style: textTheme.buttonMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
