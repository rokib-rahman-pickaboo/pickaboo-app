// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// ─────────────────────────────────────────────────────────────
/// 💳 FLOATING UNIFIED CHECKOUT BOTTOM BAR
/// Matches the updated sketch:
/// 1. Top Trust Ribbon sitting on top of the card
/// 2. Sleek compact white card (Amount on left + Button on right)
/// 3. Outside T&C footnote sitting in the bottom 20.00 margin area
/// Shared across:
/// - Cart Page (My Cart)
/// - Payment Review Page (Checkout)
/// - Payment Method Page (Pay Now / Confirm Order)
/// ─────────────────────────────────────────────────────────────
class UnifiedCheckoutBottomBar extends StatelessWidget {
  final String? trustText;
  final IconData? trustIcon;
  final String priceLabel;
  final num totalPrice;
  final String buttonText;
  final bool showArrow;
  final bool isLoading;
  final VoidCallback? onPressed;
  final Widget? footnote;
  final double? buttonWidth;

  const UnifiedCheckoutBottomBar({
    super.key,
    this.trustText,
    this.trustIcon,
    this.priceLabel = 'Total Payable',
    required this.totalPrice,
    required this.buttonText,
    this.showArrow = false,
    this.isLoading = false,
    required this.onPressed,
    this.footnote,
    this.buttonWidth,
  });

  static String formatPrice(num value) {
    final formatted = value.toStringAsFixed(0);
    final result = formatted.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]},',
    );
    return '৳$result';
  }

  @override
  Widget build(BuildContext context) {
    final hasTrustTag = trustText != null && trustText!.trim().isNotEmpty;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          0,
          AppSpacing.sameGroupItemSpacing.w,
          20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── 1. Top Trust Ribbon (Flush-left with slanted right cut) ──
            if (hasTrustTag)
              Align(
                alignment: Alignment.centerLeft,
                child: CustomPaint(
                  painter: _TrustRibbonPainter(
                    fillColor: AppColors.surfaceBlue,
                    borderColor: AppColors.border,
                    radius: AppRadius.card.r,
                    slant: 12.w,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 18.w, // extra space to account for the slant cut
                      top: 4.h,
                      bottom: 3.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          trustIcon ?? Icons.shield_outlined,
                          size: 11.5.sp,
                          color: AppColors.pickabooBlue,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          trustText!,
                          style: AppTypography.brandActionText.copyWith(
                            fontSize: 9.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // ── 2. Main White Card (Height reduced 10%, Top/Bottom padding = End margin = 10) ──
            Container(
              padding: EdgeInsets.fromLTRB(
                14.w,
                10.h,
                10.w,
                10.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: hasTrustTag ? Radius.zero : Radius.circular(AppRadius.card.r),
                  topRight: Radius.circular(AppRadius.card.r),
                  bottomLeft: Radius.circular(AppRadius.card.r),
                  bottomRight: Radius.circular(AppRadius.card.r),
                ),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.navy.withValues(alpha: 0.08),
                    blurRadius: 10.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left: Amount Info
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          priceLabel,
                          style: AppTypography.bodyMuted.copyWith(
                            fontSize: 10.5.sp,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          formatPrice(totalPrice),
                          style: AppTypography.priceLarge.copyWith(
                            fontSize: 16.5.sp,
                            color: AppColors.navy,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 10.w),

                  // Right: Action Button (No arrow, padded evenly)
                  SizedBox(
                    width: buttonWidth ?? 140.w,
                    height: 40.h,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.pickabooBlue,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                      ),
                      child: isLoading
                          ? const AppLoader.button()
                          : Text(
                              buttonText,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppTypography.buttonPrimary.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),

            // ── 3. Bottom T&C / Footnote (Outside of Card in the bottom 20.00 area) ──
            if (footnote != null) ...[
              SizedBox(height: 5.h),
              Center(child: footnote!),
            ],
          ],
        ),
      ),
    );
  }
}

/// ─────────────────────────────────────────────────────────────
/// 📐 CUSTOM PAINTER FOR SLANTED TOP TRUST RIBBON
/// Draws a tab flush with the left boundary of the card,
/// rounded top-left corner, straight horizontal top, and a diagonal
/// chamfer / slant going down to the card's top edge.
/// ─────────────────────────────────────────────────────────────
class _TrustRibbonPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final double radius;
  final double slant;

  const _TrustRibbonPainter({
    required this.fillColor,
    required this.borderColor,
    required this.radius,
    required this.slant,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final r = radius.clamp(0.0, size.height);
    final s = slant.clamp(0.0, size.width);

    // 1. Fill Path
    final fillPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, r)
      ..arcToPoint(
        Offset(r, 0),
        radius: Radius.circular(r),
        clockwise: true,
      )
      ..lineTo(size.width - s, 0)
      ..lineTo(size.width, size.height)
      ..close();

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(fillPath, fillPaint);

    // 2. Stroke Path (Left, Top curve, Top horizontal, Slanted right edge)
    final strokePath = Path()
      ..moveTo(0.5, size.height)
      ..lineTo(0.5, r)
      ..arcToPoint(
        Offset(r, 0.5),
        radius: Radius.circular((r - 0.5).clamp(0.0, double.infinity)),
        clockwise: true,
      )
      ..lineTo(size.width - s, 0.5)
      ..lineTo(size.width, size.height);

    final strokePaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawPath(strokePath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _TrustRibbonPainter oldDelegate) =>
      oldDelegate.fillColor != fillColor ||
      oldDelegate.borderColor != borderColor ||
      oldDelegate.radius != radius ||
      oldDelegate.slant != slant;
}
