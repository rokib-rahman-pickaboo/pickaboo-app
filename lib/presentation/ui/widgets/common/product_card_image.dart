import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// Centralized product image widget for product cards across sliders and grids.
/// Automatically detects placeholder/broken images and resolves the real product
/// image in the background via [ProductImageResolver] with memory caching.
class ProductCardImage extends StatefulWidget {
  final int productId;
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final int? cacheWidth;
  final BorderRadiusGeometry? borderRadius;

  const ProductCardImage({
    super.key,
    required this.productId,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.cacheWidth,
    this.borderRadius,
  });

  @override
  State<ProductCardImage> createState() => _ProductCardImageState();
}

class _ProductCardImageState extends State<ProductCardImage> {
  String? _effectiveUrl;
  bool _isResolving = false;

  @override
  void initState() {
    super.initState();
    _checkAndResolve();
  }

  @override
  void didUpdateWidget(covariant ProductCardImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.productId != widget.productId ||
        oldWidget.imageUrl != widget.imageUrl) {
      _checkAndResolve();
    }
  }

  void _checkAndResolve() {
    final raw = widget.imageUrl;

    // 1. If raw imageUrl is already a valid real image URL
    if (!ProductImageResolver.isPlaceholderOrBroken(raw)) {
      _effectiveUrl = raw;
      if (widget.productId > 0) {
        ProductImageResolver.cacheImage(widget.productId, raw);
      }
      return;
    }

    // 2. Check if already resolved in ProductImageResolver memory cache
    final cached = ProductImageResolver.getCachedImage(widget.productId);
    if (cached != null && !ProductImageResolver.isPlaceholderOrBroken(cached)) {
      _effectiveUrl = cached;
      return;
    }

    // 3. Resolve asynchronously if productId is valid
    if (widget.productId > 0) {
      _isResolving = true;
      ProductImageResolver.resolveImage(
        productId: widget.productId,
        currentUrl: raw,
      ).then((res) {
        if (mounted && res != null && !ProductImageResolver.isPlaceholderOrBroken(res)) {
          setState(() {
            _effectiveUrl = res;
            _isResolving = false;
          });
        } else if (mounted) {
          setState(() {
            _isResolving = false;
          });
        }
      }).catchError((_) {
        if (mounted) {
          setState(() {
            _isResolving = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_effectiveUrl != null &&
        !ProductImageResolver.isPlaceholderOrBroken(_effectiveUrl)) {
      content = AppImage(
        imageUrl: _effectiveUrl!,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        cacheWidth: widget.cacheWidth,
      );
    } else if (_isResolving) {
      content = Container(
        width: widget.width,
        height: widget.height,
        color: AppColors.pageBg,
        child: const Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 1.8,
              color: AppColors.primary,
            ),
          ),
        ),
      );
    } else {
      content = Container(
        width: widget.width,
        height: widget.height,
        color: AppColors.pageBg,
        child: Center(
          child: Icon(
            Icons.image_outlined,
            color: AppColors.mutedLight,
            size: 24.sp,
          ),
        ),
      );
    }

    if (widget.borderRadius != null) {
      return ClipRRect(
        borderRadius: widget.borderRadius!,
        child: content,
      );
    }

    return content;
  }
}
