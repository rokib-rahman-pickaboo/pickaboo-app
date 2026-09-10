// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/domain/entity/homepage_offers/homepage_offers_entity.dart';
import 'package:pickaboo/presentation/bloc/homepage_offers_bloc/homepage_offers_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_section_header.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// ============================================================================
/// 🏷️ HOMEPAGE OFFERS SECTION (Campaign Deals Grid)
/// Standardized with universal 8.w sameGroupItemSpacing and 12.h groupToGroupSpacing.
/// ============================================================================
class HomepageOffersSection extends StatelessWidget {
  const HomepageOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageOffersBloc, HomepageOffersState>(
      builder: (context, state) {
        if (state.status == HomepageOffersStatus.loading) {
          return AppLoader.sliver(
            padding: EdgeInsets.symmetric(vertical: 24.h),
          );
        }

        if (state.status == HomepageOffersStatus.loaded &&
            state.offers != null) {
          final entries = <_OfferEntry>[];
          for (final menu in state.offers!.menus) {
            for (final sub in menu.subsections) {
              if (sub.status == 1 && sub.items.isNotEmpty) {
                entries.add(_OfferEntry(menu: menu, subsection: sub));
              }
            }
          }

          if (entries.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final entry = entries[index];
                return RepaintBoundary(
                  child: OfferDealsGrid(
                    subsection: entry.subsection,
                    onDealTap: (item) => _handleDealTap(context, item),
                    onViewAll: () => _handleViewAll(context, entry),
                  ),
                );
              },
              childCount: entries.length,
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: true,
              addSemanticIndexes: false,
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }

  void _handleViewAll(BuildContext context, _OfferEntry entry) {
    final sub = entry.subsection;

    if (sub.seeMoreLink.isNotEmpty) {
      context.handleBannerTap(
        linkType: sub.seeMoreLinkType.isNotEmpty
            ? sub.seeMoreLinkType
            : 'category',
        link: sub.seeMoreLink,
        categoryName: sub.title,
      );
      return;
    }

    final category = entry.menu.category;
    if (category.id != 0 || category.slug.isNotEmpty) {
      context.pushToCategoryProduct(
        categoryId: category.id.toString(),
        categorySlug: category.slug,
        categoryName: category.name.isNotEmpty ? category.name : sub.title,
      );
    }
  }

  void _handleDealTap(BuildContext context, OfferItemEntity item) {
    context.handleBannerTap(
      linkType: item.itemType,
      link: item.itemId != 0 ? item.itemId.toString() : item.link,
      categoryName: item.name,
    );
  }
}

class _OfferEntry {
  final HomepageOfferMenuEntity menu;
  final OfferSubsectionEntity subsection;

  const _OfferEntry({required this.menu, required this.subsection});
}

class OfferDealsGrid extends StatelessWidget {
  final OfferSubsectionEntity subsection;
  final Function(OfferItemEntity)? onDealTap;
  final VoidCallback? onViewAll;

  const OfferDealsGrid({
    super.key,
    required this.subsection,
    this.onDealTap,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final deals = subsection.items.take(4).toList();

    if (deals.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(
        left: AppSpacing.sameGroupItemSpacing.w,
        right: AppSpacing.sameGroupItemSpacing.w,
        bottom: AppSpacing.groupToGroupSpacing.h,
      ),
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceBlue,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(
          color: AppColors.border,
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSectionHeader(
            title: subsection.title,
            onViewAll: onViewAll,
            padding: EdgeInsets.zero,
          ),

          SizedBox(height: AppSpacing.sameGroupItemSpacing.h),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int rowStart = 0;
                  rowStart < deals.length;
                  rowStart += gridColumnsFor(context)) ...[
                if (rowStart > 0)
                  SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
                Row(
                  children: [
                    for (int i = 0; i < gridColumnsFor(context); i++) ...[
                      if (i > 0)
                        SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                      Expanded(
                        child: (rowStart + i < deals.length)
                            ? AspectRatio(
                                aspectRatio: 0.92,
                                child: _OfferDealCard(
                                  deal: deals[rowStart + i],
                                  onTap: () =>
                                      onDealTap?.call(deals[rowStart + i]),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _OfferDealCard extends StatelessWidget {
  final OfferItemEntity deal;
  final VoidCallback? onTap;

  const _OfferDealCard({required this.deal, this.onTap});

  String? get _discountLabel {
    if (deal.discountValue <= 0) return null;
    final value = deal.discountValue.toStringAsFixed(0);
    switch (deal.discountType) {
      case 'percentage':
        return '$value% Off';
      case 'fixed':
        return '৳$value Off';
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final discount = _discountLabel;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageCacheWidth =
        ((screenWidth - 82) / 2 * devicePixelRatio).round();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.border,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.navy.withValues(alpha: 0.03),
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(7.r),
                ),
                child: AppImage(
                  imageUrl: deal.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  cacheWidth: imageCacheWidth,
                  placeholder: Container(
                    color: AppColors.pageBg,
                    child: const AppLoader.inline(),
                  ),
                  errorWidget: Container(
                    color: AppColors.pageBg,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: AppColors.muted,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: 44.h,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(7.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    deal.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyTiny,
                  ),
                  if (discount != null && discount.trim().isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    Text(
                      discount,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppTypography.brandActionText,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
