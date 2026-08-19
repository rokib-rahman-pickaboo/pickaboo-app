import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/order_cancelled_page/cancellation_reason_view.dart';
import 'package:pickaboo/presentation/ui/widgets/order_cancelled_page/cancellation_success_view.dart';

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
    final colors = context.colors;
    final textStyles = context.textStyle;

    return Scaffold(
      backgroundColor: colors.scaffoldBackground,
      appBar: AppBar(
        title: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            String title = "Cancel Order";
            if (state.cancelledOrder != null) {
              title = "Cancellation Request";
            }
            return Text(
              title,
              style: textStyles.appBarTitle.copyWith(color: colors.text),
            );
          },
        ),
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.pop(context),
          iconColor: colors.text,
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.successMessage!,
                  style: textStyles.bodyMedium.copyWith(color: colors.white),
                ),
                backgroundColor: colors.green,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
          }
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage!,
                  style: textStyles.bodyMedium.copyWith(color: colors.white),
                ),
                backgroundColor: colors.red,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.cancelledOrder != null) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: CancellationSuccessView(
                order: state.cancelledOrder!,
                onViewDetails: () => _openOrderDetails(state.cancelledOrder!),
              ),
            );
          }

          if (state.isLoading && state.orderDetails == null) {
            return Center(
              child: CircularProgressIndicator(color: colors.primary),
            );
          }

          final displayDetails =
              state.orderDetails ??
              (widget.order is OrderDetailEntity ? widget.order : null);

          if (displayDetails != null) {
            return Stack(
              children: [
                CancellationReasonView(
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
                if (state.isLoading)
                  Container(
                    color: colors.black.withValues(alpha: 0.3),
                    child: Center(
                      child: CircularProgressIndicator(color: colors.primary),
                    ),
                  ),
              ],
            );
          }

          if (widget.order is OrderCancelEntity) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: CancellationSuccessView(
                order: widget.order as OrderCancelEntity,
                onViewDetails: () =>
                    _openOrderDetails(widget.order as OrderCancelEntity),
              ),
            );
          }

          return Center(
            child: Text(
              "Preparing cancellation request...",
              style: textStyles.bodyMedium.copyWith(color: colors.textLight),
            ),
          );
        },
        ),
      ),
    );
  }
}
