import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProductSaleTimerSection extends StatefulWidget {
  final DateTime? endTime;
  final VoidCallback? onLearnMore;
  final String title;

  final String? subtitle;

  const ProductSaleTimerSection({
    super.key,
    this.endTime,
    this.onLearnMore,
    required this.title,
    this.subtitle,
  });

  @override
  State<ProductSaleTimerSection> createState() =>
      _ProductSaleTimerSectionState();
}

class _ProductSaleTimerSectionState extends State<ProductSaleTimerSection> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateRemainingTime() {
    final endTime =
        widget.endTime ?? DateTime.now().add(const Duration(days: 7));
    final now = DateTime.now();
    setState(() {
      _remainingTime = endTime.difference(now);
      if (_remainingTime.isNegative) {
        _remainingTime = Duration.zero;
      }
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateRemainingTime();
      if (_remainingTime == Duration.zero) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;
    final seconds = _remainingTime.inSeconds % 60;

    final subtitle = widget.subtitle?.trim() ?? '';

    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/new/special_timer_background.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: textStyle.bodyMedium.copyWith(
                      color: context.colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      height: 1.2,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: textStyle.bodySmall.copyWith(
                        color: context.colors.white.withValues(alpha: 0.85),
                        fontSize: 11.sp,
                        height: 1.2,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              flex: 46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildTimerBox(
                      context,
                      days.toString().padLeft(2, '0'),
                      'Days',
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: _buildTimerBox(
                      context,
                      hours.toString().padLeft(2, '0'),
                      'Hours',
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: _buildTimerBox(
                      context,
                      minutes.toString().padLeft(2, '0'),
                      'Min',
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: _buildTimerBox(
                      context,
                      seconds.toString().padLeft(2, '0'),
                      'Sec',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              flex: 26,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onLearnMore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E9BF0),
                    foregroundColor: context.colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    elevation: 0,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Learn More',
                      maxLines: 1,
                      softWrap: false,
                      style: textStyle.bodySmall.copyWith(
                        color: context.colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerBox(BuildContext context, String value, String label) {
    final textStyle = context.textStyle;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 2.w),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            maxLines: 1,
            style: textStyle.bodyMedium.copyWith(
              color: const Color(0xFF16181D),
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              height: 1.15,
            ),
          ),
          SizedBox(height: 1.h),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              maxLines: 1,
              style: textStyle.caption.copyWith(
                color: const Color(0xFF7A8699),
                fontSize: 10.sp,
                height: 1.15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
