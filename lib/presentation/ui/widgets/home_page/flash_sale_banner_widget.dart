// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/hex_color.dart';
import 'package:pickaboo/domain/entity/home_flash_sale/home_flash_sale_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FlashSaleBannerWidget extends StatelessWidget {
  final FlashSaleBannerEntity banner;
  final DateTime? startTime;
  final DateTime? endTime;
  final String title;
  final String shortDescription;
  final String description;

  final String? titleColor;
  final String? subTitleColor;
  final String? descriptionColor;

  final VoidCallback? onShopNow;

  const FlashSaleBannerWidget({
    super.key,
    required this.banner,
    this.startTime,
    this.endTime,
    required this.title,
    this.shortDescription = '',
    this.description = '',
    this.titleColor,
    this.subTitleColor,
    this.descriptionColor,
    this.onShopNow,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final hasCopy = description.isNotEmpty;
    final resolvedTitleColor = hexToColor(titleColor) ?? AppColors.text;
    final resolvedHeadlineColor =
        hexToColor(subTitleColor) ?? AppColors.text.withValues(alpha: 0.8);
    final resolvedDescriptionColor = hexToColor(descriptionColor) ?? AppColors.text;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    return RepaintBoundary(
      child: Container(
        constraints: BoxConstraints(minHeight: 160.h),
        margin: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          AppSpacing.sameGroupItemSpacing.h,
          AppSpacing.sameGroupItemSpacing.w,
          0,
        ),
        decoration: BoxDecoration(
          color: AppColors.pickabooBlue.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.pageBg.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: banner.mobileImageUrl.isNotEmpty
                      ? banner.mobileImageUrl
                      : banner.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  memCacheWidth: (screenWidth * devicePixelRatio).round(),
                  placeholder: (context, url) => Container(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.3),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.3),
                  ),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 9),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 14.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/new/svg/token_icon.svg',
                                width: 8.w,
                                height: 8.w,
                                colorFilter: ColorFilter.mode(
                                  resolvedTitleColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                title,
                                style: textStyle.bodySmallBold.copyWith(
                                  color: resolvedTitleColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8.h),

                          if (shortDescription.isNotEmpty) ...[
                            Text(
                              shortDescription,
                              style: textStyle.bodySmall.copyWith(
                                color: resolvedHeadlineColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(height: 6.h),
                          ],

                          if (description.isNotEmpty)
                            Text(
                              description,
                              style: textStyle.bodyMedium.copyWith(
                                color: resolvedDescriptionColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                                height: 1.3,
                              ),
                            ),

                          if (startTime != null || endTime != null) ...[
                            SizedBox(height: hasCopy ? 12.h : 10.h),
                            RepaintBoundary(
                              child: _CountdownView(
                                startTime: startTime,
                                endTime: endTime,
                              ),
                            ),
                          ],

                          SizedBox(height: 12.h),

                          SizedBox(
                            height: 30.h,
                            child: ElevatedButton(
                              onPressed: onShopNow,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.pickabooBlue,
                                foregroundColor: AppColors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 22.w,
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
                                  color: AppColors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}

enum _SalePhase {
  pre,

  live,

  ended,
}

class _CountdownView extends StatefulWidget {
  final DateTime? startTime;
  final DateTime? endTime;

  const _CountdownView({this.startTime, this.endTime});

  @override
  State<_CountdownView> createState() => _CountdownViewState();
}

class _CountdownViewState extends State<_CountdownView> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;
  _SalePhase _phase = _SalePhase.ended;

  @override
  void initState() {
    super.initState();
    _updateRemainingTime();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant _CountdownView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startTime != widget.startTime ||
        oldWidget.endTime != widget.endTime) {
      _updateRemainingTime();
      if (_timer == null || !_timer!.isActive) _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemainingTime();
    });
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    final start = widget.startTime;
    final end = widget.endTime;

    _SalePhase phase;
    Duration remaining;

    if (start != null && now.isBefore(start)) {
      phase = _SalePhase.pre;
      remaining = start.difference(now);
    } else if (end != null && now.isBefore(end)) {
      phase = _SalePhase.live;
      remaining = end.difference(now);
    } else {
      phase = _SalePhase.ended;
      remaining = Duration.zero;
      _timer?.cancel();
    }

    if (!mounted) return;
    if (phase == _phase && remaining.inSeconds == _remainingTime.inSeconds) {
      return;
    }
    setState(() {
      _phase = phase;
      _remainingTime = remaining;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    if (_phase == _SalePhase.ended) return const SizedBox.shrink();

    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;
    final seconds = _remainingTime.inSeconds % 60;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_phase == _SalePhase.pre) ...[
            Text(
              'STARTS IN',
              style: textStyle.bodySmall.copyWith(
                color: AppColors.text,
                fontSize: 8.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 4.h),
          ],
          _buildBoxes(days, hours, minutes, seconds, textStyle),
        ],
      ),
    );
  }

  Widget _buildBoxes(
    int days,
    int hours,
    int minutes,
    int seconds,
    AppTextStyles textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (days > 0) ...[
          Expanded(
            child: _buildTimeBox(
              days.toString().padLeft(2, '0'),
              'DAYS',
              textStyle,
            ),
          ),
          SizedBox(width: 2.w),
        ],
        Expanded(
          child: _buildTimeBox(
            hours.toString().padLeft(2, '0'),
            'HRS',
            textStyle,
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            minutes.toString().padLeft(2, '0'),
            'MIN',
            textStyle,
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: _buildTimeBox(
            seconds.toString().padLeft(2, '0'),
            'SEC',
            textStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox(
    String value,
    String label,
    AppTextStyles textStyle,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.pickabooBlue, width: 2.w),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            maxLines: 1,
            style: textStyle.bodyMedium.copyWith(
              color: AppColors.pickabooBlue,
              fontWeight: FontWeight.w700,
              fontSize: 11.sp,
              height: 1.1,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              maxLines: 1,
              style: textStyle.bodySmall.copyWith(
                color: AppColors.pickabooBlue,
                fontSize: 7.sp,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
