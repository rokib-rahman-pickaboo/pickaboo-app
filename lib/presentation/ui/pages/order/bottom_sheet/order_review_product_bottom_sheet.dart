// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// Modern OrderReviewProductBottomSheet matching Pickaboo-App-UI design language.
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
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 20.h + MediaQuery.of(context).padding.bottom,
        top: 16.h,
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
                style: AppTypography.pageTitle,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: AppColors.muted, size: 22.sp),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            "Choose one product from your order to write a review.",
            style: AppTypography.bodyMuted,
          ),
          SizedBox(height: 16.h),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.items.length,
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = selectedItem?.itemId == item.itemId;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedItem = item;
                    });
                  },
                  borderRadius: AppRadius.cardRadius,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? AppColors.pickabooBlue
                            : AppColors.border,
                        width: isSelected ? 1.5 : 1.0,
                      ),
                      borderRadius: AppRadius.cardRadius,
                      color: isSelected
                          ? AppColors.surfaceBlue
                          : AppColors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 56.w,
                          height: 56.w,
                          decoration: BoxDecoration(
                            borderRadius: AppRadius.cardRadius,
                            color: AppColors.pageBg,
                            border: Border.all(color: AppColors.border),
                          ),
                          child: ClipRRect(
                            borderRadius: AppRadius.cardRadius,
                            child: AppImage(
                              imageUrl: item.image ?? "",
                              width: 56.w,
                              height: 56.w,
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
                                style: AppTypography.cardTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "৳${item.finalPrice.toStringAsFixed(0)}",
                                style: AppTypography.priceStandard.withColor(AppColors.pickabooBlue),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          isSelected
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: isSelected
                              ? AppColors.pickabooBlue
                              : AppColors.border,
                          size: 22.sp,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: selectedItem == null
                  ? null
                  : () {
                      Navigator.pop(context);
                      widget.onProductSelected(selectedItem!);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pickabooBlue,
                foregroundColor: AppColors.white,
                disabledBackgroundColor: AppColors.border,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.cardRadius,
                ),
              ),
              child: Text(
                "Continue",
                style: selectedItem == null ? AppTypography.buttonPrimary.withColor(AppColors.mutedLight) : AppTypography.buttonPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
