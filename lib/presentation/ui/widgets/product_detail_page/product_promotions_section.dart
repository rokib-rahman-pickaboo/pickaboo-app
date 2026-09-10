import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/bloc/promo_bloc/promo_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/dialog/free_delivery_coupon_dialog.dart';

class ProductPromotionsSection extends StatelessWidget {
  const ProductPromotionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoBloc, PromoState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (promo) {
            if (!promo.isEligible) return const SizedBox.shrink();
            final textStyle = context.textStyle;

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              color: AppColors.white,
              child: Row(
                children: [
                  Text(
                    'Promotions:',
                    style: textStyle.offerBadge.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.text,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  GestureDetector(
                    onTap: () => FreeDeliveryCouponDialog.show(
                      context,
                      couponCode: promo.couponCode,
                    ),
                    child: ClipPath(
                      clipper: _PromotionBadgeClipper(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 6.h,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.pickabooBlue,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Free Delivery',
                              style: textStyle.offerBadge.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.white,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _PromotionBadgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const radius = 4.0;
    const notchDepth = 10.0;
    const notchWidth = 6.0;

    path.moveTo(radius, 0);
    path.lineTo(size.width - notchWidth, 0);
    path.lineTo(size.width - notchWidth - notchDepth, size.height / 2);
    path.lineTo(size.width - notchWidth, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
