import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        const Spacer(),
        Center(
          child: SvgPicture.asset(
            'assets/new/svg/empty_cart_icon.svg',
            width: 150.w,
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          "Empty Cart",
          style: context.textStyle.headingMedium.copyWith(color: colors.text),
        ),
        SizedBox(height: 8.h),
        Text(
          "You have no items in your cart",
          style: context.textStyle.bodyLarge.copyWith(color: colors.textMedium),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.go(Routes.home),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF002B5B),
                minimumSize: Size(double.maxFinite, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                "Continue Shopping",
                style: context.textStyle.buttonMedium.copyWith(
                  color: colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
