import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

final Future<PackageInfo> _appPackageInfo = PackageInfo.fromPlatform();

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Drawer(
      backgroundColor: colors.white,
      child: SafeArea(
        child: Column(
          children: [
            BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (user, imageUrl, mobileNumber) => _buildProfileHeader(
                    context,
                    user,
                    imageUrl,
                    mobileNumber ?? '',
                  ),
                  basicInfoUpdateSuccess:
                      (message, user, imageUrl, mobileNumber) =>
                          _buildProfileHeader(
                            context,
                            user,
                            imageUrl,
                            mobileNumber ?? '',
                          ),
                  mobileUpdateSuccess:
                      (message, user, imageUrl, mobileNumber) =>
                          _buildProfileHeader(
                            context,
                            user,
                            imageUrl,
                            mobileNumber ?? '',
                          ),
                  imageUploadSuccess:
                      (message, user, imageUrl, mobileNumber) =>
                          _buildProfileHeader(
                            context,
                            user,
                            imageUrl,
                            mobileNumber ?? '',
                          ),
                  updating: (user, imageUrl, mobileNumber) =>
                      _buildProfileHeader(
                        context,
                        user,
                        imageUrl,
                        mobileNumber ?? '',
                      ),
                  loading: (user, imageUrl, mobileNumber) => user != null
                      ? _buildProfileHeader(
                          context,
                          user,
                          imageUrl,
                          mobileNumber ?? '',
                        )
                      : _buildAuthFallbackHeader(context),
                  phoneUpdateOtpSent: (mobileNumber, user, imageUrl) =>
                      _buildProfileHeader(context, user, imageUrl, mobileNumber),
                  orElse: () => _buildAuthFallbackHeader(context),
                );
              },
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 16.h),

                  _buildShopForSection(context),

                  _buildDivider(colors),

                  _buildAccountSection(context),

                  _buildDivider(colors),

                  _buildPreferencesSection(context),

                  _buildDivider(colors),

                  _buildOthersSection(context),

                  SizedBox(height: 16.h),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      final isLoggedIn = state.maybeWhen(
                        authenticated: (token, user) => true,
                        orElse: () => false,
                      );
                      return _buildAuthButton(context, isLoggedIn);
                    },
                  ),

                  _buildVersionFooter(context),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCategory(BuildContext context, CategoryEntity category) {
    if (category.isSpecial) {
      context.pushToSpecialCategoryProduct(
        categorySlug: category.slug,
        categoryName: category.name,
      );
    } else {
      context.pushToCategoryProduct(
        categoryId: category.id,
        categoryName: category.name,
      );
    }
  }

  Widget _buildAuthFallbackHeader(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) => authState.maybeWhen(
        authenticated: (token, user) =>
            _buildProfileHeader(context, user, null, ''),
        orElse: () => _buildGuestHeader(),
      ),
    );
  }

  Widget _buildProfileHeader(
    BuildContext context,
    dynamic user,
    String? profileImage,
    String mobileNumber,
  ) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    final borderRadius = BorderRadius.circular(12.r);

    return Container(
      padding: EdgeInsets.all(16.w),
      color: colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: SizedBox(
              width: 56.w,
              height: 56.w,
              child: profileImage != null && profileImage.isNotEmpty
                  ? AppImage(
                      imageUrl: profileImage,
                      fit: BoxFit.cover,
                      errorWidget: Container(
                        color: colors.backgroundGray,
                        child: Icon(
                          Icons.person,
                          size: 28.sp,
                          color: colors.gray,
                        ),
                      ),
                    )
                  : Container(
                      color: colors.backgroundGray,
                      child: Icon(
                        Icons.person,
                        size: 28.sp,
                        color: colors.gray,
                      ),
                    ),
            ),
          ),
          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${user.firstname} ${user.lastname}',
                  style: textStyle.profileName.withColor(colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'ID # ${user.id}',
                  style: textStyle.profileLabel.withColor(colors.gray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestHeader() {
    return SizedBox(height: 24.h);
  }

  Widget _buildShopForSection(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state.status == CategoryStatus.success &&
            state.categories != null) {
          final topCategories = state.categories!.toList();
          return _DrawerSection(
            title: 'Shop for',
            children: topCategories
                .map(
                  (category) => _DrawerCategoryItem(
                    category: category,
                    onCategoryTap: (selectedCategory) {
                      context.pop();
                      _navigateToCategory(context, selectedCategory);
                    },
                  ),
                )
                .toList(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildAccountSection(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoggedIn = state.maybeWhen(
          authenticated: (token, user) => true,
          orElse: () => false,
        );

        return _DrawerSection(
          title: 'Account',
          children: [
            _DrawerMenuItem(
              iconAsset: DrawerIcons.dashboard,
              fallbackIcon: Icons.dashboard,
              iconColor: colors.primary,
              title: 'Dashboard',
              onTap: () {
                context.pop();
                if (isLoggedIn) {
                  context.go(Routes.dashboard);
                } else {
                  context.push(Routes.login);
                }
              },
            ),
            _DrawerMenuItem(
              iconAsset: DrawerIcons.myOrders,
              fallbackIcon: Icons.shopping_bag,
              iconColor: colors.red,
              title: 'My Orders',
              onTap: () {
                context.pop();
                if (isLoggedIn) {
                  context.push(Routes.orderList);
                } else {
                  context.push(Routes.login);
                }
              },
            ),
            _DrawerMenuItem(
              iconAsset: DrawerIcons.myWishlist,
              fallbackIcon: Icons.favorite,
              iconColor: colors.geraldine,
              title: 'My Wishlist',
              onTap: () {
                context.pop();
                if (isLoggedIn) {
                  context.push(Routes.wishlist);
                } else {
                  context.push(Routes.login);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    final colors = context.colors;

    return _DrawerSection(
      title: 'Preferences',
      children: [
        _DrawerMenuItem(
          iconAsset: DrawerIcons.settings,
          fallbackIcon: Icons.settings,
          iconColor: colors.orange,
          title: 'Settings',
          onTap: () {
            context.pop();
            context.push(Routes.setting);
          },
        ),
      ],
    );
  }

  Widget _buildOthersSection(BuildContext context) {
    final colors = context.colors;

    return _DrawerSection(
      title: 'Others',
      children: [
        _DrawerMenuItem(
          iconAsset: DrawerIcons.contactUs,
          fallbackIcon: Icons.contact_support,
          iconColor: colors.scampi,
          title: 'Contact Us',
          onTap: () {
            context.pop();
            context.push(Routes.contactUs);
          },
        ),
      ],
    );
  }

  Widget _buildAuthButton(BuildContext context, bool isLoggedIn) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        height: 48.h,
        child: ElevatedButton(
          onPressed: () {
            if (isLoggedIn) {
              if (kDebugMode) {
                print('🚪 [LOGOUT] Logout button pressed');
                print('   Capturing AuthBloc reference...');
              }

              final authBloc = context.read<AuthBloc>();

              context.pop();

              if (kDebugMode) {
                print('   Drawer closed, showing confirmation dialog...');
              }

              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print('   Logout cancelled');
                        }
                        Navigator.pop(ctx);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print('✅ [LOGOUT] Logout confirmed!');
                          print('   Closing dialog...');
                        }

                        Navigator.pop(ctx);

                        if (kDebugMode) {
                          print('   Triggering AuthEvent.userLoggedOut()');
                        }

                        authBloc.add(const AuthEvent.userLoggedOut());

                        if (kDebugMode) {
                          print('   Logout event dispatched successfully');
                        }
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            } else {
              context.pop();
              context.push(Routes.login);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            elevation: 0,
          ),
          child: Text(
            isLoggedIn ? 'Logout' : 'Login',
            style: textStyle.buttonLarge.withColor(colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildVersionFooter(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Center(
        child: FutureBuilder<PackageInfo>(
          future: _appPackageInfo,
          builder: (context, snapshot) {
            final version = snapshot.data?.version ?? '';
            if (version.isEmpty) return const SizedBox.shrink();
            return Text(
              'Version $version',
              style: textStyle.profileLabel.withColor(colors.gray),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDivider(AppColors colors) {
    return Divider(
      height: 1.h,
      thickness: 1,
      color: colors.borderColor,
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}

class _DrawerSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DrawerSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textStyle.bodyLargeBold.withColor(colors.text)),
          SizedBox(height: 8.h),
          ...children,
        ],
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final String iconAsset;
  final IconData fallbackIcon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.iconAsset,
    required this.fallbackIcon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      splashColor: colors.primary.withValues(alpha: 0.15),
      highlightColor: colors.primary.withValues(alpha: 0.05),
      onTap: () {
        getIt<AnalyticsService>().logClick(
          section: 'menu',
          source: 'drawer',
          medium: 'menu_link',
          title: title,
        );
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.backgroundGray,
              ),
              child: Image.asset(
                iconAsset,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(fallbackIcon, color: iconColor, size: 20.sp),
              ),
            ),
            SizedBox(width: 12.w),

            Expanded(
              child: Text(
                title,
                style: textStyle.drawerItem.withColor(colors.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerIcons {
  const DrawerIcons._();

  static const String _base = 'assets/images/drawer';
  static const String dashboard = '$_base/dashboard.png';
  static const String myOrders = '$_base/my_orders.png';
  static const String myWishlist = '$_base/my_wishlist.png';
  static const String settings = '$_base/settings.png';
  static const String contactUs = '$_base/contact_us.png';
}

class _DrawerCategoryItem extends StatefulWidget {
  final CategoryEntity category;
  final Function(CategoryEntity) onCategoryTap;
  final int level;

  const _DrawerCategoryItem({
    required this.category,
    required this.onCategoryTap,
    this.level = 0,
  });

  @override
  State<_DrawerCategoryItem> createState() => _DrawerCategoryItemState();
}

class _DrawerCategoryItemState extends State<_DrawerCategoryItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final hasChildren = widget.category.children.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8.r),
          splashColor: colors.primary.withValues(alpha: 0.15),
          highlightColor: colors.primary.withValues(alpha: 0.05),
          onTap: () {
            widget.onCategoryTap(widget.category);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.level > 0 ? 0 : 4.w,
              horizontal: 4.w,
            ),
            child: Row(
              children: [
                if (widget.level > 0)
                  SizedBox(width: 52.w + (12.w * (widget.level - 1))),

                if (widget.level == 0) ...[
                  if (widget.category.icon.isNotEmpty)
                    Container(
                      width: 40.w,
                      height: 40.w,
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.backgroundGray,
                      ),
                      child: AppImage(
                        imageUrl: widget.category.icon,
                        fit: BoxFit.fitHeight,
                        errorWidget: Icon(
                          Icons.category,
                          size: 20.sp,
                          color: colors.primary,
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.primary.withValues(alpha: 0.1),
                      ),
                      child: Icon(
                        Icons.category,
                        color: colors.primary,
                        size: 20.sp,
                      ),
                    ),
                  SizedBox(width: 12.w),
                ],

                Expanded(
                  child: Container(
                    decoration: widget.level > 0
                        ? BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: colors.borderColor.withValues(
                                  alpha: 0.5,
                                ),
                                width: 1.h,
                              ),
                            ),
                          )
                        : null,
                    padding: widget.level > 0
                        ? EdgeInsets.only(top: 12.h, bottom: 12.h)
                        : EdgeInsets.zero,
                    child: Text(
                      widget.category.name,
                      style: widget.level == 0
                          ? textStyle.drawerItem.withColor(colors.text)
                          : textStyle.drawerItem.copyWith(
                              color: colors.textMedium,
                              fontWeight: FontWeight.normal,
                            ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                if (hasChildren)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Icon(
                        _isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: colors.gray,
                        size: 24.sp,
                      ),
                    ),
                  )
                else if (widget.level == 0)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    child: Icon(Icons.chevron_right, color: colors.gray, size: 24.sp),
                  ),
              ],
            ),
          ),
        ),

        if (hasChildren && _isExpanded)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(8.r),
                splashColor: colors.primary.withValues(alpha: 0.15),
                highlightColor: colors.primary.withValues(alpha: 0.05),
                onTap: () => widget.onCategoryTap(widget.category),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: [
                      SizedBox(width: 52.w + (12.w * widget.level)),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: colors.borderColor.withValues(
                                  alpha: 0.5,
                                ),
                                width: 1.h,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
                          child: Text(
                            'All in ${widget.category.name}',
                            style: textStyle.drawerItem.copyWith(
                              color: colors.textMedium,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ...widget.category.children.map(
                (childCategory) => _DrawerCategoryItem(
                  category: childCategory,
                  onCategoryTap: widget.onCategoryTap,
                  level: widget.level + 1,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
