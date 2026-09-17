import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// 7. KEY HIGHLIGHTS 2x2 SPEC GRID (Exact Pickaboo-App-UI Card Design with Dynamic API Icons)
class PdpKeyHighlightsWidget extends StatelessWidget {
  final List<MoreInformationEntity> moreInformation;

  const PdpKeyHighlightsWidget({
    super.key,
    required this.moreInformation,
  });

  static const List<String> _defaultFallbackIcons = [
    AppAssets.detailBrand,
    AppAssets.detailDimensions,
    AppAssets.detailVolume,
    AppAssets.detailRefrigerator,
    AppAssets.detailDoor,
    AppAssets.detailFreezer,
  ];

  int _computeLinesNeeded(String text, TextStyle style, double maxWidth) {
    if (text.isEmpty) return 1;
    final span = TextSpan(text: text, style: style);
    final width = maxWidth > 0 ? maxWidth : 120.0;

    final tp1 = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(maxWidth: width);
    final exceeds1 = tp1.didExceedMaxLines;
    tp1.dispose();

    if (!exceeds1) return 1;

    final tp2 = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
      maxLines: 2,
    )..layout(maxWidth: width);
    final exceeds2 = tp2.didExceedMaxLines;
    tp2.dispose();

    if (!exceeds2) return 2;

    return 3;
  }

  @override
  Widget build(BuildContext context) {
    // Extract only attributes that are explicitly marked isFeatured == true
    final List<AttrListEntity> topSpecs = [];
    for (final group in moreInformation) {
      for (final attr in group.attrList) {
        if (attr.isFeatured) {
          topSpecs.add(attr);
        }
      }
    }

    if (topSpecs.isEmpty) return const SizedBox.shrink();

    final subtitleStyle = AppTypography.bodySmall.copyWith(
      fontSize: 11.5.sp,
      height: 1.25,
      color: AppColors.muted,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Highlights',
          style: AppTypography.titleMedium,
        ),
        AppSpacing.sameGroupHeightGap,
        LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final tileWidth =
                (availableWidth - AppSpacing.sameGroupItemSpacing.w) / 2;
            final textMaxWidth = tileWidth -
                (AppSpacing.sameGroupItemSpacing.w * 2) -
                24.w -
                AppSpacing.sameGroupItemSpacing.w;
            final effectiveMaxWidth =
                (availableWidth.isFinite && textMaxWidth > 0)
                    ? textMaxWidth
                    : 120.0;

            return Column(
              children: [
                for (int r = 0; r < topSpecs.length; r += 2) ...[
                  Builder(
                    builder: (context) {
                      final item1 = topSpecs[r];
                      final item2 =
                          (r + 1 < topSpecs.length) ? topSpecs[r + 1] : null;

                      final val1 = item1.value.trim();
                      final val2 = item2?.value.trim() ?? '';

                      final lines1 = _computeLinesNeeded(
                        val1,
                        subtitleStyle,
                        effectiveMaxWidth,
                      );
                      final lines2 = item2 != null
                          ? _computeLinesNeeded(
                              val2,
                              subtitleStyle,
                              effectiveMaxWidth,
                            )
                          : 1;
                      final rowLines = item2 != null
                          ? (lines1 > lines2 ? lines1 : lines2)
                          : lines1;

                      final emptyLinesToAdd1 = rowLines - lines1;
                      final item1Text = emptyLinesToAdd1 > 0
                          ? '$val1${'\n' * emptyLinesToAdd1}'
                          : val1;

                      final emptyLinesToAdd2 = rowLines - lines2;
                      final item2Text = emptyLinesToAdd2 > 0
                          ? '$val2${'\n' * emptyLinesToAdd2}'
                          : val2;

                      return IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: _buildHighlightTile(
                                spec: item1,
                                index: r,
                                displayText: item1Text,
                                maxLines: rowLines,
                                subtitleStyle: subtitleStyle,
                              ),
                            ),
                            if (item2 != null) ...[
                              AppSpacing.sameGroupWidthGap,
                              Expanded(
                                child: _buildHighlightTile(
                                  spec: item2,
                                  index: r + 1,
                                  displayText: item2Text,
                                  maxLines: rowLines,
                                  subtitleStyle: subtitleStyle,
                                ),
                              ),
                            ] else
                              const Expanded(child: SizedBox.shrink()),
                          ],
                        ),
                      );
                    },
                  ),
                  if (r + 2 < topSpecs.length) AppSpacing.sameGroupHeightGap,
                ],
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildHighlightTile({
    required AttrListEntity spec,
    required int index,
    required String displayText,
    required int maxLines,
    required TextStyle subtitleStyle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: AppSpacing.sameGroupItemSpacing.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.pageBg,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Icon from API response / SVG / Image ──
          SizedBox(
            width: 24.w,
            height: 24.w,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: _buildIcon(spec, index),
              ),
            ),
          ),
          AppSpacing.sameGroupWidthGap,

          // ── Title & Value Column ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  spec.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.titleSmall.copyWith(
                    fontSize: 11.5.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  displayText,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: subtitleStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(AttrListEntity spec, int index) {
    if (spec.iconUrl.isNotEmpty) {
      if (spec.iconUrl.endsWith('.svg')) {
        return SvgPicture.network(
          spec.iconUrl,
          height: 20.h,
          width: 20.w,
          fit: BoxFit.contain,
          placeholderBuilder: (_) => const SizedBox.shrink(),
        );
      }
      return AppImage(
        imageUrl: spec.iconUrl,
        height: 20.h,
        width: 20.w,
        fit: BoxFit.contain,
        placeholder: const SizedBox.shrink(),
        errorWidget: const SizedBox.shrink(),
      );
    }

    if (spec.icon.isNotEmpty) {
      if (spec.icon.endsWith('.svg')) {
        return SvgPicture.network(
          spec.icon,
          height: 20.h,
          width: 20.w,
          fit: BoxFit.contain,
          placeholderBuilder: (_) => const SizedBox.shrink(),
        );
      }
      return AppImage(
        imageUrl: spec.icon,
        height: 20.h,
        width: 20.w,
        fit: BoxFit.contain,
        placeholder: const SizedBox.shrink(),
        errorWidget: const SizedBox.shrink(),
      );
    }

    final fallbackAsset = _defaultFallbackIcons[index % _defaultFallbackIcons.length];
    return SvgPicture.asset(
      fallbackAsset,
      height: 18.h,
      width: 18.w,
      colorFilter: const ColorFilter.mode(
        AppColors.pickabooBlue,
        BlendMode.srcIn,
      ),
    );
  }
}
