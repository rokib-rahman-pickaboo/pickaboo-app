// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_html.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Modern ProductDescriptionPage matching Pickaboo-App-UI design language.
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
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: widget.product.name,
      ),
      body: Column(
        children: [
          _buildProductSummary(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
            padding: EdgeInsets.all(4.w),
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.surfaceBlue,
              borderRadius: AppRadius.cardRadius,
              border: Border.all(color: AppColors.border),
            ),
            child: TabBar(
              controller: _tabController,
              dividerColor: AppColors.transparent,
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.muted,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.pickabooBlue,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.pickabooBlue.withValues(alpha: 0.2),
                    blurRadius: 4.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              labelStyle: AppTypography.titleSmall,
              unselectedLabelStyle: AppTypography.bodyMedium,
              tabs: const [
                Tab(text: 'Specification'),
                Tab(text: 'Description'),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSpecification(),
                _buildDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSummary() {
    final hasDiscount = widget.product.discount > 0;
    final currentPrice = hasDiscount
        ? widget.product.spacialPrice
        : widget.product.regularPrice;
    final originalPrice = widget.product.regularPrice;
    final discountPercent = widget.product.discount;
    final showDiscount = hasDiscount;

    return Container(
      margin: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      padding: EdgeInsets.all(12.w),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 75.w,
            height: 75.w,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              border: Border.all(color: AppColors.border),
              borderRadius: AppRadius.cardRadius,
            ),
            child: ClipRRect(
              borderRadius: AppRadius.cardRadius,
              child: AppImage(
                imageUrl: widget.product.images.isNotEmpty
                    ? widget.product.images.first
                    : '',
                fit: BoxFit.contain,
                errorWidget: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.mutedLight,
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: AppTypography.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '৳ ${currentPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                      style: AppTypography.priceStandard.withColor(AppColors.pickabooBlue),
                    ),
                  ],
                ),
                if (showDiscount) ...[
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        '৳ ${originalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}',
                        style: AppTypography.priceStrike,
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.red.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          '$discountPercent% OFF',
                          style: AppTypography.bodyMedium.extraBold().red,
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

  Widget _buildDescription() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: 8.h,
      ),
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppRadius.cardRadius,
          border: Border.all(color: AppColors.border),
        ),
        child: AppHtml(data: widget.product.productDetails),
      ),
    );
  }

  int _selectedSpecGroupIndex = 0;

  Widget _buildSpecification() {
    final groups = widget.product.specificationGroups;
    if (groups.isEmpty) {
      return Center(
        child: Text(
          'No specifications available',
          style: AppTypography.bodySmall,
        ),
      );
    }

    final safeIndex = _selectedSpecGroupIndex.clamp(0, groups.length - 1);
    final activeGroup = groups[safeIndex];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        bottom: 24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Horizontal Chip List (Radio Group for Specification Categories) ──
          if (groups.length > 1) ...[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(groups.length, (index) {
                  final group = groups[index];
                  final isSelected = index == safeIndex;
                  final label = group.groupLabel.isNotEmpty
                      ? group.groupLabel
                      : 'Group ${index + 1}';

                  return Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedSpecGroupIndex = index;
                        });
                      },
                      borderRadius: BorderRadius.circular(6.r),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.pickabooBlue
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.pickabooBlue
                                : AppColors.border,
                            width: 1.w,
                          ),
                        ),
                        child: Text(
                          label,
                          style: AppTypography.bodySmall.copyWith(
                            fontSize: 11.sp,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: isSelected
                                ? AppColors.white
                                : AppColors.navy,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 12.h),
          ],

          // ── Active Group Specification Card ──
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.cardRadius,
              boxShadow: [
                BoxShadow(
                  color: AppColors.navy.withValues(alpha: 0.03),
                  blurRadius: 8.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: AppRadius.cardRadius,
              border: Border.all(color: AppColors.border),
            ),
            clipBehavior: Clip.antiAlias,
            child: ClipRRect(
              borderRadius: AppRadius.cardRadius,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (activeGroup.groupLabel.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBlue,
                      ),
                      child: Text(
                        activeGroup.groupLabel,
                        style: AppTypography.titleSmall,
                      ),
                    ),
                  if (activeGroup.attrList.isNotEmpty)
                    for (int i = 0; i < activeGroup.attrList.length; i++)
                      Builder(
                        builder: (context) {
                          final bool isFirst = i == 0;
                          final bool isLast =
                              i == activeGroup.attrList.length - 1;
                          final bool hasGroupHeader =
                              activeGroup.groupLabel.isNotEmpty;

                          final BorderRadius? rowRadius = (hasGroupHeader)
                              ? (isLast
                                  ? const BorderRadius.vertical(
                                      bottom: Radius.circular(AppRadius.card),
                                    )
                                  : null)
                              : (isFirst && isLast)
                                  ? AppRadius.cardRadius
                                  : isFirst
                                      ? const BorderRadius.vertical(
                                          top: Radius.circular(AppRadius.card),
                                        )
                                      : isLast
                                          ? const BorderRadius.vertical(
                                              bottom: Radius.circular(
                                                  AppRadius.card),
                                            )
                                          : null;

                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: i % 2 == 0
                                  ? AppColors.white
                                  : AppColors.pageBg,
                              borderRadius: rowRadius,
                              border: !isLast
                                  ? Border(
                                      bottom: BorderSide(
                                        color: AppColors.border
                                            .withValues(alpha: 0.6),
                                        width: 0.8.w,
                                      ),
                                    )
                                  : null,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    activeGroup.attrList[i].label,
                                    style: AppTypography.bodySmall.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    activeGroup.attrList[i].value,
                                    style: AppTypography.titleSmall.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                  else
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        'No specifications in this category.',
                        style: AppTypography.bodySmall,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
