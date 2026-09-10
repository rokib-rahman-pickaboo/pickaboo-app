// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_typography.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_banner_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_item_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/category_banner.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/subcategory_card.dart';

/// ============================================================================
/// 📱 SUBCATEGORY SECTION
/// Renders locked top banner + structured white surface cards for all subsections.
/// ============================================================================
class SubcategorySection extends StatelessWidget {
  final DiscoverCategoryEntity? selectedCategory;
  final Function(DiscoverCategoryEntity) onSubcategoryTap;
  final VoidCallback onViewAllTap;
  final void Function(DiscoverSubsectionItemEntity) onItemTap;
  final void Function(DiscoverCategoryBannerEntity) onBannerTap;

  const SubcategorySection({
    super.key,
    required this.selectedCategory,
    required this.onSubcategoryTap,
    required this.onViewAllTap,
    required this.onItemTap,
    required this.onBannerTap,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedCategory == null) {
      return Center(
        child: Text(
          'Select a category',
          style: AppTypography.bodyMuted,
        ),
      );
    }

    final activeSubsections = selectedCategory!.subsections
        .where((s) => s.items.isNotEmpty)
        .toList();

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: 0,
        bottom: 110.h + MediaQuery.of(context).padding.bottom,
      ),
      children: [
        // =====================================================================
        // 🔒 LOCKED SECTION: TOP BANNER WITH IMAGE & OVER-TEXT
        // (PRESERVED AS PER USER INSTRUCTION)
        // =====================================================================
        if (selectedCategory!.banners.isNotEmpty) ...[
          CategoryBanner(
            banners: selectedCategory!.banners,
            menuName: selectedCategory!.menuName,
            onTap: () => onBannerTap(selectedCategory!.banners.first),
          ),
          SizedBox(height: 10.h),
        ],
        // =====================================================================

        // ── DYNAMIC SUBSECTION CARDS ──
        for (final subsection in activeSubsections)
          DiscoverSectionCard(
            title: subsection.title,
            items: subsection.items,
            onItemTap: onItemTap,
          ),
      ],
    );
  }
}
