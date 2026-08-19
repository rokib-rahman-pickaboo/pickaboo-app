import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/home_content/category_insertion_models.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/category_deals_grid.dart';

class CategoryInsertionBuilder {
  static Widget build(
    BuildContext context,
    CategoryInsertionItem item, {
    bool isFirst = false,
  }) {
    switch (item.type) {
      case InsertionWidgetType.banner:
        return _buildBanner(context, item.data, isFirst: isFirst);

      case InsertionWidgetType.productGrid:
        return _buildProductGrid(context, item.data);

      case InsertionWidgetType.flashSale:
        return _buildFlashSale(context, item.data);

      case InsertionWidgetType.categoryGrid:
        return _buildCategoryGrid(context, item.data);

      case InsertionWidgetType.customWidget:
        return _buildCustomWidget(context, item.data);
    }
  }

  static Widget _buildBanner(
    BuildContext context,
    Map<String, dynamic> data, {
    bool isFirst = false,
  }) {
    final bannerData = data['banner'];

    if (bannerData is BannerEntity) {
      final policy =
          data['displayPolicy'] as BannerDisplayPolicy? ?? BannerDisplayPolicy.normal;
      return _buildCategoryMatchedBanner(
        context,
        bannerData,
        policy,
        isFirst: isFirst,
      );
    }

    final banner = bannerData as SliderEntity;
    final bannerType = data['bannerType'] as String? ?? 'normal';

    double bannerHeight;
    switch (bannerType) {
      case 'large_banner':
        bannerHeight = 200.h;
        break;
      case 'extra_large':
        bannerHeight = 260.h;
        break;
      default:
        bannerHeight = 160.h;
    }

    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h, left: 16.w, right: 16.w),
      child: BannerItemView(
        banner: banner,
        height: bannerHeight,
        onTap: (b) {
          context.handleBannerTap(
            linkType: b.linkType,
            link: b.link,
            urlKey: b.urlKey,
            categoryName: b.name,
          );
        },
      ),
    );
  }

  static Widget _buildCategoryMatchedBanner(
    BuildContext context,
    BannerEntity banner,
    BannerDisplayPolicy policy, {
    bool isFirst = false,
  }) {
    if (policy == BannerDisplayPolicy.skip) return const SizedBox.shrink();

    final sliderEntity = banner.toSliderEntity();

    void handleTap(SliderEntity _) {
      final target = banner.tapTarget;
      context.handleBannerTap(
        linkType: target.linkType,
        link: target.link,
        categoryName: target.name,
      );
    }

    switch (policy) {
      case BannerDisplayPolicy.full:
        return Padding(
          padding: EdgeInsets.only(
            top: isFirst ? 16.h : 6.h,
            bottom: 6.h,
            left: 16.w,
            right: 16.w,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: BannerItemView(
              banner: sliderEntity,
              naturalHeight: true,
              borderRadius: BorderRadius.circular(12.r),
              onTap: handleTap,
            ),
          ),
        );

      case BannerDisplayPolicy.normal:
      default:
        return Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: BannerItemView(
            banner: sliderEntity,
            naturalHeight: true,
            onTap: handleTap,
          ),
        );
    }
  }

  static Widget _buildProductGrid(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: const Center(child: Text('Product Grid - To be implemented')),
    );
  }

  static Widget _buildFlashSale(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: const Center(child: Text('Flash Sale - To be implemented')),
    );
  }

  static Widget _buildCategoryGrid(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    final categorySlider = data['categorySlider'] as CategorySliderEntity;

    return CategoryDealsGrid(
      categorySlider: categorySlider,
      onDealTap: (deal) {
        context.handleBannerTap(
          linkType: deal.linkType,
          link: deal.link,
          categoryName: deal.title,
          urlKey: deal.urlKey,
        );
      },
      onViewAll: () {
        if (categorySlider.slides.isEmpty) return;
        final firstSlide = categorySlider.slides.first;
        if (firstSlide.isSpecialCat) {
          context.pushToSpecialCategoryProduct(
            categorySlug: categorySlider.alias.isNotEmpty
                ? categorySlider.alias
                : firstSlide.link,
            categoryName: categorySlider.name,
          );
        } else {
          context.pushToCategoryProduct(
            categoryId: categorySlider.alias.isNotEmpty
                ? categorySlider.alias
                : firstSlide.link,
            categoryName: categorySlider.name,
          );
        }
      },
    );
  }

  static Widget _buildCustomWidget(
    BuildContext context,
    Map<String, dynamic> data,
  ) {
    if (data['widgetType'] == 'multiColumnCategoryBanner') {
      final banners = data['banners'] as List<BannerEntity>;
      final columnCount = data['columnCount'] as int;

      void handleBannerTap(BannerEntity banner) {
        final target = banner.tapTarget;
        context.handleBannerTap(
          linkType: target.linkType,
          link: target.link,
          categoryName: target.name,
        );
      }

      final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
      final screenWidth = MediaQuery.sizeOf(context).width;
      final columnWidth =
          (screenWidth - 32.w - (columnCount - 1) * 8.w) / columnCount;
      final bannerCacheWidth = (columnWidth * devicePixelRatio).round();

      final rows = <Widget>[];
      for (var i = 0; i < banners.length; i += columnCount) {
        final chunk = banners.skip(i).take(columnCount).toList();
        final rowChildren = <Widget>[];

        for (var j = 0; j < chunk.length; j++) {
          if (j > 0) rowChildren.add(SizedBox(width: 8.w));
          final banner = chunk[j];
          rowChildren.add(
            Expanded(
              child: BannerItemView(
                banner: banner.toSliderEntity(),
                naturalHeight: true,
                cacheWidth: bannerCacheWidth,
                onTap: (_) => handleBannerTap(banner),
              ),
            ),
          );
        }

        for (var k = chunk.length; k < columnCount; k++) {
          rowChildren.add(SizedBox(width: 8.w));
          rowChildren.add(const Expanded(child: SizedBox.shrink()));
        }

        rows.add(
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: rowChildren,
            ),
          ),
        );
      }

      return Padding(
        padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
        child: Column(children: rows),
      );
    }

    if (data['widgetType'] == 'multiLayoutBanner') {
      final banners = data['banners'] as List<SliderEntity>;
      final layout = data['layout'] as String;
      final itemCount = data['itemCount'] as int;

      void Function(SliderEntity) handleTap(SliderEntity b) {
        return (_) {
          context.handleBannerTap(
            linkType: b.linkType,
            link: b.link,
            urlKey: b.urlKey,
            categoryName: b.name,
          );
        };
      }

      if (layout == 'row') {
        final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
        final screenWidth = MediaQuery.sizeOf(context).width;
        final itemWidth =
            (screenWidth - 32.w - (itemCount - 1) * 8.w) / itemCount;
        final bannerCacheWidth = (itemWidth * devicePixelRatio).round();

        final rows = <Widget>[];
        for (var i = 0; i < banners.length; i += itemCount) {
          final chunk = banners.skip(i).take(itemCount).toList();
          final rowChildren = <Widget>[];

          for (var j = 0; j < chunk.length; j++) {
            if (j > 0) rowChildren.add(SizedBox(width: 8.w));
            rowChildren.add(
              Expanded(
                child: BannerItemView(
                  banner: chunk[j],
                  height: 160.h,
                  cacheWidth: bannerCacheWidth,
                  onTap: handleTap(chunk[j]),
                ),
              ),
            );
          }

          if (chunk.length < itemCount) {
            for (var k = chunk.length; k < itemCount; k++) {
              rowChildren.add(SizedBox(width: 8.w));
              rowChildren.add(const Expanded(child: SizedBox.shrink()));
            }
          }

          rows.add(
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rowChildren,
              ),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          child: Column(children: rows),
        );
      } else {
        final columnChildren = <Widget>[];
        for (var i = 0; i < banners.length; i++) {
          if (i > 0) columnChildren.add(SizedBox(height: 8.h));
          columnChildren.add(
            BannerItemView(
              banner: banners[i],
              height: 160.h,
              onTap: handleTap(banners[i]),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
          child: Column(children: columnChildren),
        );
      }
    }

    return const SizedBox.shrink();
  }
}
