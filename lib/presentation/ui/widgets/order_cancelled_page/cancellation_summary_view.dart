import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/presentation/ui/pages/order/order_details_page/order_details_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CancellationSummaryView extends StatelessWidget {
  final OrderCancelEntity order;
  final String cancelDate;

  const CancellationSummaryView({
    super.key,
    required this.order,
    required this.cancelDate,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            color: colors.white,
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order #${order.incrementId}",
                          style: textStyles.headingSmall.copyWith(
                            color: colors.text,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Canceled on $cancelDate",
                          style: textStyles.bodySmall.copyWith(
                            color: colors.gray,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusAttributes(
                          order.status,
                        ).backgroundColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: _getStatusAttributes(
                            order.status,
                          ).backgroundColor.withValues(alpha: 0.2),
                          width: 1.w,
                        ),
                      ),
                      child: Text(
                        _getStatusAttributes(order.status).text,
                        style: textStyles.bodySmallBold.copyWith(
                          color: _getStatusAttributes(
                            order.status,
                          ).backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          if (order.statusHistories.isNotEmpty)
            Container(
              color: colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: FixedTimeline.tileBuilder(
                theme: TimelineThemeData(
                  nodePosition: 0,
                  color: colors.primary,
                  indicatorTheme: IndicatorThemeData(position: 0, size: 12.w),
                  connectorTheme: ConnectorThemeData(
                    thickness: 2.w,
                    color: colors.primary,
                  ),
                ),
                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.after,
                  itemCount: order.statusHistories.length,
                  contentsBuilder: (_, index) {
                    final history = order.statusHistories.reversed.toList();
                    final status = history[index];
                    final isLatest = index == 0;
                    final date = DateTime.tryParse(status.createdAt);

                    return Padding(
                      padding: EdgeInsets.only(left: 12.w, bottom: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _formatStatusText(status.status),
                            style:
                                (isLatest
                                        ? textStyles.bodyMediumBold
                                        : textStyles.bodyMedium)
                                    .copyWith(
                                      color: isLatest
                                          ? colors.primary
                                          : colors.text,
                                    ),
                          ),
                          if (date != null) ...[
                            SizedBox(height: 4.h),
                            Text(
                              DateFormat('MMM dd, yyyy - hh:mm a').format(date),
                              style: textStyles.bodySmall.copyWith(
                                color: colors.gray,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                          if (status.comment != null &&
                              status.comment!.isNotEmpty) ...[
                            SizedBox(height: 6.h),
                            Text(
                              status.comment!,
                              style: textStyles.bodySmall.copyWith(
                                color: colors.text.withValues(alpha: 0.8),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                  indicatorBuilder: (_, index) {
                    final isLatest = index == 0;
                    return DotIndicator(
                      color: isLatest ? colors.primary : colors.grayLight,
                      size: 12.w,
                      child: isLatest
                          ? Icon(Icons.check, size: 8.w, color: colors.white)
                          : null,
                    );
                  },
                  connectorBuilder: (_, index, _) {
                    return SolidLineConnector(
                      color: index == 0 ? colors.primary : colors.grayLight,
                    );
                  },
                ),
              ),
            ),

          SizedBox(height: 16.h),

          ...order.items.map(
            (item) => _buildItemCard(item, colors, textStyles),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  String _formatStatusText(String status) {
    final normalized = status.toLowerCase().replaceAll('_', ' ');
    return normalized
        .split(' ')
        .where((s) => s.isNotEmpty)
        .map((str) {
          if (str.isEmpty) return '';
          return str[0].toUpperCase() +
              (str.length > 1 ? str.substring(1).toLowerCase() : '');
        })
        .join(' ');
  }

  Widget _buildItemCard(
    OrderCancelItemEntity item,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h, left: 16.w, right: 16.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colors.borderColor.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80.r,
                height: 80.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: colors.borderColor.withValues(alpha: 0.3),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AppImage(
                    imageUrl: item.image,
                    placeholder: Center(
                      child: CircularProgressIndicator(
                        color: colors.primary,
                        strokeWidth: 2,
                      ),
                    ),
                    errorWidget: Icon(
                      Icons.inventory_2_outlined,
                      color: colors.graySmallLight,
                      size: 32.r,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bodyLargeBold.copyWith(
                        color: colors.text,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      item.soldBy != null
                          ? "Sold by: ${item.soldBy}"
                          : "Sold by: Pickaboo Official",
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textLight,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        text: "Price: ",
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textLight,
                        ),
                        children: [
                          TextSpan(
                            text: "৳${item.price.toStringAsFixed(0)}",
                            style: textStyles.bodyMediumBold.copyWith(
                              color: colors.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: colors.borderColor.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              "Qty: ${item.qtyOrdered}",
              textAlign: TextAlign.center,
              style: textStyles.bodySmallMedium.copyWith(color: colors.text),
            ),
          ),
        ],
      ),
    );
  }

  OrderStatusAttributes _getStatusAttributes(String status) {
    const Color defaultColor = Color(0xFF1B5DD5);
    const Color cancelColor = Color(0xFFFF2222);

    if (status.toLowerCase().contains('canceled') ||
        status.toLowerCase().contains('cancelled') ||
        status.toLowerCase() == 'closed' ||
        status.toLowerCase() == 'returned') {
      return OrderStatusAttributes(
        text: 'Canceled',
        backgroundColor: cancelColor,
      );
    }

    final normalizedStatus = status.toLowerCase().replaceAll('_', ' ');

    switch (normalizedStatus) {
      case 'delivered':
        return OrderStatusAttributes(
          text: 'Delivered',
          backgroundColor: defaultColor,
        );
      case 'processing for delivery':
      case 'at the hub requested':
      case 'being picked':
      case 'picked':
      case 'on the way to hub':
      case 'at the hub':
        return OrderStatusAttributes(
          text: 'Processing for Delivery',
          backgroundColor: defaultColor,
        );
      case 'complete':
        return OrderStatusAttributes(
          text: 'Complete',
          backgroundColor: defaultColor,
        );
      case 'pending':
        return OrderStatusAttributes(
          text: 'Order Placed',
          backgroundColor: defaultColor,
        );
      case 'authorized':
        return OrderStatusAttributes(
          text: 'Authorized',
          backgroundColor: defaultColor,
        );
      case 'on the way to hub requested':
        return OrderStatusAttributes(
          text: 'Pickup In Progress',
          backgroundColor: defaultColor,
        );
      case 'in delivery':
        return OrderStatusAttributes(
          text: 'In Delivery',
          backgroundColor: defaultColor,
        );
      case 'payment review':
      case 'processing':
        return OrderStatusAttributes(
          text: 'Processing',
          backgroundColor: defaultColor,
        );
      default:
        final formatted = status
            .replaceAll('_', ' ')
            .split(' ')
            .where((s) => s.isNotEmpty)
            .map((str) {
              if (str.isEmpty) return '';
              return str[0].toUpperCase() +
                  (str.length > 1 ? str.substring(1).toLowerCase() : '');
            })
            .join(' ');

        return OrderStatusAttributes(
          text: formatted,
          backgroundColor: defaultColor,
        );
    }
  }
}
