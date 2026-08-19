import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

class PlaceOrderBottomBar extends StatelessWidget {
  final double total;
  final VoidCallback onPlaceOrder;

  const PlaceOrderBottomBar({
    super.key,
    required this.total,
    required this.onPlaceOrder,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 10.r,
            offset: Offset(0, -4.h),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.button,
                foregroundColor: colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                minimumSize: Size(double.maxFinite, 48.h),
              ),
              onPressed: onPlaceOrder,
              child: Text(
                'Place Order',
                style: context.textStyle.buttonMedium.withColor(colors.white),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.push(Routes.terms);
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "By clicking place order, I agree to Pickaboo's ",
                      ),
                      TextSpan(
                        text: "Terms of Conditions",
                        style: context.textStyle.linkSmall.withColor(
                          colors.primary,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: context.textStyle.linkSmall.copyWith(
                    color: colors.silverChalice,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
