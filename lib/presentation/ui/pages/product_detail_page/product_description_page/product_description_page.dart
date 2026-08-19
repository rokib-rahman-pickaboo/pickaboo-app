import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';

class ProductDescriptionPage extends StatefulWidget {
  final ProductDetailEntity product;
  final int initialIndex;

  const ProductDescriptionPage({
    super.key,
    required this.product,
    this.initialIndex = 0,
  });

  @override
  State<ProductDescriptionPage> createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: Text(widget.product.name, style: context.textStyle.appBarTitle),
      ),
      body: Column(
        children: [
          _buildProductSummary(colors, textStyle),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(4.w),
            height: 48.h,
            decoration: BoxDecoration(
              color: colors.whiteSmoke.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TabBar(
              controller: _tabController,
              dividerColor: Colors.transparent,
              labelColor: colors.white,
              unselectedLabelColor: colors.textMedium,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withValues(alpha: 0.2),
                    blurRadius: 4.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              labelStyle: textStyle.bodyMediumBold,
              unselectedLabelStyle: textStyle.bodyMedium,
              tabs: const [
                Tab(text: 'Specification'),
                Tab(text: 'Description'),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSpecification(colors, textStyle),
                _buildDescription(colors),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSummary(AppColors colors, AppTextStyles textStyle) {
    final hasDiscount = widget.product.discount > 0;
    final currentPrice = hasDiscount
        ? widget.product.spacialPrice
        : widget.product.regularPrice;
    final originalPrice = widget.product.regularPrice;
    final discountPercent = widget.product.discount;
    final showDiscount = hasDiscount;

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: colors.borderColor),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.04),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90.w,
            height: 90.w,
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: colors.white,
              border: Border.all(
                color: colors.borderColor.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.product.images.isNotEmpty
                  ? widget.product.images.first
                  : '',
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => Icon(
                Icons.image_not_supported_outlined,
                color: colors.textMedium,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: textStyle.productNameLarge.copyWith(
                    color: context.colors.text,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '৳ ${currentPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                      style: textStyle.productPriceLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary,
                      ),
                    ),
                  ],
                ),
                if (showDiscount) ...[
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Text(
                        '৳ ${originalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                        style: textStyle.bodyMedium.copyWith(
                          color: colors.textMedium,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: colors.textMedium,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: colors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          '$discountPercent% OFF',
                          style: textStyle.bodySmall.copyWith(
                            color: colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(AppColors colors) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: AppHtml(data: widget.product.productDetails),
    );
  }

  Widget _buildSpecification(AppColors colors, AppTextStyles textStyle) {
    if (widget.product.moreInformation.isEmpty) {
      return Center(
        child: Text(
          'No specifications available',
          style: textStyle.bodyMedium.copyWith(color: colors.textMedium),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.product.moreInformation.length,
      itemBuilder: (context, index) {
        final info = widget.product.moreInformation[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                info.groupLabel,
                style: textStyle.bodyLargeBold.copyWith(color: colors.primary),
              ),
            ),
            ...info.attrList.map((attr) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: colors.borderColor.withValues(alpha: 0.3),
                      width: 1.w,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        attr.label,
                        style: textStyle.bodyMedium.copyWith(
                          color: colors.text,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      flex: 3,
                      child: Text(
                        attr.value,
                        style: textStyle.bodyMedium.copyWith(
                          color: colors.text,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: 16.h),
          ],
        );
      },
    );
  }
}
