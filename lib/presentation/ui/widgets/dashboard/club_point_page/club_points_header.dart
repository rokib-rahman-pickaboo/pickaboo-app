// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';

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
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.pickabooBlue,
            AppColors.navy,
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.pickabooBlue.withValues(alpha: 0.35),
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
                      style: AppTypography.bodyRegular.withColor(Colors.white.withValues(alpha: 0.85)),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${data.myLifeTimePoints}',
                      style: AppTypography.heroTitle.size(28.sp).withColor(Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Balance',
                      style: AppTypography.bodyMuted.withColor(Colors.white.withValues(alpha: 0.85)),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '${data.myPoints}',
                      style: AppTypography.pageTitleWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (data.tiers.isNotEmpty) ...[
            SizedBox(height: 16.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: LinearProgressIndicator(
                value: _getProgressPercentage(data),
                backgroundColor: Colors.white.withValues(alpha: 0.25),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.green,
                ),
                minHeight: 8.h,
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.tiers.first.name,
                  style: AppTypography.bodyMuted.withColor(Colors.white.withValues(alpha: 0.85)),
                ),
                Text(
                  data.tiers.last.name,
                  style: AppTypography.bodyMuted.withColor(Colors.white.withValues(alpha: 0.85)),
                ),
              ],
            ),
          ],

          if (_getReachGoalText(data).isNotEmpty) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.emoji_events_rounded,
                    color: Colors.white,
                    size: 15.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    _getReachGoalText(data),
                    style: AppTypography.buttonPrimary.size(11.5.sp),
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
