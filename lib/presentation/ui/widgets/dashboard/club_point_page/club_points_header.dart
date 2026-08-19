import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ClubPointsHeader extends StatelessWidget {
  final ClubPointEntity data;

  const ClubPointsHeader({super.key, required this.data});

  double _getProgressPercentage(ClubPointEntity data) {
    if (data.tiers.isEmpty) return 0;
    final maxPoints = int.tryParse(data.tiers.last.minPoints) ?? 0;
    if (maxPoints == 0) return 0;

    if (data.myLifeTimePoints >= maxPoints) return 1.0;

    return (data.myLifeTimePoints / maxPoints).clamp(0.0, 1.0);
  }

  String _getReachGoalText(ClubPointEntity data) {
    if (data.tiers.isEmpty) return '';

    final maxPoints = int.tryParse(data.tiers.last.minPoints) ?? 0;
    if (data.myLifeTimePoints >= maxPoints) {
      return 'You are already at max level';
    }

    for (int i = data.tiers.length - 1; i >= 0; i--) {
      final currentTierMin = int.tryParse(data.tiers[i].minPoints) ?? 0;

      if (data.myLifeTimePoints < currentTierMin) {
        continue;
      } else {
        if (i + 1 < data.tiers.length) {
          final nextTier = data.tiers[i + 1];
          final nextTierMin = int.tryParse(nextTier.minPoints) ?? 0;
          final pointsNeeded = nextTierMin - data.myLifeTimePoints;
          return '$pointsNeeded points to reach ${nextTier.name} level';
        }
        break;
      }
    }

    if (data.tiers.isNotEmpty) {
      final firstTierMin = int.tryParse(data.tiers.first.minPoints) ?? 0;
      if (data.myLifeTimePoints < firstTierMin) {
        final pointsNeeded = firstTierMin - data.myLifeTimePoints;
        return '$pointsNeeded points to reach ${data.tiers.first.name} level';
      }
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.primary, colors.primary.withAlpha(200)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withAlpha(76),
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My lifetime points',
                      style: textTheme.bodySmall.copyWith(
                        color: colors.white.withAlpha(204),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${data.myLifeTimePoints}',
                      style: textTheme.displayLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: colors.white.withAlpha(51),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Balance',
                      style: textTheme.bodySmall.copyWith(
                        color: colors.white.withAlpha(204),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${data.myPoints}',
                      style: textTheme.headingLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (data.tiers.isNotEmpty) ...[
            SizedBox(height: 20.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: LinearProgressIndicator(
                value: _getProgressPercentage(data),
                backgroundColor: colors.white.withAlpha(76),
                valueColor: AlwaysStoppedAnimation<Color>(colors.shamrock),
                minHeight: 12.h,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.tiers.first.name,
                  style: textTheme.bodySmall.copyWith(
                    color: colors.white.withAlpha(204),
                  ),
                ),
                Text(
                  data.tiers.last.name,
                  style: textTheme.bodySmall.copyWith(
                    color: colors.white.withAlpha(204),
                  ),
                ),
              ],
            ),
          ],

          if (_getReachGoalText(data).isNotEmpty) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: colors.white.withAlpha(51),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.emoji_events, color: colors.white, size: 16.sp),
                  SizedBox(width: 8.w),
                  Text(
                    _getReachGoalText(data),
                    style: textTheme.bodySmall.copyWith(color: colors.white),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
