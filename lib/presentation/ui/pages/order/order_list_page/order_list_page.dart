// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/order/bottom_sheet/order_review_product_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/order_list_page/order_item_card.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.dashboard);
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'My Orders',
      ),
      body: _wrapTwoPane(
        context,
        BlocConsumer<OrderBloc, OrderState>(
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
                backgroundColor: Colors.transparent,
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
                SnackBarUtils.showPositive(
                  context,
                  state.successMessage ?? AppStrings.operationSuccessful,
                );
              }
            }
          },
          builder: (context, state) {
            return SafeArea(
              top: false,
              child: RefreshIndicator(
                color: AppColors.pickabooBlue,
                onRefresh: () async {
                  context.read<OrderBloc>().add(const OrderEvent.refresh());
                  await Future.delayed(const Duration(milliseconds: 500));
                },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sameGroupItemSpacing.w,
                      vertical: AppSpacing.sameGroupItemSpacing.h,
                    ),
                    sliver: PagedSliverList<int, OrderItemEntity>(
                      state: state.pagingState,
                      fetchNextPage: () {
                        context.read<OrderBloc>().add(
                          const OrderEvent.getOrders(),
                        );
                      },
                      builderDelegate: PagedChildBuilderDelegate<OrderItemEntity>(
                        firstPageErrorIndicatorBuilder: (context) {
                          final isOffline = ConnectivityUtils.isNoInternet(state.errorMessage, context);
                          return AppErrorView(
                            type: isOffline ? AppErrorType.noInternet : AppErrorType.server,
                            title: isOffline ? 'No Internet Connection' : 'Unable to Load Orders',
                            message: isOffline ? null : state.errorMessage,
                            onRetry: () => context.read<OrderBloc>().add(
                              const OrderEvent.refresh(),
                            ),
                          );
                        },
                        newPageErrorIndicatorBuilder: (context) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Center(
                            child: Text(
                              "Couldn't load more orders",
                              style: AppTypography.inputError,
                            ),
                          ),
                        ),
                        firstPageProgressIndicatorBuilder: (context) =>
                            const AppLoader.fullPage(),
                        newPageProgressIndicatorBuilder: (context) =>
                            const AppLoader.pagination(),
                        noItemsFoundIndicatorBuilder: (context) =>
                            AppEmptyView.orders(
                              onStartShopping: () => context.go(Routes.home),
                            ),
                        itemBuilder: (context, order, index) {
                          return OrderItemCard(
                            order: order,
                            onTap: () {
                              if (context.useTwoPane) {
                                setState(() {
                                  _selectedOrderId = order.orderId.toString();
                                });
                              } else {
                                context.goToOrderDetails(
                                  order.orderId.toString(),
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
                              _handleReorder(context, order.orderId.toString());
                            },
                            onPay: () {
                              context.goToOrderPayment(
                                orderId: order.orderId.toString(),
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
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 40.h)),
                ],
              ),
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
        SizedBox(width: 360.w, child: list),
        const VerticalDivider(width: 1, thickness: 1),
        Expanded(child: _buildDetailPane(context)),
      ],
    );
  }

  Widget _buildDetailPane(BuildContext context) {
    final orderId = _selectedOrderId;
    if (orderId == null) {
      return Center(
        child: Text(
          'Select an order to see details',
          style: AppTypography.bodyMuted,
        ),
      );
    }

    return MultiBlocProvider(
      key: ValueKey(orderId),
      providers: [
        BlocProvider(create: (_) => getIt<OrderBloc>()),
        BlocProvider(create: (_) => getIt<JustForYouBloc>()),
      ],
      child: OrderDetailsPage(orderId: orderId, embedded: true),
    );
  }
}
