// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';

/// Empty state card shown when no support categories match the search query.
class SupportEmptyState extends StatelessWidget {
  final String query;

  const SupportEmptyState({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.pickabooBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 38.sp,
              color: AppColors.pickabooBlue,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'No Questions Found',
            style: AppTypography.titleLarge,
          ),
          SizedBox(height: 6.h),
          Text(
            'We couldn\'t find any help topics matching "$query". Try searching another keyword or browse our topics.',
            textAlign: TextAlign.center,
            style: AppTypography.bodySmall,
          ),
        ],
      ),
    );
  }
}
