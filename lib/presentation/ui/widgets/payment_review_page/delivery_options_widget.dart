import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/demo/payment_models.dart';

/// ============================================================================
/// 🚚 DELIVERY OPTIONS WIDGET (Matching img1 specification)
/// ============================================================================
class DeliveryOptionsWidget extends StatelessWidget {
  final List<DeliveryMethod> methods;
  final Function(DeliveryMethod) onSameMethodSelected;

  const DeliveryOptionsWidget({
    super.key,
    required this.methods,
    required this.onSameMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: AppDecorations.cardBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Delivery Options",
            style: AppTypography.titleMedium,
          ),
          SizedBox(height: 8.h),
          if (methods.isNotEmpty)
            Column(
              children: [
                for (var i = 0; i < methods.length; i++) ...[
                  if (i > 0) SizedBox(height: 8.h),
                  _DeliveryOptionCard(
                    key: ValueKey("${methods[i].carrierCode}_${methods[i].methodCode}"),
                    method: methods[i],
                    onTap: () => onSameMethodSelected(methods[i]),
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

class _DeliveryOptionCard extends StatelessWidget {
  final DeliveryMethod method;
  final VoidCallback onTap;

  const _DeliveryOptionCard({
    super.key,
    required this.method,
    required this.onTap,
  });

  String get _amount => method.amount > 0
      ? '৳ ${method.amount.toStringAsFixed(0)}'
      : '৳ 0';

  @override
  Widget build(BuildContext context) {
    final selected = method.isSelected;

    return GestureDetector(
      onTap: selected ? null : onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.surfaceBlue : AppColors.white,
          borderRadius: AppRadius.k8,
          border: Border.all(
            color: selected ? AppColors.pickabooBlue : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _RadioDot(selected: selected),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.carrierTitle,
                    style: AppTypography.titleSmall,
                  ),
                  if (method.methodTitle.isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    Text(
                      method.methodTitle,
                      style: AppTypography.bodySmall.copyWith(
                        height: 1.25,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              _amount,
              style: AppTypography.priceStandard.copyWith(
                color: AppColors.pickabooBlue,
                fontSize: 13.5.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool selected;

  const _RadioDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.w,
      height: 18.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.pickabooBlue : AppColors.border,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.pickabooBlue,
                ),
              ),
            )
          : null,
    );
  }
}
