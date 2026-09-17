import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
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
import 'package:collection/collection.dart';
import 'package:pickaboo/presentation/bloc/nav_drawer/nav_drawer_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/home_category_nav.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/primary_home_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/secondary_home_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/search_app_bar/search_app_bar.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/domain/entity/home_banner/home_banner_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/entity/home_content/category_insertion_models.dart';
import 'package:pickaboo/presentation/bloc/popup_bloc/popup_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/popup_banner_view.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:pickaboo/presentation/bloc/promotion_slider_bloc/promotion_slider_bloc.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/core/cache/category_preload_cache.dart';
import 'package:pickaboo/core/services/category_preload_queue.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  String _selectedCategory = 'For You';
  final ValueNotifier<bool> _isCategoryNavCollapsed = ValueNotifier<bool>(false);

  StreamSubscription<String?>? _fcmTokenSub;

  List<CategoryProductEntity>? _lastSections;
  List<HomeBannerEntity>? _lastBanners;
  Map<int, List<CategoryInsertionItem>> _insertionMap = const {};

  List<BannerEntity> _heroTopBanners = const [];
  List<BannerEntity> _heroBottomBanners = const [];

  @override
  void initState() {
    super.initState();
    context.read<HomeContentBloc>().add(
      const HomeContentEvent.getFeedContent(),
    );
    context.read<HomeBannerBloc>().add(const HomeBannerEvent.load());
    context.read<CategoryBloc>().add(const CategoryEvent.getCategories());

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
          debugPrint('📱 [DEVICE_FCM_TOKEN] $token');
          // ignore: avoid_print
          print('DEVICE_TOKEN: $token');
          context.read<NotificationBloc>().add(
            NotificationEvent.saveFcmToken(token: token),
          );
        }
      });

      getIt<PushNotificationService>().getStoredToken().then((token) {
        if (token != null && mounted) {
          debugPrint('📱 [DEVICE_FCM_TOKEN] $token');
          // ignore: avoid_print
          print('DEVICE_TOKEN: $token');
          context.read<NotificationBloc>().add(
            NotificationEvent.saveFcmToken(token: token),
          );
        }
      });

      _logDeviceToken();
    });
  }

  Future<void> _logDeviceToken() async {
    try {
      final token = await getIt<PushNotificationService>().getStoredToken() ??
          await FirebaseMessaging.instance.getToken();
      if (token != null) {
        debugPrint('╔═══════════════════════════════════════════════════════════════════════════════════════');
        debugPrint('║ 📱 [DEVICE_FCM_TOKEN]');
        debugPrint('║ $token');
        debugPrint('╚═══════════════════════════════════════════════════════════════════════════════════════');
        // ignore: avoid_print
        print('DEVICE_TOKEN: $token');
        // ignore: avoid_print
        print('FCM_TOKEN: $token');
      } else {
        debugPrint('⚠️ [DEVICE_FCM_TOKEN] Token is null');
      }
    } catch (e) {
      debugPrint('❌ [DEVICE_FCM_TOKEN] Error retrieving FCM token: $e');
    }
  }

  @override
  void dispose() {
    _fcmTokenSub?.cancel();
    _scrollController.dispose();
    _isCategoryNavCollapsed.dispose();
    MainPage.hideBottomNav.value = false;
    super.dispose();
  }

  Future<void> _onRefresh() async {
    CategoryPreloadQueue.instance.clear();
    context.read<HomeContentBloc>().add(
      const HomeContentEvent.getFeedContent(forceRefresh: true),
    );
    context.read<HomeFlashSaleBloc>().add(const HomeFlashSaleEvent.fetch());
    context.read<HomeBannerBloc>().add(const HomeBannerEvent.load());
    context.read<CategoryBloc>().add(const CategoryEvent.getCategories());
    context.read<PromotionSliderBloc>().add(
      const PromotionSliderEvent.getPromotionSlider(),
    );
    context.read<JustForYouBloc>().add(const JustForYouEvent.refresh());
  }

  @override
  Widget build(BuildContext context) {
    const colors = _HomeColors();

    return MultiBlocListener(
      listeners: [
        BlocListener<InternetBloc, InternetState>(
          listenWhen: (previous, current) =>
              previous.maybeWhen(disconnected: (_) => true, orElse: () => false) &&
              current.maybeWhen(connected: (_) => true, orElse: () => false),
          listener: (context, state) {
            _onRefresh();
          },
        ),
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
                  print('   Resetting CartBloc to guest state');
                  print('   Resetting UserProfileBloc to initial state');
                }

                context.read<CartBloc>().add(const CartEvent.clearCartSession());
                context.read<UserProfileBloc>().add(
                  const UserProfileEvent.clear(),
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
      child: BlocBuilder<HomeContentBloc, HomeContentState>(
        builder: (context, homeContentState) {
          final hasContent = homeContentState.homeFeed != null;

          if (!hasContent) {
            // While initial load is in progress, ALWAYS show loader — never flash error or offline
            if (homeContentState.status == HomeContentStatus.loading ||
                homeContentState.status == HomeContentStatus.initial) {
              return Scaffold(
                key: _scaffoldKey,
                backgroundColor: AppColors.pageBg,
                body: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      HomeTopHeader(
                        onMenuTap: () => context.read<NavDrawerBloc>().add(
                          const NavDrawerEvent.openDrawer(),
                        ),
                        categoryName: _selectedCategory,
                      ),
                      Expanded(
                        child: Center(
                          child: AppLoader(
                            color: AppColors.pickabooBlue,
                            strokeWidth: 2.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // If loading finished with error and no cached content exists
            if (homeContentState.status == HomeContentStatus.error) {
              final isOffline = ConnectivityUtils.isNoInternet(
                homeContentState.error,
                context,
              );

              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (MainPage.hideBottomNav.value != true) {
                  MainPage.hideBottomNav.value = true;
                }
              });

              if (isOffline) {
                return Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: AppColors.pageBg,
                  body: SafeArea(
                    child: NoInternetPage(
                      showAppBar: false,
                      onRetry: () => _onRefresh(),
                    ),
                  ),
                );
              }

              return Scaffold(
                key: _scaffoldKey,
                backgroundColor: AppColors.pageBg,
                body: SafeArea(
                  child: AppErrorView(
                    type: AppErrorType.generic,
                    title: "Couldn't load home content",
                    message: 'Please try again in a moment.',
                    retryLabel: 'Retry',
                    onRetry: () => _onRefresh(),
                  ),
                ),
              );
            }
          }

          // Content exists — make sure bottom nav is visible
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (MainPage.hideBottomNav.value != false) {
              MainPage.hideBottomNav.value = false;
            }
          });

          final homeFeed = homeContentState.homeFeed;
          final drawerCategories = context
              .select<CategoryBloc, List<CategoryEntity>?>(
                (b) => b.state.categories,
              );
          final displayCategories = homeFeed != null
              ? alignCategoriesWithDrawerOrder(
                  homeFeed.categoryList,
                  drawerCategories,
                )
              : const <CategoryListEntity>[];

          if (homeFeed != null) {
            final sections = homeFeed.categoryProducts;
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

              // Zero-cost instant seeding from home feed products
              CategoryPreloadCache.instance.seedFromHomeFeed(homeFeed);

              // Enqueue visible categories for controlled sequential background preloading
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  CategoryPreloadQueue.instance.enqueue(displayCategories);
                }
              });
            }
          }

          return PopScope(
            canPop: _selectedCategory == 'For You',
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              if (_selectedCategory != 'For You') {
                setState(() {
                  _selectedCategory = 'For You';
                });
                if (_scrollController.hasClients) {
                  _scrollController.jumpTo(0);
                }
              }
            },
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: AppColors.pageBg,
            body: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  HomeTopHeader(
                    onMenuTap: () => context.read<NavDrawerBloc>().add(
                      const NavDrawerEvent.openDrawer(),
                    ),
                    categoryName: _selectedCategory,
                  ),
                  if (displayCategories.isNotEmpty)
                    ValueListenableBuilder<bool>(
                      valueListenable: _isCategoryNavCollapsed,
                      builder: (context, isCollapsed, _) {
                        return HomeCategoryNav(
                          categories: displayCategories,
                          selectedCategory: _selectedCategory,
                          isCollapsed: isCollapsed,
                          onCategorySelected: (cat) {
                            if (_selectedCategory != cat) {
                              setState(() {
                                _selectedCategory = cat;
                              });
                              if (_scrollController.hasClients) {
                                _scrollController.jumpTo(0);
                              }
                            }
                          },
                          onViewAll: () {
                            context.go(Routes.discoverCategory);
                          },
                        );
                      },
                    ),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification) {
                          final metrics = notification.metrics;
                          if (metrics.axis == Axis.vertical) {
                            final isDown = (notification.scrollDelta ?? 0) > 2;
                            final isUp = (notification.scrollDelta ?? 0) < -2;
                            if (isDown && !_isCategoryNavCollapsed.value && metrics.pixels > 60) {
                              _isCategoryNavCollapsed.value = true;
                            } else if ((isUp || metrics.pixels <= 20) && _isCategoryNavCollapsed.value) {
                              _isCategoryNavCollapsed.value = false;
                            }
                          }
                        }
                        return false;
                      },
                      child: _selectedCategory == 'For You'
                          ? RefreshIndicator(
                              onRefresh: _onRefresh,
                              color: colors.primary,
                              child: CustomScrollView(
                                controller: _scrollController,
                                cacheExtent: 1000.0,
                                slivers: [
                                  if (homeFeed != null) ...[
                                    PrimaryHomeWidget(
                                      homeFeed: homeFeed,
                                      heroTopBanners: _heroTopBanners,
                                      heroBottomBanners: _heroBottomBanners,
                                      insertionMap: _insertionMap,
                                    ),
                                  ] else if (homeContentState.status == HomeContentStatus.error) ...[
                                    SliverFillRemaining(
                                      hasScrollBody: false,
                                      child: AppErrorView(
                                        type: AppErrorType.server,
                                        message: homeContentState.error?.message,
                                        onRetry: () => _onRefresh(),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            )
                          : Builder(
                              builder: (context) {
                                final selectedCategoryEntity =
                                    displayCategories.firstWhereOrNull(
                                  (c) => c.name == _selectedCategory,
                                ) ?? homeFeed?.categoryList.firstWhereOrNull(
                                  (c) => c.name == _selectedCategory,
                                );
                                if (selectedCategoryEntity != null) {
                                  final categoryKey = selectedCategoryEntity.id.isNotEmpty
                                      ? selectedCategoryEntity.id
                                      : (selectedCategoryEntity.slug.isNotEmpty
                                          ? selectedCategoryEntity.slug
                                          : _selectedCategory);
                                  return SecondaryHomeWidget(
                                    key: ValueKey(categoryKey),
                                    category: selectedCategoryEntity,
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        },
      ),
    );
  }
}

/// Re-orders [homeCategories] to match the canonical ordering from the category API
/// response ([drawerCategories], as rendered in [NavDrawer]). Any categories not found
/// in [drawerCategories] remain in the list and are placed at the end.
@visibleForTesting
List<CategoryListEntity> alignCategoriesWithDrawerOrder(
  List<CategoryListEntity> homeCategories,
  List<CategoryEntity>? drawerCategories,
) {
  if (drawerCategories == null || drawerCategories.isEmpty) {
    return homeCategories;
  }
  final orderMap = <String, int>{};
  for (int i = 0; i < drawerCategories.length; i++) {
    final cat = drawerCategories[i];
    if (cat.id.isNotEmpty) orderMap[cat.id] = i;
    if (cat.slug.isNotEmpty) orderMap[cat.slug.toLowerCase()] = i;
    if (cat.name.isNotEmpty) orderMap[cat.name.toLowerCase()] = i;
  }

  final sorted = List<CategoryListEntity>.from(homeCategories);
  sorted.sort((a, b) {
    final indexA = orderMap[a.id] ??
        orderMap[a.slug.toLowerCase()] ??
        orderMap[a.name.toLowerCase()] ??
        999;
    final indexB = orderMap[b.id] ??
        orderMap[b.slug.toLowerCase()] ??
        orderMap[b.name.toLowerCase()] ??
        999;
    return indexA.compareTo(indexB);
  });
  return sorted;
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

class _HomeColors {
  const _HomeColors();
  Color get white => AppColors.white;
  Color get primary => AppColors.pickabooBlue;
  Color get whiteSmoke => AppColors.surfaceBlue;
  Color get text => AppColors.navy;
  Color get gray => AppColors.muted;
}
