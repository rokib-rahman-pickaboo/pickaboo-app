// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Centralized widget for displaying user profile avatars across the app.
class UserImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final String? name;
  final double size;
  final bool showStatusDot;
  final bool showCameraOverlay;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final Color? textColor;

  const UserImageWidget({
    super.key,
    this.imageUrl,
    this.initials,
    this.name,
    this.size = 36.0,
    this.showStatusDot = false,
    this.showCameraOverlay = false,
    this.onTap,
    this.backgroundColor = AppColors.surfaceBlue,
    this.borderColor = AppColors.pickabooBlue,
    this.borderWidth = 1.5,
    this.textColor = AppColors.pickabooBlue,
  });

  /// Quick constructor factory for Top App Bar avatar (small 32px with status dot & consistent blue border)
  const UserImageWidget.appBar({
    super.key,
    this.imageUrl,
    this.initials,
    this.name,
    this.size = 32.0,
    this.showStatusDot = true,
    this.onTap,
    this.borderColor = AppColors.pickabooBlue,
    this.borderWidth = 1.5,
  })  : showCameraOverlay = false,
        backgroundColor = AppColors.surfaceBlue,
        textColor = AppColors.pickabooBlue;

  /// Quick constructor factory for Profile Header / Account Info avatar (large 52px-76px with blue border)
  const UserImageWidget.profileHeader({
    super.key,
    this.imageUrl,
    this.initials,
    this.name,
    this.size = 52.0,
    this.showCameraOverlay = false,
    this.onTap,
    this.borderColor = AppColors.pickabooBlue,
    this.borderWidth = 2.0,
  })  : showStatusDot = false,
        backgroundColor = AppColors.surfaceBlue,
        textColor = AppColors.pickabooBlue;

  String _getInitials() {
    if (initials != null && initials!.isNotEmpty) {
      return initials!;
    }
    if (name != null && name!.trim().isNotEmpty) {
      final parts = name!.trim().split(' ');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      } else if (parts.isNotEmpty && parts[0].isNotEmpty) {
        return parts[0][0].toUpperCase();
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final computedInitials = _getInitials();
    final bgCol =
        backgroundColor ?? AppColors.pickabooBlue.withValues(alpha: 0.12);
    final borderCol = borderColor;

    Widget avatarContent;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatarContent = ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.cover,
          width: size,
          height: size,
          placeholder: (context, url) => AppLoader.inline(
            size: size * 0.4,
            padding: EdgeInsets.zero,
          ),
          errorWidget: (context, url, error) => Center(
            child: Text(
              computedInitials.isNotEmpty ? computedInitials : 'P',
              style: AppTypography.brandActionText,
            ),
          ),
        ),
      );
    } else if (computedInitials.isNotEmpty) {
      avatarContent = Center(
        child: Text(
          computedInitials,
          style: AppTypography.brandActionText,
        ),
      );
    } else {
      avatarContent = Center(
        child: Icon(
          Icons.person_rounded,
          size: size * 0.55,
          color: textColor ?? AppColors.pickabooBlue,
        ),
      );
    }

    Widget avatarBox = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgCol,
        shape: BoxShape.circle,
        border: borderCol != null && borderWidth > 0
            ? Border.all(color: borderCol, width: borderWidth)
            : null,
      ),
      child: avatarContent,
    );

    Widget fullWidget;

    if (showStatusDot) {
      fullWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          avatarBox,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.25,
              height: size * 0.25,
              decoration: BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1.5),
              ),
            ),
          ),
        ],
      );
    } else if (showCameraOverlay) {
      fullWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          avatarBox,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(size * 0.06),
              decoration: const BoxDecoration(
                color: AppColors.pickabooBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_rounded,
                color: AppColors.white,
                size: size * 0.2,
              ),
            ),
          ),
        ],
      );
    } else {
      fullWidget = avatarBox;
    }

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: fullWidget,
      );
    }

    return fullWidget;
  }
}
