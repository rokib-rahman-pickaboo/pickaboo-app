import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/demo/payment_models.dart';

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
    final colors = context.colors;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: context.colors.borderColor),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Delivery Options", style: context.textStyle.bodyMediumBold),
            SizedBox(height: 8.h),
            if (methods.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < methods.length; i++) ...[
                        if (i > 0) SizedBox(width: 10.w),
                        _DeliveryOptionCard(
                          method: methods[i],
                          onTap: () => onSameMethodSelected(methods[i]),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryOptionCard extends StatelessWidget {
  final DeliveryMethod method;
  final VoidCallback onTap;

  const _DeliveryOptionCard({required this.method, required this.onTap});

  String get _amount => method.amount.toStringAsFixed(0);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final selected = method.isSelected;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 250.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? colors.primary : colors.borderColor,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _RadioDot(selected: selected, color: colors.primary),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.carrierTitle,
                    style: context.textStyle.bodyMediumBold.withColor(
                      colors.text,
                    ),
                  ),
                  if (method.carrierTitle.isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    Text(
                      method.methodTitle,
                      style: context.textStyle.bodySmall.withColor(
                        colors.silverChalice,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "৳ $_amount",
              style: context.textStyle.productPrice.withColor(colors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool selected;
  final Color color;

  const _RadioDot({required this.selected, required this.color});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: 18.w,
      height: 18.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? color : colors.silverChalice,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
            )
          : null,
    );
  }
}
