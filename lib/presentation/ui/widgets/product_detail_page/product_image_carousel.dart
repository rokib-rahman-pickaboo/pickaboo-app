import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  final VoidCallback onImageTap;
  final VoidCallback onFavoriteTap;
  final ValueChanged<bool> onCompareTap;
  final VoidCallback onShareTap;
  final bool isFavorite;
  final int productId;
  final bool showShareButton;
  final bool showCompareButton;

  final bool flexible;

  const ProductImageCarousel({
    super.key,
    required this.images,
    required this.onImageTap,
    required this.onFavoriteTap,
    required this.onCompareTap,
    required this.onShareTap,
    this.isFavorite = false,
    required this.productId,
    this.showShareButton = true,
    this.showCompareButton = false,
    this.flexible = false,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return _buildPlaceholder();
    }

    return Container(
      height: widget.flexible ? null : 350.h,
      color: AppColors.white,
      child: Stack(
        children: [
          GestureDetector(
            onTap: widget.onImageTap,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return AppImage(
                  imageUrl: widget.images[index],
                  fit: BoxFit.contain,
                );
              },
            ),
          ),

          Positioned(
            right: 16.w,
            top: 16.h,
            child: Column(
              children: [
                AppBarButton(
                  onPressed: widget.onFavoriteTap,
                  iconPath: widget.isFavorite
                      ? "assets/new/svg/favorited_icon.svg"
                      : 'assets/new/svg/favorite_icon.svg',
                  width: 22.w,
                  height: 20.h,
                  iconColor: widget.isFavorite ? AppColors.red : AppColors.pickabooBlue,
                ),
                if (widget.showCompareButton)
                  BlocBuilder<CompareBloc, CompareState>(
                    builder: (context, compareState) {
                      final isCompared = compareState.products.any((p) => p.id == widget.productId);
                      return AppBarButton(
                        onPressed: () => widget.onCompareTap(isCompared),
                        iconPath: 'assets/new/svg/compare_icon.svg',
                        width: 22.w,
                        height: 20.h,
                        iconColor: isCompared ? AppColors.orange : AppColors.pickabooBlue,
                      );
                    },
                  ),
                if (widget.showShareButton == true)
                  AppBarButton(
                    onPressed: widget.onShareTap,
                    iconPath: 'assets/new/svg/link_share_icon.svg',
                    width: 22.w,
                    height: 20.h,
                    iconColor: AppColors.pickabooBlue,
                  ),
              ],
            ),
          ),

          if (widget.images.length > 1)
            Positioned(
              bottom: 16.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    width: _currentPage == index ? 24.w : 8.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: _currentPage == index
                          ? AppColors.pickabooBlue
                          : AppColors.muted.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: 400.h,
      color: AppColors.pageBg,
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          size: 100.sp,
          color: AppColors.muted,
        ),
      ),
    );
  }
}
