import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_flash_sale_bloc/product_flash_sale_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_sale_timer_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/selected_extra_option_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/cms_content_bloc/cms_content_bloc.dart';
import 'package:pickaboo/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:pickaboo/presentation/bloc/product_detail_bloc/product_detail_bloc.dart';
import 'package:pickaboo/presentation/bloc/recommended_products_bloc/recommended_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/related_products_bloc/related_products_bloc.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:pickaboo/domain/entity/product_flash_sale/product_flash_sale_entity.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:pickaboo/presentation/ui/widgets/common/permission_prompt.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_image_carousel.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/draggable_compare_button.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_media_filter.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_info_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_promotions_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_special_offers_section.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/dialog/product_media_dialog.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_variant_selector.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_addons_section.dart';
import 'package:pickaboo/presentation/ui/common/bottom_sheet/delivery_location_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_delivery_info.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_quantity_selector.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_seller_info.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_warranty_info.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_frequently_bought_together.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_at_a_glance.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_specification_button.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_reviews_section.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_description_section.dart';
import 'package:pickaboo/presentation/bloc/delivery_charge_bloc/delivery_charge_bloc.dart';
import 'package:pickaboo/presentation/bloc/place_picker_bloc/place_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/promo_bloc/promo_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_bottom_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/product_section_slider.dart';

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

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with WidgetsBindingObserver {
  final GlobalKey<ProductBottomBarState> _bottomBarKey =
      GlobalKey<ProductBottomBarState>();

  int _quantity = AppConstants.minCartQuantity;
  int _totalAddonPrice = 0;
  bool _isFavorite = false;
  bool _isWishlistProcessing = false;
  bool _isSharing = false;
  String _selectedMediaFilter = 'Product Images';
  List<ConfigurableItemOptionEntity> _selectedVariantsStatus = [];
  List<ConfigurableItemOptionEntity> _selectedAddonOptions = [];

  bool _showVariantError = false;
  bool _showAddonError = false;

  bool _hasLocationPermission = false;
  PlacePickResultEntity? _selectedDeliveryLocation;

  bool _slugSectionsRequested = false;

  String _resolvedSlug = '';

  /// Set when the user is sent to the OS settings screen from the delivery
  /// card. On resume, if the permission came back granted, the sheet opens by
  /// itself so the trip to Settings finishes the action the user started.
  bool _awaitingSettingsReturn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkLocationPermission();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailBloc>().add(
        ProductDetailEvent.load(productId: widget.productId),
      );

      context.read<CmsContentBloc>().add(const CmsContentEvent.loadAll());

      _loadSlugBasedSections(widget.slug);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    // Coming back from the OS settings screen — the permission may have
    // changed underneath us, and Geolocator only reports it on a fresh check.
    _refreshPermissionAfterSettings();
  }

  Future<void> _refreshPermissionAfterSettings() async {
    final permission = await Geolocator.checkPermission();
    final granted =
        permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
    if (!mounted) return;
    setState(() => _hasLocationPermission = granted);

    if (granted && _awaitingSettingsReturn) {
      _awaitingSettingsReturn = false;
      await _openDeliveryLocationSheet();
    } else if (!granted) {
      _awaitingSettingsReturn = false;
    }
  }

  void _loadSlugBasedSections(String slug) {
    if (_slugSectionsRequested || slug.isEmpty) return;
    _slugSectionsRequested = true;
    _resolvedSlug = slug;

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

  void _addBuyTogetherToCart(List<BuyTogetherEntity> selectedItems) {
    final addable = selectedItems
        .where((item) => item.typeId != 'configurable')
        .toList();
    final skipped = selectedItems
        .where((item) => item.typeId == 'configurable')
        .toList();

    final cartBloc = context.read<CartBloc>();
    for (final item in addable) {
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

    if (addable.isNotEmpty) {
      SnackBarUtils.showSuccess(context, 'Product added to cart successfully');
    }
  }

  Future<void> _checkLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    if (!mounted) return;
    setState(() {
      _hasLocationPermission =
          permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
    });
  }

  Future<void> _onDeliveryInfoTap() async {
    if (!_hasLocationPermission) {
      var permission = await Geolocator.checkPermission();

      // Android stops showing the system dialog after two denials and every
      // later request returns `deniedForever` immediately; iOS behaves the
      // same after a single denial. Asking again is a no-op, so the only way
      // forward is the app's settings page.
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.unableToDetermine) {
        permission = await Geolocator.requestPermission();
      }

      if (!mounted) return;

      if (permission == LocationPermission.deniedForever) {
        await _promptOpenAppSettings();
        return;
      }

      final granted =
          permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
      setState(() => _hasLocationPermission = granted);
      if (!granted) return;
    }

    await _openDeliveryLocationSheet();
  }

  /// Explains why the app needs the permission and hands the user off to the
  /// OS settings page — a silent no-op leaves the delivery card looking broken.
  Future<void> _promptOpenAppSettings() async {
    // Flagged before the await: didChangeAppLifecycleState fires on return and
    // re-opens the sheet if the permission was granted while away.
    _awaitingSettingsReturn = await PermissionPrompt.location(context);
  }

  Future<void> _openDeliveryLocationSheet() async {
    if (!mounted) return;
    final result = await DeliveryLocationSheet.show(context);
    if (result != null && mounted) {
      setState(() => _selectedDeliveryLocation = result);
      debugPrint('DeliveryLocation district: ${result.district}');
      context.read<DeliveryChargeBloc>().add(
        DeliveryChargeEvent.fetch(productId: widget.productId),
      );
    }
  }

  bool _validateSelection(ProductDetailEntity product) {
    bool isValid = true;

    if (product.variantGroups.isNotEmpty) {
      final selectedIds = _selectedVariantsStatus
          .map((e) => e.optionId)
          .toSet();
      final allSelected = product.variantGroups.every(
        (v) => selectedIds.contains(v.optionId),
      );
      if (!allSelected) {
        setState(() => _showVariantError = true);
        isValid = false;
      }
    }

    final requiredOptions = product.extraOptions
        .where((o) => o.isRequire)
        .toList();
    if (requiredOptions.isNotEmpty) {
      final selectedAddonIds = _selectedAddonOptions
          .where((e) => e.isCustomOption)
          .map((e) => e.optionId)
          .toSet();
      final allRequiredSelected = requiredOptions.every(
        (o) => selectedAddonIds.contains(o.optionId.toString()),
      );
      if (!allRequiredSelected) {
        setState(() => _showAddonError = true);
        isValid = false;
      }
    }

    return isValid;
  }

  List<SelectedExtraOptionEntity> _buildAddonInitialSelections(
    ProductDetailEntity product,
  ) {
    final List<SelectedExtraOptionEntity> selections = [];
    for (final e in _selectedAddonOptions) {
      if (!e.isCustomOption) continue;
      final optionIdInt = int.tryParse(e.optionId);
      final optionTypeIdInt = int.tryParse(e.optionValue);
      if (optionIdInt == null || optionTypeIdInt == null) continue;
      try {
        final option = product.extraOptions.firstWhere(
          (o) => o.optionId == optionIdInt,
        );
        final value = option.values.firstWhere(
          (v) => v.optionTypeId == optionTypeIdInt,
        );
        selections.add(
          SelectedExtraOptionEntity(
            optionId: optionIdInt,
            optionTypeId: optionTypeIdInt,
            title: value.title,
            price: value.price,
          ),
        );
      } catch (e) {
      }
    }
    return selections;
  }

  Future<void> _onRefresh() async {
    context.read<ProductDetailBloc>().add(
      ProductDetailEvent.refresh(productId: widget.productId),
    );
    context.read<CmsContentBloc>().add(const CmsContentEvent.loadAll());
    final slug = _resolvedSlug.isNotEmpty ? _resolvedSlug : widget.slug;
    if (slug.isNotEmpty) {
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
    await Future.delayed(const Duration(seconds: 1));
  }

  void _onFlashSaleLearnMore(FlashSaleDetailEntity sale) {
    final type = sale.bannerLinkType.trim();
    final value = sale.bannerLinkValue.trim();

    if (type.isNotEmpty && value.isNotEmpty) {
      context.handleBannerTap(
        linkType: type,
        link: value,
        categoryName: sale.title,
        urlKey: value,
      );
      return;
    }

    final segments =
        sale.slug.split('/').where((s) => s.trim().isNotEmpty).toList();
    if (segments.isEmpty) return;
    final slug = segments.last.trim();
    if (slug.isEmpty) return;

    context.handleBannerTap(
      linkType: 'special_category',
      link: slug,
      categoryName: sale.title,
      urlKey: slug,
    );
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
    final colors = context.colors;
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
            debugPrint('PlacePicker restored district: ${place.district}');
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
                    backgroundColor: colors.red,
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

                if (!_isWishlistProcessing &&
                    _isFavorite != isActuallyFavorite) {
                  setState(() {
                    _isFavorite = isActuallyFavorite;
                  });
                }
              },
              actionSuccess: (message) {
                if (_isWishlistProcessing) {
                  setState(() => _isWishlistProcessing = false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: colors.primary,
                    ),
                  );
                }
              },
              error: (message) {
                if (_isWishlistProcessing) {
                  setState(() {
                    _isFavorite = !_isFavorite;
                    _isWishlistProcessing = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: colors.red,
                    ),
                  );
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
                if (_showVariantError || _showAddonError) {
                  setState(() {
                    _showVariantError = false;
                    _showAddonError = false;
                  });
                }
              },
              error: (error, lastCart) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.message),
                    backgroundColor: colors.red,
                  ),
                );
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
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: widget.embedded
                      ? null
                      : AppBarButton(
                          iconPath: 'assets/new/svg/back_nav_icon.svg',
                          width: 7.w,
                          height: 14.h,
                          onPressed: () => Navigator.of(context).pop(),
                          iconColor: colors.text,
                        ),
                  title: Text(
                    widget.productName.isNotEmpty
                        ? widget.productName
                        : state.maybeMap(
                            loaded: (product) => product.product.name,
                            orElse: () => "",
                          ),
                    style: context.textStyle.appBarTitle,
                  ),
                  actions: [
                    AppBarButton(
                      onPressed: () {
                        context.push(Routes.search);
                      },
                      iconPath: 'assets/new/svg/search_icon.svg',
                      width: 22.w,
                      height: 20.h,
                      iconColor: colors.primary,
                    ),

                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, cartState) {
                        final cartCount = cartState.maybeWhen(
                          loaded: (cart) => cart.itemsCount,
                          itemAdded: (cart, _) => cart.itemsCount,
                          couponApplied: (cart, _) => cart.itemsCount,
                          rewardPointsApplied: (cart, _) => cart.itemsCount,
                          operationInProgress: (cart, _) => cart.itemsCount,
                          orElse: () => 0,
                        );

                        return AppBarButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            context.push(Routes.cart);
                          },
                          iconPath: 'assets/new/svg/cart_icon.svg',
                          width: 22.w,
                          height: 20.h,
                          iconColor: colors.primary,
                          showBadge: cartCount > 0,
                          badgeCount: cartCount,
                        );
                      },
                    ),
                    SizedBox(width: 8.w),
                  ],
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(2.h),
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          operationInProgress: (cart, message) => true,
                          orElse: () => false,
                        );
                        if (isLoading) {
                          return LinearProgressIndicator(
                            color: colors.primary,
                            minHeight: 2.h,
                          );
                        }
                        return SizedBox(height: 2.h);
                      },
                    ),
                  ),
                ),
                body: SafeArea(
                  top: false,
                  child: Stack(
                    children: [
                      state.when(
                        initial: () => _buildLoadingState(colors),
                        loading: () => _buildLoadingState(colors),
                        loaded: (product) => _buildLoadedState(
                          product,
                          colors,
                          textStyle,
                          isLoggedIn,
                        ),
                        error: (error) =>
                            _buildErrorState(error, colors, textStyle, context),
                      ),
                      state.maybeWhen(
                        loaded: (product) =>
                            BlocBuilder<CompareBloc, CompareState>(
                              builder: (context, compareState) {
                                if (compareState.products.length < 2) {
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
                    ],
                  ),
                ),
                bottomNavigationBar: state.maybeWhen(
                  loaded: (product) => ProductBottomBar(
                    key: _bottomBarKey,
                    product: product,
                    quantity: _quantity,
                    selectedVariantsStatus: _selectedVariantsStatus,
                    selectedAddonOptions: _selectedAddonOptions,
                    totalAddonPrice: _totalAddonPrice,
                    onValidate: () => _validateSelection(product),
                    onSheetSelectionsChanged: (variants, addons) {
                      int totalAddonPrice = 0;
                      for (final addon in addons) {
                        if (!addon.isCustomOption) continue;
                        try {
                          final option = product.extraOptions.firstWhere(
                            (o) => o.optionId.toString() == addon.optionId,
                          );
                          final value = option.values.firstWhere(
                            (v) =>
                                v.optionTypeId.toString() == addon.optionValue,
                          );
                          totalAddonPrice += value.price;
                        } catch (e) {
                        }
                      }
                      setState(() {
                        _selectedVariantsStatus = variants;
                        _selectedAddonOptions = addons;
                        _totalAddonPrice = totalAddonPrice;
                        _showVariantError = false;
                        _showAddonError = false;
                      });
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

  Widget _buildImageSection(
    AppColors colors,
    ProductDetailEntity product,
    bool isLoggedIn, {
    bool flexible = false,
  }) {
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

    return ProductImageCarousel(
      images: images,
      isFavorite: _isFavorite,
      productId: product.id,
      showShareButton: product.shareUrl.isNotEmpty,
      flexible: flexible,
      onImageTap: () {
      },
      onFavoriteTap: () {
        if (isLoggedIn) {
          if (_isWishlistProcessing) return;

          setState(() {
            _isWishlistProcessing = true;
          });

          if (_isFavorite) {
            context.read<WishlistBloc>().add(
              WishlistEvent.removeFromWishlist(widget.productId),
            );
          } else {
            context.read<WishlistBloc>().add(
              WishlistEvent.addToWishlist(widget.productId),
            );
          }

          setState(() {
            _isFavorite = !_isFavorite;
          });
        } else {
          context.push(Routes.login);
        }
      },
      onCompareTap: (isCompared) {
        if (isCompared) {
          context.read<CompareBloc>().add(
            CompareEvent.remove(productId: product.id.toString()),
          );
        } else {
          context.read<CompareBloc>().add(CompareEvent.add(product: product));
        }
      },
      onShareTap: () async {
        if (_isSharing) return;

        if (product.shareUrl.isNotEmpty) {
          setState(() => _isSharing = true);
          try {
            await SharePlus.instance.share(
              ShareParams(
                title: "Pickaboo Product",
                subject: product.name,
                text:
                    'Check out ${product.name} on Pickaboo: \n${product.shareUrl}',
              ),
            );
          } finally {
            if (mounted) {
              setState(() => _isSharing = false);
            }
          }
        }
      },
    );
  }

  Widget _buildLoadingState(AppColors colors) {
    return Center(child: CircularProgressIndicator(color: colors.primary));
  }

  Widget _buildLoadedState(
    ProductDetailEntity product,
    AppColors colors,
    AppTextStyles textStyle,
    bool isLoggedIn,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewportHeight = constraints.maxHeight;

        return RefreshIndicator(
          color: colors.primary,
          onRefresh: _onRefresh,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: viewportHeight / 2,
                      child: _buildImageSection(
                        colors,
                        product,
                        isLoggedIn,
                        flexible: true,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                      child: ProductMediaFilter(
                        product: product,
                        selectedFilter: _selectedMediaFilter,
                        onFilterChanged: (filter) {
                          setState(() => _selectedMediaFilter = filter);

                          ProductMediaType? type;
                          if (filter == 'Product Images') {
                            type = ProductMediaType.productImages;
                          } else if (filter == 'Videos') {
                            type = ProductMediaType.videos;
                          } else if (filter == 'Customer Images') {
                            type = ProductMediaType.customerImages;
                          }

                          if (type != null) {
                            ProductMediaDialog.show(
                              context,
                              initialType: type,
                              productImages: product.images,
                              videoThumbnails: _youtubeThumbnails(product),
                              videoIds: _youtubeIds(product),
                              customerImages: product.allReviewImages,
                            );
                          }
                        },
                      ),
                    ),

                    ProductInfoSection(
                      product: product,
                      addonPrice: _totalAddonPrice,
                      onBrandTap: () {
                        context.pushToBrandProduct(
                          brandKey: product.brand.replaceAll(RegExp(r'\s+'), ''),
                          brandName: product.brand,
                        );
                      },
                      onAddReviewTap: () {
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'You are not eligible to write a review for this product',
                                ),
                                backgroundColor: colors.red,
                              ),
                            );
                          }
                        } else {
                          context.push(Routes.login);
                        }
                      },
                    ),

                    SizedBox(height: 12.h),
                  ],
                ),
              ),

              const SliverToBoxAdapter(child: ProductPromotionsSection()),

              BlocBuilder<ProductFlashSaleBloc, ProductFlashSaleState>(
                builder: (context, flashSaleState) {
                  if (flashSaleState.status == ProductFlashSaleStatus.success &&
                      flashSaleState.flashSale != null &&
                      flashSaleState.flashSale!.inFlashSale &&
                      flashSaleState.flashSale!.flashSale?.endTime != null) {
                    final sale = flashSaleState.flashSale!.flashSale!;
                    return SliverToBoxAdapter(
                      child: ProductSaleTimerSection(
                        title: sale.title,
                        subtitle: sale.shortDescription,
                        endTime: sale.endTime!,
                        onLearnMore: () => _onFlashSaleLearnMore(sale),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
              SliverToBoxAdapter(
                child: ProductSpecialOffersSection(product: product),
              ),
              SliverToBoxAdapter(
                child: ProductVariantSelector(
                  variants: product.variantGroups,
                  matrix: product.variantMatrix,
                  showError: _showVariantError,
                  initialSelections: {
                    for (var e in _selectedVariantsStatus)
                      e.optionId: e.optionValue,
                  },
                  onTapOverride: () => _bottomBarKey.currentState
                      ?.openOptionsSheet(isSelectionOnly: true),
                  onChanged: (selections) {
                    setState(() {
                      _showVariantError = false;
                      _selectedVariantsStatus = selections
                          .map(
                            (s) => ConfigurableItemOptionEntity(
                              optionId: s.optionId,
                              optionValue: s.valueId,
                            ),
                          )
                          .toList();
                    });
                  },
                ),
              ),

              SliverToBoxAdapter(
                child: ProductAddonsSection(
                  extraOptions: product.extraOptions,
                  showError: _showAddonError,
                  initialSelections: _buildAddonInitialSelections(product),
                  onChanged: (selections) {
                    final totalAddonPrice = selections.fold(
                      0,
                      (sum, item) => sum + item.price,
                    );
                    final requiredOptions = product.extraOptions
                        .where((o) => o.isRequire)
                        .toList();
                    final selectedIds = selections
                        .map((s) => s.optionId)
                        .toSet();
                    final allRequiredFulfilled = requiredOptions.every(
                      (o) => selectedIds.contains(o.optionId),
                    );
                    setState(() {
                      _totalAddonPrice = totalAddonPrice;
                      if (allRequiredFulfilled) _showAddonError = false;
                      _selectedAddonOptions = selections
                          .map(
                            (s) => ConfigurableItemOptionEntity(
                              optionId: s.optionId.toString(),
                              optionValue: s.optionTypeId.toString(),
                              isCustomOption: true,
                            ),
                          )
                          .toList();
                    });
                    debugPrint('Current total addon price: $totalAddonPrice');
                  },
                ),
              ),
              BlocBuilder<DeliveryChargeBloc, DeliveryChargeState>(
                builder: (context, deliveryChargeState) {
                  final isInsideDhaka =
                      _selectedDeliveryLocation?.district
                          ?.toLowerCase()
                          .contains('dhaka') ==
                      true;

                  final trailingText = deliveryChargeState.maybeWhen(
                    loaded: (entity) => isInsideDhaka
                        ? entity.formattedInsideCharge
                        : entity.formattedOutsideCharge,
                    orElse: () => null,
                  );

                  return SliverToBoxAdapter(
                    child: ProductDeliveryInfo(
                      title: 'How you will get this item',
                      iconPath: 'assets/new/svg/detail/delivery_icon.svg',
                      mainText: 'Standard Delivery',
                      subtitle: 'Standard Delivery',
                      onTap: _onDeliveryInfoTap,
                      iconBackgroundColor: colors.primary,
                      hasLocationPermission: _hasLocationPermission,
                      selectedAddress:
                          _selectedDeliveryLocation?.displayAddress,
                      trailingText: trailingText,
                    ),
                  );
                },
              ),
              BlocBuilder<CmsContentBloc, CmsContentState>(
                builder: (context, state) {
                  if (state.productOffer != null &&
                      state.productOffer?.active == true) {
                    return SliverPadding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        top: 4.w,
                        bottom: 2.w,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () {
                            final String title =
                                state.productOffer?.title ?? "";
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
                            data: state.productOffer?.content ?? "",
                            onLinkTap: (url, attributes, element) async {
                              debugPrint('Link clicked: ${element?.text}');
                              debugPrint('Link clicked: ${attributes.values}');
                              debugPrint('Link URL: $url');

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
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 2.w,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  color: colors.borderColor,
                ),
              ),
              SliverToBoxAdapter(
                child: ProductQuantitySelector(
                  initialQuantity: _quantity,
                  maxQuantity: AppConstants.maxCartQuantity,
                  onChanged: (quantity) {
                    setState(() {
                      _quantity = quantity;
                    });
                  },
                ),
              ),
              if (product.soldBy.trim().isNotEmpty) ...[
                SliverToBoxAdapter(
                  child: Container(
                    height: 2.w,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    color: colors.borderColor,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProductSellerInfo(
                    sellerName: product.soldBy,
                    rating: product.ratingSummaryValue,
                    onTap: () {
                      context.pushToSellerProduct(
                        shopUrl: product.soldByVendorUrlKey,
                        sellerName: product.soldBy,
                      );
                    },
                  ),
                ),
              ],
              SliverToBoxAdapter(
                child: ProductWarrantyInfo(warranty: product.warranty),
              ),
              SliverToBoxAdapter(
                child: ProductDeliveryInfo(
                  iconPath: 'assets/new/svg/detail/club_point_icon.svg',
                  mainText: 'Club Points',
                  subtitle: 'Earn ${product.clubPoints} Club Points',
                  onTap: () {
                    if (isLoggedIn) {
                      context.push(Routes.clubPoint);
                    } else {
                      context.push(Routes.login);
                    }
                  },
                  iconBackgroundColor: colors.primary,
                ),
              ),
              SliverToBoxAdapter(
                child: ProductFrequentlyBoughtTogether(
                  items: product.buysTogather,
                  onAddToCart: _addBuyTogetherToCart,
                ),
              ),
              SliverToBoxAdapter(
                child: ProductAtAGlance(
                  moreInformationEntity: product.moreInformation,
                ),
              ),
              SliverToBoxAdapter(
                child: ProductSpecificationButton(
                  onTap: () {
                    context.pushNamed(
                      'productDescription',
                      pathParameters: {'id': product.id.toString()},
                      extra: {'product': product, 'initialIndex': 0},
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: ProductReviewsSection(
                  product: product,
                  onRate: () {
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                              'You are not eligible to write a review for this product',
                            ),
                            backgroundColor: colors.red,
                          ),
                        );
                      }
                    } else {
                      context.push(Routes.login);
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 2.w,
                  color: colors.borderColor,
                  margin: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
                ),
              ),
              SliverToBoxAdapter(
                child: ProductDescriptionSection(product: product),
              ),

              BlocBuilder<RelatedProductsBloc, RelatedProductsState>(
                builder: (context, relatedState) {
                  return relatedState.maybeWhen(
                    loaded: (entity) {
                      if (entity.relatedProducts.isEmpty) {
                        return const SliverToBoxAdapter(
                          child: SizedBox.shrink(),
                        );
                      }
                      return SliverToBoxAdapter(
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
                    orElse: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                  );
                },
              ),

              BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
                builder: (context, recommendedState) {
                  return recommendedState.maybeWhen(
                    loaded: (entity) {
                      if (entity.sellerRecommendedProducts.isEmpty) {
                        return const SliverToBoxAdapter(
                          child: SizedBox.shrink(),
                        );
                      }
                      return SliverToBoxAdapter(
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
                    orElse: () =>
                        const SliverToBoxAdapter(child: SizedBox.shrink()),
                  );
                },
              ),

              SliverToBoxAdapter(
                child: Container(
                  height: 2.w,
                  color: colors.borderColor,
                  margin: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorState(
    dynamic error,
    AppColors colors,
    AppTextStyles textStyle,
    BuildContext context,
  ) {
    return AppErrorView(
      type: AppErrorType.generic,
      title: "Couldn't load this product",
      message:
          'Something went wrong while loading this product. '
          'Please try again in a moment.',
      retryLabel: 'Go Back',
      onRetry: () => Navigator.of(context).pop(),
    );
  }
}
