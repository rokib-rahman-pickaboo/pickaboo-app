import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/date_time_utils.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';

class OrderHeaderSection extends StatelessWidget {
  final OrderDetailEntity order;
  final Function(String) getStatusAttributes;
  final VoidCallback onBuyAgain;
  final VoidCallback onReview;
  final VoidCallback? onCancel;
  final bool showCancel;
  final bool showReview;

  const OrderHeaderSection({
    super.key,
    required this.order,
    required this.getStatusAttributes,
    required this.onBuyAgain,
    required this.onReview,
    this.onCancel,
    this.showCancel = false,
    this.showReview = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;
    final statusAttr = getStatusAttributes(order.status);

    return Container(
      color: colors.white,
      padding: EdgeInsets.all(16.w),
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
                    "Order #${order.orderNumber}",
                    style: textStyles.subheading.copyWith(
                      color: colors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _formatDate(order.createdAt),
                    style: textStyles.bodySmall.copyWith(color: colors.gray),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: statusAttr.backgroundColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: statusAttr.backgroundColor.withValues(alpha: 0.2),
                    width: 1.w,
                  ),
                ),
                child: Text(
                  statusAttr.text,
                  style: textStyles.bodySmallBold.copyWith(
                    color: statusAttr.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: colors.primary, width: 1.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    color: colors.black.withValues(alpha: 0.0),
                    child: InkWell(
                      onTap: onBuyAgain,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8.r),
                      ),
                      splashColor: colors.primary.withAlpha(20),
                      highlightColor: colors.primary.withAlpha(10),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 18.sp,
                              color: colors.primary,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Buy Again',
                              style: textStyles.linkSmall.withColor(
                                colors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (showReview) ...[
                  Container(width: 1.w, height: 40.h, color: colors.primary),
                  Expanded(
                    child: Material(
                      color: colors.black.withValues(alpha: 0.0),
                      child: InkWell(
                        onTap: onReview,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(8.r),
                        ),
                        splashColor: colors.primary.withAlpha(20),
                        highlightColor: colors.primary.withAlpha(10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border,
                                size: 18.sp,
                                color: colors.primary,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                'Review',
                                style: textStyles.linkSmall.withColor(
                                  colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (showCancel && onCancel != null) ...[
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: colors.red, width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Material(
                color: colors.black.withValues(alpha: 0.0),
                child: InkWell(
                  onTap: onCancel,
                  borderRadius: BorderRadius.circular(8.r),
                  splashColor: colors.red.withAlpha(20),
                  highlightColor: colors.red.withAlpha(10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Center(
                      child: Text(
                        'Cancel Order',
                        style: textStyles.badgeLarge.withColor(colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    final date = parseServerDateTime(dateString);
    if (date == null) return dateString;
    return DateFormat('dd MMMM yyyy, hh:mm a').format(date).toLowerCase();
  }
}
