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
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/banner_bloc/banner_bloc.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/product_comparison_page/widgets/add_product_compare_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Robust, user-friendly ProductComparisonPage
class ProductComparisonPage extends StatefulWidget {
  const ProductComparisonPage({super.key});

  @override
  State<ProductComparisonPage> createState() => _ProductComparisonPageState();
}

class _ProductComparisonPageState extends State<ProductComparisonPage> {
  bool _highlightDifferencesOnly = false;

  @override
  void initState() {
    super.initState();
    context.read<BannerBloc>().add(const BannerEvent.getBannerContent());
  }

  void _openAddProductSheet([ProductDetailEntity? baseProduct]) {
    AddProductCompareBottomSheet.show(
      context,
      baseProduct: baseProduct,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: 'Product Comparison',
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded, color: AppColors.navy, size: 22.sp),
            onPressed: () => context.push(Routes.search),
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

              return IconButton(
                icon: Badge(
                  isLabelVisible: cartCount > 0,
                  label: Text(
                    '$cartCount',
                    style: AppTypography.bodyTiny.bold().withColor(AppColors.white),
                  ),
                  backgroundColor: AppColors.pickabooBlue,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.navy,
                    size: 22.sp,
                  ),
                ),
                onPressed: () => context.push(Routes.cart),
              );
            },
          ),
          SizedBox(width: 4.w),
        ],
      ),
      body: BlocListener<CompareBloc, CompareState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (error, _) {
              SnackBarUtils.showWarning(context, error.message);
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<CompareBloc, CompareState>(
          builder: (context, compareState) {
            final products = compareState.products;

            if (products.isEmpty) {
              return _buildEmptyState();
            }

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Product Cards Section
                SliverToBoxAdapter(
                  child: _buildProductCardsSection(products),
                ),

                // Highlight Differences Bar (if 2 products)
                if (products.length >= 2)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.sameGroupItemSpacing.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Technical Specifications',
                            style: AppTypography.titleMedium,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _highlightDifferencesOnly = !_highlightDifferencesOnly;
                              });
                            },
                            borderRadius: BorderRadius.circular(20.r),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                color: _highlightDifferencesOnly
                                    ? AppColors.surfaceBlue
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: _highlightDifferencesOnly
                                      ? AppColors.pickabooBlue
                                      : AppColors.border,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _highlightDifferencesOnly
                                        ? Icons.check_circle_rounded
                                        : Icons.remove_red_eye_outlined,
                                    size: 14.sp,
                                    color: _highlightDifferencesOnly
                                        ? AppColors.pickabooBlue
                                        : AppColors.muted,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Highlight Differences',
                                    style: AppTypography.brandAction,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                SliverToBoxAdapter(child: SizedBox(height: 4.h)),

                // Comparison Table
                SliverToBoxAdapter(
                  child: _buildComparisonTable(products),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                // Banner Section
                SliverToBoxAdapter(
                  child: _buildBannerSection(),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 32.h)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: const BoxDecoration(
                color: AppColors.surfaceBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.compare_arrows_rounded,
                size: 48.sp,
                color: AppColors.pickabooBlue,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No Products to Compare',
              style: AppTypography.titleLarge,
            ),
            SizedBox(height: 6.h),
            Text(
              'Select items while browsing or search products directly to compare features side-by-side.',
              textAlign: TextAlign.center,
              style: AppTypography.bodySmall,
            ),
            AppSpacing.gapV20,
            AppButton.primary(
              text: 'Add Product to Compare',
              icon: Icon(Icons.add_rounded, size: 18.sp, color: AppColors.white),
              isFullWidth: false,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              borderRadius: BorderRadius.circular(10.r),
              onPressed: () => _openAddProductSheet(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCardsSection(List<ProductDetailEntity> products) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        AppSpacing.sameGroupItemSpacing.w,
        0,
        AppSpacing.sameGroupItemSpacing.w,
        AppSpacing.sameGroupItemSpacing.w,
      ),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.03),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Product Slot
            Expanded(
              child: _buildProductCard(
                products[0],
                label: products.length >= 2 ? 'Product 1' : 'Primary',
                onSwap: () => _openAddProductSheet(products.length >= 2 ? products[1] : null),
              ),
            ),
            SizedBox(width: 8.w),
            // Second Product Slot OR Add Slot
            Expanded(
              child: products.length >= 2
                  ? _buildProductCard(
                      products[1],
                      label: 'Product 2',
                      onSwap: () => _openAddProductSheet(products[0]),
                    )
                  : _buildAddProductSlot(products.first),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
    ProductDetailEntity product, {
    required String label,
    required VoidCallback onSwap,
  }) {
    final imageUrl = product.images.isNotEmpty ? product.images.first : '';
    final price = product.prodOfferPrice > 0
        ? product.prodOfferPrice
        : product.regularPrice;
    final originalPrice = product.regularPrice;
    final discount = product.discount;

    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadius.cardRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Header (Slot Tag + Remove X Button)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.surfaceBlue,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  label.toUpperCase(),
                  style: AppTypography.brandAction,
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<CompareBloc>().add(
                        CompareEvent.remove(
                          productId: product.id.toString(),
                        ),
                      );
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: AppColors.pageBg,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    size: 14.sp,
                    color: AppColors.navy,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // Image
          GestureDetector(
            onTap: () => context.goToProductDetail(product.id.toString()),
            child: SizedBox(
              width: 85.w,
              height: 85.w,
              child: AppImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8.h),

          // Name
          GestureDetector(
            onTap: () => context.goToProductDetail(product.id.toString()),
            child: Text(
              product.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTypography.titleSmall,
            ),
          ),
          SizedBox(height: 6.h),

          // Price
          Text(
            '৳ ${_formatPrice(price)}',
            style: AppTypography.brandAction,
          ),
          if (originalPrice > price) ...[
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '৳ ${_formatPrice(originalPrice)}',
                  style: AppTypography.priceStrike,
                ),
                SizedBox(width: 4.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: AppColors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    '$discount% OFF',
                    style: AppTypography.bodyMedium.extraBold().red,
                  ),
                ),
              ],
            ),
          ],
          const Spacer(),
          SizedBox(height: 8.h),

          // Action Buttons: Swap & View
          Row(
            children: [
              Expanded(
                child: AppButton.outline(
                  text: 'Swap',
                  size: AppButtonSize.sm,
                  height: 32.h,
                  borderRadius: BorderRadius.circular(6.r),
                  textStyle: AppTypography.bodyTiny,
                  onPressed: onSwap,
                ),
              ),
              AppSpacing.gapH4,
              Expanded(
                child: AppButton.secondary(
                  text: 'View',
                  size: AppButtonSize.sm,
                  height: 32.h,
                  backgroundColor: AppColors.surfaceBlue,
                  textColor: AppColors.pickabooBlue,
                  borderColor: AppColors.pickabooBlue,
                  borderRadius: BorderRadius.circular(6.r),
                  textStyle: AppTypography.brandTag,
                  onPressed: () => context.goToProductDetail(product.id.toString()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddProductSlot(ProductDetailEntity baseProduct) {
    return GestureDetector(
      onTap: () => _openAddProductSheet(baseProduct),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.pageBg,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(
            color: AppColors.pickabooBlue.withValues(alpha: 0.5),
            style: BorderStyle.solid,
            width: 1.2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 14.h),
            Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceBlue,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.pickabooBlue, width: 1.w),
              ),
              child: Icon(
                Icons.add_rounded,
                size: 28.sp,
                color: AppColors.pickabooBlue,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              '+ Add Product',
              textAlign: TextAlign.center,
              style: AppTypography.titleSmall,
            ),
            SizedBox(height: 4.h),
            Text(
              'Select from similar items\nor search any model',
              textAlign: TextAlign.center,
              style: AppTypography.bodyTiny,
            ),
            const Spacer(),
            AppSpacing.gapV8,
            AppButton.primary(
              text: 'Select Product',
              size: AppButtonSize.sm,
              height: 34.h,
              borderRadius: BorderRadius.circular(6.r),
              isFullWidth: true,
              onPressed: () => _openAddProductSheet(baseProduct),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonTable(List<ProductDetailEntity> products) {
    final Map<String, String> dynamicAttributes = {};
    for (final p in products) {
      for (final info in p.moreInformation) {
        for (final attr in info.attrList) {
          final label = attr.label.trim();
          final lowerLabel = label.toLowerCase();
          if (lowerLabel != 'sku' &&
              lowerLabel != 'brand' &&
              lowerLabel != 'warranty') {
            if (!dynamicAttributes.containsKey(lowerLabel)) {
              dynamicAttributes[lowerLabel] = label;
            }
          }
        }
      }
    }

    final List<Map<String, String>> attributes = [
      {'label': 'Brand', 'key': 'brand'},
      {'label': 'Warranty', 'key': 'warranty'},
      {'label': 'SKU', 'key': 'sku'},
    ];

    dynamicAttributes.forEach((lowerLabel, originalLabel) {
      attributes.add({'label': originalLabel, 'key': lowerLabel});
    });

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.03),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.cardRadius,
        child: Column(
          children: attributes.map((attr) {
            return _buildComparisonRow(attr, products);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildComparisonRow(
    Map<String, String> attr,
    List<ProductDetailEntity> products,
  ) {
    final val1 = _getAttributeValue(products[0], attr['key'] ?? '');
    final val2 = products.length >= 2
        ? _getAttributeValue(products[1], attr['key'] ?? '')
        : '';
    final bool isDifferent = products.length >= 2 &&
        val1 != '-' &&
        val2 != '-' &&
        val1.toLowerCase().trim() != val2.toLowerCase().trim();

    final bool shouldHighlight = _highlightDifferencesOnly && isDifferent;

    return Container(
      decoration: BoxDecoration(
        color: shouldHighlight
            ? AppColors.surfaceBlue.withValues(alpha: 0.35)
            : AppColors.white,
        border: const Border(
          bottom: BorderSide(color: AppColors.border, width: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
              vertical: 7.h,
            ),
            color: shouldHighlight
                ? AppColors.surfaceBlue
                : AppColors.pageBg.withValues(alpha: 0.7),
            child: Row(
              children: [
                if (shouldHighlight) ...[
                  Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: const BoxDecoration(
                      color: AppColors.pickabooBlue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 6.w),
                ],
                Text(
                  attr['label'] ?? '',
                  style: shouldHighlight
                      ? AppTypography.brandAction
                      : AppTypography.titleSmall.copyWith(
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Column 1
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: AppColors.border,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Text(
                    val1,
                    style: shouldHighlight
                        ? AppTypography.bodyMedium.copyWith(
                            fontSize: 11.5.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.navy,
                          )
                        : AppTypography.bodySmall.copyWith(
                            fontSize: 11.5.sp,
                            color: AppColors.text,
                          ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Column 2
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
                  child: products.length >= 2
                      ? Text(
                          val2,
                          style: shouldHighlight
                              ? AppTypography.bodyMedium.copyWith(
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.navy,
                                )
                              : AppTypography.bodySmall.copyWith(
                                  fontSize: 11.5.sp,
                                  color: AppColors.text,
                                ),
                          textAlign: TextAlign.center,
                        )
                      : InkWell(
                          onTap: () => _openAddProductSheet(products.first),
                          child: Text(
                            '+ Add to compare',
                            style: AppTypography.brandAction,
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getAttributeValue(ProductDetailEntity product, String key) {
    switch (key) {
      case 'sku':
        return product.sku.isNotEmpty ? product.sku : '-';
      case 'brand':
        return product.brand.isNotEmpty ? product.brand : '-';
      case 'warranty':
        return product.warranty.isNotEmpty ? product.warranty : '-';
      default:
        for (final info in product.moreInformation) {
          for (final attr in info.attrList) {
            if (attr.label.trim().toLowerCase() == key) {
              return attr.value.isNotEmpty ? attr.value : '-';
            }
          }
        }
        return '-';
    }
  }

  Widget _buildBannerSection() {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state.status == BannerStatus.loading) {
          return const AppLoader.inline();
        }

        if (state.status == BannerStatus.success && state.banners.isNotEmpty) {
          final activeBanners = state.banners
              .where((b) =>
                  b.isActive == 1 && b.identifier.startsWith('compare-banner'))
              .toList();

          if (activeBanners.isEmpty) return const SizedBox.shrink();

          final groupedByIdentifier = <String, List<BannerEntity>>{};
          for (final banner in activeBanners) {
            groupedByIdentifier.putIfAbsent(banner.identifier, () => []).add(banner);
          }

          final widgets = <Widget>[];

          void handleBannerTap(BannerEntity banner) {
            final target = banner.tapTarget;
            context.handleBannerTap(
              linkType: target.linkType,
              link: target.link,
              categoryName: target.name,
            );
          }

          for (final entry in groupedByIdentifier.entries) {
            final identifier = entry.key;
            final banners = entry.value
              ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

            if (identifier == 'compare-banner-two-col') {
              for (var i = 0; i < banners.length; i += 2) {
                final chunk = banners.skip(i).take(2).toList();
                final rowChildren = <Widget>[];

                for (var j = 0; j < chunk.length; j++) {
                  if (j > 0) rowChildren.add(SizedBox(width: 8.w));
                  final banner = chunk[j];
                  rowChildren.add(
                    Expanded(
                      child: BannerItemView(
                        banner: banner.toSliderEntity(),
                        naturalHeight: true,
                        onTap: (_) => handleBannerTap(banner),
                      ),
                    ),
                  );
                }

                for (var k = chunk.length; k < 2; k++) {
                  rowChildren.add(SizedBox(width: 8.w));
                  rowChildren.add(const Expanded(child: SizedBox.shrink()));
                }

                widgets.add(
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rowChildren,
                    ),
                  ),
                );
              }
            } else if (identifier == 'compare-banner-full') {
              for (final banner in banners) {
                widgets.add(
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: BannerItemView(
                      banner: banner.toSliderEntity(),
                      naturalHeight: true,
                      onTap: (_) => handleBannerTap(banner),
                    ),
                  ),
                );
              }
            }
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
            child: Column(children: widgets),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
