// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/pages/product_detail_page/dialog/youtube_player_dialog.dart';

enum ProductMediaType { productImages, videos, customerImages }

class ProductMediaDialog extends StatefulWidget {
  final ProductMediaType initialType;
  final int initialIndex;
  final List<String> productImages;
  final List<String> videoThumbnails;

  final List<String> videoIds;
  final List<String> customerImages;

  const ProductMediaDialog({
    super.key,
    this.initialType = ProductMediaType.productImages,
    this.initialIndex = 0,
    required this.productImages,
    required this.videoThumbnails,
    this.videoIds = const [],
    required this.customerImages,
  });

  static Future<void> show(
    BuildContext context, {
    ProductMediaType initialType = ProductMediaType.productImages,
    int initialIndex = 0,
    required List<String> productImages,
    required List<String> videoThumbnails,
    List<String> videoIds = const [],
    required List<String> customerImages,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => ProductMediaDialog(
        initialType: initialType,
        initialIndex: initialIndex,
        productImages: productImages,
        videoThumbnails: videoThumbnails,
        videoIds: videoIds,
        customerImages: customerImages,
      ),
    );
  }

  @override
  State<ProductMediaDialog> createState() => _ProductMediaDialogState();
}

class _ProductMediaDialogState extends State<ProductMediaDialog> {
  late ProductMediaType _currentType;
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentType = _resolveInitialType();
    _currentIndex = _currentType == widget.initialType
        ? widget.initialIndex
        : 0;
    _pageController = PageController(initialPage: _currentIndex);
  }

  ProductMediaType _resolveInitialType() {
    bool hasContent(ProductMediaType t) {
      switch (t) {
        case ProductMediaType.productImages:
          return widget.productImages.isNotEmpty;
        case ProductMediaType.videos:
          return widget.videoThumbnails.isNotEmpty;
        case ProductMediaType.customerImages:
          return widget.customerImages.isNotEmpty;
      }
    }

    if (hasContent(widget.initialType)) return widget.initialType;
    return ProductMediaType.values.firstWhere(
      hasContent,
      orElse: () => widget.initialType,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> get _currentList {
    switch (_currentType) {
      case ProductMediaType.productImages:
        return widget.productImages;
      case ProductMediaType.videos:
        return widget.videoThumbnails;
      case ProductMediaType.customerImages:
        return widget.customerImages;
    }
  }

  String get _title {
    switch (_currentType) {
      case ProductMediaType.productImages:
        return "Images";
      case ProductMediaType.videos:
        return "Videos";
      case ProductMediaType.customerImages:
        return "Customer Images";
    }
  }

  void _onCategoryChanged(ProductMediaType type) {
    setState(() {
      _currentType = type;
      _currentIndex = 0;
      _pageController.jumpToPage(0);
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _playVideoAt(int index) {
    if (index < 0 || index >= widget.videoIds.length) return;
    final id = widget.videoIds[index];
    if (id.isEmpty) return;
    YoutubePlayerDialog.show(context, videoId: id);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 8.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      backgroundColor: AppColors.white,
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              _buildHeader(context, textStyle),
              const Divider(height: 1),

              SizedBox(height: 16.h),
              _buildFilterChips(textStyle),
              SizedBox(height: 16.h),

              Expanded(child: _buildMainViewer()),

              const Divider(height: 1, color: AppColors.border),
              _buildThumbnailGallery(),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    AppTextStyles textStyle,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _title,
            style: textStyle.headingMedium.copyWith(
              color: AppColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.text, size: 24.sp),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(AppTextStyles textStyle) {
    final chips = <Widget>[
      if (widget.productImages.isNotEmpty)
        _CategoryChip(
          label: "Product Images (${widget.productImages.length})",
          isSelected: _currentType == ProductMediaType.productImages,
          onTap: () => _onCategoryChanged(ProductMediaType.productImages),
        ),
      if (widget.videoThumbnails.isNotEmpty)
        _CategoryChip(
          label: "Videos (${widget.videoThumbnails.length})",
          isSelected: _currentType == ProductMediaType.videos,
          onTap: () => _onCategoryChanged(ProductMediaType.videos),
        ),
      if (widget.customerImages.isNotEmpty)
        _CategoryChip(
          label: "Customer Images (${widget.customerImages.length})",
          isSelected: _currentType == ProductMediaType.customerImages,
          onTap: () => _onCategoryChanged(ProductMediaType.customerImages),
        ),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          for (int i = 0; i < chips.length; i++) ...[
            if (i > 0) SizedBox(width: 8.w),
            chips[i],
          ],
        ],
      ),
    );
  }

  Widget _buildMainViewer() {
    final list = _currentList;

    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AppImage(
                    imageUrl: list[index],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  if (_currentType == ProductMediaType.videos)
                    GestureDetector(
                      onTap: () => _playVideoAt(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.black.withValues(alpha: 0.35),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(20.w),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: AppColors.white,
                          size: 64.sp,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),

        if (list.length > 1) ...[
          Positioned(
            left: 16.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: _NavButton(
                icon: Icons.chevron_left,
                onTap: _currentIndex > 0
                    ? () => _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    : null,
              ),
            ),
          ),
          Positioned(
            right: 16.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: _NavButton(
                icon: Icons.chevron_right,
                onTap: _currentIndex < (list.length - 1)
                    ? () => _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    : null,
              ),
            ),
          ),
        ],

        if (_currentType == ProductMediaType.videos)
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(list.length, (index) {
                return Container(
                  width: 8.w,
                  height: 8.w,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? AppColors.text
                        : AppColors.muted.withValues(alpha: 0.3),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }

  Widget _buildThumbnailGallery() {
    final list = _currentList;

    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final isSelected = _currentIndex == index;

          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 66.w,
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.pageBg : AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: isSelected ? AppColors.pickabooBlue : AppColors.border,
                  width: isSelected ? 1.5.w : 0.5.w,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: AppImage(
                  imageUrl: list[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surfaceBlue : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColors.pickabooBlue : AppColors.border,
            width: 1.2.w,
          ),
        ),
        child: Text(
          label,
          style: textStyle.bodySmall.copyWith(
            color: isSelected ? AppColors.pickabooBlue : AppColors.text,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: AppColors.pageBg.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          icon,
          color: onTap != null
              ? AppColors.text
              : AppColors.muted.withValues(alpha: 0.3),
          size: 28.sp,
        ),
      ),
    );
  }
}
