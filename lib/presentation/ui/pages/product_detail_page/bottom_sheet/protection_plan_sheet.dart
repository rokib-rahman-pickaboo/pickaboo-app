// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/selected_extra_option_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';

/// Modern ProtectionPlanSheet matching Pickaboo-App-UI design language.
class ProtectionPlanSheet extends StatelessWidget {
  final List<ExtraOptionEntity> insuranceOptions;
  final Function(List<SelectedExtraOptionEntity>)? onPlanSelected;
  final VoidCallback? onNoThanks;

  const ProtectionPlanSheet({
    super.key,
    required this.insuranceOptions,
    this.onPlanSelected,
    this.onNoThanks,
  });

  @override
  Widget build(BuildContext context) {
    final firstOption =
        insuranceOptions.isNotEmpty ? insuranceOptions.first : null;
    final firstValue = firstOption?.values.isNotEmpty == true
        ? firstOption!.values.first
        : null;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Icon(Icons.check, color: AppColors.white, size: 14.sp),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Added to cart',
                  style: AppTypography.pageTitle,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: AppColors.muted,
                    size: 22.sp,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),

          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    'assets/new/svg/detail/pickaboo_protection_icon.svg',
                    height: 100.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 14.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Pickaboo Protection Plan by Allstate',
                      textAlign: TextAlign.center,
                      style: AppTypography.pageTitle,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  if (firstValue != null) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'Protect it today. Enjoy it for years. Plan covers:',
                        textAlign: TextAlign.center,
                        style: AppTypography.cardTitle,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    if (firstValue.details.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceBlue,
                            borderRadius: AppRadius.cardRadius,
                            border: Border.all(color: AppColors.border),
                          ),
                          child: AppHtml(data: firstValue.details),
                        ),
                      ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'View all details',
                          style: AppTypography.brandActionText,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sameGroupItemSpacing.w * 2,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 48.h,
                            child: ElevatedButton(
                              onPressed: () {
                                final selection = SelectedExtraOptionEntity(
                                  optionId: firstOption!.optionId,
                                  optionTypeId: firstValue.optionTypeId,
                                  title: firstValue.title,
                                  price: firstValue.price,
                                );
                                Navigator.of(context).pop();
                                onPlanSelected?.call([selection]);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.pickabooBlue,
                                foregroundColor: AppColors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: AppRadius.cardRadius,
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                '${firstValue.title} - ${firstValue.price}',
                                style: AppTypography.buttonPrimary,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),

                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              onNoThanks?.call();
                            },
                            child: Text(
                              'No Thanks',
                              style: AppTypography.bodyMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          const Divider(height: 1, color: AppColors.border),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                'pickaboo.com',
                textAlign: TextAlign.center,
                style: AppTypography.bodyMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
