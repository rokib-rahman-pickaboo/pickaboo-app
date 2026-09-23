// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

/// Result returned from [DeviceInsuranceDialog].
///
/// [accepted] is `true` when the user taps "Add Protection Plan".
/// [optionId] and [optionTypeId] identify the selected insurance custom option.
class DeviceInsuranceResult {
  final bool accepted;
  final int optionId;
  final int optionTypeId;

  const DeviceInsuranceResult({
    required this.accepted,
    required this.optionId,
    required this.optionTypeId,
  });
}

/// A popup dialog offering Device Insurance / Protection Plan after the item
/// has been validated and is about to be added to cart.
///
/// When [isRequired] is `true`, the "No thanks" option is hidden and the
/// barrier is not dismissible — Magento requires the custom option.
/// When [isRequired] is `false`, the user can decline via "No thanks".
class DeviceInsuranceDialog extends StatelessWidget {
  final ExtraOptionEntity insuranceOption;
  final bool isRequired;

  const DeviceInsuranceDialog({
    super.key,
    required this.insuranceOption,
    this.isRequired = false,
  });

  /// Show the dialog and return a [DeviceInsuranceResult] if the user accepts,
  /// or `null` if declined / dismissed.
  static Future<DeviceInsuranceResult?> show(
    BuildContext context, {
    required ExtraOptionEntity insuranceOption,
    bool isRequired = false,
  }) {
    return showDialog<DeviceInsuranceResult>(
      context: context,
      barrierDismissible: !isRequired,
      builder: (_) => DeviceInsuranceDialog(
        insuranceOption: insuranceOption,
        isRequired: isRequired,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstValue =
        insuranceOption.values.isNotEmpty ? insuranceOption.values.first : null;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      backgroundColor: AppColors.white,
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context),
              const Divider(height: 1),
              _buildBody(context, firstValue),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Header: Title + Close (matching app dialog pattern) ─────────────────
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Device Insurance',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (!isRequired)
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.close, color: AppColors.text, size: 22.sp),
            ),
        ],
      ),
    );
  }

  // ─── Body: Shield icon, subtitle, coverage details, CTA ──────────────────
  Widget _buildBody(BuildContext context, ExtraOptionValueEntity? firstValue) {
    return Flexible(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Shield Icon ──
            Image.asset(
              AppAssets.deviceInsuranceShield,
              width: 64.w,
              height: 64.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 12.h),

            // ── Subtitle ──
            Text(
              'Complete Peace of Mind',
              textAlign: TextAlign.center,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.muted,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20.h),

            // ── "WHAT'S COVERED" card — data from value.details ──
            if (insuranceOption.values.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  color: AppColors.pageBg,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WHAT\'S COVERED',
                      style: AppTypography.bodyTiny.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: AppColors.muted,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Each value: parse details by newlines, fall back to title
                    ...insuranceOption.values.map((value) {
                      final detailLines = value.details.isNotEmpty
                          ? value.details
                              .split(RegExp(r'\r\n|\n|\r'))
                              .map((line) => line.trim())
                              .where((line) => line.isNotEmpty)
                              .toList()
                          : <String>[];

                      // If details is empty, fall back to title
                      final coverageLines = detailLines.isNotEmpty
                          ? detailLines
                          : [value.title];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...coverageLines.map(
                            (line) => Padding(
                              padding: EdgeInsets.only(
                                bottom: line != coverageLines.last ? 6.h : 0,
                              ),
                              child: _buildCoverageRow(line),
                            ),
                          ),
                          if (value != insuranceOption.values.last)
                            SizedBox(height: 8.h),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            SizedBox(height: 24.h),

            // ── Primary CTA: Add Protection Plan ──
            if (firstValue != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: AppButton.primary(
                  borderRadius: BorderRadius.circular(30.r),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  text: firstValue.price > 0
                      ? 'Add Protection Plan (৳${firstValue.price})'
                      : 'Add Protection Plan (Free)',
                  textStyle: AppTypography.bodyLarge
                      .bold()
                      .copyWith(color: AppColors.white),
                  onPressed: () {
                    Navigator.of(context).pop(
                      DeviceInsuranceResult(
                        accepted: true,
                        optionId: insuranceOption.optionId,
                        optionTypeId: firstValue.optionTypeId,
                      ),
                    );
                  },
                ),
              ),

            // ── "No thanks" — only shown when insurance is optional ──
            if (!isRequired) ...[
              SizedBox(height: 14.h),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text(
                  'No thanks',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
            SizedBox(height: 8.h),

            // ── Subtle footer text ──
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shield_outlined,
                  color: AppColors.mutedLight,
                  size: 12.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  'Protection by Pickaboo.com',
                  style: AppTypography.bodyTiny.copyWith(
                    color: AppColors.mutedLight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ─── Single coverage line with blue checkmark ────────────────────────────
  Widget _buildCoverageRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 2.h),
          padding: EdgeInsets.all(2.w),
          decoration: const BoxDecoration(
            color: AppColors.pickabooBlue,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: AppColors.white,
            size: 10.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.navy,
            ),
          ),
        ),
      ],
    );
  }
}
