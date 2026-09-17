// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/network/api_error_parser.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';
import 'package:pickaboo/presentation/bloc/internet/internet_bloc.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:pickaboo/presentation/bloc/place_picker_bloc/place_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/core/cache/pdp_location_cache.dart';
import 'package:pickaboo/presentation/bloc/promo_bloc/promo_bloc.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/common/bottom_sheet/delivery_location_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/cms_content_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/emi_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/product_options_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/bottom_sheet/review_image_viewer_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/dialog/product_media_dialog.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/pages/no_internet_page/no_internet_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/draggable_compare_button.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_bottom_action_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_cross_sell_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_deals_and_offers_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_fulfillment_and_services_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_key_highlights_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_media_gallery_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_new_price_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_section_card.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_skeleton_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_tab_section_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_top_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_trust_ribbon_widget.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_variant_selector_section.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productId;
  final String slug;
  final String productName;
  final String? previewImageUrl;
  final String? previewPrice;
  final bool embedded;
  final ProductEntity? previewProduct;

  const ProductDetailsPage({
    super.key,
    required this.productId,
    required this.slug,
    required this.productName,
    this.previewImageUrl,
    this.previewPrice,
    this.previewProduct,
    this.embedded = false,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  /// Toggle to control the visibility of the compare feature on the PDP page.
  /// Set to false to hide compare UI while preserving 100% of compare implementation logic.
  static const bool _showCompareFeature = false;

  /// Toggle to control the visibility of the top trust ribbon vs price card trust row.
  /// When true: Top PdpTrustRibbonWidget is displayed, and the 3-item row after warranty is omitted.
  /// When false: Top trust ribbon is hidden, and the 3-item row is displayed after warranty.
  static const bool _showTrustRibbon = false;

  int _quantity = AppConstants.minCartQuantity;
  int _totalAddonPrice = 0;
  bool _isFavorite = false;
  bool _isWishlistProcessing = false;
  bool _isSharing = false;
  List<ConfigurableItemOptionEntity> _selectedVariantsStatus = [];
  List<ConfigurableItemOptionEntity> _selectedAddonOptions = [];

  bool _showVariantError = false;

  PlacePickResultEntity? _selectedDeliveryLocation;
  bool _secondarySectionsLoaded = false;
  bool _bottomSlidersLoaded = false;

  int _pendingBatchAddCount = 0;
  int _totalBatchAddCount = 0;
  Timer? _batchAddTimeoutTimer;

  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isScrolledPastHeroNotifier = ValueNotifier<bool>(false);
  final GlobalKey<PdpTabSectionWidgetState> _reviewsTabKey = GlobalKey<PdpTabSectionWidgetState>();

  /// The hero image is 1:1 aspect ratio, so its height equals the screen width.
  double get _heroImageHeight => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 1. Prioritize main product detail request with Frame 0 instant preview hydration
      context.read<ProductDetailBloc>().add(
        ProductDetailEvent.load(
          productId: widget.productId,
          initialProduct: widget.previewProduct,
        ),
      );
      // Read delivery location from local storage
      _readCachedDeliveryLocation();
      // 2. Early unblocked secondary loading at Frame 0
      _initEarlySecondarySections();
    });
  }

  void _onScrollChanged() {
    if (!_scrollController.hasClients) return;
    // Hard guarantee: Whenever at or near top (offset <= 20px),
    // the top bar MUST be transparent without product name.
    if (_scrollController.offset <= 20.0 && _isScrolledPastHeroNotifier.value) {
      _isScrolledPastHeroNotifier.value = false;
    }
  }

  @override
  void dispose() {
    _batchAddTimeoutTimer?.cancel();
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
    final threshold = _heroImageHeight * 0.5;

    // ── 1. Top of page guarantee ──
    // At the top of the page (offset <= 20px):
    // App bar MUST be transparent without name.
    if (pixels <= 20.0) {
      if (_isScrolledPastHeroNotifier.value) {
        _isScrolledPastHeroNotifier.value = false;
      }
      return false;
    }

    // ── 2. Active Scrolling ──
    if (notification is ScrollUpdateNotification) {
      final delta = notification.scrollDelta ?? 0;

      // Scrolling DOWN and scrolled past 40px:
      // Smoothly activate top app bar if scrolling down with noticeable velocity.
      if (delta > 0.5 && pixels > 40.0) {
        if (!_isScrolledPastHeroNotifier.value) {
          _isScrolledPastHeroNotifier.value = true;
        }
      }
      // Scrolling UP and <= 50% of image height remaining:
      // Transition immediately to transparent top app bar without name.
      else if (delta < -0.5 && pixels < threshold) {
        if (_isScrolledPastHeroNotifier.value) {
          _isScrolledPastHeroNotifier.value = false;
        }
      }
      // If scrolled deep past threshold:
      // Keep regular top app bar with product name.
      else if (pixels >= threshold) {
        if (!_isScrolledPastHeroNotifier.value) {
          _isScrolledPastHeroNotifier.value = true;
        }
      }
    }

    return false;
  }

  void _initEarlySecondarySections() {
    final effectiveSlug = widget.slug.isNotEmpty
        ? widget.slug
        : (widget.previewProduct?.slug ?? '');

    // 1. Above-the-fold & interactive info (Flash sale, Promo, EMI, CMS)
    if (effectiveSlug.isNotEmpty && !_secondarySectionsLoaded) {
      _secondarySectionsLoaded = true;
      context.read<ProductFlashSaleBloc>().add(
        ProductFlashSaleEvent.fetch(slug: effectiveSlug),
      );
      context.read<PromoBloc>().add(PromoEvent.fetch(slug: effectiveSlug));
    }

    if (int.tryParse(widget.productId) != null) {
      context.read<EmiBloc>().add(
        EmiEvent.load(productId: widget.productId),
      );
      context.read<ReviewBloc>().add(
        ReviewEvent.load(productId: widget.productId),
      );
    }
    context.read<CmsContentBloc>().add(const CmsContentEvent.loadAll());

    // 2. Defer bottom sliders slightly (200ms) so hero & initial frame paint instantly
    if (effectiveSlug.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (!mounted) return;
        _loadBottomSliders(effectiveSlug);
      });
    }
  }

  void _loadSecondarySections(ProductDetailEntity product) {
    final effectiveSlug = product.slug.isNotEmpty
        ? product.slug
        : (widget.slug.isNotEmpty
            ? widget.slug
            : (widget.previewProduct?.slug ?? ''));

    // 1. Above-the-fold & interactive info (Flash sale, Promo, Delivery charge, EMI)
    if (effectiveSlug.isNotEmpty && !_secondarySectionsLoaded) {
      _secondarySectionsLoaded = true;
      context.read<ProductFlashSaleBloc>().add(
        ProductFlashSaleEvent.fetch(slug: effectiveSlug),
      );
      context.read<PromoBloc>().add(PromoEvent.fetch(slug: effectiveSlug));
    }

    if (_selectedDeliveryLocation != null && product.stockAvailable) {
      final pid = product.id > 0 ? product.id.toString() : widget.productId;
      context.read<DeliveryChargeBloc>().add(
        DeliveryChargeEvent.fetch(productId: pid),
      );
    }

    final effectiveProductId = product.id > 0
        ? product.id.toString()
        : (int.tryParse(widget.productId) != null ? widget.productId : '');
    if (effectiveProductId.isNotEmpty) {
      context.read<EmiBloc>().add(
        EmiEvent.load(productId: effectiveProductId),
      );
      context.read<ReviewBloc>().add(
        ReviewEvent.load(productId: effectiveProductId),
      );
    }
    context.read<CmsContentBloc>().add(const CmsContentEvent.loadAll());

    // 2. Load bottom sliders if not already loaded
    if (!_bottomSlidersLoaded && effectiveSlug.isNotEmpty) {
      _loadBottomSliders(effectiveSlug);
    }
  }

  void _loadBottomSliders(String slug) {
    if (_bottomSlidersLoaded || slug.isEmpty) return;
    _bottomSlidersLoaded = true;

    context.read<RecommendedProductsBloc>().add(
      RecommendedProductsEvent.load(slug: slug),
    );
    context.read<RelatedProductsBloc>().add(
      RelatedProductsEvent.load(slug: slug),
    );
  }

  Future<void> _readCachedDeliveryLocation() async {
    final cached = await PdpLocationCache.getLocation();
    if (cached != null && mounted) {
      setState(() => _selectedDeliveryLocation = cached);
      context.read<DeliveryChargeBloc>().add(
        DeliveryChargeEvent.fetch(productId: widget.productId),
      );
    }
  }

  bool _isDhakaPlace(PlacePickResultEntity? place) {
    if (place == null) return false;
    final candidates = [
      place.district,
      place.division,
      place.city,
      place.address,
      place.placeName,
      place.area,
    ];
    return candidates.any((c) => c != null && c.toLowerCase().contains('dhaka'));
  }

  UserEntity? get _currentUser {
    try {
      final state = context.read<UserProfileBloc>().state;
      return state.maybeWhen(
        loaded: (user, _, __) => user,
        updating: (user, _, __) => user,
        basicInfoUpdateSuccess: (_, user, __, ___) => user,
        mobileUpdateSuccess: (_, user, __, ___) => user,
        imageUploadSuccess: (_, user, __, ___) => user,
        phoneUpdateOtpSent: (_, user, __) => user,
        loading: (user, _, __) => user,
        orElse: () => null,
      );
    } catch (_) {
      return null;
    }
  }

  bool _isUserLocationNonDhaka() {
    if (_selectedDeliveryLocation != null) {
      return !_isDhakaPlace(_selectedDeliveryLocation);
    }
    final user = _currentUser;
    final addresses = user?.addresses;
    if (addresses != null && addresses.isNotEmpty) {
      final addr = addresses.firstWhere(
        (a) => a.defaultShipping,
        orElse: () => addresses.first,
      );
      final List<String> candidates = [
        addr.city,
        addr.region.region,
        ...addr.street,
      ];
      final isDhaka = candidates.any(
        (c) => c.toLowerCase().contains('dhaka'),
      );
      return !isDhaka;
    }
    return false;
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
      PdpLocationCache.saveLocation(result);
    }
  }

  void _addBuyTogetherToCart(List<BuyTogetherEntity> selectedItems) {
    final addable = selectedItems
        .where((item) => item.typeId != 'configurable')
        .toList();
    final skipped = selectedItems
        .where((item) => item.typeId == 'configurable')
        .toList();

    if (_pendingBatchAddCount == 0 && addable.length > 1) {
      _totalBatchAddCount = addable.length;
      _pendingBatchAddCount = addable.length;
      _batchAddTimeoutTimer?.cancel();
      _batchAddTimeoutTimer = Timer(const Duration(seconds: 15), () {
        _pendingBatchAddCount = 0;
        _totalBatchAddCount = 0;
      });
    }

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

  void _addBundleToCart(
    ProductDetailEntity mainProduct,
    List<BuyTogetherEntity> selectedAccessories,
  ) {
    if (!mainProduct.stockAvailable) {
      SnackBarUtils.showWarning(context, 'This product is currently out of stock');
      return;
    }

    if (!_validateSelection(mainProduct)) {
      _openOptionsSheet(mainProduct, isBuyNow: false);
      return;
    }

    final addableAccessories = selectedAccessories
        .where((item) => item.typeId != 'configurable')
        .toList();
    final totalCount = 1 + addableAccessories.length;
    _totalBatchAddCount = totalCount;
    _pendingBatchAddCount = totalCount;
    _batchAddTimeoutTimer?.cancel();
    _batchAddTimeoutTimer = Timer(const Duration(seconds: 15), () {
      _pendingBatchAddCount = 0;
      _totalBatchAddCount = 0;
    });

    _executeAddToCart(mainProduct);
    _addBuyTogetherToCart(selectedAccessories);
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

    if (product.images.isNotEmpty) {
      ProductImageResolver.cacheImage(product.id, product.images.first);
    }

    final cartBloc = context.read<CartBloc>();
    cartBloc.markAdditionPending();
    cartBloc.add(
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

    if (product.images.isNotEmpty) {
      ProductImageResolver.cacheImage(product.id, product.images.first);
    }

    final cartBloc = context.read<CartBloc>();
    cartBloc.markAdditionPending();
    cartBloc.add(
      CartEvent.addItemSmart(
        sku: product.sku,
        qty: _quantity,
        productType: product.typeId.isNotEmpty ? product.typeId : 'simple',
        configurableOptions: combinedOptions,
      ),
    );

    context.push(Routes.cart);
  }

  VariantMatrixProductEntity? _getMatchedMatrixProduct(ProductDetailEntity product) {
    final matrix = product.variantMatrix;
    if (matrix.isEmpty) return null;
    final selectedMap = {
      for (final v in _selectedVariantsStatus)
        if (v.optionValue.isNotEmpty) v.optionId: v.optionValue,
    };
    return matrix.productFor(selectedMap);
  }

  int _calculateBasePrice(ProductDetailEntity product) {
    final matched = _getMatchedMatrixProduct(product);
    if (matched != null) {
      if (matched.productSpecialPrice > 0) return matched.productSpecialPrice;
      if (matched.productPrice > 0) return matched.productPrice;
    }
    return product.spacialPrice > 0 ? product.spacialPrice : product.regularPrice;
  }

  int _calculateRegularPrice(ProductDetailEntity product) {
    final matched = _getMatchedMatrixProduct(product);
    if (matched != null && matched.productPrice > 0) {
      return matched.productPrice;
    }
    return product.regularPrice;
  }

  List<String> _resolveImages(ProductDetailEntity product) {
    List<String> images = product.images.isNotEmpty
        ? product.images
        : ['https://via.placeholder.com/400'];

    final matched = _getMatchedMatrixProduct(product);
    if (matched != null && matched.productImages.isNotEmpty) {
      return matched.productImages;
    }

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
            PdpLocationCache.saveLocation(place);
            context.read<DeliveryChargeBloc>().add(
              DeliveryChargeEvent.fetch(productId: widget.productId),
            );
          },
        ),
        BlocListener<CompareBloc, CompareState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (error, _) {
                SnackBarUtils.showNegative(context, error.message);
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<ProductDetailBloc, ProductDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (product) {
                if (product.images.isNotEmpty) {
                  ProductImageResolver.cacheImage(product.id, product.images.first);
                }
                _autoSelectSingleVariants(product);

                if (!_isWishlistProcessing) {
                  setState(() {
                    _isFavorite = product.isWishlisted;
                  });
                }

                // Stagger secondary requests once hero product is visible
                _loadSecondarySections(product);
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
                if (_pendingBatchAddCount > 1) {
                  _pendingBatchAddCount--;
                  return;
                }

                final int addedCount = _totalBatchAddCount > 0 ? _totalBatchAddCount : 1;
                _pendingBatchAddCount = 0;
                _totalBatchAddCount = 0;
                _batchAddTimeoutTimer?.cancel();

                final finalMessage = addedCount > 1
                    ? '$addedCount items added to cart'
                    : (message.isNotEmpty ? message : 'Item added to cart');

                SnackBarUtils.showCartItemAdded(
                  context,
                  itemCount: addedCount,
                  message: finalMessage,
                );
              },
              error: (error, lastCart) {
                _pendingBatchAddCount = 0;
                _totalBatchAddCount = 0;
                _batchAddTimeoutTimer?.cancel();
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
          final cartCount = context.watch<CartBloc>().state.maybeWhen(
            loaded: (cart) => cart.itemsCount,
            itemAdded: (cart, _) => cart.itemsCount,
            couponApplied: (cart, _) => cart.itemsCount,
            rewardPointsApplied: (cart, _) => cart.itemsCount,
            operationInProgress: (cart, _) => cart.itemsCount,
            orElse: () => 0,
          );

          return BlocListener<InternetBloc, InternetState>(
            listenWhen: (previous, current) =>
                previous.maybeWhen(disconnected: (_) => true, orElse: () => false) &&
                current.maybeWhen(connected: (_) => true, orElse: () => false),
            listener: (context, state) {
              context.read<ProductDetailBloc>().add(
                ProductDetailEvent.load(productId: widget.productId),
              );
            },
            child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return PopScope(
                canPop: widget.embedded,
                onPopInvokedWithResult: (didPop, result) {
                  if (didPop || widget.embedded) return;
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go(Routes.home);
                  }
                },
                child: Scaffold(
                backgroundColor: AppColors.white,
                body: SafeArea(
                  top: true,
                  bottom: false,
                  child: Stack(
                    children: [
                      // ── Smooth crossfade: skeleton → loaded ──
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.02),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: state.when(
                          initial: () => _buildLoadingState(cartCount, isLoggedIn),
                          loading: () => _buildLoadingState(cartCount, isLoggedIn),
                          loaded: (product) => _buildLoadedState(
                            product,
                            isLoggedIn,
                          ),
                          error: (error) => _buildErrorState(error),
                        ),
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
                      // ── Top Progressive Loading Bar when syncing full details ──
                      state.maybeWhen(
                        loaded: (product) {
                          if (product.isPartial) {
                            return const Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 3.0,
                                child: LinearProgressIndicator(
                                  backgroundColor: AppColors.surfaceBlue,
                                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.pickabooBlue),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOutCubic,
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                  child: state.maybeWhen(
                    loaded: (product) => BlocBuilder<CartBloc, CartState>(
                      key: const ValueKey('pdp_bottom_bar_loaded'),
                      builder: (context, cartState) {
                        final isProcessing = cartState.maybeWhen(
                          operationInProgress: (_, __) => true,
                          loading: () => true,
                          orElse: () => false,
                        );

                        final int basePrice = _calculateBasePrice(product);
                        final int regularPrice = _calculateRegularPrice(product);
                        final int computedCurrent = (basePrice + _totalAddonPrice) * _quantity;
                        final int computedOriginal = (regularPrice + _totalAddonPrice) * _quantity;

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
                    orElse: () => _buildSkeletonBottomBar(),
                  ),
                ),
              ),
              );
            },
          ),
        );
      },
    ),
  );
}

  Widget _buildLoadingState(int cartCount, bool isLoggedIn) {
    return PdpSkeletonWidget(
      key: const ValueKey('pdp_skeleton'),
      productId: widget.productId,
      previewProduct: widget.previewProduct,
      productName: widget.productName.isNotEmpty ? widget.productName : null,
      previewImageUrl: widget.previewImageUrl,
      previewPrice: widget.previewPrice,
      cartCount: cartCount,
      isFavorite: _isFavorite,
      showTrustRibbon: _showTrustRibbon,
      onBack: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          context.go(Routes.home);
        }
      },
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
        final shareName = (widget.previewProduct?.productName.isNotEmpty == true)
            ? widget.previewProduct!.productName
            : widget.productName;
        final shareSlug = (widget.previewProduct?.slug.isNotEmpty == true)
            ? widget.previewProduct!.slug
            : widget.slug;
        final shareUrl = 'https://www.pickaboo.com/product/$shareSlug';
        setState(() => _isSharing = true);
        try {
          await SharePlus.instance.share(
            ShareParams(
              title: "Pickaboo Product",
              subject: shareName,
              text: 'Check out $shareName on Pickaboo:\n$shareUrl',
            ),
          );
        } finally {
          if (mounted) setState(() => _isSharing = false);
        }
      },
    );
  }

  /// Skeleton bottom action bar matching PdpBottomActionBar button structure.
  Widget _buildSkeletonBottomBar() {
    return Container(
      key: const ValueKey('pdp_bottom_bar_skeleton'),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            offset: const Offset(0, -3),
            blurRadius: 8,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 8.h,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Chat button (functional)
            GestureDetector(
              onTap: () => context.push(Routes.contactUs),
              child: Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.pageBg,
                  borderRadius: AppRadius.buttonRadius,
                  border: Border.all(color: AppColors.border, width: 1.w),
                ),
                child: Center(
                  child: Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 20.sp,
                    color: AppColors.navy,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            // ADD TO CART outline placeholder
            Expanded(
              child: Container(
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppRadius.buttonRadius,
                  border: Border.all(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.4),
                    width: 1.2.w,
                  ),
                ),
                child: Center(
                  child: Text(
                    'ADD TO CART',
                    style: AppTypography.button.copyWith(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            // BUY NOW filled placeholder
            Expanded(
              child: Container(
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.pickabooBlue.withValues(alpha: 0.5),
                  borderRadius: AppRadius.buttonRadius,
                ),
                child: Center(
                  child: Text(
                    'BUY NOW',
                    style: AppTypography.button.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedState(
    ProductDetailEntity product,
    bool isLoggedIn,
  ) {
    final activeImages = _resolveImages(product);
    final int basePrice = _calculateBasePrice(product);
    final int regularPrice = _calculateRegularPrice(product);
    final int currentPrice = (basePrice + _totalAddonPrice) * _quantity;
    final int originalPrice = (regularPrice + _totalAddonPrice) * _quantity;
    final int saving = originalPrice > currentPrice ? originalPrice - currentPrice : 0;

    return KeyedSubtree(
      key: ValueKey('pdp_loaded_${product.id}'),
      child: BlocBuilder<CompareBloc, CompareState>(
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
                physics: const ClampingScrollPhysics(),
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
                      onMediaTap: (type, index) {
                        ProductMediaDialog.show(
                          context,
                          initialType: type,
                          initialIndex: index,
                          productImages: activeImages.isNotEmpty
                              ? activeImages
                              : product.images,
                          videoThumbnails: _youtubeThumbnails(product),
                          videoIds: _youtubeIds(product),
                          customerImages: product.allReviewImages,
                        );
                      },
                    ),

                    // ── 2. Top Trust Ribbon Strip (Authentic, Return, Seller, Warranty, Free Delivery) ──
                    if (_showTrustRibbon)
                      PdpTrustRibbonWidget(
                        product: product,
                      ),

                    // ── 3. Product Header, Stock, Price & EMI Section ──
                    PdpSectionCard(
                      child: PdpNewPriceSection(
                        product: product,
                        currentPrice: currentPrice,
                        originalPrice: originalPrice,
                        saving: saving,
                        showTrustRibbon: _showTrustRibbon,
                        onBrandTap: () {
                          context.pushToBrandProduct(
                            brandKey: product.brand.replaceAll(RegExp(r'\s+'), ''),
                            brandName: product.brand,
                          );
                        },
                        onRateTap: () {
                          _reviewsTabKey.currentState?.selectTab(2);
                          final ctx = _reviewsTabKey.currentContext;
                          if (ctx != null) {
                            Scrollable.ensureVisible(
                              ctx,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOutCubic,
                            );
                          }
                        },
                        onEmiTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: AppColors.transparent,
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
                        onSellerTap: () {
                          final shopUrl = product.soldByVendorUrlKey.trim().isNotEmpty
                              ? product.soldByVendorUrlKey.trim()
                              : product.soldBy.trim();
                          if (shopUrl.isNotEmpty) {
                            context.pushToSellerProduct(
                              shopUrl: shopUrl,
                              sellerName: product.soldBy.trim(),
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
                    // ── 5. Deals & Offers Section (Flash Sale Countdown & Available Offers / Bank Discounts) ──
                    PdpDealsAndOffersSection(
                      product: product,
                    ),

                    // ── 6. Fulfillment & Services Section (Delivery Location, Pickaboo Assured & CMS Banner) ──
                    PdpFulfillmentAndServicesSection(
                      product: product,
                      selectedDeliveryLocation: _selectedDeliveryLocation,
                      isUserLocationNonDhaka: _isUserLocationNonDhaka(),
                      isLoggedIn: isLoggedIn,
                      onDeliveryLocationTap: _onDeliveryInfoTap,
                    ),

                    // ── 7. Key Highlights (2x2 Spec Summary Grid) ──
                    if (product.hasKeyHighlights)
                      PdpSectionCard(
                        child: PdpKeyHighlightsWidget(
                          moreInformation: product.moreInformation,
                        ),
                      ),

                    // ── 8. Tabbed Specifications, Overview, Reviews & Q&A ──
                    PdpSectionCard(
                      customPadding: EdgeInsets.zero,
                      child: PdpTabSectionWidget(
                        key: _reviewsTabKey,
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
                            backgroundColor: AppColors.black,
                            builder: (_) => ReviewImageViewerSheet(
                              imageUrls: product.allReviewImages,
                              initialIndex: idx,
                            ),
                          );
                        },
                      ),
                    ),

                    // ── 9. Cross-Sell & Recommendations Section (Bought Together + Related & Recommended Sliders) ──
                    PdpCrossSellSection(
                      product: product,
                      onAddBuyTogetherToCart: _addBuyTogetherToCart,
                      onAddBundleToCart: (accessories) =>
                          _addBundleToCart(product, accessories),
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

  Widget _buildErrorState(dynamic error) {
    final isOffline = ConnectivityUtils.isNoInternet(error, context);
    if (isOffline) {
      return KeyedSubtree(
        key: const ValueKey('pdp_error_offline'),
        child: NoInternetPage(
        showAppBar: false,
        onRetry: () {
          context.read<ProductDetailBloc>().add(
            ProductDetailEvent.load(productId: widget.productId),
          );
        },
        onBack: Navigator.of(context).canPop()
            ? () => Navigator.of(context).pop()
            : null,
      ),
      );
    }

    const fallbackMessage = 'Something went wrong while loading this product. Please try again in a moment.';
    final String rawMessage = error is AppErrorEntity && error.message.isNotEmpty
        ? error.message
        : fallbackMessage;
    final String message = ApiErrorParser.sanitize(rawMessage, fallback: fallbackMessage);

    return KeyedSubtree(
      key: const ValueKey('pdp_error_generic'),
      child: AppErrorView(
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
      ),
    );
  }

  Widget _buildFloatingAppBar(ProductDetailState state) {
    final isLoaded = state.maybeWhen(
      loaded: (_) => true,
      orElse: () => false,
    );
    final isError = state.maybeWhen(
      error: (_) => true,
      orElse: () => false,
    );
    if (!isLoaded || isError) return const SizedBox.shrink();

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
                onBack: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go(Routes.home);
                  }
                },
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
