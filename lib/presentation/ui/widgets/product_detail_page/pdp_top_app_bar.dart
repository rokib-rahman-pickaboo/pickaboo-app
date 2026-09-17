// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Floating persistent top bar for the Product Detail Page.
///
/// Only shown when the user has scrolled past the hero image.
/// Displays: Back button (left), product title (center), Search + Cart (right).
/// Animates in from above when [isVisible] becomes true.
class PdpTopAppBar extends StatelessWidget {
  final String title;
  final int cartCount;
  final VoidCallback? onBack;
  final VoidCallback? onSearch;
  final VoidCallback? onCart;
  final bool isVisible;
  final bool isScrolledPastHero;
  final bool showBackButton;

  const PdpTopAppBar({
    super.key,
    required this.title,
    this.cartCount = 0,
    this.onBack,
    this.onSearch,
    this.onCart,
    required this.isVisible,
    required this.isScrolledPastHero,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isVisible,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        offset: isVisible ? Offset.zero : const Offset(0, -1.2),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: isScrolledPastHero
              ? BoxDecoration(
                  color: AppColors.white,
                  border: const Border(
                    bottom: BorderSide(
                      color: AppColors.border,
                      width: 1.0,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.navy.withValues(alpha: 0.04),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                )
              : const BoxDecoration(
                  color: AppColors.transparent,
                ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
            vertical: AppSpacing.sameGroupItemSpacing.h,
          ),
          child: Row(
            children: [
              // Left: Back button
              if (showBackButton)
                _PdpCircleButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  size: 16.sp,
                  onTap: onBack ?? () => Navigator.of(context).maybePop(),
                )
              else
                const SizedBox.shrink(),

              // Center: Product title (only visible when scrolled past hero)
              Expanded(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  opacity: isScrolledPastHero ? 1.0 : 0.0,
                  child: IgnorePointer(
                    ignoring: !isScrolledPastHero,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.titleLarge.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.navy,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Right: Search & Cart actions
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onSearch != null)
                    _PdpCircleButton(
                      icon: Icons.search_rounded,
                      size: 18.sp,
                      onTap: onSearch!,
                    ),
                  if (onSearch != null && onCart != null)
                    AppSpacing.sameGroupWidthGap,
                  if (onCart != null)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _PdpCircleButton(
                          icon: Icons.shopping_bag_outlined,
                          size: 18.sp,
                          onTap: onCart!,
                        ),
                        if (cartCount > 0)
                          Positioned(
                            top: -2.h,
                            right: -2.w,
                            child: Container(
                              padding: EdgeInsets.all(
                                AppSpacing.sameGroupItemSpacing.w / 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.pickabooBlue,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 1.2.w,
                                ),
                              ),
                              child: Text(
                                '$cartCount',
                                style: AppTypography.button.copyWith(
                                  fontSize: 10.sp,
                                ),
                              ),
                            ),
                          ),
                      ],
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

class _PdpCircleButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onTap;

  const _PdpCircleButton({
    required this.icon,
    this.size = 18,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, size: size, color: AppColors.navy),
        ),
      ),
    );
  }
}
