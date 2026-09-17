// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Standardized SavedWalletItem styled as a list tile for grouped container views
/// (matching dashboard item list pattern).
class SavedWalletItem extends StatelessWidget {
  final String linkedMasked;
  final String last4;
  final bool isSelected;
  final VoidCallback onTap;

  const SavedWalletItem({
    super.key,
    required this.linkedMasked,
    required this.last4,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected ? AppColors.surfaceBlue.withValues(alpha: 0.5) : AppColors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        child: Row(
          children: [
            // ── Wallet Icon (36x36) ──
            Container(
              width: 36.w,
              height: 36.w,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.buttonRadius,
                border: Border.all(
                  color: isSelected
                      ? AppColors.pickabooBlue.withValues(alpha: 0.4)
                      : AppColors.border,
                ),
              ),
              child: SvgPicture.asset(
                AppAssets.bkash,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 12.w),

            // ── Details ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'bKash',
                        style: AppTypography.titleSmall,
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.surfaceBlue,
                          borderRadius: AppRadius.badgeRadius,
                        ),
                        child: Text(
                          'Saved',
                          style: AppTypography.brandTag,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    linkedMasked,
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),

            // ── Radio Dot ──
            _RadioDot(selected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool selected;

  const _RadioDot({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected ? AppColors.pickabooBlue : AppColors.border,
          width: 2,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.pickabooBlue,
                ),
              ),
            )
          : null,
    );
  }
}
