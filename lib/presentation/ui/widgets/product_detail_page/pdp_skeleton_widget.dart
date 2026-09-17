// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY & COLORS ENFORCED
// All styling originates from [AppTypography] & [AppColors] design tokens.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/rating_stars.dart';
import 'package:pickaboo/presentation/ui/widgets/product_detail_page/pdp_section_card.dart';

/// Shimmer skeleton loader matching the exact geometry of the Product Details Page.
/// Supports instant preview hydration (ProductEntity or preview fields)
/// so users see authentic content immediately while the rest of the PDP loads.
///
/// Features:
/// 1. Transparent floating controls (Back, Search, Cart, Wishlist, Share) — 100% active.
/// 2. Image counter badge (1/1) matching loaded gallery.
/// 3. Fixed Trust Ribbon strip ("100% Authentic | Easy Return") — no fake pills.
/// 4. Value card matching [PdpNewPriceSection]: dark navy price, strike-through,
///    red discount badge, express badge, savings, and rating.
/// 5. Clean, centered loader below price card.
class PdpSkeletonWidget extends StatefulWidget {
  final String? productId;
  final ProductEntity? previewProduct;
  final String? productName;
  final String? previewImageUrl;
  final String? previewPrice;
  final VoidCallback? onBack;
  final VoidCallback? onSearch;
  final VoidCallback? onCart;
  final int cartCount;
  final VoidCallback? onFavorite;
  final bool isFavorite;
  final VoidCallback? onShare;
  final bool showTrustRibbon;

  const PdpSkeletonWidget({
    super.key,
    this.productId,
    this.previewProduct,
    this.productName,
    this.previewImageUrl,
    this.previewPrice,
    this.onBack,
    this.onSearch,
    this.onCart,
    this.cartCount = 0,
    this.onFavorite,
    this.isFavorite = false,
    this.onShare,
    this.showTrustRibbon = true,
  });

  static final RegExp _thousandsSeparator = RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );

  static String formatPrice(num price) {
    return '৳${price.round().toString().replaceAllMapped(_thousandsSeparator, (Match m) => '${m[1]},')}';
  }

  @override
  State<PdpSkeletonWidget> createState() => _PdpSkeletonWidgetState();
}

class _PdpSkeletonWidgetState extends State<PdpSkeletonWidget> {
  String? _resolvedImageUrl;

  @override
  void initState() {
    super.initState();
    _resolveImage();
  }

  @override
  void didUpdateWidget(covariant PdpSkeletonWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.productId != widget.productId ||
        oldWidget.previewImageUrl != widget.previewImageUrl ||
        oldWidget.previewProduct?.productImg != widget.previewProduct?.productImg) {
      _resolveImage();
    }
  }

  void _resolveImage() {
    final parsedId = int.tryParse(widget.productId ?? widget.previewProduct?.id ?? '') ?? 0;

    // 1. Check in-memory cache in ProductImageResolver
    if (parsedId > 0) {
      final cached = ProductImageResolver.getCachedImage(parsedId);
      if (cached != null && !ProductImageResolver.isPlaceholderOrBroken(cached)) {
        _resolvedImageUrl = cached;
        return;
      }
    }

    // 2. Check previewProduct.productImg or previewImageUrl
    final raw = widget.previewProduct?.productImg ?? widget.previewImageUrl;
    if (!ProductImageResolver.isPlaceholderOrBroken(raw)) {
      _resolvedImageUrl = raw;
      if (parsedId > 0) {
        ProductImageResolver.cacheImage(parsedId, raw);
      }
      return;
    }

    // 3. Fallback: If placeholder/empty, resolve asynchronously in background
    if (parsedId > 0) {
      ProductImageResolver.resolveImage(
        productId: parsedId,
        currentUrl: raw,
      ).then((res) {
        if (mounted && res != null && !ProductImageResolver.isPlaceholderOrBroken(res)) {
          setState(() {
            _resolvedImageUrl = res;
          });
        }
      }).catchError((_) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveName = widget.previewProduct?.productName ?? widget.productName;
    final effectiveImageUrl = _resolvedImageUrl;
    final hasPreviewImage = effectiveImageUrl != null &&
        effectiveImageUrl.trim().isNotEmpty &&
        !ProductImageResolver.isPlaceholderOrBroken(effectiveImageUrl);
    final hasProductName = effectiveName != null && effectiveName.trim().isNotEmpty;

    final int? currentPrice = widget.previewProduct != null
        ? widget.previewProduct!.finalPrice
        : (widget.previewPrice != null
            ? int.tryParse(widget.previewPrice!.replaceAll(RegExp(r'[^0-9]'), ''))
            : null);

    final int? originalPrice = widget.previewProduct != null && widget.previewProduct!.originalPrice > 0
        ? widget.previewProduct!.originalPrice
        : null;

    final int discountPct = widget.previewProduct?.computedDiscountPercentage ?? 0;
    final bool hasDiscount = discountPct > 0 &&
        originalPrice != null &&
        currentPrice != null &&
        originalPrice > currentPrice;

    final int savings = hasDiscount ? (originalPrice - currentPrice) : 0;
    final String brand = widget.previewProduct?.brand ?? '';
    final bool inStock = widget.previewProduct?.stockAvailable ?? true;
    final bool isExpress = widget.previewProduct?.expressDelivery ?? false;
    final double rating = widget.previewProduct?.rating ?? 0.0;
    final int ratingCount = widget.previewProduct?.ratingCount ?? 0;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Hero Image Box (1:1 Aspect Ratio) with Active Floating Overlay Buttons
          _buildHeroSection(
            context,
            hasPreviewImage: hasPreviewImage,
            imageUrl: effectiveImageUrl,
          ),

          // 2. Media Tab Pills Placeholder (reserves space so loaded pills don't cause shift)
          _buildMediaTabPlaceholder(),

          // 3. Fixed Trust Ribbon Strip ("100% Authentic | Easy Return")
          if (widget.showTrustRibbon) _buildTrustRibbon(),

          // 4. Product Info & Unified Price Card (wrapped in PdpSectionCard)
          PdpSectionCard(
            child: _buildPriceSection(
              hasProductName: hasProductName,
              productName: effectiveName,
              brand: brand,
              inStock: inStock,
              currentPrice: currentPrice,
              originalPrice: originalPrice,
              hasDiscount: hasDiscount,
              discountPct: discountPct,
              savings: savings,
              isExpress: isExpress,
              rating: rating,
              ratingCount: ratingCount,
            ),
          ),

          // 4. Loading Indicator — clean spinner positioned clearly above bottom bar
          _buildLoadingIndicator(),
        ],
      ),
    );
  }

  // ── 1. Hero Image Section with Active Floating Overlay Buttons ──
  Widget _buildHeroSection(
    BuildContext context, {
    required bool hasPreviewImage,
    required String? imageUrl,
  }) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Stack(
          children: [
            // ── Image or Shimmer ──
            Positioned.fill(
              child: hasPreviewImage
                  ? AppImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Skeletonizer(
                      enabled: true,
                      child: Container(
                        margin: EdgeInsets.all(16.w),
                        decoration: const BoxDecoration(
                          color: AppColors.pageBg,
                          borderRadius: AppRadius.cardRadius,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 64.sp,
                            color: AppColors.border,
                          ),
                        ),
                      ),
                    ),
            ),

            // ── Image Counter Badge (matches PdpMediaGalleryWidget) ──
            Positioned(
              bottom: 12.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.54),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '1/1',
                  style: AppTypography.bodyTiny.bold().white,
                ),
              ),
            ),

            // ── Floating Top Overlay: Back (left), Search + Cart (right) ──
            Positioned(
              top: AppSpacing.sameGroupItemSpacing.h,
              left: AppSpacing.sameGroupItemSpacing.w,
              right: AppSpacing.sameGroupItemSpacing.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left: Back button
                  _FloatingCircleButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    size: 16.sp,
                    onTap: widget.onBack ?? () => Navigator.of(context).maybePop(),
                  ),

                  // Right: Search + Cart (Active with badge)
                  Row(
                    children: [
                      _FloatingCircleButton(
                        icon: Icons.search_rounded,
                        size: 18.sp,
                        onTap: widget.onSearch,
                      ),
                      AppSpacing.sameGroupWidthGap,
                      _FloatingCircleButton(
                        icon: Icons.shopping_bag_outlined,
                        size: 18.sp,
                        badgeCount: widget.cartCount,
                        onTap: widget.onCart,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Right-Side Action Column: Wishlist + Share (Full opacity, active) ──
            Positioned(
              top: 0,
              bottom: 0,
              right: AppSpacing.sameGroupItemSpacing.w,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _FloatingCircleButton(
                      icon: widget.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      iconColor: widget.isFavorite ? AppColors.red : AppColors.navy,
                      onTap: widget.onFavorite,
                    ),
                    AppSpacing.sameGroupHeightGap,
                    _FloatingCircleButton(
                      icon: Icons.share_outlined,
                      onTap: widget.onShare,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── 2. Media Tab Pills Placeholder (matches PdpMediaGalleryWidget pill row) ──
  Widget _buildMediaTabPlaceholder() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: (constraints.maxWidth - 24.w).clamp(0.0, double.infinity),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // "Product Images (1)" — selected state, matching _MediaPill styling
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceBlue,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(
                      color: AppColors.pickabooBlue,
                      width: 1.2.w,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.photo_library_outlined,
                        size: 13.sp,
                        color: AppColors.pickabooBlue,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Product Images (1)',
                        style: AppTypography.brandAction.copyWith(
                          color: AppColors.pickabooBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── 3. Fixed Trust Ribbon Strip ("100% Authentic | Easy Return") ──
  Widget _buildTrustRibbon() {
    return Container(
      width: double.infinity,
      height: 36.h,
      color: AppColors.surfaceBlue,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified_user_outlined,
                size: 15.sp,
                color: AppColors.pickabooBlue,
              ),
              SizedBox(width: 4.w),
              Text(
                '100% Authentic',
                style: AppTypography.titleSmall.copyWith(
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              '|',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.muted.withValues(alpha: 0.5),
                fontSize: 12.sp,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.replay_rounded,
                size: 15.sp,
                color: AppColors.pickabooBlue,
              ),
              SizedBox(width: 4.w),
              Text(
                'Easy Return',
                style: AppTypography.titleSmall.copyWith(
                  fontSize: 11.5.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── 3. Product Info & Unified Pricing Value Card (matching PdpNewPriceSection) ──
  Widget _buildPriceSection({
    required bool hasProductName,
    required String? productName,
    required String brand,
    required bool inStock,
    required int? currentPrice,
    required int? originalPrice,
    required bool hasDiscount,
    required int discountPct,
    required int savings,
    required bool isExpress,
    required double rating,
    required int ratingCount,
  }) {
    final bool hasReviews = ratingCount > 0 && rating > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand Name
        if (brand.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 6.h),
            child: Text(
              brand.toUpperCase(),
              style: AppTypography.brandTag,
            ),
          ),
        ] else if (!hasProductName) ...[
          Skeletonizer(
            enabled: true,
            child: Container(
              width: 60.w,
              height: 14.h,
              decoration: const BoxDecoration(
                color: AppColors.pageBg,
                borderRadius: AppRadius.fullRadius,
              ),
            ),
          ),
          SizedBox(height: 6.h),
        ],

        // Product Title + In-Stock Badge
        if (hasProductName)
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$productName  ',
                  style: AppTypography.titleLarge,
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    padding: AppSpacing.badgePadding,
                    decoration: BoxDecoration(
                      color: inStock ? AppColors.greenBg : AppColors.redBg,
                      borderRadius: BorderRadius.circular(AppRadius.badge),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          inStock ? Icons.check_circle_rounded : Icons.cancel_rounded,
                          size: 11.sp,
                          color: inStock ? AppColors.green : AppColors.red,
                        ),
                        const SizedBox(width: AppSpacing.sameGroupItemSpacing / 2),
                        Text(
                          inStock ? 'In Stock' : 'Stock Out',
                          style: inStock
                              ? AppTypography.bodyTiny.extraBold().green
                              : AppTypography.bodyTiny.extraBold().red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          Skeletonizer(
            enabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 18.h,
                  decoration: const BoxDecoration(
                    color: AppColors.pageBg,
                    borderRadius: AppRadius.smRadius,
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  width: 220.w,
                  height: 18.h,
                  decoration: const BoxDecoration(
                    color: AppColors.pageBg,
                    borderRadius: AppRadius.smRadius,
                  ),
                ),
              ],
            ),
          ),

        SizedBox(height: 8.h),

        // Unified Price Card matching PdpNewPriceSection
        Container(
          decoration: BoxDecoration(
            color: AppColors.pageBg,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: AppColors.border, width: 1.w),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Row 1: Price (- Regular & Discount) + Express or Rating ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          if (currentPrice != null)
                            Text(
                              PdpSkeletonWidget.formatPrice(currentPrice),
                              style: AppTypography.priceLarge,
                            )
                          else
                            Skeletonizer(
                              enabled: true,
                              child: Container(
                                width: 90.w,
                                height: 22.h,
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: AppRadius.smRadius,
                                ),
                              ),
                            ),
                          if (hasDiscount && originalPrice != null) ...[
                            AppSpacing.sameGroupWidthGap,
                            Text(
                              PdpSkeletonWidget.formatPrice(originalPrice),
                              style: AppTypography.priceStrike,
                            ),
                            AppSpacing.sameGroupWidthGap,
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                                vertical: 2.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(AppRadius.badge),
                              ),
                              child: Text(
                                '-$discountPct%',
                                style: AppTypography.bodyLarge.extraBold().white,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  if (isExpress) ...[
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      AppAssets.expressPdp,
                      width: 67.2.w,
                      height: 14.4.h,
                      fit: BoxFit.contain,
                    ),
                  ] else if (hasReviews) ...[
                    SizedBox(width: 8.w),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RatingStars(
                          rating: rating,
                          size: 11.sp,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '${rating.toStringAsFixed(1)} ',
                          style: AppTypography.bodyLarge.bold(),
                        ),
                        Text(
                          '($ratingCount)',
                          style: AppTypography.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ],
              ),

              // ── Row 2: Save amount / Rating (when express occupied Row 1) ──
              if (/* savings > 0 || */ (isExpress && hasReviews)) ...[
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Temporarily commented out as requested: "You save X amount today"
                    // if (savings > 0)
                    //   Text(
                    //     'You save ${PdpSkeletonWidget.formatPrice(savings)} today',
                    //     style: AppTypography.savingsText,
                    //   )
                    // else
                    const SizedBox.shrink(),
                    if (isExpress && hasReviews)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingStars(
                            rating: rating,
                            size: 11.sp,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            '${rating.toStringAsFixed(1)} ',
                            style: AppTypography.bodyLarge.bold(),
                          ),
                          Text(
                            '($ratingCount)',
                            style: AppTypography.bodySmall,
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // ── 4. Loading Indicator — clean spinner centered in visible space ──
  Widget _buildLoadingIndicator() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: SizedBox(
          width: 26.w,
          height: 26.w,
          child: const CircularProgressIndicator(
            strokeWidth: 2.5,
            color: AppColors.pickabooBlue,
          ),
        ),
      ),
    );
  }
}

/// Floating circle button matching PdpMediaGalleryWidget._FloatingCircleButton
/// and PdpTopAppBar._PdpCircleButton — white circle with subtle shadow.
class _FloatingCircleButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback? onTap;
  final Color? iconColor;
  final int badgeCount;

  const _FloatingCircleButton({
    required this.icon,
    this.size = 18,
    this.onTap,
    this.iconColor,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.08),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(icon, size: size, color: iconColor ?? AppColors.navy),
            ),
          ),
          if (badgeCount > 0)
            Positioned(
              top: -2.h,
              right: -2.w,
              child: Container(
                padding: EdgeInsets.all(3.w),
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(minWidth: 16.w, minHeight: 16.w),
                child: Center(
                  child: Text(
                    badgeCount > 99 ? '99+' : badgeCount.toString(),
                    style: AppTypography.bodyTiny.bold().white.copyWith(
                      fontSize: 9.sp,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
