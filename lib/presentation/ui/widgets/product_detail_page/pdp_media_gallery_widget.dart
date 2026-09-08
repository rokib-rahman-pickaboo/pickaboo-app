// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// 1. HERO MEDIA GALLERY WITH FLOATING TOP BAR (Back, Search, Cart) AND RIGHT-SIDE BUTTONS (Wishlist, Compare, Share)
class PdpMediaGalleryWidget extends StatefulWidget {
  final ProductDetailEntity product;
  final List<String> activeImages;
  final bool isFavorite;
  final bool isCompared;
  final int cartCount;
  final VoidCallback? onBack;
  final VoidCallback? onSearch;
  final VoidCallback? onCart;
  final VoidCallback onFavorite;
  final VoidCallback onShare;
  final VoidCallback onCompare;
  final ValueChanged<String>? onMediaFilterSelected;
  final Function(int imageIndex)? onImageTap;
  final bool showTopBar;
  final bool showCompareButton;

  const PdpMediaGalleryWidget({
    super.key,
    required this.product,
    required this.activeImages,
    this.isFavorite = false,
    this.isCompared = false,
    this.cartCount = 0,
    this.onBack,
    this.onSearch,
    this.onCart,
    required this.onFavorite,
    required this.onShare,
    required this.onCompare,
    this.onMediaFilterSelected,
    this.onImageTap,
    this.showTopBar = false,
    this.showCompareButton = false,
  });

  @override
  State<PdpMediaGalleryWidget> createState() => _PdpMediaGalleryWidgetState();
}

class _PdpMediaGalleryWidgetState extends State<PdpMediaGalleryWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  String _selectedFilter = 'Images';

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.activeImages.isNotEmpty
        ? widget.activeImages
        : (widget.product.images.isNotEmpty
            ? widget.product.images
            : ['https://via.placeholder.com/400']);

    final int videoCount = widget.product.youtubeVideos.length;
    final int customerPhotoCount = widget.product.allReviewImages.length;

    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          // ── HERO 1:1 IMAGE CAROUSEL WITH OVERLAY CONTROLS ──
          AspectRatio(
            aspectRatio: 1.0,
            child: Stack(
              children: [
                // ── Swipeable PageView ──
                PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => widget.onImageTap?.call(index),
                      child: Container(
                        color: AppColors.white,
                        padding: EdgeInsets.zero,
                        child: AppImage(
                          imageUrl: images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),

                // ── Floating Top Bar: Back Button (Left), Search & Cart (Right) ──
                if (widget.showTopBar && widget.onBack != null)
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
                          onTap: widget.onBack!,
                        ),

                        // Right: Search + Cart
                        Row(
                          children: [
                            if (widget.onSearch != null)
                              _FloatingCircleButton(
                                icon: Icons.search_rounded,
                                size: 18.sp,
                                onTap: widget.onSearch!,
                              ),
                            if (widget.onSearch != null && widget.onCart != null)
                              AppSpacing.sameGroupWidthGap,
                            if (widget.onCart != null)
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  _FloatingCircleButton(
                                    icon: Icons.shopping_bag_outlined,
                                    size: 18.sp,
                                    onTap: widget.onCart!,
                                  ),
                                  if (widget.cartCount > 0)
                                    Positioned(
                                      top: -2.h,
                                      right: -2.w,
                                      child: Container(
                                        padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w / 2),
                                        decoration: BoxDecoration(
                                          color: AppColors.pickabooBlue,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.white,
                                            width: 1.2.w,
                                          ),
                                        ),
                                        child: Text(
                                          '${widget.cartCount}',
                                          style: AppTypography.buttonPrimary,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                // ── Right-Side Action Column: Wishlist (Heart), Compare, Share (Vertically Centered) ──
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: AppSpacing.sameGroupItemSpacing.w,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 1. Wishlist / Heart Button
                        _FloatingCircleButton(
                          icon: widget.isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          iconColor: widget.isFavorite ? AppColors.red : AppColors.navy,
                          onTap: widget.onFavorite,
                        ),
                        AppSpacing.sameGroupHeightGap,

                        // 2. Compare Button (Currently hidden - preserved for future enable)
                        if (widget.showCompareButton) ...[
                          _FloatingCircleButton(
                            icon: Icons.sync_alt_rounded,
                            iconColor: widget.isCompared ? AppColors.pickabooBlue : AppColors.navy,
                            onTap: widget.onCompare,
                          ),
                          AppSpacing.sameGroupHeightGap,
                        ],

                        // 3. Share Button
                        if (widget.product.shareUrl.isNotEmpty)
                          _FloatingCircleButton(
                            icon: Icons.share_outlined,
                            iconColor: AppColors.navy,
                            onTap: widget.onShare,
                          ),
                      ],
                    ),
                  ),
                ),

                // ── Image Index Indicator Badge (Bottom Right) ──
                Positioned(
                  bottom: AppSpacing.sameGroupItemSpacing.h,
                  right: AppSpacing.sameGroupItemSpacing.w,
                  child: Container(
                    padding: AppSpacing.badgePadding,
                    decoration: BoxDecoration(
                      color: AppColors.navy.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(AppRadius.card),
                    ),
                    child: Text(
                      '${_currentIndex + 1}/${images.length}',
                      style: AppTypography.buttonPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── BOTTOM MEDIA PILL FILTERS (Horizontally scrollable if more than 2 types or needs space) ──
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: (constraints.maxWidth - 24.w).clamp(0.0, double.infinity),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _MediaPill(
                        label: 'Product Images (${images.length})',
                        icon: Icons.photo_library_outlined,
                        isSelected: _selectedFilter == 'Images',
                        onTap: () {
                          setState(() => _selectedFilter = 'Images');
                          widget.onMediaFilterSelected?.call('Product Images');
                        },
                      ),
                      if (videoCount > 0) ...[
                        SizedBox(width: 8.w),
                        _MediaPill(
                          label: 'Videos ($videoCount)',
                          icon: Icons.play_circle_outline_rounded,
                          isSelected: _selectedFilter == 'Videos',
                          onTap: () {
                            setState(() => _selectedFilter = 'Videos');
                            widget.onMediaFilterSelected?.call('Videos');
                          },
                        ),
                      ],
                      if (customerPhotoCount > 0) ...[
                        SizedBox(width: 8.w),
                        _MediaPill(
                          label: 'Customer Images ($customerPhotoCount)',
                          icon: Icons.camera_alt_outlined,
                          isSelected: _selectedFilter == 'Customer',
                          onTap: () {
                            setState(() => _selectedFilter = 'Customer');
                            widget.onMediaFilterSelected?.call('Customer Images');
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FloatingCircleButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final VoidCallback onTap;

  const _FloatingCircleButton({
    required this.icon,
    this.size = 18,
    this.iconColor = AppColors.navy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, size: size, color: iconColor),
        ),
      ),
    );
  }
}

class _MediaPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _MediaPill({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceBlue : AppColors.pageBg,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(
            color: isSelected ? AppColors.pickabooBlue : AppColors.border,
            width: isSelected ? 1.2.w : 1.w,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 13.sp,
              color: isSelected ? AppColors.pickabooBlue : AppColors.muted,
            ),
            SizedBox(width: 4.w),
            Text(
              label,
              style: AppTypography.brandActionText,
            ),
          ],
        ),
      ),
    );
  }
}
