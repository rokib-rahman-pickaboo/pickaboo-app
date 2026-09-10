import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class ProductDeliveryInfo extends StatelessWidget {
  final String? title;
  final String iconPath;
  final String mainText;
  final String subtitle;
  final VoidCallback onTap;
  final Color iconBackgroundColor;

  final bool? hasLocationPermission;

  final String? selectedAddress;

  final String? trailingText;

  const ProductDeliveryInfo({
    super.key,
    this.title,
    required this.iconPath,
    required this.mainText,
    required this.subtitle,
    required this.onTap,
    required this.iconBackgroundColor,
    this.hasLocationPermission,
    this.selectedAddress,
    this.trailingText,
  });

  bool get _isLocationMode => hasLocationPermission != null;

  bool get _noPermission => hasLocationPermission == false;

  bool get _noLocation =>
      hasLocationPermission == true &&
      (selectedAddress == null || selectedAddress!.isEmpty);

  String get _resolvedSubtitle {
    if (!_isLocationMode) return subtitle;
    if (_noPermission) {
      return 'Enable location to see estimated delivery charge';
    }
    if (_noLocation) return 'Tap to set your delivery location';
    return selectedAddress!;
  }

  String get _resolvedIconPath {
    if (_isLocationMode && (_noPermission || _noLocation)) {
      return 'assets/new/svg/location_icon.svg';
    }
    return iconPath;
  }

  Color get _resolvedIconBg {
    if (_isLocationMode && (_noPermission || _noLocation)) {
      return AppColors.muted;
    }
    return iconBackgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: AppColors.pageBg,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: textStyle.bodyMediumBold.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 8.h),
          ],

          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.pageBg,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.pageBg, width: 1.w),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: _resolvedIconBg,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: SvgPicture.asset(
                      _resolvedIconPath,
                      width: 20.w,
                      height: 20.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainText,
                          style: textStyle.bodyMediumBold.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.text,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          _resolvedSubtitle,
                          style: textStyle.bodySmall.copyWith(
                            color: AppColors.muted,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  if (trailingText != null) ...[
                    SizedBox(width: 8.w),
                    Text(
                      trailingText!,
                      style: textStyle.bodyMediumBold.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.pickabooBlue,
                      ),
                    ),
                  ],

                  Icon(
                    Icons.chevron_right,
                    size: 24.sp,
                    color: AppColors.muted,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
