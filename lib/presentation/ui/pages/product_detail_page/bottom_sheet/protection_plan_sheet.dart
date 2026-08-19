import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/selected_extra_option_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';

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
    final colors = context.colors;
    final textStyle = context.textStyle;

    final firstOption = insuranceOptions.isNotEmpty ? insuranceOptions.first : null;
    final firstValue = firstOption?.values.isNotEmpty == true ? firstOption!.values.first : null;

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: colors.green,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Icon(Icons.check, color: colors.white, size: 16.sp),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Added to cart',
                  style: textStyle.subheading.copyWith(
                    color: colors.text,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: colors.text, size: 24.sp),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colors.borderColor),

          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    'assets/new/svg/detail/pickaboo_protection_icon.svg',
                    height: 120.h,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 16.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Pickaboo Protection Plan by Allstate',
                      textAlign: TextAlign.center,
                      style: textStyle.headingMedium.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colors.text,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  if (firstValue != null) ...[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        'Protect it today. Enjoy it for years. Plan covers:',
                        textAlign: TextAlign.center,
                        style: textStyle.bodyMediumBold.copyWith(
                          color: colors.text,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    if (firstValue.details.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: AppHtml(data: firstValue.details),
                      ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Text(
                          'View all details',
                          style: textStyle.bodyMedium.copyWith(
                            color: colors.linkBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          ElevatedButton(
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
                              backgroundColor: colors.linkBlue,
                              minimumSize: Size(double.infinity, 48.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              '${firstValue.title} - ${firstValue.price}',
                              style: textStyle.buttonMedium.copyWith(
                                color: colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),

                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              onNoThanks?.call();
                            },
                            child: Text(
                              'No Thanks',
                              style: textStyle.bodyMedium.copyWith(
                                color: colors.text,
                                decoration: TextDecoration.underline,
                                decorationColor: colors.text,
                              ),
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

          Divider(height: 1, color: colors.borderColor),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Text(
                'pickaboo.com',
                textAlign: TextAlign.center,
                style: textStyle.bodyTiny.copyWith(
                  color: colors.textLight,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

