import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/widgets/common/catalog_grid_skeleton.dart';

/// ─────────────────────────────────────────────────────────────
/// ⚡ HIGH-FIDELITY SECONDARY HOME SKELETON WIDGET
/// Shimmer skeleton loader reproducing the exact structure and geometry
/// of [SecondaryHomeWidget], [SecondaryHomeWidgetCustom], and [CategoryProductPage]:
///   1. Subcategory Chips Rail with 8.h top margin and 8.h gap
///   2. Action Strip: Sort, Filter, and View Mode Toggle buttons
///   3. 2-Column Product Grid Cards with interleaved Question Filter shimmer
///
/// Can be rendered as a standalone scrollable widget or inside CustomScrollView slivers.
/// ─────────────────────────────────────────────────────────────
class SecondaryHomeSkeletonWidget extends StatelessWidget {
  final bool asSliver;
  final bool hasActionStrip;
  final int productCount;
  final bool hasChildCategories;

  const SecondaryHomeSkeletonWidget({
    super.key,
    this.asSliver = false,
    this.hasActionStrip = true,
    this.productCount = 6,
    this.hasChildCategories = true,
  });

  const SecondaryHomeSkeletonWidget.sliver({
    super.key,
    this.hasActionStrip = true,
    this.productCount = 6,
    this.hasChildCategories = true,
  }) : asSliver = true;

  @override
  Widget build(BuildContext context) {
    return CatalogGridSkeleton.category(
      asSliver: asSliver,
      isEmbedded: true,
      hasChildCategories: hasChildCategories,
    );
  }
}
