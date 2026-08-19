import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/bloc/banner_bloc/banner_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/home_page/banner_item_view.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';

class ProductComparisonPage extends StatefulWidget {
  const ProductComparisonPage({super.key});

  @override
  State<ProductComparisonPage> createState() => _ProductComparisonPageState();
}

class _ProductComparisonPageState extends State<ProductComparisonPage> {

  @override
  void initState() {
    super.initState();
    context.read<BannerBloc>().add(BannerEvent.getBannerContent());
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: Text('Product Comparison', style: context.textStyle.appBarTitle),
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
      body: BlocBuilder<CompareBloc, CompareState>(
        builder: (context, compareState) {
          final products = compareState.products;
          if (products.isEmpty) {
            return Center(
              child: Text(
                'No products to compare',
                style: textStyle.bodyLarge.copyWith(color: colors.textMedium),
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _buildProductCardsSection(products, colors, textStyle),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),

              SliverToBoxAdapter(
                child: _buildComparisonTable(products, colors, textStyle),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),

              SliverToBoxAdapter(
                child: _buildBannerSection(colors),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 32.h)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductCardsSection(List<ProductDetailEntity> products, AppColors colors, AppTextStyles textStyle) {
    return Container(
      color: colors.white,
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: products.map((product) {
          return Expanded(child: _buildProductCard(product, colors, textStyle));
        }).toList(),
      ),
    );
  }

  Widget _buildProductCard(
    ProductDetailEntity product,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    final imageUrl = product.images.isNotEmpty ? product.images.first : '';
    final price = product.prodOfferPrice > 0 ? product.prodOfferPrice : product.regularPrice;
    final originalPrice = product.regularPrice;
    final discount = product.discount;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border.all(color: colors.borderColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.w,
                height: 20.w,
                child: Checkbox(
                  value: true,
                  onChanged: (value) {
                    if (value == false) {
                      context.read<CompareBloc>().add(CompareEvent.remove(productId: product.id.toString()));
                    }
                  },
                  activeColor: colors.primary,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          Container(
            width: 100.w,
            height: 100.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: colors.whiteSmoke,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: AppImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            product.name,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textStyle.bodySmall.copyWith(
              color: colors.text,
              height: 1.3.h,
            ),
          ),
          SizedBox(height: 8.h),

          Text(
            '৳ ${_formatPrice(price)}',
            style: textStyle.bodyLargeBold.copyWith(
              color: const Color(0xFF0094CF),
            ),
          ),
          if (originalPrice > price) ...[
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '৳ ${_formatPrice(originalPrice)}',
                  style: textStyle.bodySmall.copyWith(
                    color: colors.gray,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(width: 6.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    '$discount% OFF',
                    style: textStyle.caption.copyWith(
                      color: colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildComparisonTable(List<ProductDetailEntity> products, AppColors colors, AppTextStyles textStyle) {
    final Map<String, String> dynamicAttributes = {};
    for (final p in products) {
      for (final info in p.moreInformation) {
        for (final attr in info.attrList) {
          final label = attr.label.trim();
          final lowerLabel = label.toLowerCase();
          if (lowerLabel != 'sku' && lowerLabel != 'brand' && lowerLabel != 'warranty') {
            if (!dynamicAttributes.containsKey(lowerLabel)) {
              dynamicAttributes[lowerLabel] = label;
            }
          }
        }
      }
    }

    final List<Map<String, String>> attributes = [
      {'label': 'SKU', 'key': 'sku'},
      {'label': 'Brand', 'key': 'brand'},
      {'label': 'Warranty', 'key': 'warranty'},
    ];

    dynamicAttributes.forEach((lowerLabel, originalLabel) {
      attributes.add({'label': originalLabel, 'key': lowerLabel});
    });

    return Container(
      color: colors.white,
      child: Column(
        children: attributes.map((attr) {
          return _buildComparisonRow(attr, products, colors, textStyle);
        }).toList(),
      ),
    );
  }

  Widget _buildComparisonRow(
    Map<String, String> attr,
    List<ProductDetailEntity> products,
    AppColors colors,
    AppTextStyles textStyle,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colors.borderColor, width: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            color: colors.whiteSmoke,
            child: Text(
              attr['label'] ?? '',
              style: textStyle.bodyMedium.copyWith(
                color: colors.text,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: products.map((product) {
              return Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: colors.borderColor.withValues(alpha: 0.5),
                        width: 0.5.w,
                      ),
                    ),
                  ),
                  child: Text(
                    _getAttributeValue(product, attr['key'] ?? ''),
                    style: textStyle.bodySmall.copyWith(
                      color: colors.textMedium,
                      height: 1.4.h,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _getAttributeValue(ProductDetailEntity product, String key) {
    switch (key) {
      case 'sku':
        return product.sku;
      case 'brand':
        return product.brand;
      case 'warranty':
        return product.warranty;
      default:
        for (final info in product.moreInformation) {
          for (final attr in info.attrList) {
            if (attr.label.trim().toLowerCase() == key) {
              return attr.value;
            }
          }
        }
        return '-';
    }
  }

  Widget _buildBannerSection(AppColors colors) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state.status == BannerStatus.loading) {
          return Center(
            child: CircularProgressIndicator(color: colors.primary),
          );
        }

        if (state.status == BannerStatus.success && state.banners.isNotEmpty) {
          final activeBanners = state.banners
              .where((b) => b.isActive == 1 && b.identifier.startsWith('compare-banner'))
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
            final banners = entry.value..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

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
            padding: EdgeInsets.symmetric(horizontal: 16.w),
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

