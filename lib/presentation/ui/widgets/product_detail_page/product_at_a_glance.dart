import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class ProductAtAGlance extends StatelessWidget {
  const ProductAtAGlance({super.key, required this.moreInformationEntity});

  final List<MoreInformationEntity> moreInformationEntity;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    if (moreInformationEntity.isEmpty) {
      return const SizedBox.shrink();
    }

    final firstGroup = moreInformationEntity.first;
    final attrList = firstGroup.attrList;

    if (attrList.isEmpty) {
      return const SizedBox.shrink();
    }

    final icons = [
      'assets/new/svg/detail/volume_icon.svg',
      'assets/new/svg/detail/refrigerator_icon.svg',
      'assets/new/svg/detail/brand_icon.svg',
      'assets/new/svg/detail/door_icon.svg',
      'assets/new/svg/detail/dimensions_icon.svg',
      'assets/new/svg/detail/freezer_icon.svg',
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      color: colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'At a glance',
            style: textStyle.subheading.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.text,
            ),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridColumnsFor(context, tablet: 3, largeTablet: 4),
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.w,
              childAspectRatio: 1.1,
            ),
            itemCount: attrList.length > 6 ? 6 : attrList.length,
            itemBuilder: (context, index) {
              final attr = attrList[index];
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: colors.pattensBlue.withValues(
                    alpha: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (attr.iconUrl.isNotEmpty)
                      if (attr.iconUrl.endsWith('.svg'))
                        SvgPicture.network(
                          attr.iconUrl,
                          height: 28.h,
                        )
                      else
                        AppImage(
                          imageUrl: attr.iconUrl,
                          height: 28.h,
                          fit: BoxFit.contain,
                        )
                    else
                      SvgPicture.asset(
                        icons[index % icons.length],
                        height: 28.h,
                        colorFilter: ColorFilter.mode(
                          colors.text,
                          BlendMode.srcIn,
                        ),
                      ),
                    SizedBox(height: 12.h),
                    Text(
                      attr.label,
                      style: textStyle.bodyMediumBold.copyWith(
                        color: colors.text,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      attr.value,
                      style: textStyle.productDescription.copyWith(
                        fontWeight: FontWeight.w400,
                        color: colors.textMedium,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
