import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class DiscoverMetrics {
  const DiscoverMetrics._();

  static const int columns = 3;

  static double get contentPadding => 12.w;

  static double get runSpacing => 18.h;

  static double get titleGap => 14.h;

  static double get sectionGap => 28.h;

  static double get squareTile => 76.w;

  static double get circleTile => 66.w;

  static double get tileLabelGap => 8.h;

  static double get labelHeight => 26.h;

  static double get actionHeight => 14.h;
}

class DiscoverGrid extends StatelessWidget {
  final List<Widget> children;
  final int columns;
  final double? runSpacing;

  const DiscoverGrid({
    super.key,
    required this.children,
    this.columns = DiscoverMetrics.columns,
    this.runSpacing,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();

    final gap = runSpacing ?? DiscoverMetrics.runSpacing;
    final rowCount = (children.length / columns).ceil();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(rowCount, (row) {
        return Padding(
          padding: EdgeInsets.only(bottom: row == rowCount - 1 ? 0 : gap),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(columns, (col) {
              final index = row * columns + col;
              return Expanded(
                child: index < children.length
                    ? children[index]
                    : const SizedBox.shrink(),
              );
            }),
          ),
        );
      }),
    );
  }
}

class DiscoverTileLabel extends StatelessWidget {
  final String text;
  final int maxLines;

  const DiscoverTileLabel({super.key, required this.text, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DiscoverMetrics.labelHeight,
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.navy,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          height: 1.25,
        ),
      ),
    );
  }
}

class DiscoverTileAction extends StatelessWidget {
  final String text;

  const DiscoverTileAction({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DiscoverMetrics.actionHeight,
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.pickabooBlue,
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
      ),
    );
  }
}
