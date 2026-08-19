import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_banner_bloc/home_banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:pickaboo/presentation/bloc/discover_category_bloc/discover_category_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_content_bloc/home_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/homepage_offers_bloc/homepage_offers_bloc.dart';
import 'package:pickaboo/presentation/bloc/home_flash_sale_bloc/home_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/just_for_you_bloc/just_for_you_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/bloc/nav_drawer/nav_drawer_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/product_view.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_carousel.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/category_list.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/category_slider.dart';
import 'package:pickaboo/presentation/ui/widgets/search_app_bar/search_app_bar.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/home_banner/home_banner_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/entity/home_content/category_insertion_models.dart';
import 'package:pickaboo/presentation/bloc/popup_bloc/popup_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/popup_banner_view.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/category_insertion_builder.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:pickaboo/presentation/bloc/promotion_slider_bloc/promotion_slider_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/flash_sale_category_slider.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/flash_sale_banner_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/promotion_banner_slider.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/homepage_offers_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final int _cartCount = 0;

  StreamSubscription<String?>? _fcmTokenSub;

  List<CategoryProductEntity>? _lastSections;
  List<HomeBannerEntity>? _lastBanners;
  Map<int, List<CategoryInsertionItem>> _insertionMap = const {};

  List<Widget> _categoryRows = const [];

  List<BannerEntity> _heroTopBanners = const [];
  List<BannerEntity> _heroBottomBanners = const [];

  @override
  void initState() {
    super.initState();
    context.read<HomeContentBloc>().add(
      const HomeContentEvent.getFeedContent(),
    );
    context.read<HomeBannerBloc>().add(const HomeBannerEvent.load());

    final customerId = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (token, user) => user.id.toString(),
      orElse: () => null,
    );
    getIt<AnalyticsService>().logHome(customerId: customerId);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<PopupBloc>().add(const PopupEvent.getPopupContent());
      context.read<HomepageOffersBloc>().add(const HomepageOffersEvent.load());
      context.read<JustForYouBloc>().add(const JustForYouEvent.getProducts());
      context.read<CategoryBloc>().add(const CategoryEvent.getCategories());
      context.read<HomeFlashSaleBloc>().add(const HomeFlashSaleEvent.fetch());
      context.read<PromotionSliderBloc>().add(
        const PromotionSliderEvent.getPromotionSlider(),
      );
      context.read<DiscoverCategoryBloc>().add(
        const DiscoverCategoryEvent.getDiscoverCategories(),
      );

      _fcmTokenSub = getIt<PushNotificationService>().tokenStream.listen((
        token,
      ) {
        if (token != null && mounted) {
          context.read<NotificationBloc>().add(
            NotificationEvent.saveFcmToken(token: token),
          );
        }
      });

      getIt<PushNotificationService>().getStoredToken().then((token) {
        if (token != null && mounted) {
          context.read<NotificationBloc>().add(
            NotificationEvent.saveFcmToken(token: token),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _fcmTokenSub?.cancel();
    super.dispose();
  }

  List<Widget> _buildCategoryRows(
    BuildContext context,
    List<CategoryProductEntity> sections,
  ) {
    final rows = <Widget>[];
    for (int i = 0; i < sections.length; i++) {
      final section = sections[i];

      rows.add(
        CategorySlider(
          key: PageStorageKey('cat_section_${section.categoryId}'),
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
            );
          },
          categoryProduct: section,
          onCategoryTap: (category) {
            getIt<AnalyticsService>().logClick(
              section: 'category_slider',
              source: 'homepage',
              medium: 'category_tile',
              entityId: category.categoryId.toString(),
              title: category.categoryName,
            );
            context.pushToCategoryProduct(
              categoryId: category.categoryId,
              categoryName: category.categoryName,
            );
          },
        ),
      );

      final insertions = _insertionMap[i];
      if (insertions != null) {
        for (int j = 0; j < insertions.length; j++) {
          final insertion = insertions[j];
          rows.add(
            KeyedSubtree(
              key: ValueKey(insertion.id),
              child: CategoryInsertionBuilder.build(
                context,
                insertion,
                isFirst: j == 0,
              ),
            ),
          );
        }
      }
    }
    return rows;
  }

  Future<void> _onRefresh() async {
    context.read<HomeContentBloc>().add(
      const HomeContentEvent.getFeedContent(forceRefresh: true),
    );
    context.read<HomeFlashSaleBloc>().add(const HomeFlashSaleEvent.fetch());
    context.read<HomeBannerBloc>().add(const HomeBannerEvent.load());
    context.read<CategoryBloc>().add(const CategoryEvent.getCategories());
    context.read<PromotionSliderBloc>().add(
      const PromotionSliderEvent.getPromotionSlider(),
    );
  }

  Widget _buildHeroBannerRowSliver(List<BannerEntity> banners) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final slotCount = banners.isEmpty ? 1 : banners.length;
    final slotWidth =
        (screenWidth - 32.w - (slotCount - 1) * 8.w) / slotCount;
    final bannerCacheWidth = (slotWidth * devicePixelRatio).round();

    final children = <Widget>[];
    for (var i = 0; i < banners.length; i++) {
      if (i > 0) children.add(SizedBox(width: 8.w));
      final banner = banners[i];
      children.add(
        Expanded(
          child: RepaintBoundary(
            child: BannerItemView(
              banner: banner.toSliderEntity(),
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
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 8.w, bottom: 8.w, left: 16.w, right: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (kDebugMode) {
              print('🔐 [AUTH LISTENER] State changed: ${state.runtimeType}');
            }

            state.maybeWhen(
              authenticated: (token, userEntity) {
                if (kDebugMode) {
                  print(
                    '✅ [AUTH LISTENER] User authenticated: ${userEntity.email}',
                  );
                  print('   Triggering CartBloc.getCart()');
                  print('   Triggering UserProfileBloc.loadUserProfile()');
                }

                context.read<CartBloc>().add(const CartEvent.getCart());
                context.read<UserProfileBloc>().add(
                  const UserProfileEvent.loadUserProfile(),
                );
                getIt<PushNotificationService>().getStoredToken().then((
                  fcmToken,
                ) {
                  if (fcmToken != null && context.mounted) {
                    context.read<NotificationBloc>().add(
                      NotificationEvent.saveFcmToken(token: fcmToken),
                    );
                  }
                });
              },
              unauthenticated: () {
                if (kDebugMode) {
                  print('🚪 [AUTH LISTENER] User logged out');
                  print('   Triggering CartBloc.getCart() as guest');
                  print('   Resetting UserProfileBloc to initial state');
                }

                context.read<CartBloc>().add(const CartEvent.getCart());
                context.read<UserProfileBloc>().add(
                  const UserProfileEvent.started(),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<PopupBloc, PopupState>(
          listener: (context, state) {
            if (state.status == PopupStatus.success &&
                state.popup?.active == true) {
              final router = GoRouter.of(context);
              final String currentLocation = router
                  .routerDelegate
                  .currentConfiguration
                  .last
                  .matchedLocation;

              if (currentLocation != Routes.home) {
                if (kDebugMode) {
                  print(
                    '🏠 [HOME] Skipping popup: Current location is $currentLocation',
                  );
                }
                return;
              }

              showDialog(
                context: context,
                builder: (context) => PopupBannerView(
                  popup: state.popup,
                  linkType: state.linkType,
                  link: state.link,
                  name: state.name,
                  onClose: () => Navigator.of(context).pop(),
                  onLinkTap: (linkType, link, name) => context.handleBannerTap(
                    linkType: linkType,
                    link: link,
                  ),
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: colors.white,
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          color: colors.primary,
          child: CustomScrollView(
            slivers: [
              SearchAppBar(
                cartCount: _cartCount,
                onMenuTap: () => context.read<NavDrawerBloc>().add(
                  const NavDrawerEvent.openDrawer(),
                ),
              ),

              BlocBuilder<HomeContentBloc, HomeContentState>(
                builder: (context, state) {
                  if (state.status == HomeContentStatus.loading) {
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: colors.primary,
                          strokeWidth: 2.w,
                        ),
                      ),
                    );
                  }

                  if (state.status == HomeContentStatus.success &&
                      state.homeFeed != null) {
                    final sections = state.homeFeed!.categoryProducts;

                    final banners = context
                        .select<HomeBannerBloc, List<HomeBannerEntity>>(
                          (b) => b.state.banners,
                        );

                    if (!identical(sections, _lastSections) ||
                        !identical(banners, _lastBanners)) {
                      final bannerEntities =
                          banners.map((b) => b.toBannerEntity()).toList();
                      _insertionMap =
                          _buildInsertionMap(sections, bannerEntities);
                      _heroTopBanners = _buildHeroBanners(
                        bannerEntities,
                        _kHeroTopIdentifier,
                      );
                      _heroBottomBanners = _buildHeroBanners(
                        bannerEntities,
                        _kHeroBottomIdentifier,
                      );
                      _lastSections = sections;
                      _lastBanners = banners;
                      _categoryRows = _buildCategoryRows(context, sections);
                    }

                    return SliverMainAxisGroup(
                      slivers: [
                        if (state.homeFeed?.mainSlider.isNotEmpty == true)
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.w, bottom: 8.w),
                              child: RepaintBoundary(
                                child: BannerCarousel(
                                  banners: state.homeFeed!.mainSlider,
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
                            ),
                          ),

                        if (_heroTopBanners.isNotEmpty ||
                            _heroBottomBanners.isNotEmpty)
                          _buildHeroBannerRowSliver([
                            ..._heroTopBanners,
                            ..._heroBottomBanners,
                          ]),

                        if (state.homeFeed?.categoryList.isNotEmpty == true)
                          SliverToBoxAdapter(
                            child: CategoryList(
                              categories: state.homeFeed!.categoryList,
                              onCategoryTap: (category) {
                                context.pushToCategoryProduct(
                                  categoryId: category.id,
                                  categoryName: category.name,
                                );
                              },
                              onViewAllTap: () {
                                context.go(Routes.discoverCategory);
                              },
                            ),
                          ),

                        BlocBuilder<PromotionSliderBloc, PromotionSliderState>(
                          builder: (context, promoState) {
                            if (promoState.status ==
                                    PromotionSliderStatus.success &&
                                promoState.slides.isNotEmpty) {
                              return SliverPadding(
                                padding: EdgeInsets.only(
                                  left: 16.w,
                                  right: 16.w,
                                  bottom: 8.w,
                                  top: 6.w,
                                ),
                                sliver: SliverToBoxAdapter(
                                  child: RepaintBoundary(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colors.whiteSmoke,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
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
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            );
                          },
                        ),

                        BlocBuilder<HomeFlashSaleBloc, HomeFlashSaleState>(
                          builder: (context, flashState) {
                            if (flashState.status ==
                                    HomeFlashSaleStatus.success &&
                                flashState.flashSale != null) {
                              final flashSale = flashState.flashSale!;
                              final slivers = <Widget>[];

                              slivers.add(
                                SliverToBoxAdapter(
                                  child: FlashSaleCategorySlider(
                                    category: flashSale.category,
                                    title: flashSale.title,
                                    onProductTap: (product) {
                                      context.goToProductDetail(
                                        product.id.toString(),
                                        slug: product.slug,
                                        productName: product.productName,
                                      );
                                    },
                                    onViewAll: () {
                                      context.pushToCategoryProduct(
                                        categoryId: flashSale.category.categoryId.toString(),
                                        categoryName:
                                            flashSale.category.name,
                                      );
                                    },
                                  ),
                                ),
                              );

                              if (flashSale.banners.isNotEmpty &&
                                  flashSale.isVisible) {
                                for (var banner in flashSale.banners) {
                                  slivers.add(
                                    SliverToBoxAdapter(
                                      child: RepaintBoundary(
                                        child: FlashSaleBannerWidget(
                                          banner: banner,
                                          startTime: flashSale.startTime,
                                          endTime: flashSale.endTime,
                                          title: flashSale.title,
                                          shortDescription:
                                              flashSale.shortDescription,
                                          description: flashSale.description,
                                          titleColor: flashSale.titleColor,
                                          subTitleColor:
                                              flashSale.subTitleColor,
                                          descriptionColor:
                                              flashSale.descriptionColor,
                                          onShopNow: () {
                                            context.handleBannerTap(
                                              linkType: banner.linkType,
                                              link: banner.linkValue,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }

                              return SliverMainAxisGroup(slivers: slivers);
                            }
                            return const SliverToBoxAdapter(
                              child: SizedBox.shrink(),
                            );
                          },
                        ),

                        if (_categoryRows.isNotEmpty)
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => _categoryRows[index],
                              childCount: _categoryRows.length,
                            ),
                          ),
                      ],
                    );
                  }

                  if (state.status == HomeContentStatus.error) {
                    // Reached only when there is no cached feed to fall back
                    // on — with a cache the repository serves the stale copy
                    // instead of surfacing the failure.
                    final isOffline = state.error?.isConnectivity ?? false;
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: AppErrorView(
                        type: isOffline
                            ? AppErrorType.noInternet
                            : AppErrorType.server,
                        message: isOffline ? null : state.error?.message,
                        onRetry: () => context.read<HomeContentBloc>().add(
                          const HomeContentEvent.getFeedContent(
                            forceRefresh: true,
                          ),
                        ),
                      ),
                    );
                  }

                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),

              const HomepageOffersSection(),

              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Just For You",
                        style: textStyle.bodyMediumBold.withColor(colors.text),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                sliver: BlocBuilder<JustForYouBloc, JustForYouState>(
                  builder: (context, state) {
                    return PagedSliverAlignedGrid<int, ProductEntity>(
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      showNoMoreItemsIndicatorAsGridChild: false,
                      showNewPageProgressIndicatorAsGridChild: false,
                      showNewPageErrorIndicatorAsGridChild: false,
                      gridDelegateBuilder: (int childCount) {
                        return SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: gridColumnsFor(context),
                        );
                      },
                      builderDelegate: PagedChildBuilderDelegate<ProductEntity>(
                        firstPageErrorIndicatorBuilder: (context) => const SizedBox(),
                        newPageErrorIndicatorBuilder: (context) => const SizedBox(),
                        firstPageProgressIndicatorBuilder: (context) => Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                        noMoreItemsIndicatorBuilder: (context) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Center(
                            child: Text(
                              'No more products',
                              style: context.textStyle.bodySmall.withColor(
                                context.colors.gray,
                              ),
                            ),
                          ),
                        ),
                        itemBuilder: (context, product, index) {
                          return ProductView(
                            product: product,
                            onTap: (product) {
                              context.goToProductDetail(
                                product.id.toString(),
                                slug: product.slug,
                                productName: product.productName,
                              );
                            },
                          );
                        },
                      ),
                      state: state.pagingState,
                      fetchNextPage: () {
                        context.read<JustForYouBloc>().add(
                          const JustForYouEvent.getProducts(),
                        );
                      },
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            ],
          ),
        ),
      ),
    );
  }
}

const String _kHeroTopIdentifier = 'home-banner-hero-top';
const String _kHeroBottomIdentifier = 'home-banner-hero-bottom';

List<BannerEntity> _buildHeroBanners(
  List<BannerEntity> banners,
  String identifier,
) {
  return banners
      .where(
        (b) =>
            b.identifier == identifier &&
            b.isActive == 1 &&
            b.forHomepage == 1,
      )
      .toList()
    ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
}

const Set<String> _kSectionBannerSlots = {
  'home-banner-right',
  'home-banner-full',
  'home-banner-two-col',
  'home-banner-xl',
  'home-banner-three-col',
};

const String _kRightBannerIdentifier = 'home-banner-right';

bool _isHomepageSectionBanner(BannerEntity b) {
  if (b.isActive != 1) return false;
  if (!_kSectionBannerSlots.contains(b.identifier)) return false;

  final catId = b.category?.id ?? (b.categoryId != 0 ? b.categoryId : null);
  if (catId == null) return false;

  final position = b.imagePosition.trim().toLowerCase();
  final isRightBanner =
      b.identifier == _kRightBannerIdentifier && position == 'right';
  final isBottomBanner = position == 'full';
  return isRightBanner || isBottomBanner;
}

Map<int, List<CategoryInsertionItem>> _buildInsertionMap(
  List<CategoryProductEntity> sections,
  List<BannerEntity> banners,
) {
  final activeBanners = banners.where(_isHomepageSectionBanner).toList();

  final insertionMap = <int, List<CategoryInsertionItem>>{};

  final categoryBannerMap = <int, List<BannerEntity>>{};
  for (final banner in activeBanners) {
    final catId =
        banner.category?.id ??
        (banner.categoryId != 0 ? banner.categoryId : null);
    if (catId != null) {
      categoryBannerMap.putIfAbsent(catId, () => []).add(banner);
    }
  }

  for (int i = 0; i < sections.length; i++) {
    final section = sections[i];
    final sectionCatId = int.tryParse(section.categoryId) ?? 0;
    final matched = categoryBannerMap[sectionCatId] ?? [];

    final groupedByIdentifier = <String, List<BannerEntity>>{};
    for (final banner in matched) {
      groupedByIdentifier.putIfAbsent(banner.identifier, () => []).add(banner);
    }

    for (final entry in groupedByIdentifier.entries) {
      final identifier = entry.key;
      final banners = entry.value
        ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      if (BannerDisplayPolicyX.isMultiColumn(identifier)) {
        final columnCount =
            BannerDisplayPolicyX.columnsForIdentifier(identifier);
        insertionMap
            .putIfAbsent(i, () => [])
            .add(
              CategoryInsertionItem.categoryMatchedMultiColumnBanner(
                id: 'cat_multicol_${identifier}_$i',
                afterSectionIndex: i,
                banners: banners,
                columnCount: columnCount,
              ),
            );
      } else {
        for (final banner in banners) {
          final policy = BannerDisplayPolicyX.fromIdentifier(banner.identifier);
          if (policy == BannerDisplayPolicy.skip) {
            continue;
          }
          insertionMap
              .putIfAbsent(i, () => [])
              .add(
                CategoryInsertionItem.categoryMatchedBanner(
                  id: 'cat_banner_${banner.entityId}_$i',
                  afterSectionIndex: i,
                  banner: banner,
                  displayPolicy: policy,
                ),
              );
        }
      }
    }
  }

  return insertionMap;
}
