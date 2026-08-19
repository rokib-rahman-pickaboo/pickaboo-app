import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/order_list_page/order_item_card.dart';
import 'package:pickaboo/presentation/ui/pages/order/bottom_sheet/order_review_product_bottom_sheet.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  bool _reviewRequested = false;

  String? _selectedOrderId;

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(const OrderEvent.refresh());
  }

  void _handleReorder(BuildContext context, String orderId) {
    context.read<OrderBloc>().add(OrderEvent.reorder(orderId));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: Text('My Order', style: context.textStyle.appBarTitle),
      ),
      body: _wrapTwoPane(
        context,
        SafeArea(
          top: false,
          child: BlocConsumer<OrderBloc, OrderState>(
            listener: (context, state) {
              if (_reviewRequested &&
                  state.orderDetails != null &&
                  !state.isLoading) {
                setState(() {
                  _reviewRequested = false;
                });

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: colors.black.withValues(alpha: 0.0),
                  builder: (context) => OrderReviewProductBottomSheet(
                    items: state.orderDetails!.items,
                    onProductSelected: (item) {
                      context.pushNamed(
                        'writeReviewOrder',
                        extra: {
                          'productId': item.productId.toString(),
                          'productName': item.itemName,
                          'productImage': item.image,
                        },
                      );
                    },
                  ),
                );
              }

              if (state.successMessage != null) {
                if (state.successMessage == 'Items added to cart') {
                  context.push(Routes.cart);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.successMessage!,
                        style: textStyles.bodyMedium.copyWith(
                          color: colors.white,
                        ),
                      ),
                      backgroundColor: colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  );
                }
              }
            },
            builder: (context, state) {
              return RefreshIndicator(
                color: colors.primary,
                onRefresh: () async {
                  context.read<OrderBloc>().add(const OrderEvent.refresh());
                  await Future.delayed(const Duration(milliseconds: 500));
                },
                child: CustomScrollView(
                  slivers: [
                    PagedSliverList<int, OrderItemEntity>(
                      builderDelegate: PagedChildBuilderDelegate<OrderItemEntity>(
                        firstPageErrorIndicatorBuilder: (context) =>
                            AppErrorView(
                              type: AppErrorType.server,
                              title: 'Unable to Load Orders',
                              message: state.errorMessage,
                              onRetry: () => context.read<OrderBloc>().add(
                                const OrderEvent.refresh(),
                              ),
                            ),
                        newPageErrorIndicatorBuilder: (context) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Center(
                            child: Text(
                              "Couldn't load more orders",
                              style: textStyles.caption.copyWith(
                                color: colors.red,
                              ),
                            ),
                          ),
                        ),
                        firstPageProgressIndicatorBuilder: (context) => Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 100.h),
                            child: CircularProgressIndicator(
                              color: colors.primary,
                            ),
                          ),
                        ),
                        newPageProgressIndicatorBuilder: (context) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Center(
                            child: SizedBox(
                              width: 24.r,
                              height: 24.r,
                              child: CircularProgressIndicator(
                                color: colors.primary,
                                strokeWidth: 2.5,
                              ),
                            ),
                          ),
                        ),
                        noItemsFoundIndicatorBuilder: (context) =>
                            _buildEmptyState(colors, textStyles, context),
                        itemBuilder: (context, order, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: OrderItemCard(
                              order: order,
                              onTap: () {
                                if (context.useTwoPane) {
                                  setState(() {
                                    _selectedOrderId = order.orderId.toString();
                                  });
                                } else {
                                  context.pushNamed(
                                    'orderDetails',
                                    pathParameters: {
                                      'id': order.orderId.toString(),
                                    },
                                  );
                                }
                              },
                              onCancel: () {
                                context.push(
                                  Routes.orderCancelled,
                                  extra: order,
                                );
                              },
                              onBuy: () {
                                _handleReorder(
                                  context,
                                  order.orderId.toString(),
                                );
                              },
                              onPay: () {
                                context.goToOrderPayment(
                                  orderId: order.orderId.toString(),
                                  selectedMethod: order.paymentMethod,
                                  grandTotal: order.grandtotal,
                                  subtotal: order.subtotal,
                                  shippingAmount: order.shipping,
                                  discountAmount: order.discountAmount,
                                  itemsCount:
                                      1,
                                );
                              },
                              onReview: () {
                                setState(() {
                                  _reviewRequested = true;
                                });
                                context.read<OrderBloc>().add(
                                  OrderEvent.loadOrderDetails(
                                    order.orderId.toString(),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                      state: state.pagingState,
                      fetchNextPage: () {
                        context.read<OrderBloc>().add(
                          const OrderEvent.getOrders(),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _wrapTwoPane(BuildContext context, Widget list) {
    if (!context.useTwoPane) return list;
    return Row(
      children: [
        SizedBox(width: 360, child: list),
        const VerticalDivider(width: 1, thickness: 1),
        Expanded(child: _buildDetailPane(context)),
      ],
    );
  }

  Widget _buildDetailPane(BuildContext context) {
    final id = _selectedOrderId;
    if (id == null) {
      return Center(
        child: Text(
          'Select an order to see its details',
          style: context.textStyle.bodyMedium.copyWith(
            color: context.colors.gray,
          ),
        ),
      );
    }
    return MultiBlocProvider(
      key: ValueKey(id),
      providers: [
        BlocProvider(create: (_) => getIt<OrderBloc>()),
        BlocProvider(create: (_) => getIt<JustForYouBloc>()),
      ],
      child: OrderDetailsPage(orderId: id, embedded: true),
    );
  }

  Widget _buildEmptyState(
    AppColors colors,
    AppTextStyles textStyles,
    BuildContext context,
  ) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: colors.gray.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 48.r,
                color: colors.gray,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "No Orders Yet",
              style: textStyles.headingSmall.copyWith(color: colors.text),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              "Start shopping to see your orders here",
              style: textStyles.bodyMedium.copyWith(color: colors.gray),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
