import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_cancel_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:timelines_plus/timelines_plus.dart';

class CancellationSuccessView extends StatelessWidget {
  final OrderCancelEntity order;
  final VoidCallback onViewDetails;

  const CancellationSuccessView({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Icon(Icons.check_circle, color: colors.green, size: 64.w),
                SizedBox(height: 12.h),
                Text(
                  "Cancellation Successful",
                  style: textStyles.headingSmall.copyWith(
                    color: colors.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Your order has been cancelled successfully",
                  textAlign: TextAlign.center,
                  style: textStyles.bodyMedium.copyWith(color: colors.gray),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          if (order.statusHistories.isNotEmpty)
            Container(
              color: colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: OutlinedButton(
                onPressed: onViewDetails,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: colors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "View Details",
                  style: textStyles.buttonMedium.copyWith(
                    color: colors.primary,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
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
}
