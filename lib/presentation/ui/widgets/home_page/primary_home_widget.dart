import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/home_content/category_insertion_models.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/home_flash_sale_bloc/home_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/promotion_slider_bloc/promotion_slider_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_section_header.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_carousel.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/category_insertion_builder.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/category_slider.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/flash_sale_banner_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/flash_sale_category_slider.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/homepage_offers_section.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/promotion_banner_slider.dart';

/// ─────────────────────────────────────────────────────────────
/// ⚡ HIGH-PERFORMANCE 3-SLIVER PRIMARY HOME WIDGET ("For You" Feed)
/// Architecture:
///   1. Top Header Sliver (Carousel, Hero, Promo Slider, Flash Sale)
///   2. Lazy Category & Insertions Feed Sliver (SingleChildScrollView Rails on demand)
///   3. Campaign Offers Section (Deals Grids)
///   4. "Just For You" Infinite Product Grid (Paged 2-column rows)
/// ─────────────────────────────────────────────────────────────
class PrimaryHomeWidget extends StatefulWidget {
  final HomeContentEntity homeFeed;
  final List<BannerEntity> heroTopBanners;
  final List<BannerEntity> heroBottomBanners;
  final Map<int, List<CategoryInsertionItem>> insertionMap;

  const PrimaryHomeWidget({
    super.key,
    required this.homeFeed,
    required this.heroTopBanners,
    required this.heroBottomBanners,
    required this.insertionMap,
  });

  @override
  State<PrimaryHomeWidget> createState() => _PrimaryHomeWidgetState();
}

class _PrimaryHomeWidgetState extends State<PrimaryHomeWidget> {
  List<_FeedItemEntry>? _cachedFeedEntries;
  HomeContentEntity? _lastHomeFeed;
  Map<int, List<CategoryInsertionItem>>? _lastInsertionMap;

  List<_FeedItemEntry> _getFeedEntries() {
    if (_cachedFeedEntries != null &&
        identical(widget.homeFeed, _lastHomeFeed) &&
        identical(widget.insertionMap, _lastInsertionMap)) {
      return _cachedFeedEntries!;
    }
    _lastHomeFeed = widget.homeFeed;
    _lastInsertionMap = widget.insertionMap;
    return _cachedFeedEntries = _buildFeedEntries();
  }

  List<_FeedItemEntry> _buildFeedEntries() {
    final entries = <_FeedItemEntry>[];
    final sections = widget.homeFeed.categoryProducts;

    for (int i = 0; i < sections.length; i++) {
      final section = sections[i];
      if (section.products.isNotEmpty) {
        entries.add(_FeedItemEntry.category(section));
      }

      final insertions = widget.insertionMap[i];
      if (insertions != null && insertions.isNotEmpty) {
        for (final insertion in insertions) {
          entries.add(_FeedItemEntry.insertion(insertion));
        }
      }
    }
    return entries;
  }

  Widget _buildHeroBannerRow(BuildContext context, List<BannerEntity> banners) {
    if (banners.isEmpty) return const SizedBox.shrink();

    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final int slotCount = banners.length;
    final double slotWidth = (screenWidth -
            2 * AppSpacing.sameGroupItemSpacing.w -
            (slotCount - 1) * AppSpacing.sameGroupItemSpacing.w) /
        slotCount;
    final int bannerCacheWidth =
        (slotWidth * devicePixelRatio).round().clamp(250, 480);

    final children = <Widget>[];
    for (var i = 0; i < banners.length; i++) {
      if (i > 0) children.add(SizedBox(width: AppSpacing.sameGroupItemSpacing.w));
      final banner = banners[i];
      final slider = banner.toSliderEntity();
      children.add(
        Expanded(
          child: BannerItemView(
            banner: slider,
            naturalHeight: true,
            cacheWidth: bannerCacheWidth,
            onTap: (item) {
              context.handleBannerTap(
                linkType: item.linkType,
                link: item.link,
                categoryName: item.name,
              );
            },
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        bottom: AppSpacing.groupToGroupSpacing.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildTopHeaderSliver(BuildContext context) {
    final bool hasMainSlider = widget.homeFeed.mainSlider.isNotEmpty;
    final bool hasHeroBanners =
        widget.heroTopBanners.isNotEmpty || widget.heroBottomBanners.isNotEmpty;

    return SliverToBoxAdapter(
      child: RepaintBoundary(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Main Slider Banner Carousel
            if (hasMainSlider)
              Padding(
                padding: EdgeInsets.only(
                  top: AppSpacing.sameGroupItemSpacing.h,
                  bottom: hasHeroBanners
                      ? AppSpacing.sameGroupItemSpacing.h
                      : AppSpacing.groupToGroupSpacing.h,
                ),
                child: BannerCarousel(
                  banners: widget.homeFeed.mainSlider,
                  onBannerTap: (banner) {
                    context.handleBannerTap(
                      linkType: banner.linkType,
                      link: banner.link,
                      urlKey: banner.urlKey,
                      categoryName: banner.name,
                    );
                  },
                ),
              ),

            // Hero Banners
            if (hasHeroBanners)
              _buildHeroBannerRow(context, [
                ...widget.heroTopBanners,
                ...widget.heroBottomBanners,
              ]),

            // Promotion Slider
            BlocBuilder<PromotionSliderBloc, PromotionSliderState>(
              builder: (context, promoState) {
                if (promoState.status == PromotionSliderStatus.success &&
                    promoState.slides.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: AppSpacing.groupToGroupSpacing.h,
                    ),
                    child: PromotionBannerSlider(
                      slides: promoState.slides,
                      onSlideTap: (slide) {
                        context.handleBannerTap(
                          linkType: slide.linkType,
                          link: slide.link,
                          categoryName: slide.name,
                          urlKey: slide.urlKey,
                        );
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            // Flash Sale Section
            BlocBuilder<HomeFlashSaleBloc, HomeFlashSaleState>(
              builder: (context, flashState) {
                if (flashState.status == HomeFlashSaleStatus.success &&
                    flashState.flashSale != null) {
                  final flashSale = flashState.flashSale!;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: AppSpacing.groupToGroupSpacing.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlashSaleCategorySlider(
                          category: flashSale.category,
                          title: flashSale.title,
                          onProductTap: (product) {
                            context.goToProductDetail(
                              product.id.toString(),
                              slug: product.slug,
                              productName: product.productName,
                              productImage: product.productImg,
                              productPrice: (product.productSpecialPrice > 0
                                      ? product.productSpecialPrice
                                      : product.productPrice)
                                  .toString(),
                              product: product,
                            );
                          },
                          onViewAll: () {
                            context.pushToCategoryProduct(
                              categoryId:
                                  flashSale.category.categoryId.toString(),
                              categoryName: flashSale.category.name,
                            );
                          },
                        ),
                        if (flashSale.banners.isNotEmpty && flashSale.isVisible)
                          ...flashSale.banners.map(
                            (banner) => FlashSaleBannerWidget(
                              banner: banner,
                              startTime: flashSale.startTime,
                              endTime: flashSale.endTime,
                              title: flashSale.title,
                              shortDescription: flashSale.shortDescription,
                              description: flashSale.description,
                              titleColor: flashSale.titleColor,
                              subTitleColor: flashSale.subTitleColor,
                              descriptionColor: flashSale.descriptionColor,
                              onShopNow: () {
                                context.handleBannerTap(
                                  linkType: banner.linkType,
                                  link: banner.linkValue,
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedItem(BuildContext context, _FeedItemEntry entry) {
    switch (entry.type) {
      case _FeedItemType.categorySection:
        final section = entry.categoryProduct!;
        return CategorySlider(
          categoryProduct: section,
          onProductTap: (product) {
            getIt<AnalyticsService>().logClick(
              section: 'category_products',
              source: 'homepage',
              medium: 'product_card',
              entityId: product.id.toString(),
              title: product.productName,
            );
            context.goToProductDetail(
              product.id.toString(),
              slug: product.slug,
              productName: product.productName,
              productImage: product.productImg,
              productPrice: (product.productSpecialPrice > 0
                      ? product.productSpecialPrice
                      : product.productPrice)
                  .toString(),
              product: product,
            );
          },
          onCategoryTap: (category) {
            getIt<AnalyticsService>().logClick(
              section: 'category_view_all',
              source: 'homepage',
              medium: 'text_button',
              entityId: category.categoryId,
              title: category.categoryName,
            );
            context.pushToCategoryProduct(
              categoryId: category.categoryId,
              categoryName: category.categoryName,
            );
          },
        );

      case _FeedItemType.insertionItem:
        return CategoryInsertionBuilder.build(
          context,
          entry.insertionItem!,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedEntries = _getFeedEntries();

    return SliverMainAxisGroup(
      slivers: [
        // ── 1. Top Header Sliver (Consolidates Carousel, Hero, Promo, Flash Sale) ──
        _buildTopHeaderSliver(context),

        // ── 2. Lazy Category & Insertion Feed Sliver ──
        if (feedEntries.isNotEmpty)
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: AppSpacing.groupToGroupSpacing.h,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildFeedItem(context, feedEntries[index]),
                childCount: feedEntries.length,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: true,
                addSemanticIndexes: false,
              ),
            ),
          ),

        // ── 3. Campaign Offers Section ──
        const HomepageOffersSection(),

        // ── 4. Just For You Title & Product Grid ──
        SliverToBoxAdapter(
          child: RepaintBoundary(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: AppSpacing.sameGroupItemSpacing.h,
              ),
              child: const AppSectionHeader(
                title: "Just For You",
              ),
            ),
          ),
        ),

        BlocBuilder<JustForYouBloc, JustForYouState>(
          builder: (context, state) {
            final paging = state.pagingState;
            final allItems = paging.pages?.expand((p) => p).toList() ??
                const <ProductEntity>[];
            final columns = gridColumnsFor(context);
            final rowCount = (allItems.length / columns).ceil();

            if (allItems.isEmpty && paging.isLoading) {
              return AppLoader.sliver(
                padding: EdgeInsets.symmetric(vertical: 24.h),
              );
            }

            if (rowCount == 0) {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            }

            return SliverMainAxisGroup(
              slivers: [
                SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.sameGroupItemSpacing.w,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, rowIndex) {
                          if (rowIndex == rowCount - 1) {
                            if (paging.hasNextPage && !paging.isLoading) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                context.read<JustForYouBloc>().add(
                                  const JustForYouEvent.getProducts(),
                                );
                              });
                            }
                          }

                          final start = rowIndex * columns;
                          final end = (start + columns) < allItems.length
                              ? start + columns
                              : allItems.length;
                          final rowItems = allItems.sublist(start, end);

                          return Padding(
                            key: ValueKey('jfy_row_${rowItems.first.id}'),
                            padding: EdgeInsets.only(
                              bottom: AppSpacing.sameGroupItemSpacing.h,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < columns; i++) ...[
                                  if (i > 0)
                                    SizedBox(
                                      width:
                                          AppSpacing.sameGroupItemSpacing.w,
                                    ),
                                  Expanded(
                                    child: i < rowItems.length
                                        ? ProductView(
                                            product: rowItems[i],
                                            onTap: (product) {
                                              context.goToProductDetail(
                                                product.id.toString(),
                                                slug: product.slug,
                                                productName:
                                                    product.productName,
                                                productImage: product.productImg,
                                                productPrice: (product.productSpecialPrice > 0
                                                        ? product.productSpecialPrice
                                                        : product.productPrice)
                                                    .toString(),
                                                product: product,
                                              );
                                            },
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                        childCount: rowCount,
                        addAutomaticKeepAlives: false,
                        addRepaintBoundaries: false,
                        addSemanticIndexes: false,
                      ),
                    ),
                  ),

                if (paging.isLoading && allItems.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: const AppLoader.pagination(),
                    ),
                  ),

                if (!paging.hasNextPage && allItems.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Center(
                        child: Text(
                          'No more products',
                          style: AppTypography.bodySmall.withColor(
                            AppColors.muted,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 90.h + MediaQuery.paddingOf(context).bottom,
          ),
        ),
      ],
    );
  }
}

enum _FeedItemType {
  categorySection,
  insertionItem,
}

class _FeedItemEntry {
  final _FeedItemType type;
  final CategoryProductEntity? categoryProduct;
  final CategoryInsertionItem? insertionItem;

  const _FeedItemEntry.category(this.categoryProduct)
      : type = _FeedItemType.categorySection,
        insertionItem = null;

  const _FeedItemEntry.insertion(this.insertionItem)
      : type = _FeedItemType.insertionItem,
        categoryProduct = null;
}
