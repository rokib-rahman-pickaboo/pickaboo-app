import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class OrderReviewProductBottomSheet extends StatefulWidget {
  final List<OrderItemDetailEntity> items;
  final Function(OrderItemDetailEntity) onProductSelected;

  const OrderReviewProductBottomSheet({
    super.key,
    required this.items,
    required this.onProductSelected,
  });

  @override
  State<OrderReviewProductBottomSheet> createState() =>
      _OrderReviewProductBottomSheetState();
}

class _OrderReviewProductBottomSheetState
    extends State<OrderReviewProductBottomSheet> {
  OrderItemDetailEntity? selectedItem;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 20.h + MediaQuery.of(context).padding.bottom,
        top: 12.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Product to Review",
                style: textStyles.headingSmall.copyWith(
                  color: colors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: colors.gray, size: 24.r),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            "Choose one product from your order to write a review.",
            style: textStyles.bodySmall.copyWith(color: colors.gray),
          ),
          SizedBox(height: 20.h),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.items.length,
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = selectedItem?.itemId == item.itemId;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedItem = item;
                    });
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? colors.primary : colors.borderLight,
                        width: isSelected ? 2.w : 1.w,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                      color: isSelected
                          ? colors.primary.withValues(alpha: 0.05)
                          : colors.black.withValues(alpha: 0.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: colors.backgroundGray,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: AppImage(
                              imageUrl: item.image ?? "",
                              width: 60.w,
                              height: 60.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.itemName,
                                style: textStyles.bodyMediumBold.copyWith(
                                  color: colors.text,
                                  fontSize: 14.sp,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "৳${item.finalPrice.toStringAsFixed(0)}",
                                style: textStyles.bodySmall.copyWith(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: isSelected ? colors.primary : colors.grayLight,
                          size: 24.r,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedItem == null
                  ? null
                  : () {
                      Navigator.pop(context);
                      widget.onProductSelected(selectedItem!);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.white,
                disabledBackgroundColor: colors.grayLight,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                elevation: 0,
              ),
              child: Text(
                "Continue",
                style: textStyles.buttonMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: selectedItem == null ? colors.gray : colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
