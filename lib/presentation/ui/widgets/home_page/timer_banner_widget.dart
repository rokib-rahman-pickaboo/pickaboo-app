// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class TimerBannerWidget extends StatefulWidget {
  final SliderEntity banner;
  final DateTime endTime;
  final VoidCallback? onShopNow;

  const TimerBannerWidget({
    super.key,
    required this.banner,
    required this.endTime,
    this.onShopNow,
  });

  @override
  State<TimerBannerWidget> createState() => _TimerBannerWidgetState();
}

class _TimerBannerWidgetState extends State<TimerBannerWidget> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateRemainingTime();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemainingTime();
    });
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    final remaining = widget.endTime.difference(now);

    if (remaining.isNegative) {
      setState(() {
        _remainingTime = Duration.zero;
      });
      _timer?.cancel();
    } else {
      setState(() {
        _remainingTime = remaining;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.pickabooBlue.withValues(
          alpha: 0.2,
        ),
        borderRadius: AppRadius.cardRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.pageBg.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.cardRadius,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 9,
              child: Image.asset(
                AppAssets.timerBannerDemo,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.3),
                  );
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.only(top: 12.w, bottom: 12.w, right: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppAssets.token,
                          width: 8.w,
                          height: 8.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Deal of the Week',
                          style: AppTypography.bodySmall.bold().copyWith(
                            color: AppColors.text,
                            fontWeight: FontWeight.w800,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      'Hurry Up! Offer ends in. Get',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.text,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),

                    Text(
                      'UP TO 80% OFF',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.pickabooBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    _buildCountdownTimer(),

                    SizedBox(height: 12.h),

                    AppButton.primary(
                      isFullWidth: false,
                      height: 32.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 0,
                      ),
                      borderRadius: AppRadius.smRadius,
                      onPressed: widget.onShopNow,
                      text: 'Shop Now',
                      textStyle: AppTypography.bodyMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdownTimer() {
    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;
    final seconds = _remainingTime.inSeconds % 60;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: _buildTimeBox(
            days.toString().padLeft(2, '0'),
            'DAYS',
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            hours.toString().padLeft(2, '0'),
            'HRS',
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            minutes.toString().padLeft(2, '0'),
            'MIN',
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            seconds.toString().padLeft(2, '0'),
            'SEC',
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox(
    String value,
    String label,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.pickabooBlue, width: 2.w),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.pickabooBlue,
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
          ),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.pickabooBlue,
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
