import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';

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
    final colors = context.colors;
    final textTheme = context.textStyle;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) widget.onContinueShopping();
      },
      child: Scaffold(
        backgroundColor: colors.whiteSmoke,
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/success_cart.png',
                            height: 150.h,
                            width: 150.w,
                          ),
                          SizedBox(height: 20.h),

                          Text(
                            "Thank you for shopping with Pickaboo!",
                            style: textTheme.headingMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colors.darkBlueBg,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Order placed successfully",
                            style: textTheme.bodyLarge.copyWith(
                              color: colors.green,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          if (retrying) ...[
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colors.primary,
                              ),
                            ),
                          ] else if (failedToLoad) ...[
                            Text(
                              "We couldn't load your order number right now.",
                              style: textTheme.bodyMedium.copyWith(
                                color: colors.textLight,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            TextButton(
                              onPressed: _onManualRetry,
                              child: Text(
                                "Retry",
                                style: textTheme.bodyMedium.copyWith(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ] else ...[
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: textTheme.bodyLarge.copyWith(
                                  color: colors.text,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Your order number is: ",
                                  ),
                                  TextSpan(
                                    text: displayOrderNumber ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          if (earnedPoints > 0) ...[
                            SizedBox(height: 20.h),
                            Text(
                              "You earned $earnedPoints Club Points for this order.\n"
                              "Earned points will be enrolled to your account after we finish processing your order.",
                              style: textTheme.bodyMedium.copyWith(
                                color: colors.text,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],

                          SizedBox(height: 20.h),
                          Text(
                            "We'll email you an order confirmation with the order details.",
                            style: textTheme.bodySmall.copyWith(
                              color: colors.gray,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    height: 70.h,
                    color: colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.darkBlueBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          elevation: 0,
                        ),
                        onPressed: widget.onContinueShopping,
                        child: Text(
                          "Continue Shopping",
                          style: textTheme.buttonMedium.copyWith(
                            color: colors.white,
                            fontWeight: FontWeight.bold,
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
