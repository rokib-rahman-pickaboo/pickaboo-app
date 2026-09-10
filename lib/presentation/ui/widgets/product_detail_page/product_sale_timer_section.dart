import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

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
      margin: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        bottom: (AppSpacing.groupToGroupSpacing * 0.5).h,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/new/special_timer_background.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle.bodyMedium.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      height: 1.2,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.bodySmall.copyWith(
                        color: AppColors.white.withValues(alpha: 0.85),
                        fontSize: 10.5.sp,
                        height: 1.2,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(width: 8.w),

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
                  SizedBox(width: 4.w),
                  Expanded(
                    child: _buildTimerBox(
                      context,
                      hours.toString().padLeft(2, '0'),
                      'Hours',
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: _buildTimerBox(
                      context,
                      minutes.toString().padLeft(2, '0'),
                      'Min',
                    ),
                  ),
                  SizedBox(width: 4.w),
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

            SizedBox(width: 8.w),

            Expanded(
              flex: 26,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onLearnMore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pickabooBlue,
                    foregroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 8.h,
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
                      AppStrings.learnMore,
                      maxLines: 1,
                      softWrap: false,
                      style: textStyle.bodySmall.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.5.sp,
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
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 2.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
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
              color: AppColors.navy,
              fontWeight: FontWeight.bold,
              fontSize: 13.5.sp,
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
                color: AppColors.muted,
                fontSize: 9.sp,
                height: 1.15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
