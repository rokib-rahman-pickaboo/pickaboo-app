// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';

/// Universal, design-token compliant empty state widget for Pickaboo.
///
/// Supports:
/// - Box and Sliver layouts ([AppEmptyView.sliver])
/// - Standard full-page, embedded compact mode ([isCompact]), and card mode ([useCard])
/// - SVG illustrations, standard icons, image assets, or custom illustrations
/// - Primary and optional secondary CTA buttons
/// - Domain factory constructors for Cart, Category, Search, Wishlist, Orders, etc.
class AppEmptyView extends StatelessWidget {
  /// Optional standard icon (rendered within a softly tinted container circle).
  final IconData? icon;

  /// Optional SVG asset path (e.g. 'assets/new/svg/empty_cart_icon.svg').
  final String? svgAsset;

  /// Optional bitmap image asset path.
  final String? imageAsset;

  /// Optional completely custom illustration widget (e.g. Lottie or composite).
  final Widget? customIllustration;

  /// Icon color override (defaults to [AppColors.pickabooBlue]).
  final Color? iconColor;

  /// Icon background container tint color override (defaults to 10% alpha pickabooBlue).
  final Color? iconBackgroundColor;

  /// Explicit icon size (defaults to 44.sp for standard, 32.sp for compact).
  final double? iconSize;

  /// Primary bold title for the empty state.
  final String title;

  /// Secondary descriptive text explaining what happened and how to proceed.
  final String? subtitle;

  /// Optional custom child widget between subtitle and action buttons.
  final Widget? customContent;

  /// Primary call-to-action button label.
  final String? primaryButtonText;

  /// Optional icon for primary CTA button.
  final IconData? primaryButtonIcon;

  /// Callback when primary CTA is tapped.
  final VoidCallback? onPrimaryAction;

  /// Optional secondary button label (rendered as OutlinedButton).
  final String? secondaryButtonText;

  /// Optional icon for secondary CTA button.
  final IconData? secondaryButtonIcon;

  /// Callback when secondary CTA is tapped.
  final VoidCallback? onSecondaryAction;

  /// When true, renders with tighter padding and smaller graphics.
  /// Ideal for embedded sections like [SecondaryHomeWidget], tabs, or bottom sheets.
  final bool isCompact;

  /// When true, encloses the content inside an [AppCard] surface with border & shadow.
  final bool useCard;

  /// Custom padding override.
  final EdgeInsetsGeometry? padding;

  /// When true, wraps content in [SingleChildScrollView] to prevent small-screen overflow.
  final bool scrollable;

  const AppEmptyView({
    super.key,
    this.icon,
    this.svgAsset,
    this.imageAsset,
    this.customIllustration,
    this.iconColor,
    this.iconBackgroundColor,
    this.iconSize,
    required this.title,
    this.subtitle,
    this.customContent,
    this.primaryButtonText,
    this.primaryButtonIcon,
    this.onPrimaryAction,
    this.secondaryButtonText,
    this.secondaryButtonIcon,
    this.onSecondaryAction,
    this.isCompact = false,
    this.useCard = false,
    this.padding,
    this.scrollable = false,
  });

  // ===========================================================================
  // ── SLIVER WRAPPER FACTORY ────────────────────────────────────────────────
  // ===========================================================================

  /// Renders [AppEmptyView] wrapped inside a sliver for direct use in [CustomScrollView].
  static Widget sliver({
    Key? key,
    IconData? icon,
    String? svgAsset,
    String? imageAsset,
    Widget? customIllustration,
    Color? iconColor,
    Color? iconBackgroundColor,
    double? iconSize,
    required String title,
    String? subtitle,
    Widget? customContent,
    String? primaryButtonText,
    IconData? primaryButtonIcon,
    VoidCallback? onPrimaryAction,
    String? secondaryButtonText,
    IconData? secondaryButtonIcon,
    VoidCallback? onSecondaryAction,
    bool isCompact = false,
    bool useCard = false,
    bool fillRemaining = false,
    EdgeInsetsGeometry? padding,
  }) {
    final view = AppEmptyView(
      key: key,
      icon: icon,
      svgAsset: svgAsset,
      imageAsset: imageAsset,
      customIllustration: customIllustration,
      iconColor: iconColor,
      iconBackgroundColor: iconBackgroundColor,
      iconSize: iconSize,
      title: title,
      subtitle: subtitle,
      customContent: customContent,
      primaryButtonText: primaryButtonText,
      primaryButtonIcon: primaryButtonIcon,
      onPrimaryAction: onPrimaryAction,
      secondaryButtonText: secondaryButtonText,
      secondaryButtonIcon: secondaryButtonIcon,
      onSecondaryAction: onSecondaryAction,
      isCompact: isCompact,
      useCard: useCard,
      padding: padding,
    );

    if (fillRemaining) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: view),
      );
    }

    return SliverToBoxAdapter(child: view);
  }

  // ===========================================================================
  // ── DOMAIN FACTORY CONSTRUCTORS ───────────────────────────────────────────
  // ===========================================================================

  /// Empty cart state factory.
  factory AppEmptyView.cart({
    Key? key,
    VoidCallback? onContinueShopping,
  }) {
    return AppEmptyView(
      key: key,
      svgAsset: 'assets/new/svg/empty_cart_icon.svg',
      title: AppStrings.emptyCartTitle,
      subtitle: AppStrings.emptyCartSubtitle,
      primaryButtonText: AppStrings.continueShopping,
      primaryButtonIcon: Icons.shopping_bag_outlined,
      onPrimaryAction: onContinueShopping,
      scrollable: true,
    );
  }

  /// Category products empty state (for SecondaryHomeWidget & CategoryProductPage).
  factory AppEmptyView.categoryProducts({
    Key? key,
    required String categoryName,
    bool isFiltered = false,
    String? errorMessage,
    VoidCallback? onResetFilters,
    VoidCallback? onExplore,
    bool isCompact = false,
    EdgeInsetsGeometry? padding,
  }) {
    if (isFiltered) {
      return AppEmptyView(
        key: key,
        icon: Icons.search_off_rounded,
        title: 'No Matching Products',
        subtitle: errorMessage ??
            'No products match your selected filters in $categoryName.',
        primaryButtonText: 'Reset All Filters',
        primaryButtonIcon: Icons.refresh_rounded,
        onPrimaryAction: onResetFilters,
        isCompact: isCompact,
        padding: padding,
      );
    }

    return AppEmptyView(
      key: key,
      icon: Icons.inventory_2_outlined,
      title: 'No Products in $categoryName',
      subtitle: errorMessage ??
          'There are currently no products available in $categoryName. Check back soon or explore other categories!',
      primaryButtonText: onExplore != null ? 'Explore Other Categories' : null,
      primaryButtonIcon: Icons.explore_outlined,
      onPrimaryAction: onExplore,
      isCompact: isCompact,
      padding: padding,
    );
  }

  /// Search results empty state.
  factory AppEmptyView.search({
    Key? key,
    String? query,
    bool hasActiveFilters = false,
    VoidCallback? onClearFilters,
    bool isCompact = false,
    EdgeInsetsGeometry? padding,
  }) {
    if (hasActiveFilters) {
      return AppEmptyView(
        key: key,
        icon: Icons.inventory_2_outlined,
        title: 'No Products Match Filters',
        subtitle: 'Try removing a filter to see more products.',
        primaryButtonText: 'Clear All Filters',
        primaryButtonIcon: Icons.filter_alt_off_rounded,
        onPrimaryAction: onClearFilters,
        isCompact: isCompact,
        padding: padding,
      );
    }

    final hasQuery = query != null && query.trim().isNotEmpty;
    return AppEmptyView(
      key: key,
      icon: Icons.search_off_rounded,
      title: 'No Results Found',
      subtitle: hasQuery
          ? 'We couldn\'t find any matches for "$query". Check for typos or try more general keywords.'
          : 'No products found matching your search.',
      isCompact: isCompact,
      padding: padding,
    );
  }

  /// Initial search prompt state (shown before any query has been entered).
  factory AppEmptyView.searchPrompt({
    Key? key,
    String? title,
    String? subtitle,
    bool isCompact = false,
    EdgeInsetsGeometry? padding,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.search_rounded,
      title: title ?? 'Search for Products',
      subtitle: subtitle ??
          'Start typing to search for smartphones, gadgets, electronics and more on Pickaboo.',
      isCompact: isCompact,
      padding: padding,
    );
  }

  /// Wishlist empty state.
  factory AppEmptyView.wishlist({
    Key? key,
    VoidCallback? onStartShopping,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.favorite_outline_rounded,
      title: 'Your Wishlist is Empty',
      subtitle: 'Tap the heart icon on any product to save it for later.',
      primaryButtonText: AppStrings.continueShopping,
      primaryButtonIcon: Icons.shopping_bag_outlined,
      onPrimaryAction: onStartShopping,
      scrollable: true,
    );
  }

  /// Orders empty state.
  factory AppEmptyView.orders({
    Key? key,
    VoidCallback? onStartShopping,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.shopping_bag_outlined,
      title: 'No Orders Found',
      subtitle:
          'You haven\'t placed any orders yet. Explore our curated products and start shopping!',
      primaryButtonText: 'Start Shopping',
      primaryButtonIcon: Icons.shopping_bag_outlined,
      onPrimaryAction: onStartShopping,
      useCard: true,
    );
  }

  /// Reviews empty state.
  factory AppEmptyView.reviews({
    Key? key,
    VoidCallback? onViewOrders,
  }) {
    return AppEmptyView(
      key: key,
      svgAsset: 'assets/new/svg/empty_review_icon.svg',
      icon: Icons.rate_review_outlined,
      title: 'No Reviews Yet',
      subtitle:
          'You haven\'t written any product reviews yet. Leave reviews on your purchased items to win Club Points!',
      primaryButtonText: onViewOrders != null ? 'View Your Orders' : null,
      primaryButtonIcon: Icons.shopping_bag_outlined,
      onPrimaryAction: onViewOrders,
      useCard: true,
    );
  }

  /// Support tickets empty state.
  factory AppEmptyView.tickets({
    Key? key,
    VoidCallback? onCreateTicket,
    bool useCard = true,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.confirmation_number_outlined,
      title: 'No Support Tickets',
      subtitle:
          'You do not have any open tickets.\nCreate a ticket to get assistance from our support team.',
      primaryButtonText: onCreateTicket != null ? 'Create Ticket' : null,
      primaryButtonIcon: Icons.add_rounded,
      onPrimaryAction: onCreateTicket,
      useCard: useCard,
    );
  }

  /// Saved addresses empty state.
  factory AppEmptyView.addresses({
    Key? key,
    VoidCallback? onAddAddress,
    bool useCard = true,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.location_on_outlined,
      title: 'No Addresses Saved',
      subtitle:
          'Please add your shipping and billing address for a seamless checkout experience.',
      primaryButtonText: onAddAddress != null ? 'Add New Address' : null,
      primaryButtonIcon: Icons.add_rounded,
      onPrimaryAction: onAddAddress,
      useCard: useCard,
    );
  }

  /// Saved payment methods empty state.
  factory AppEmptyView.savedPayments({
    Key? key,
    bool useCard = true,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.account_balance_wallet_outlined,
      title: 'No Saved Payment Methods',
      subtitle:
          'Wallets you save during checkout will show up here for faster payments next time.',
      useCard: useCard,
    );
  }

  /// Product comparison empty state.
  factory AppEmptyView.compare({
    Key? key,
    VoidCallback? onAddProduct,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.compare_arrows_rounded,
      title: 'No Products to Compare',
      subtitle:
          'Select items while browsing or search products directly to compare features side-by-side.',
      primaryButtonText: onAddProduct != null ? 'Add Product to Compare' : null,
      primaryButtonIcon: Icons.add_rounded,
      onPrimaryAction: onAddProduct,
    );
  }

  /// Notifications empty state.
  factory AppEmptyView.notifications({
    Key? key,
    VoidCallback? onExplore,
  }) {
    return AppEmptyView(
      key: key,
      icon: Icons.notifications_none_rounded,
      title: 'No Notifications',
      subtitle:
          'You\'re all caught up! Updates, order tracking, and exclusive deals will appear here.',
      primaryButtonText: onExplore != null ? 'Explore Pickaboo' : null,
      primaryButtonIcon: Icons.shopping_bag_outlined,
      onPrimaryAction: onExplore,
    );
  }

  // ===========================================================================
  // ── BUILD PIPELINE ────────────────────────────────────────────────────────
  // ===========================================================================

  @override
  Widget build(BuildContext context) {
    Widget content = _buildBody(context);

    if (useCard) {
      content = Padding(
        padding: padding ??
            EdgeInsets.all(
              isCompact
                  ? AppSpacing.sameGroupItemSpacing.w
                  : AppSpacing.sameGroupItemSpacing.w * 3,
            ),
        child: AppCard(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: isCompact ? 24.h : 36.h,
          ),
          child: content,
        ),
      );
    } else if (padding != null) {
      content = Padding(
        padding: padding!,
        child: content,
      );
    }

    if (scrollable) {
      return Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 16.w : 24.w,
            vertical: isCompact ? 16.h : 32.h,
          ),
          child: content,
        ),
      );
    }

    return Center(child: content);
  }

  Widget _buildBody(BuildContext context) {
    final effectiveGraphic = _buildGraphic(context);
    final hasActions = primaryButtonText != null || secondaryButtonText != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (effectiveGraphic != null) ...[
          effectiveGraphic,
          SizedBox(height: isCompact ? 14.h : 20.h),
        ],
        Text(
          title,
          textAlign: TextAlign.center,
          style: isCompact
              ? AppTypography.sectionTitle
              : AppTypography.pageTitle.copyWith(fontSize: 18.sp),
        ),
        if (subtitle != null && subtitle!.isNotEmpty) ...[
          SizedBox(height: isCompact ? 6.h : 8.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact ? 12.w : 24.w,
            ),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: isCompact
                  ? AppTypography.bodyMuted
                  : AppTypography.bodyMuted.copyWith(fontSize: 12.sp),
            ),
          ),
        ],
        if (customContent != null) ...[
          SizedBox(height: 12.h),
          customContent!,
        ],
        if (hasActions) ...[
          SizedBox(height: isCompact ? 16.h : 24.h),
          _buildActionButtons(context),
        ],
      ],
    );
  }

  Widget? _buildGraphic(BuildContext context) {
    if (customIllustration != null) {
      return customIllustration;
    }

    if (svgAsset != null && svgAsset!.isNotEmpty) {
      final svgSize = isCompact ? 80.w : 130.w;
      return SvgPicture.asset(
        svgAsset!,
        width: svgSize,
        height: svgSize,
        fit: BoxFit.contain,
      );
    }

    if (imageAsset != null && imageAsset!.isNotEmpty) {
      final imgSize = isCompact ? 80.w : 130.w;
      return Image.asset(
        imageAsset!,
        width: imgSize,
        height: imgSize,
        fit: BoxFit.contain,
      );
    }

    if (icon != null) {
      final effectiveIconSize = iconSize ?? (isCompact ? 32.sp : 44.sp);
      final containerPadding = isCompact ? 12.w : 16.w;
      final effectiveColor = iconColor ?? AppColors.pickabooBlue;
      final effectiveBgColor = iconBackgroundColor ??
          AppColors.pickabooBlue.withValues(alpha: 0.08);

      return Container(
        padding: EdgeInsets.all(containerPadding),
        decoration: BoxDecoration(
          color: effectiveBgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: effectiveIconSize,
          color: effectiveColor,
        ),
      );
    }

    return null;
  }

  Widget _buildActionButtons(BuildContext context) {
    final List<Widget> buttons = [];

    if (primaryButtonText != null) {
      final effectiveOnPressed = onPrimaryAction ?? () => context.go(Routes.home);
      final buttonHeight = isCompact ? 40.h : 46.h;

      final Widget primaryBtn;
      if (primaryButtonIcon != null) {
        primaryBtn = ElevatedButton.icon(
          onPressed: effectiveOnPressed,
          icon: Icon(
            primaryButtonIcon,
            size: 16.sp,
            color: AppColors.white,
          ),
          label: Text(
            primaryButtonText!,
            style: AppTypography.buttonPrimary,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pickabooBlue,
            foregroundColor: AppColors.white,
            elevation: 0,
            minimumSize: isCompact ? null : Size(180.w, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: isCompact ? 8.h : 12.h,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.buttonRadius,
            ),
          ),
        );
      } else {
        primaryBtn = ElevatedButton(
          onPressed: effectiveOnPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pickabooBlue,
            foregroundColor: AppColors.white,
            elevation: 0,
            minimumSize: isCompact ? null : Size(180.w, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: isCompact ? 8.h : 12.h,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.buttonRadius,
            ),
          ),
          child: Text(
            primaryButtonText!,
            style: AppTypography.buttonPrimary,
          ),
        );
      }
      buttons.add(primaryBtn);
    }

    if (secondaryButtonText != null && onSecondaryAction != null) {
      final buttonHeight = isCompact ? 40.h : 46.h;
      final Widget secondaryBtn;

      if (secondaryButtonIcon != null) {
        secondaryBtn = OutlinedButton.icon(
          onPressed: onSecondaryAction,
          icon: Icon(
            secondaryButtonIcon,
            size: 16.sp,
            color: AppColors.pickabooBlue,
          ),
          label: Text(
            secondaryButtonText!,
            style: AppTypography.buttonSecondary,
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.pickabooBlue,
            side: const BorderSide(color: AppColors.pickabooBlue),
            minimumSize: isCompact ? null : Size(160.w, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: isCompact ? 8.h : 12.h,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.buttonRadius,
            ),
          ),
        );
      } else {
        secondaryBtn = OutlinedButton(
          onPressed: onSecondaryAction,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.pickabooBlue,
            side: const BorderSide(color: AppColors.pickabooBlue),
            minimumSize: isCompact ? null : Size(160.w, buttonHeight),
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: isCompact ? 8.h : 12.h,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.buttonRadius,
            ),
          ),
          child: Text(
            secondaryButtonText!,
            style: AppTypography.buttonSecondary,
          ),
        );
      }
      buttons.add(secondaryBtn);
    }

    if (buttons.length == 1) {
      return buttons.first;
    }

    return Wrap(
      spacing: 12.w,
      runSpacing: 10.h,
      alignment: WrapAlignment.center,
      children: buttons,
    );
  }
}
