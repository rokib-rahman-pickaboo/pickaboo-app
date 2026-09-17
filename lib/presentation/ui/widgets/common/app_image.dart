import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';

typedef AppImageBuilder =
    Widget Function(BuildContext context, ImageProvider imageProvider);

class AppImage extends StatefulWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Color? color;
  final int maxAutoRetries;
  final Duration retryDelay;
  final bool useMemCache;
  final AppImageBuilder? imageBuilder;

  final int? maxWidthDiskCache;

  final int? maxHeightDiskCache;
  final Duration fadeInDuration;
  final Function(Object)? errorListener;

  final int? cacheWidth;
  final FilterQuality filterQuality;
  final bool constrainHeightInMemCache;

  /// Returns a [CachedNetworkImageProvider] with URL normalization applied.
  /// Use this when an [ImageProvider] is needed instead of a widget
  /// (e.g., [PhotoView], [DecorationImage]).
  static CachedNetworkImageProvider provider(String url) {
    return CachedNetworkImageProvider(_normalizeUrlStatic(url));
  }

  static String _normalizeUrlStatic(String url) {
    if (url.isEmpty) return '';
    final trimmed = url.trim();
    final lower = trimmed.toLowerCase();
    if (lower.contains('placeholder/.jpg') ||
        lower.contains('placeholder/.png') ||
        lower.contains('magento_catalog/images/product/placeholder') ||
        lower.contains('/placeholder/default') ||
        lower.contains('pickaboo-plholder') ||
        lower.contains('plholder') ||
        lower.contains('/placeholder/') ||
        lower.endsWith('/.jpg') ||
        lower.endsWith('/.png')) {
      return '';
    }
    if (trimmed.startsWith('http')) return trimmed;
    if (trimmed.startsWith('//')) return 'https:$trimmed';
    final cleanRelativePath = trimmed.startsWith('/') ? trimmed : '/$trimmed';
    return '$_cleanBaseUrl$cleanRelativePath';
  }

  static final String _cleanBaseUrl = ApiEndpoints.baseUrl.endsWith('/')
      ? ApiEndpoints.baseUrl.substring(0, ApiEndpoints.baseUrl.length - 1)
      : ApiEndpoints.baseUrl;

  const AppImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.color,
    this.maxAutoRetries = 2,
    this.retryDelay = const Duration(seconds: 1),
    this.useMemCache = true,
    this.imageBuilder,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.fadeInDuration = const Duration(milliseconds: 120),
    this.errorListener,
    this.cacheWidth,
    this.filterQuality = FilterQuality.medium,
    this.constrainHeightInMemCache = true,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  int _retryCount = 0;
  Key _imageKey = UniqueKey();
  Timer? _retryTimer;

  @override
  void dispose() {
    _retryTimer?.cancel();
    super.dispose();
  }

  void _retry() {
    _retryTimer?.cancel();
    if (mounted) {
      setState(() {
        _imageKey = UniqueKey();
        _retryCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final validUrl = widget.imageUrl != null
        ? AppImage._normalizeUrlStatic(widget.imageUrl!)
        : '';

    if (validUrl.isEmpty) {
      return widget.errorWidget ?? _buildDefaultError(context, manual: false);
    }

    final double devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    final int? targetWidth =
        widget.cacheWidth ??
        ((widget.width != null && widget.width!.isFinite)
            ? (widget.width! * devicePixelRatio).round()
            : null);
    final int? targetHeight = (widget.height != null && widget.height!.isFinite)
        ? (widget.height! * devicePixelRatio).round()
        : null;

    return CachedNetworkImage(
      key: _imageKey,
      imageUrl: validUrl,
      cacheKey: _retryCount > 0 ? '${validUrl}_v$_retryCount' : null,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      filterQuality: widget.filterQuality,
      memCacheWidth: widget.useMemCache ? targetWidth : null,
      memCacheHeight:
          (widget.useMemCache && widget.constrainHeightInMemCache)
              ? targetHeight
              : null,
      maxWidthDiskCache: widget.maxWidthDiskCache,
      maxHeightDiskCache: widget.maxHeightDiskCache,
      fadeInDuration: widget.fadeInDuration,
      imageBuilder: widget.imageBuilder,
      placeholder: (context, url) =>
          widget.placeholder ?? _buildLoadingPlaceholder(),
      errorListener: (e) {
        if (widget.errorListener != null) widget.errorListener!(e);
        if (kDebugMode) {
          if (e is SocketException) {
            debugPrint('AppImage Speed Tip: Check connection for ${e.address}');
          } else {
            debugPrint('AppImage Exception: $e');
          }
        }
      },
      errorWidget: (context, url, error) {
        final errorString = error.toString();
        final is404 = errorString.contains('statusCode: 404');

        if (!is404 && _retryCount < widget.maxAutoRetries) {
          if (_retryTimer == null || !_retryTimer!.isActive) {
            _retryTimer = Timer(widget.retryDelay, _retry);
          }
          return widget.placeholder ?? _buildLoadingPlaceholder();
        }
        return widget.errorWidget ?? _buildDefaultError(context, manual: true);
      },
    );
  }

  Widget _buildLoadingPlaceholder() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = (widget.width?.isFinite ?? false)
            ? widget.width
            : (constraints.hasBoundedWidth ? constraints.maxWidth : 0.0);
        final height = (widget.height?.isFinite ?? false)
            ? widget.height
            : (constraints.hasBoundedHeight ? constraints.maxHeight : 0.0);

        return Center(
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: AppRadius.badgeRadius,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDefaultError(BuildContext context, {bool manual = false}) {
    return GestureDetector(
      onTap: manual
          ? () {
              if (mounted) {
                setState(() {
                  _retryCount = 0;
                  _imageKey = UniqueKey();
                });
              }
            }
          : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: (widget.width?.isFinite ?? false) ? widget.width : null,
        height: (widget.height?.isFinite ?? false) ? widget.height : null,
        color: AppColors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.broken_image_outlined,
                color: AppColors.mutedLight,
                size: 20.sp,
              ),
              if (manual) ...[
                SizedBox(height: 4.h),
                Icon(Icons.refresh, size: 14.sp, color: AppColors.mutedLight),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
