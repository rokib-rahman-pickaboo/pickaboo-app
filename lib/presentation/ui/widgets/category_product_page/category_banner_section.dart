import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/category_banner/category_banner_entity.dart';
import 'package:pickaboo/domain/entity/home_content/category_insertion_models.dart';
import 'package:pickaboo/presentation/bloc/category_banner_bloc/category_banner_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';

class CategoryBannerGroup {
  final String identifier;
  final List<BannerEntity> banners;

  final int columnCount;

  final BannerSlot slot;

  const CategoryBannerGroup({
    required this.identifier,
    required this.banners,
    required this.columnCount,
    required this.slot,
  });

  bool get isMultiColumn => columnCount > 1;
}

List<CategoryBannerGroup> groupBannersForCategory(
  List<BannerEntity> banners,
  int categoryId,
) {
  if (categoryId == 0) return const [];

  final matched = banners.where((banner) {
    if (banner.isActive != 1) return false;
    if (banner.identifier.trim().toLowerCase().startsWith('home-banner-')) {
      return false;
    }
    if (!banner.linksToCategory) return false;

    final bannerCategoryId =
        banner.category?.id ??
        (banner.categoryId != 0 ? banner.categoryId : null);
    return bannerCategoryId == categoryId;
  }).toList();

  if (matched.isEmpty) return const [];

  final byIdentifier = <String, List<BannerEntity>>{};
  for (final banner in matched) {
    byIdentifier.putIfAbsent(banner.identifier, () => []).add(banner);
  }

  final groups = <CategoryBannerGroup>[];
  for (final entry in byIdentifier.entries) {
    final identifier = entry.key;
    final sorted = entry.value
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    if (BannerDisplayPolicyX.isMultiColumn(identifier)) {
      groups.add(
        CategoryBannerGroup(
          identifier: identifier,
          banners: sorted,
          columnCount: BannerDisplayPolicyX.columnsForIdentifier(identifier),
          slot: BannerDisplayPolicyX.slotForIdentifier(identifier),
        ),
      );
      continue;
    }

    for (final banner in sorted) {
      if (BannerDisplayPolicyX.fromIdentifier(banner.identifier) ==
          BannerDisplayPolicy.skip) {
        continue;
      }
      groups.add(
        CategoryBannerGroup(
          identifier: identifier,
          banners: [banner],
          columnCount: 1,
          slot: BannerDisplayPolicyX.slotForIdentifier(identifier),
        ),
      );
    }
  }

  groups.sort((a, b) {
    final bySlot = a.slot.index.compareTo(b.slot.index);
    if (bySlot != 0) return bySlot;

    final byOrder = a.banners.first.sortOrder.compareTo(
      b.banners.first.sortOrder,
    );
    if (byOrder != 0) return byOrder;

    return a.identifier.compareTo(b.identifier);
  });

  return groups;
}

class CategoryBannerSection extends StatelessWidget {
  final int categoryId;

  const CategoryBannerSection({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final categoryBanners =
        context.select<CategoryBannerBloc, List<CategoryBannerEntity>>(
      (bloc) => bloc.state.banners,
    );
    final banners =
        categoryBanners.map((b) => b.toBannerEntity()).toList();

    final groups = groupBannersForCategory(banners, categoryId);
    if (groups.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final group in groups)
          Padding(
            key: ValueKey(
              'cat_banner_${group.identifier}_'
              '${group.banners.first.entityId}',
            ),
            padding: EdgeInsets.only(top: 12.h),
            child: group.isMultiColumn
                ? _MultiColumnBanners(group: group)
                : _SingleBanner(banner: group.banners.first),
          ),
        SizedBox(height: 4.h),
      ],
    );
  }
}

void _handleTap(BuildContext context, BannerEntity banner) {
  final target = banner.tapTarget;

  context.handleBannerTap(
    linkType: target.linkType,
    link: target.link,
    categoryName: target.name,
  );
}

class _SingleBanner extends StatelessWidget {
  final BannerEntity banner;

  const _SingleBanner({required this.banner});

  @override
  Widget build(BuildContext context) {
    final policy = BannerDisplayPolicyX.fromIdentifier(banner.identifier);
    if (policy == BannerDisplayPolicy.skip) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BannerItemView(
        banner: banner.toSliderEntity(),
        naturalHeight: true,
        onTap: (_) => _handleTap(context, banner),
      ),
    );
  }
}

class _MultiColumnBanners extends StatelessWidget {
  final CategoryBannerGroup group;

  const _MultiColumnBanners({required this.group});

  @override
  Widget build(BuildContext context) {
    final columns = group.columnCount;
    final rows = <Widget>[];

    for (int start = 0; start < group.banners.length; start += columns) {
      final end = (start + columns).clamp(0, group.banners.length);
      final chunk = group.banners.sublist(start, end);

      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < columns; i++) ...[
              if (i > 0) SizedBox(width: 8.w),
              Expanded(
                child: i < chunk.length
                    ? BannerItemView(
                        banner: chunk[i].toSliderEntity(),
                        naturalHeight: true,
                        onTap: (_) => _handleTap(context, chunk[i]),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < rows.length; i++) ...[
            if (i > 0) SizedBox(height: 8.h),
            rows[i],
          ],
        ],
      ),
    );
  }
}
