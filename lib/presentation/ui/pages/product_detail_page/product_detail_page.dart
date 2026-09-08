// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:pickaboo/presentation/bloc/place_picker_bloc/place_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/bloc/promo_bloc/promo_bloc.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/common/bottom_sheet/delivery_location_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/cms_content_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/emi_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/product_options_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/review_image_viewer_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/dialog/product_media_dialog.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/draggable_compare_button.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_available_offers_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_bottom_action_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_delivery_location_selector.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_header_price_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_key_highlights_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_media_gallery_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_pickaboo_assured_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_section_slider.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_section_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_tab_section_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_trust_ribbon_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_variant_selector_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_frequently_bought_together.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_sale_timer_section.dart';
import 'package:flutter/rendering.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_top_app_bar.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  final String slug;
  final String productName;
  final bool embedded;

  const ProductDetailsPage({
    super.key,
    required this.productId,
    required this.slug,
    required this.productName,
    this.embedded = false,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  /// Toggle to control the visibility of the compare feature on the PDP page.
  /// Set to false to hide compare UI while preserving 100% of compare implementation logic.
  static const bool _showCompareFeature = false;

  int _quantity = AppConstants.minCartQuantity;
  int _totalAddonPrice = 0;
  bool _isFavorite = false;
  bool _isWishlistProcessing = false;
  bool _isSharing = false;
  List<ConfigurableItemOptionEntity> _selectedVariantsStatus = [];
  List<ConfigurableItemOptionEntity> _selectedAddonOptions = [];

  bool _showVariantError = false;

  PlacePickResultEntity? _selectedDeliveryLocation;
  bool _slugSectionsRequested = false;

  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isScrolledPastHeroNotifier = ValueNotifier<bool>(false);

  /// The hero image is 1:1 aspect ratio, so its height equals the screen width.
  double get _heroImageHeight => MediaQuery.of(context).size.width;

  /// Guards against active scroll notifications during snap animation.
  bool _isSnapping = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailBloc>().add(
        ProductDetailEvent.load(productId: widget.productId),
      );
      context.read<CmsContentBloc>().add(const CmsContentEvent.loadAll());
      _loadSlugBasedSections(widget.slug);
    });
  }

  void _onScrollChanged() {
    if (!_scrollController.hasClients) return;
    // Hard guarantee: Whenever at or near top (offset <= 5px),
    // the top bar MUST be transparent without product name.
    if (_scrollController.offset <= 5.0 && _isScrolledPastHeroNotifier.value) {
      _isScrolledPastHeroNotifier.value = false;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollChanged);
    _scrollController.dispose();
    _isScrolledPastHeroNotifier.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    // ── Ignore all inner scrollables (e.g. PageView, Offers auto-scroll, Sliders) ──
    if (notification.depth != 0 || notification.metrics.axis != Axis.vertical) {
      return false;
    }

    final pixels = notification.metrics.pixels;
    final threshold = _heroImageHeight * 0.25; // 75% visible threshold

    // ── 1. Top of page / Over-scroll guarantee ──
    // At the top of the page (offset <= 5px or overscrolling at the top):
    // App bar MUST be transparent without name.
    if (pixels <= 5.0) {
      if (_isScrolledPastHeroNotifier.value) {
        _isScrolledPastHeroNotifier.value = false;
      }
      return false;
    }

    if (_isSnapping) return false;

    // ── 2. Active Scrolling ──
    if (notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta ?? 0;

      // Scrolling DOWN and scrolled past 20px:
      // Show regular top app bar with product name.
      if (delta > 0.5 && pixels > 20.0) {
        if (!_isScrolledPastHeroNotifier.value) {
          _isScrolledPastHeroNotifier.value = true;
        }
      }
      // Scrolling UP and >= 75% of image is visible:
      // Transition immediately to transparent top app bar without name.
      else if (delta < -0.5 && pixels < threshold) {
        if (_isScrolledPastHeroNotifier.value) {
          _isScrolledPastHeroNotifier.value = false;
        }
      }
      // If scrolled deep (less than 75% of image visible):
      // Keep regular top app bar with product name.
      else if (pixels >= threshold) {
        if (!_isScrolledPastHeroNotifier.value) {
          _isScrolledPastHeroNotifier.value = true;
        }
      }
    }

    // ── 3. Snap-to-top on release ──
    // If scroll settles and >= 75% of the product image is visible:
    // Automatically transition to image-focused state and snap image to full fit.
    final bool isScrollSettled =
        (notification is UserScrollNotification &&
            notification.direction == ScrollDirection.idle) ||
        notification is ScrollEndNotification;

    if (isScrollSettled) {
      if (pixels > 2.0 && pixels < threshold) {
        _triggerSnapToTop();
      } else if (pixels <= 5.0) {
        if (_isScrolledPastHeroNotifier.value) {
          _isScrolledPastHeroNotifier.value = false;
        }
      }
    }

    return false;
  }

  /// Smoothly snaps scroll to offset 0 while transitioning the
  /// app bar to transparent without name over the product image.
  void _triggerSnapToTop() {
    if (_isSnapping) return;
    if (!_scrollController.hasClients) return;
    if (_scrollController.offset <= 0) {
      _isScrolledPastHeroNotifier.value = false;
      return;
    }

    _isSnapping = true;
    _isScrolledPastHeroNotifier.value = false;

    _scrollController
        .animateTo(
          0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
        )
        .catchError((_) {})
        .whenComplete(() {
          _isSnapping = false;
          if (_isScrolledPastHeroNotifier.value) {
            _isScrolledPastHeroNotifier.value = false;
          }
        });
  }

  void _loadSlugBasedSections(String slug) {
    if (_slugSectionsRequested || slug.isEmpty) return;
    _slugSectionsRequested = true;

    context.read<PromoBloc>().add(PromoEvent.fetch(slug: slug));
    context.read<ProductFlashSaleBloc>().add(
      ProductFlashSaleEvent.fetch(slug: slug),
    );
    context.read<RecommendedProductsBloc>().add(
      RecommendedProductsEvent.load(slug: slug),
    );
    context.read<RelatedProductsBloc>().add(
      RelatedProductsEvent.load(slug: slug),
    );
  }

  Future<void> _onDeliveryInfoTap() async {
    await _openDeliveryLocationSheet();
  }

  Future<void> _openDeliveryLocationSheet() async {
    final result = await DeliveryLocationSheet.show(context);
    if (result != null && mounted) {
      setState(() => _selectedDeliveryLocation = result);
      context.read<DeliveryChargeBloc>().add(
        DeliveryChargeEvent.fetch(productId: widget.productId),
      );
    }
  }

  void _addBuyTogetherToCart(List<BuyTogetherEntity> selectedItems) {
    final addable = selectedItems
        .where((item) => item.typeId != 'configurable')
        .toList();
    final skipped = selectedItems
        .where((item) => item.typeId == 'configurable')
        .toList();

    final cartBloc = context.read<CartBloc>();
    for (final item in addable) {
      final double effectivePrice = (item.specialPrice > 0
              ? item.specialPrice
              : item.price)
          .toDouble();
      getIt<AnalyticsService>().logAddToCart(
        id: item.id,
        name: item.name,
        price: effectivePrice,
        quantity: 1,
      );
      cartBloc.add(
        CartEvent.addItemSmart(
          sku: item.sku,
          qty: 1,
          productType: item.typeId.isNotEmpty ? item.typeId : 'simple',
        ),
      );
    }

    if (skipped.isNotEmpty) {
      final names = skipped.map((item) => item.name).join(', ');
      SnackBarUtils.showWarning(
        context,
        skipped.length == 1
            ? '$names needs options selected — open it to add'
            : 'These need options selected before adding: $names',
      );
      return;
    }
  }


  void _autoSelectSingleVariants(ProductDetailEntity product) {
    if (!product.hasVariants) return;
    final updated = List<ConfigurableItemOptionEntity>.from(_selectedVariantsStatus);
    bool changed = false;

    for (final group in product.variantGroups) {
      if (group.options.length == 1) {
        final opt = group.options.first;
        final idx = updated.indexWhere((e) => e.optionId == group.optionId);
        if (idx != -1) {
          if (updated[idx].optionValue != opt.optionValue) {
            updated[idx] = ConfigurableItemOptionEntity(
              optionId: group.optionId,
              optionValue: opt.optionValue,
            );
            changed = true;
          }
        } else {
          updated.add(
            ConfigurableItemOptionEntity(
              optionId: group.optionId,
              optionValue: opt.optionValue,
            ),
          );
          changed = true;
        }
      }
    }

    if (changed) {
      setState(() {
        _selectedVariantsStatus = updated;
      });
    }
  }

  bool _validateSelection(ProductDetailEntity product) {
    final variantGroups = product.variantGroups;
    final extraOptions = product.extraOptions;

    final selectedVariantOptionIds = _selectedVariantsStatus
        .map((s) => s.optionId)
        .toSet();
    final bool allVariantsSelected = variantGroups.every(
      (g) => selectedVariantOptionIds.contains(g.optionId),
    );

    final requiredOptions = extraOptions.where((o) => o.isRequire).toList();
    final selectedOptionIds = _selectedAddonOptions
        .where((s) => s.isCustomOption)
        .map((s) => s.optionId)
        .toSet();
    final bool allAddonsSelected = requiredOptions.every(
      (o) => selectedOptionIds.contains(o.optionId.toString()),
    );

    setState(() {
      _showVariantError = !allVariantsSelected;
    });

    return allVariantsSelected && allAddonsSelected;
  }

  Future<void> _openOptionsSheet(
    ProductDetailEntity product, {
    bool isBuyNow = false,
    bool isSelectionOnly = false,
  }) async {
    final result = await ProductOptionsSheet.show(
      context,
      product: product,
      quantity: _quantity,
      initialVariants: _selectedVariantsStatus,
      initialAddons: _selectedAddonOptions,
      initialAddonPrice: _totalAddonPrice,
      isBuyNow: isBuyNow,
      isSelectionOnly: isSelectionOnly,
      onSelectionsChanged: (variants, addons) {
        int totalAddonPrice = 0;
        for (final addon in addons) {
          if (!addon.isCustomOption) continue;
          try {
            final option = product.extraOptions.firstWhere(
              (o) => o.optionId.toString() == addon.optionId,
            );
            final value = option.values.firstWhere(
              (v) => v.optionTypeId.toString() == addon.optionValue,
            );
            totalAddonPrice += value.price;
          } catch (_) {}
        }
        setState(() {
          _selectedVariantsStatus = variants;
          _selectedAddonOptions = addons;
          _totalAddonPrice = totalAddonPrice;
          _showVariantError = false;
        });
      },
    );

    if (result != null && mounted) {
      setState(() {
        _selectedVariantsStatus = result.variants;
        _selectedAddonOptions = result.addons;
      });
      if (!isSelectionOnly) {
        if (isBuyNow) {
          _executeBuyNow(product);
        } else {
          _executeAddToCart(product);
        }
      }
    }
  }

  void _logAddToCartEvent(ProductDetailEntity product) {
    final double effectivePrice = (product.spacialPrice > 0
            ? product.spacialPrice
            : product.regularPrice)
        .toDouble();

    final categoryId =
        product.categoryIds.isNotEmpty ? product.categoryIds.first : null;

    getIt<AnalyticsService>().logAddToCart(
      id: product.id.toString(),
      name: product.name,
      price: effectivePrice,
      quantity: _quantity,
      categoryId: categoryId,
      brand: product.brand.isNotEmpty ? product.brand : null,
      brandId: product.brandId.isNotEmpty ? product.brandId : null,
    );
  }

  void _executeAddToCart(ProductDetailEntity product) {
    if (!_validateSelection(product)) {
      _openOptionsSheet(product, isBuyNow: false);
      return;
    }

    _logAddToCartEvent(product);

    final List<ConfigurableItemOptionEntity> combinedOptions = [
      ..._selectedVariantsStatus,
      ..._selectedAddonOptions,
    ];

    context.read<CartBloc>().add(
      CartEvent.addItemSmart(
        sku: product.sku,
        qty: _quantity,
        productType: product.typeId.isNotEmpty ? product.typeId : 'simple',
        configurableOptions: combinedOptions,
      ),
    );
  }

  void _executeBuyNow(ProductDetailEntity product) {
    if (!_validateSelection(product)) {
      _openOptionsSheet(product, isBuyNow: true);
      return;
    }

    _logAddToCartEvent(product);

    final List<ConfigurableItemOptionEntity> combinedOptions = [
      ..._selectedVariantsStatus,
      ..._selectedAddonOptions,
    ];

    context.read<CartBloc>().add(
      CartEvent.addItemSmart(
        sku: product.sku,
        qty: _quantity,
        productType: product.typeId.isNotEmpty ? product.typeId : 'simple',
        configurableOptions: combinedOptions,
      ),
    );

    context.push(Routes.cart);
  }

  List<String> _resolveImages(ProductDetailEntity product) {
    List<String> images = product.images.isNotEmpty
        ? product.images
        : ['https://via.placeholder.com/400'];

    for (var selection in _selectedVariantsStatus) {
      try {
        final variant = product.variantGroups.firstWhere(
          (v) => v.optionId == selection.optionId,
        );
        final option = variant.options.firstWhere(
          (o) => o.optionValue == selection.optionValue,
        );
        if (option.configurableProduct?.productImages != null &&
            option.configurableProduct!.productImages.isNotEmpty) {
          images = option.configurableProduct!.productImages;
          break;
        }
      } catch (_) {}
    }
    return images;
  }

  List<String> _youtubeIds(ProductDetailEntity product) {
    final idRegex = RegExp(r'(?:v=|youtu\.be/|embed/)([A-Za-z0-9_-]{11})');
    return product.youtubeVideos
        .map((v) => idRegex.firstMatch(v.url)?.group(1))
        .whereType<String>()
        .toList();
  }

  List<String> _youtubeThumbnails(ProductDetailEntity product) => _youtubeIds(
    product,
  ).map((id) => 'https://img.youtube.com/vi/$id/hqdefault.jpg').toList();

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return MultiBlocListener(
      listeners: [
        BlocListener<PlacePickerBloc, PlacePickerState>(
          listenWhen: (prev, curr) =>
              curr.status == PlacePickerStatus.success &&
              curr.selectedPlace != null &&
              curr.selectedPlace != prev.selectedPlace,
          listener: (context, state) {
            final place = state.selectedPlace!;
            setState(() => _selectedDeliveryLocation = place);
            context.read<DeliveryChargeBloc>().add(
              DeliveryChargeEvent.fetch(productId: widget.productId),
            );
          },
        ),
        BlocListener<CompareBloc, CompareState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (error, _) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message),
                    backgroundColor: AppColors.red,
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<ProductDetailBloc, ProductDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (product) {
                context.read<ReviewBloc>().add(
                  ReviewEvent.load(productId: product.id.toString()),
                );
                context.read<EmiBloc>().add(
                  EmiEvent.load(productId: product.id.toString()),
                );
                _loadSlugBasedSections(product.slug);
                _autoSelectSingleVariants(product);

                if (!_isWishlistProcessing) {
                  setState(() {
                    _isFavorite = product.isWishlisted;
                  });
                }
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<WishlistBloc, WishlistState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (items) {
                final isActuallyFavorite = items.any(
                  (item) => item.productId == widget.productId,
                );
                if (!_isWishlistProcessing && _isFavorite != isActuallyFavorite) {
                  setState(() => _isFavorite = isActuallyFavorite);
                }
              },
              actionSuccess: (message) {
                if (_isWishlistProcessing) {
                  setState(() => _isWishlistProcessing = false);
                  SnackBarUtils.showSuccess(context, message);
                }
              },
              error: (message) {
                if (_isWishlistProcessing) {
                  setState(() {
                    _isFavorite = !_isFavorite;
                    _isWishlistProcessing = false;
                  });
                  SnackBarUtils.showError(context, message);
                }
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            state.maybeWhen(
              itemAdded: (cart, message) {
                SnackBarUtils.showCartItemAdded(
                  context,
                  message: message.isNotEmpty ? message : 'Item added to cart',
                );
              },
              error: (error, lastCart) {
                SnackBarUtils.showError(context, error.message);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          final isLoggedIn = authState.maybeWhen(
            authenticated: (token, user) => true,
            orElse: () => false,
          );

          return BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.white,
                body: SafeArea(
                  top: true,
                  bottom: false,
                  child: Stack(
                    children: [
                      state.when(
                        initial: () => _buildLoadingState(),
                        loading: () => _buildLoadingState(),
                        loaded: (product) => _buildLoadedState(
                          product,
                          textStyle,
                          isLoggedIn,
                        ),
                        error: (error) => _buildErrorState(error),
                      ),
                      if (_showCompareFeature)
                        state.maybeWhen(
                          loaded: (product) =>
                              BlocBuilder<CompareBloc, CompareState>(
                                builder: (context, compareState) {
                                  if (compareState.products.isEmpty) {
                                    return const SizedBox.shrink();
                                  }
                                  return DraggableCompareButton(
                                    badgeCount: compareState.products.length,
                                    onTap: () {
                                      context.goToProductComparison(
                                        product.id.toString(),
                                      );
                                    },
                                  );
                                },
                              ),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      // ── Floating Top App Bar (Slides in/out based on scroll) ──
                      _buildFloatingAppBar(state),
                    ],
                  ),
                ),
                bottomNavigationBar: state.maybeWhen(
                  loaded: (product) => BlocBuilder<CartBloc, CartState>(
                    builder: (context, cartState) {
                      final isProcessing = cartState.maybeWhen(
                        operationInProgress: (_, __) => true,
                        loading: () => true,
                        orElse: () => false,
                      );

                      final int basePrice = product.spacialPrice > 0
                          ? product.spacialPrice
                          : product.regularPrice;
                      final int computedCurrent = (basePrice + _totalAddonPrice) * _quantity;
                      final int computedOriginal = (product.regularPrice + _totalAddonPrice) * _quantity;

                      return PdpBottomActionBar(
                        product: product,
                        currentPrice: computedCurrent,
                        originalPrice: computedOriginal,
                        quantity: _quantity,
                        isProcessing: isProcessing,
                        onChatTap: () => context.push(Routes.contactUs),
                        onAddToCart: () => _executeAddToCart(product),
                        onBuyNow: () => _executeBuyNow(product),
                        onQuantityChanged: (q) => setState(() => _quantity = q),
                      );
                    },
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return const AppLoader.fullPage();
  }

  Widget _buildLoadedState(
    ProductDetailEntity product,
    AppTextStyles textStyle,
    bool isLoggedIn,
  ) {
    final activeImages = _resolveImages(product);
    final int basePrice = product.spacialPrice > 0
        ? product.spacialPrice
        : product.regularPrice;
    final int currentPrice = (basePrice + _totalAddonPrice) * _quantity;
    final int originalPrice = (product.regularPrice + _totalAddonPrice) * _quantity;
    final int saving = originalPrice > currentPrice ? originalPrice - currentPrice : 0;

    return BlocBuilder<CompareBloc, CompareState>(
      builder: (context, compareState) {
        final isCompared = compareState.products.any((p) => p.id == product.id);

        return BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            final cartCount = cartState.maybeWhen(
              loaded: (cart) => cart.itemsCount,
              itemAdded: (cart, _) => cart.itemsCount,
              couponApplied: (cart, _) => cart.itemsCount,
              rewardPointsApplied: (cart, _) => cart.itemsCount,
              operationInProgress: (cart, _) => cart.itemsCount,
              orElse: () => 0,
            );

            return NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      // ── 1. Hero Media Gallery with Overlay Controls (Back, Search, Cart, Heart, Compare, Share) ──
                      PdpMediaGalleryWidget(
                        product: product,
                        activeImages: activeImages,
                        isFavorite: _isFavorite,
                        isCompared: isCompared,
                        cartCount: cartCount,
                        showTopBar: false,
                        showCompareButton: _showCompareFeature,
                        onBack: () => Navigator.of(context).pop(),
                        onSearch: () => context.push(Routes.search),
                        onCart: () => context.push(Routes.cart),
                        onFavorite: () {
                        if (isLoggedIn) {
                          if (_isWishlistProcessing) return;
                          setState(() => _isWishlistProcessing = true);
                          if (_isFavorite) {
                            context.read<WishlistBloc>().add(
                              WishlistEvent.removeFromWishlist(widget.productId),
                            );
                          } else {
                            context.read<WishlistBloc>().add(
                              WishlistEvent.addToWishlist(widget.productId),
                            );
                          }
                          setState(() => _isFavorite = !_isFavorite);
                        } else {
                          context.push(Routes.login);
                        }
                      },
                      onShare: () async {
                        if (_isSharing) return;
                        if (product.shareUrl.isNotEmpty) {
                          setState(() => _isSharing = true);
                          try {
                            await SharePlus.instance.share(
                              ShareParams(
                                title: "Pickaboo Product",
                                subject: product.name,
                                text: 'Check out ${product.name} on Pickaboo:\n${product.shareUrl}',
                              ),
                            );
                          } finally {
                            if (mounted) setState(() => _isSharing = false);
                          }
                        }
                      },
                      onCompare: () {
                        if (isCompared) {
                          context.read<CompareBloc>().add(
                            CompareEvent.remove(productId: product.id.toString()),
                          );
                          SnackBarUtils.showInfo(context, 'Removed from comparison');
                        } else {
                          context.read<CompareBloc>().add(
                            CompareEvent.add(product: product),
                          );
                          SnackBarUtils.showComparisonAdded(
                            context,
                            onCompare: () {
                              context.goToProductComparison(product.id.toString());
                            },
                          );
                        }
                      },
                      onImageTap: (index) {
                        ProductMediaDialog.show(
                          context,
                          initialType: ProductMediaType.productImages,
                          initialIndex: index,
                          productImages: activeImages.isNotEmpty
                              ? activeImages
                              : product.images,
                          videoThumbnails: _youtubeThumbnails(product),
                          videoIds: _youtubeIds(product),
                          customerImages: product.allReviewImages,
                        );
                      },
                      onMediaFilterSelected: (filter) {
                        ProductMediaType? type;
                        if (filter == 'Product Images') type = ProductMediaType.productImages;
                        if (filter == 'Videos') type = ProductMediaType.videos;
                        if (filter == 'Customer Images') type = ProductMediaType.customerImages;

                        if (type != null) {
                          ProductMediaDialog.show(
                            context,
                            initialType: type,
                            productImages: activeImages.isNotEmpty
                                ? activeImages
                                : product.images,
                            videoThumbnails: _youtubeThumbnails(product),
                            videoIds: _youtubeIds(product),
                            customerImages: product.allReviewImages,
                          );
                        }
                      },
                    ),

                    // ── 2. Top Trust Ribbon Strip (Authentic, Return, Seller, Warranty, Free Delivery) ──
                    PdpTrustRibbonWidget(
                      product: product,
                    ),

                    // ── 3. Product Header, Stock, Price & EMI Section ──
                    PdpSectionCard(
                      child: PdpHeaderPriceSection(
                        product: product,
                        currentPrice: currentPrice,
                        originalPrice: originalPrice,
                        saving: saving,
                        onBrandTap: () {
                          context.pushToBrandProduct(
                            brandKey: product.brand.replaceAll(RegExp(r'\s+'), ''),
                            brandName: product.brand,
                          );
                        },
                        onRateTap: () {
                          if (isLoggedIn) {
                            if (product.isEligibleForReview) {
                              context.pushNamed(
                                'writeReview',
                                pathParameters: {'id': product.id.toString()},
                                extra: {
                                  'productName': product.name,
                                  'productImage': product.images.isNotEmpty
                                      ? product.images.first
                                      : '',
                                },
                              );
                            } else {
                              SnackBarUtils.showWarning(
                                context,
                                'You are not eligible to write a review for this product',
                              );
                            }
                          } else {
                            context.push(Routes.login);
                          }
                        },
                        onEmiTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => BlocProvider.value(
                              value: context.read<EmiBloc>(),
                              child: BlocBuilder<EmiBloc, EmiState>(
                                builder: (context, emiState) {
                                  return emiState.maybeWhen(
                                    loaded: (options) => EmiBottomSheet(
                                      emiOptions: options,
                                      productPrice: currentPrice.toString(),
                                    ),
                                    orElse: () => EmiBottomSheet(
                                      emiOptions: const [],
                                      productPrice: currentPrice.toString(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        onExpressDeliveryTap: () {
                          final cmsState = context.read<CmsContentBloc>().state;
                          if (cmsState.expressDelivery != null &&
                              cmsState.expressDelivery?.active == true) {
                            CmsContentBottomSheet.show(
                              context,
                              cmsState.expressDelivery!,
                            );
                          }
                        },
                      ),
                    ),

                    // ── 4. Variant Selector Section (Color Swatches • Storage Chips) ──
                    if (product.hasVariants)
                      PdpSectionCard(
                        child: PdpVariantSelectorSection(
                          product: product,
                          selectedVariants: _selectedVariantsStatus,
                          showError: _showVariantError,
                          onVariantsChanged: (variants) {
                            setState(() {
                              _selectedVariantsStatus = variants;
                              _showVariantError = false;
                            });
                          },
                          onHeaderTap: () => _openOptionsSheet(product, isSelectionOnly: true),
                        ),
                      ),

                    // ── 5. Available Offers & Bank Discounts ──
                    if (product.offers.trim().isNotEmpty)
                      PdpSectionCard(
                        customPadding: EdgeInsets.symmetric(vertical: AppSpacing.sameGroupItemSpacing.h),
                        child: PdpAvailableOffersWidget(
                          promoOffer: product.offers,
                        ),
                      ),

                    // ── 7. Delivery & Location Selector (Hidden when out of stock) ──
                    if (product.stockAvailable)
                      BlocBuilder<DeliveryChargeBloc, DeliveryChargeState>(
                        builder: (context, deliveryChargeState) {
                          final isInsideDhaka = _selectedDeliveryLocation?.district
                                  ?.toLowerCase()
                                  .contains('dhaka') ==
                              true;

                          final trailingText = deliveryChargeState.maybeWhen(
                            loaded: (entity) => isInsideDhaka
                                ? entity.formattedInsideCharge
                                : entity.formattedOutsideCharge,
                            orElse: () => null,
                          );

                          return PdpSectionCard(
                            child: PdpDeliveryLocationSelector(
                              selectedAddress: _selectedDeliveryLocation?.displayAddress,
                              deliveryCharge: trailingText,
                              isExpress: product.expressDelivery == 1,
                              onTap: _onDeliveryInfoTap,
                            ),
                          );
                        },
                      ),

                    // ── 8. Flash Sale Timer (if active) ──
                    BlocBuilder<ProductFlashSaleBloc, ProductFlashSaleState>(
                      builder: (context, flashSaleState) {
                        if (flashSaleState.status == ProductFlashSaleStatus.success &&
                            flashSaleState.flashSale != null &&
                            flashSaleState.flashSale!.inFlashSale &&
                            flashSaleState.flashSale!.flashSale?.endTime != null) {
                          final sale = flashSaleState.flashSale!.flashSale!;
                          return ProductSaleTimerSection(
                            title: sale.title,
                            subtitle: sale.shortDescription,
                            endTime: sale.endTime!,
                            onLearnMore: () {
                              final segments = sale.slug.split('/').where((s) => s.trim().isNotEmpty).toList();
                              if (segments.isNotEmpty) {
                                context.handleBannerTap(
                                  linkType: 'special_category',
                                  link: segments.last.trim(),
                                  categoryName: sale.title,
                                  urlKey: segments.last.trim(),
                                );
                              }
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    // ── 9. Key Highlights (2x2 Spec Summary Grid) ──
                    if (product.moreInformation.isNotEmpty)
                      PdpSectionCard(
                        child: PdpKeyHighlightsWidget(
                          moreInformation: product.moreInformation,
                        ),
                      ),

                    // ── 10. Why Shop on Pickaboo (Assured, Express Delivery & Rewards) ──
                    PdpSectionCard(
                      child: PdpPickabooAssuredCard(
                        product: product,
                        onAssuredTap: () {
                          final cmsState = context.read<CmsContentBloc>().state;
                          if (cmsState.pickabooVerified != null &&
                              cmsState.pickabooVerified?.active == true) {
                            CmsContentBottomSheet.show(
                              context,
                              cmsState.pickabooVerified!,
                            );
                          }
                        },
                        onExpressDeliveryTap: () {
                          final cmsState = context.read<CmsContentBloc>().state;
                          if (cmsState.expressDelivery != null &&
                              cmsState.expressDelivery?.active == true) {
                            CmsContentBottomSheet.show(
                              context,
                              cmsState.expressDelivery!,
                            );
                          }
                        },
                        onClubPointsTap: () {
                          if (isLoggedIn) {
                            context.push(Routes.clubPoint);
                          } else {
                            context.push(Routes.login);
                          }
                        },
                      ),
                    ),

                    // ── 10.1 Product Offer Banner (CMS) ──
                    BlocBuilder<CmsContentBloc, CmsContentState>(
                      builder: (context, cmsState) {
                        if (cmsState.productOffer != null &&
                            cmsState.productOffer?.active == true) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSpacing.sameGroupItemSpacing.w,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    final String title =
                                        cmsState.productOffer?.title ?? "";
                                    if (!title.contains('&&')) return;

                                    final parts = title.split('&&');
                                    final type = parts[0];
                                    final link = parts.length > 1 ? parts[1] : '';
                                    final name = parts.length > 2 ? parts[2] : null;

                                    context.handleBannerTap(
                                      linkType: type,
                                      link: link,
                                      categoryName: name,
                                      urlKey: link,
                                    );
                                  },
                                  child: AppHtml(
                                    data: cmsState.productOffer?.content ?? "",
                                    onLinkTap: (url, attributes, element) async {
                                      if (url != null) {
                                        final trimmedUrl = url.trim();
                                        if (trimmedUrl.contains('privacy-policy')) {
                                          context.push(Routes.privacyPolicy);
                                        } else if (trimmedUrl.contains('slug=')) {
                                          final uri = Uri.parse(trimmedUrl);
                                          final slug = uri.queryParameters['slug'];
                                          if (slug != null) {
                                            context.pushNamed(
                                              'knowledgeBaseDetailsStandalone',
                                              pathParameters: {'id': slug},
                                              extra: {
                                                'categoryId': slug,
                                                'categoryName':
                                                    element?.text ?? 'Help Articles',
                                              },
                                            );
                                          }
                                        } else {
                                          try {
                                            await launchUrl(
                                              Uri.parse(trimmedUrl),
                                              mode: LaunchMode.externalApplication,
                                            );
                                          } catch (e) {
                                            debugPrint('Could not launch $url: $e');
                                          }
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                height: AppSpacing.groupToGroupSpacing * 0.5,
                                color: AppColors.pageBg,
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    // ── 11. Tabbed Specifications, Overview, Reviews & Q&A ──
                    PdpSectionCard(
                      customPadding: EdgeInsets.zero,
                      child: PdpTabSectionWidget(
                        product: product,
                        onWriteReviewTap: () {
                          if (isLoggedIn) {
                            if (product.isEligibleForReview) {
                              context.pushNamed(
                                'writeReview',
                                pathParameters: {'id': product.id.toString()},
                                extra: {
                                  'productName': product.name,
                                  'productImage': product.images.isNotEmpty
                                      ? product.images.first
                                      : '',
                                },
                              );
                            } else {
                              SnackBarUtils.showWarning(
                                context,
                                'You are not eligible to write a review for this product',
                              );
                            }
                          } else {
                            context.push(Routes.login);
                          }
                        },
                        onViewAllReviewsTap: () {
                          context.pushNamed(
                            'allProductReviews',
                            pathParameters: {'id': product.id.toString()},
                            extra: product,
                          );
                        },
                        onReviewPhotoTap: (idx) {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            useSafeArea: true,
                            backgroundColor: Colors.black,
                            builder: (_) => ReviewImageViewerSheet(
                              imageUrls: product.allReviewImages,
                              initialIndex: idx,
                            ),
                          );
                        },
                      ),
                    ),

                    // ── 12. Frequently Bought Together Accessories ──
                    if (product.buysTogather.isNotEmpty)
                      PdpSectionCard(
                        child: ProductFrequentlyBoughtTogether(
                          items: product.buysTogather,
                          onAddToCart: _addBuyTogetherToCart,
                        ),
                      ),

                    // ── 13. Related Products Slider ──
                    BlocBuilder<RelatedProductsBloc, RelatedProductsState>(
                      builder: (context, relatedState) {
                        return relatedState.maybeWhen(
                          loaded: (entity) {
                            if (entity.relatedProducts.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return PdpSectionCard(
                              customPadding: EdgeInsets.zero,
                              child: ProductSectionSlider(
                                title: 'Related Products',
                                products: entity.relatedProducts,
                                onProductTap: (product) {
                                  context.goToProductDetail(
                                    product.id.toString(),
                                    slug: product.slug,
                                    productName: product.productName,
                                  );
                                },
                              ),
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),

                    // ── 14. Recommended For You Slider ──
                    BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
                      builder: (context, recommendedState) {
                        return recommendedState.maybeWhen(
                          loaded: (entity) {
                            if (entity.sellerRecommendedProducts.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return PdpSectionCard(
                              customPadding: EdgeInsets.zero,
                              child: ProductSectionSlider(
                                title: 'Recommended For You',
                                products: entity.sellerRecommendedProducts,
                                onProductTap: (product) {
                                  context.goToProductDetail(
                                    product.id.toString(),
                                    slug: product.slug,
                                    productName: product.productName,
                                  );
                                },
                              ),
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildErrorState(dynamic error) {
    final isOffline = ConnectivityUtils.isNoInternet(error, context);
    if (isOffline) {
      return NoInternetPage(
        showAppBar: false,
        onRetry: () {
          context.read<ProductDetailBloc>().add(
            ProductDetailEvent.load(productId: widget.productId),
          );
        },
        onBack: Navigator.of(context).canPop()
            ? () => Navigator.of(context).pop()
            : null,
      );
    }

    final String message = error is AppErrorEntity && error.message.isNotEmpty
        ? error.message
        : 'Something went wrong while loading this product. Please try again in a moment.';

    return AppErrorView(
      type: AppErrorType.generic,
      title: "Couldn't load this product",
      message: message,
      retryLabel: 'Retry',
      onRetry: () {
        context.read<ProductDetailBloc>().add(
          ProductDetailEvent.load(productId: widget.productId),
        );
      },
      onSecondary: Navigator.of(context).canPop()
          ? () => Navigator.of(context).pop()
          : null,
      secondaryLabel: 'Go Back',
    );
  }

  Widget _buildFloatingAppBar(ProductDetailState state) {
    final isError = state.maybeWhen(
      error: (_) => true,
      orElse: () => false,
    );
    if (isError) return const SizedBox.shrink();

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        final cartCount = cartState.maybeWhen(
          loaded: (cart) => cart.itemsCount,
          itemAdded: (cart, _) => cart.itemsCount,
          couponApplied: (cart, _) => cart.itemsCount,
          rewardPointsApplied: (cart, _) => cart.itemsCount,
          operationInProgress: (cart, _) => cart.itemsCount,
          orElse: () => 0,
        );

        final productName = state.maybeWhen(
          loaded: (product) => product.name,
          orElse: () => widget.productName,
        );

        final isLoaded = state.maybeWhen(
          loaded: (_) => true,
          orElse: () => false,
        );

        return ValueListenableBuilder<bool>(
          valueListenable: _isScrolledPastHeroNotifier,
          builder: (context, isScrolledPastHero, _) {
            return Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: PdpTopAppBar(
                title: productName,
                cartCount: cartCount,
                showBackButton: !widget.embedded,
                onBack: () => Navigator.of(context).maybePop(),
                onSearch: isLoaded ? () => context.push(Routes.search) : null,
                onCart: isLoaded ? () => context.push(Routes.cart) : null,
                isVisible: true,
                isScrolledPastHero: isScrolledPastHero,
              ),
            );
          },
        );
      },
    );
  }
}
