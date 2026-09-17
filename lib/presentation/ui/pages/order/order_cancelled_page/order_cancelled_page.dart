// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/order_cancelled_page/cancellation_reason_view.dart';
import 'package:pickaboo/presentation/ui/widgets/order_cancelled_page/cancellation_success_view.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modernized OrderCancelledPage matching Pickaboo-App-UI design language.
class OrderCancelledPage extends StatefulWidget {
  const OrderCancelledPage({super.key, required this.order});
  final dynamic order;

  @override
  State<OrderCancelledPage> createState() => _OrderCancelledPageState();
}

class _OrderCancelledPageState extends State<OrderCancelledPage> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    context.read<OrderBloc>().add(const OrderEvent.clearCancellation());

    if (widget.order is OrderItemEntity) {
      final orderItem = widget.order as OrderItemEntity;
      context.read<OrderBloc>().add(
        OrderEvent.loadOrderDetails(orderItem.orderId.toString()),
      );
    }
  }

  String? _orderId(OrderCancelEntity? cancelled) {
    final order = widget.order;
    if (order is OrderItemEntity) return order.orderId.toString();
    if (order is OrderDetailEntity) return order.orderId.toString();
    if (cancelled != null) return cancelled.entityId.toString();
    return null;
  }

  void _openOrderDetails(OrderCancelEntity cancelled) {
    final id = _orderId(cancelled);
    if (id == null) return;
    context.pushReplacementNamed('orderDetails', pathParameters: {'id': id});
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
          context.go(Routes.orderList);
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        titleWidget: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            String title = "Cancel Order";
            if (state.cancelledOrder != null) {
              title = "Cancellation Request";
            }
            return Text(
              title,
              style: AppTypography.titleLarge,
            );
          },
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state.successMessage != null) {
              SnackBarUtils.showSuccess(
                context,
                state.successMessage ?? AppStrings.operationSuccessful,
              );
            }
            if (state.errorMessage != null) {
              SnackBarUtils.showError(
                context,
                state.errorMessage ?? AppStrings.somethingWentWrong,
              );
            }
          },
          builder: (context, state) {
            if (state.cancelledOrder != null) {
              return CancellationSuccessView(
                order: state.cancelledOrder!,
                onViewDetails: () => _openOrderDetails(state.cancelledOrder!),
              );
            }

            if (state.isLoading && state.orderDetails == null) {
              return const AppLoader.fullPage();
            }

            final displayDetails =
                state.orderDetails ??
                (widget.order is OrderDetailEntity ? widget.order : null);

            if (displayDetails != null) {
              return AppLoader.overlay(
                isLoading: state.isLoading,
                child: CancellationReasonView(
                  order: displayDetails,
                  onSubmit: (reason, note) {
                    context.read<OrderBloc>().add(
                      OrderEvent.cancelOrder(
                        orderId: displayDetails.orderId.toString(),
                        note: note,
                        reason: reason,
                      ),
                    );
                  },
                ),
              );
            }

            if (widget.order is OrderCancelEntity) {
              return CancellationSuccessView(
                order: widget.order as OrderCancelEntity,
                onViewDetails: () =>
                    _openOrderDetails(widget.order as OrderCancelEntity),
              );
            }

            return Center(
              child: Text(
                "Preparing cancellation request...",
                style: AppTypography.bodySmall.mutedLight,
              ),
            );
          },
        ),
      ),
    ),
    );
  }
}
