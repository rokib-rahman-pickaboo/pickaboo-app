import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/homepage_offers/homepage_offers_entity.dart';
import 'package:pickaboo/presentation/bloc/homepage_offers_bloc/homepage_offers_bloc.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

class HomepageOffersSection extends StatelessWidget {
  const HomepageOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<HomepageOffersBloc, HomepageOffersState>(
      builder: (context, state) {
        if (state.status == HomepageOffersStatus.loading) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Center(
                child: SizedBox(
                  width: 28.w,
                  height: 28.w,
                  child: CircularProgressIndicator(
                    color: colors.primary,
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
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
            delegate: SliverChildBuilderDelegate((context, index) {
              final entry = entries[index];
              return OfferDealsGrid(
                subsection: entry.subsection,
                onDealTap: (item) => _handleDealTap(context, item),
                onViewAll: () => _handleViewAll(context, entry),
              );
            }, childCount: entries.length),
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
    final colors = context.colors;
    final textStyle = context.textStyle;

    final deals = subsection.items.take(4).toList();

    if (deals.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.whiteSmoke,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  subsection.title,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
              ),
              if (onViewAll != null) ...[
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: onViewAll,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 7.w,
                    ),
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: colors.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      "assets/new/svg/forward_icon.svg",
                      width: 7.w,
                      height: 14.h,
                      colorFilter: ColorFilter.mode(
                        colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),

          SizedBox(height: 12.h),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridColumnsFor(context),
              crossAxisSpacing: 18.w,
              mainAxisSpacing: 18.w,
              childAspectRatio: 0.95,
            ),
            itemCount: deals.length,
            itemBuilder: (context, index) {
              return _OfferDealCard(
                deal: deals[index],
                onTap: () => onDealTap?.call(deals[index]),
              );
            },
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
    final colors = context.colors;
    final textStyle = context.textStyle;
    final discount = _discountLabel;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageCacheWidth =
        ((screenWidth - 82) / 2 * devicePixelRatio).round();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(6.r),
                    ),
                    child: AppImage(
                      imageUrl: deal.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      cacheWidth: imageCacheWidth,
                      placeholder: Container(
                        color: colors.whiteSmoke,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                      errorWidget: Container(
                        color: colors.whiteSmoke,
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: colors.gray,
                            size: 28.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            colors.black.withValues(alpha: 0.0),
                            colors.black.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 46.h,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.r),
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
                    style: textStyle.bodySmall.copyWith(
                      color: colors.text,
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      height: 1.2.h,
                    ),
                  ),
                  if (discount != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      discount,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: textStyle.bodySmall.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp,
                        height: 1.2.h,
                      ),
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
