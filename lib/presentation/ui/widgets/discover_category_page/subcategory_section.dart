import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_banner_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_category_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_entity.dart';
import 'package:pickaboo/domain/entity/discover_category/discover_subsection_item_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/category_banner.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/discover_grid.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/section_title.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/spotlight_item.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/launch_item.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/brand_item.dart';
import 'package:pickaboo/presentation/ui/widgets/discover_category_page/view_all_circle.dart';

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

  bool _hasTarget(DiscoverSubsectionItemEntity item) =>
      item.link.isNotEmpty || item.linkValue.isNotEmpty;

  DiscoverSubsectionEntity? _findSection(String type) {
    return selectedCategory?.subsections
        .cast<DiscoverSubsectionEntity?>()
        .firstWhere((s) => s?.sectionType == type, orElse: () => null);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    if (selectedCategory == null) {
      return Center(
        child: Text(
          'Select a category',
          style: textStyles.bodyMedium.withColor(colors.gray),
        ),
      );
    }

    final spotlight = _findSection('in_the_spotlight');
    final launches = _findSection('latest_launches');
    final brands = _findSection('shop_by_brand');

    final circleInset =
        (DiscoverMetrics.squareTile - DiscoverMetrics.circleTile) / 2;

    Widget gutter(Widget child) => Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DiscoverMetrics.contentPadding,
      ),
      child: child,
    );

    return ListView(
      padding: EdgeInsets.only(
        top: 12.h,
        bottom: 32.h + MediaQuery.of(context).padding.bottom,
      ),
      children: [
        if (selectedCategory!.banners.isNotEmpty) ...[
          CategoryBanner(
            banners: selectedCategory!.banners,
            menuName: selectedCategory!.menuName,
            onTap: () => onBannerTap(selectedCategory!.banners.first),
          ),
          SizedBox(height: DiscoverMetrics.sectionGap),
        ],

        if (spotlight != null && spotlight.items.isNotEmpty) ...[
          gutter(SectionTitle(title: spotlight.title)),
          SizedBox(height: DiscoverMetrics.titleGap),
          gutter(
            DiscoverGrid(
              children: [
                for (final item in spotlight.items)
                  SpotlightItem(
                    title: item.name,
                    imageUrl: item.imageUrl,
                    onTap: _hasTarget(item) ? () => onItemTap(item) : null,
                  ),
              ],
            ),
          ),
          SizedBox(height: DiscoverMetrics.sectionGap),
        ],

        if (launches != null && launches.items.isNotEmpty) ...[
          gutter(SectionTitle(title: launches.title)),
          SizedBox(height: DiscoverMetrics.titleGap),
          gutter(
            DiscoverGrid(
              children: [
                ..._buildLaunchItems(launches.items),
                if (launches.seeMoreLink.isNotEmpty)
                  ViewAllCircle(
                    icon: Icons.arrow_forward,
                    topInset: circleInset,
                    onTap: onViewAllTap,
                  ),
              ],
            ),
          ),
          SizedBox(height: DiscoverMetrics.sectionGap),
        ],

        if (brands != null && brands.items.isNotEmpty) ...[
          gutter(SectionTitle(title: brands.title)),
          SizedBox(height: DiscoverMetrics.titleGap),
          gutter(
            DiscoverGrid(
              children: [
                ..._buildBrandItems(brands.items),
                if (brands.seeMoreLink.isNotEmpty)
                  ViewAllCircle(
                    icon: Icons.arrow_downward,
                    label: 'View All',
                    onTap: onViewAllTap,
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  List<Widget> _buildLaunchItems(List<DiscoverSubsectionItemEntity> items) {
    return items
        .map(
          (item) => LaunchItem(
            title: item.name,
            imageUrl: item.imageUrl,
            actionText: 'Buy Now',
            onTap: _hasTarget(item) ? () => onItemTap(item) : null,
          ),
        )
        .toList();
  }

  List<Widget> _buildBrandItems(List<DiscoverSubsectionItemEntity> items) {
    return items
        .map(
          (item) => BrandItem(
            brandName: item.name,
            imageUrl: item.imageUrl,
            actionText: 'Shop Now',
            onTap: _hasTarget(item) ? () => onItemTap(item) : null,
          ),
        )
        .toList();
  }
}
