import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';

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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: colors.primary.withValues(
          alpha: 0.2,
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colors.whiteSmoke.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 9,
              child: Image.asset(
                'assets/new/demo/timer_banner_demo.png',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: colors.primary.withValues(alpha: 0.3),
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
                          'assets/new/svg/token_icon.svg',
                          width: 8.w,
                          height: 8.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Deal of the Week',
                          style: textStyle.bodySmallBold.copyWith(
                            color: colors.text,
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
                      style: textStyle.bodyMedium.copyWith(
                        color: colors.text,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),

                    Text(
                      'UP TO 80% OFF',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.bodyMedium.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    _buildCountdownTimer(colors, textStyle),

                    SizedBox(height: 12.h),

                    SizedBox(
                      height: 32.h,
                      child: ElevatedButton(
                        onPressed: widget.onShopNow,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primary,
                          foregroundColor: colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Shop Now',
                          style: textStyle.bodyMedium.copyWith(
                            color: colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
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

  Widget _buildCountdownTimer(AppColors colors, AppTextStyles textStyle) {
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
            colors,
            textStyle,
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            hours.toString().padLeft(2, '0'),
            'HRS',
            colors,
            textStyle,
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            minutes.toString().padLeft(2, '0'),
            'MIN',
            colors,
            textStyle,
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            seconds.toString().padLeft(2, '0'),
            'SEC',
            colors,
            textStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox(
    String value,
    String label,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.primary, width: 2.w),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: textStyle.bodyMedium.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
          ),
          Text(
            label,
            style: textStyle.bodySmall.copyWith(
              color: colors.primary,
              fontSize: 8.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
