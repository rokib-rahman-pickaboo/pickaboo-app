import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/support_category/support_category_entity.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqTheme {
  const FaqTheme._();

  static double get radiusSmall => 6.r;
  static double get radiusMedium => 10.r;
  static double get radiusLarge => 16.r;

  static Color pageBackground(AppColors c) =>
      Color.alphaBlend(c.black.withValues(alpha: 0.02), c.white);

  static Color primarySurface(AppColors c) =>
      Color.alphaBlend(c.primary.withValues(alpha: 0.04), c.white);

  static Color primaryTint(AppColors c) =>
      Color.alphaBlend(c.primary.withValues(alpha: 0.16), c.white);

  static Color primaryBorder(AppColors c) =>
      Color.alphaBlend(c.primary.withValues(alpha: 0.32), c.white);

  static Color primaryDeep(AppColors c) =>
      Color.alphaBlend(c.black.withValues(alpha: 0.45), c.primary);

  static Color hairline(AppColors c) => c.gray.withValues(alpha: 0.14);

  static LinearGradient heroGradient(AppColors c) => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [c.primary, primaryDeep(c)],
  );
}

class FaqHero extends StatelessWidget {
  final String title;
  final String subtitle;

  final bool roundedTop;

  const FaqHero({
    super.key,
    this.title = 'How can we help?',
    this.subtitle = 'Find answers, track orders, manage your account',
    this.roundedTop = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 18.h),
      decoration: BoxDecoration(
        gradient: FaqTheme.heroGradient(colors),
        borderRadius: roundedTop
            ? BorderRadius.vertical(top: Radius.circular(FaqTheme.radiusSmall))
            : null,
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textStyle.headingSmall.copyWith(
              color: colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: context.textStyle.bodySmall.copyWith(
              color: colors.white.withValues(alpha: 0.9),
              fontSize: 13.sp,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class FaqSearchField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
  final VoidCallback onSubmitted;
  final VoidCallback? onCleared;

  const FaqSearchField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.focusNode,
    this.hintText = 'Search questions...',
    this.onCleared,
  });

  @override
  State<FaqSearchField> createState() => _FaqSearchFieldState();
}

class _FaqSearchFieldState extends State<FaqSearchField> {
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_focused != _focusNode.hasFocus) {
      setState(() => _focused = _focusNode.hasFocus);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasText = widget.controller.text.isNotEmpty;

    final radius = BorderRadius.circular(FaqTheme.radiusMedium);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      height: 46.h,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: _focused
            ? [
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.14),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: _focused ? colors.white : colors.whiteSmoke,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: _focused
                ? colors.primary
                : colors.gray.withValues(alpha: 0.18),
            width: _focused ? 1.4.w : 1.w,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        textInputAction: TextInputAction.search,
        onSubmitted: (_) => widget.onSubmitted(),
        onChanged: (_) => setState(() {}),
        cursorColor: colors.primary,
        cursorWidth: 1.5,
        cursorRadius: const Radius.circular(1),
        style: context.textStyle.bodyMedium.copyWith(
          fontSize: 14.sp,
          height: 1.2,
          color: colors.text,
        ),
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintText,
          hintStyle: context.textStyle.inputText.copyWith(
            fontSize: 14.sp,
            height: 1.2,
            color: colors.gray.withValues(alpha: 0.65),
          ),
          prefixIcon: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: EdgeInsets.only(left: 14.w, right: 10.w),
            child: Icon(
              Icons.search_rounded,
              size: 19.sp,
              color: _focused ? colors.primary : colors.gray,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(),
          suffixIcon: hasText
              ? Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: InkWell(
                    onTap: () {
                      widget.controller.clear();
                      widget.onCleared?.call();
                      setState(() {});
                    },
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: BoxDecoration(
                        color: colors.gray.withValues(alpha: 0.16),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        size: 14.sp,
                        color: colors.gray,
                      ),
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: const BoxConstraints(),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 13.h),
        ),
        ),
      ),
    );
  }
}

class FaqCategoryTrigger extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const FaqCategoryTrigger({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: FaqTheme.primarySurface(colors),
          borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
          border: Border.all(color: FaqTheme.primaryBorder(colors), width: 1.w),
        ),
        child: Row(
          children: [
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: FaqTheme.primaryTint(colors),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.menu, size: 16.sp, color: colors.primary),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CATEGORY',
                    style: context.textStyle.caption.copyWith(
                      fontSize: 10.sp,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: colors.primary,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.bodySmall.copyWith(
                      fontSize: 13.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: colors.text,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18.sp,
              color: FaqTheme.primaryBorder(colors),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqCategorySheet extends StatelessWidget {
  final List<SupportCategoryEntity> categories;
  final String? selectedId;

  const FaqCategorySheet({
    super.key,
    required this.categories,
    this.selectedId,
  });

  static Future<({String id, String name})?> show(
    BuildContext context, {
    required List<SupportCategoryEntity> categories,
    String? selectedId,
  }) {
    return showModalBottomSheet<({String id, String name})>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          FaqCategorySheet(categories: categories, selectedId: selectedId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.65,
      ),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(FaqTheme.radiusLarge),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: colors.gray.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            'Browse categories',
            style: context.textStyle.bodyMediumBold.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: colors.text,
            ),
          ),
          SizedBox(height: 10.h),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SheetRow(
                      label: category.name,
                      isActive: category.id == selectedId,
                      onTap: () => Navigator.pop(
                        context,
                        (id: category.id, name: category.name),
                      ),
                    ),
                    for (final child in category.children)
                      Padding(
                        padding: EdgeInsets.only(left: 38.w),
                        child: _SheetRow(
                          label: child.name,
                          isActive: child.id == selectedId,
                          isChild: true,
                          onTap: () => Navigator.pop(
                            context,
                            (id: child.id, name: child.name),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetRow extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool isChild;
  final VoidCallback onTap;

  const _SheetRow({
    required this.label,
    required this.isActive,
    required this.onTap,
    this.isChild = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: isChild ? 8.h : 10.h,
        ),
        decoration: BoxDecoration(
          color: isActive ? FaqTheme.primaryTint(colors) : null,
          borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
        ),
        child: Row(
          children: [
            if (isChild)
              Container(
                width: 5.w,
                height: 5.w,
                decoration: BoxDecoration(
                  color: isActive
                      ? colors.primary
                      : colors.gray.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                ),
              )
            else
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: isActive ? colors.white : colors.whiteSmoke,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  faqIconForCategory(label),
                  size: 16.sp,
                  color: isActive ? colors.primary : colors.gray,
                ),
              ),
            SizedBox(width: isChild ? 8.w : 10.w),
            Expanded(
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.bodySmall.copyWith(
                  fontSize: isChild ? 13.sp : 14.sp,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive ? FaqTheme.primaryDeep(colors) : colors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqHelpBar extends StatelessWidget {
  static const String supportHotline = '';

  const FaqHelpBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasHotline = supportHotline.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        border: Border(
          top: BorderSide(color: FaqTheme.hairline(colors), width: 1.w),
        ),
      ),
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: _HelpButton(
                icon: Icons.mail_outline,
                label: 'Contact Us',
                filled: !hasHotline,
                onTap: () => context.push(Routes.contactUs),
              ),
            ),
            if (hasHotline) ...[
              SizedBox(width: 8.w),
              Expanded(
                child: _HelpButton(
                  icon: Icons.phone_outlined,
                  label: 'Call Us',
                  filled: true,
                  onTap: () async {
                    final uri = Uri.parse('tel:$supportHotline');
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _HelpButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _HelpButton({
    required this.icon,
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final foreground = filled ? colors.white : colors.primary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: filled ? colors.primary : colors.white,
          borderRadius: BorderRadius.circular(FaqTheme.radiusSmall),
          border: Border.all(color: colors.primary, width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 15.sp, color: foreground),
            SizedBox(width: 6.w),
            Text(
              label,
              style: context.textStyle.bodySmall.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

IconData faqIconForCategory(String categoryName) {
  final name = categoryName.toLowerCase();

  if (name.contains('account')) return Icons.account_circle_outlined;
  if (name.contains('order')) return Icons.shopping_bag_outlined;
  if (name.contains('payment') || name.contains('emi')) {
    return Icons.payment_outlined;
  }
  if (name.contains('shipping') || name.contains('delivery')) {
    return Icons.local_shipping_outlined;
  }
  if (name.contains('warranty')) return Icons.verified_user_outlined;
  if (name.contains('return') || name.contains('replacement')) {
    return Icons.keyboard_return_outlined;
  }
  if (name.contains('temp') || name.contains('service')) {
    return Icons.build_outlined;
  }
  if (name.contains('store')) return Icons.store_outlined;
  if (name.contains('protect')) return Icons.shield_outlined;

  return Icons.help_outline;
}
