// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/data/services/analytics_service.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/navigation_extensions.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';

final Future<PackageInfo> _appPackageInfo = PackageInfo.fromPlatform();

/// ============================================================================
/// 🧭 MODERN NAVIGATION DRAWER
/// Updated with clean vector icon design tokens matching Profile / Dashboard.
/// ============================================================================
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return authState.maybeWhen(
                  authenticated: (token, authUser) {
                    return BlocBuilder<UserProfileBloc, UserProfileState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loaded: (user, imageUrl, mobileNumber) =>
                              _buildProfileHeader(
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
                          loading: (user, imageUrl, mobileNumber) =>
                              _buildProfileHeader(
                            context,
                            user ?? authUser,
                            imageUrl,
                            mobileNumber ?? '',
                          ),
                          phoneUpdateOtpSent:
                              (mobileNumber, user, imageUrl) =>
                                  _buildProfileHeader(
                            context,
                            user,
                            imageUrl,
                            mobileNumber,
                          ),
                          orElse: () => _buildProfileHeader(
                            context,
                            authUser,
                            null,
                            '',
                          ),
                        );
                      },
                    );
                  },
                  orElse: () => _buildGuestHeader(context),
                );
              },
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 12.h),

                  _buildShopForSection(context),

                  _buildDivider(),

                  _buildAccountSection(context),

                  _buildDivider(),

                  _buildPreferencesSection(context),

                  _buildDivider(),

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
        categorySlug: category.slug,
        categoryName: category.name,
      );
    }
  }

  Widget _buildProfileHeader(
    BuildContext context,
    dynamic user,
    String? profileImage,
    String mobileNumber,
  ) {
    final borderRadius = AppRadius.cardRadius;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
      color: AppColors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: SizedBox(
              width: 50.w,
              height: 50.w,
              child: profileImage != null && profileImage.isNotEmpty
                  ? AppImage(
                      imageUrl: profileImage,
                      fit: BoxFit.cover,
                      errorWidget: Container(
                        color: AppColors.surfaceBlue,
                        child: Icon(
                          Icons.person_rounded,
                          size: 26.sp,
                          color: AppColors.pickabooBlue,
                        ),
                      ),
                    )
                  : Container(
                      color: AppColors.surfaceBlue,
                      child: Icon(
                        Icons.person_rounded,
                        size: 26.sp,
                        color: AppColors.pickabooBlue,
                      ),
                    ),
            ),
          ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${user.firstname} ${user.lastname}',
                  style: AppTypography.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3.h),
                Text(
                  'ID # ${user.id}',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestHeader(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
        context.push('${Routes.login}?from=drawer');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
        color: AppColors.white,
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.w,
              decoration: const BoxDecoration(
                color: AppColors.surfaceBlue,
                borderRadius: AppRadius.cardRadius,
              ),
              child: Icon(
                Icons.person_outline_rounded,
                size: 26.sp,
                color: AppColors.pickabooBlue,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to Pickaboo!',
                    style: AppTypography.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    'Sign in or Register',
                    style: AppTypography.brandAction,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.mutedLight,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
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
              icon: Icons.grid_view_rounded,
              iconColor: AppColors.pickabooBlue,
              title: 'Dashboard',
              onTap: () {
                context.pop();
                if (isLoggedIn) {
                  context.go(Routes.dashboard);
                } else {
                  context.push('${Routes.login}?from=drawer');
                }
              },
            ),
            _DrawerMenuItem(
              icon: Icons.local_shipping_outlined,
              iconColor: AppColors.pickabooBlue,
              title: 'My Orders',
              onTap: () {
                context.pop();
                if (isLoggedIn) {
                  context.push(Routes.orderList);
                } else {
                  context.push('${Routes.login}?from=drawer');
                }
              },
            ),
            _DrawerMenuItem(
              icon: Icons.favorite_border_rounded,
              iconColor: AppColors.pickabooBlue,
              title: 'My Wishlist',
              onTap: () {
                context.pop();
                if (isLoggedIn) {
                  context.push(Routes.wishlist);
                } else {
                  context.push('${Routes.login}?from=drawer');
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    return _DrawerSection(
      title: 'Preferences',
      children: [
        _DrawerMenuItem(
          icon: Icons.settings_outlined,
          iconColor: AppColors.pickabooBlue,
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
    return _DrawerSection(
      title: 'Others',
      children: [
        _DrawerMenuItem(
          icon: Icons.headset_mic_outlined,
          iconColor: AppColors.pickabooBlue,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AppButton(
        height: 46.h,
        borderRadius: AppRadius.buttonRadius,
        type: isLoggedIn ? AppButtonType.danger : AppButtonType.primary,
        backgroundColor:
            isLoggedIn ? AppColors.red : AppColors.pickabooBlue,
        textColor: AppColors.white,
        text: isLoggedIn ? AppStrings.logout : AppStrings.login,
        onPressed: () {
          if (isLoggedIn) {
            if (kDebugMode) {
              print('🚪 [LOGOUT] Logout button pressed');
            }

            final authBloc = context.read<AuthBloc>();
            context.pop();

            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text(AppStrings.logout),
                content: const Text(AppStrings.logoutConfirmMessage),
                actions: [
                  AppButton.ghost(
                    text: AppStrings.cancel,
                    size: AppButtonSize.sm,
                    textColor: AppColors.muted,
                    onPressed: () => Navigator.pop(ctx),
                  ),
                  AppButton.ghost(
                    text: AppStrings.logout,
                    size: AppButtonSize.sm,
                    textColor: AppColors.red,
                    onPressed: () {
                      Navigator.pop(ctx);
                      authBloc.add(const AuthEvent.userLoggedOut());
                      SnackBarUtils.showSuccess(
                        context,
                        AppStrings.loggedOutSuccess,
                      );
                      context.go(Routes.home);
                    },
                  ),
                ],
              ),
            );
          } else {
            context.pop();
            context.push('${Routes.login}?from=drawer');
          }
        },
      ),
    );
  }

  Widget _buildVersionFooter(BuildContext context) {
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
              style: AppTypography.bodySmall,
            );
          },
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1.h,
      thickness: 1,
      color: AppColors.border,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.titleSmall,
          ),
          SizedBox(height: 6.h),
          ...children,
        ],
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppRadius.buttonRadius,
      splashColor: AppColors.pickabooBlue.withValues(alpha: 0.15),
      highlightColor: AppColors.pickabooBlue.withValues(alpha: 0.05),
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
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: AppRadius.buttonRadius,
              ),
              child: Center(
                child: Icon(icon, color: iconColor, size: 19.sp),
              ),
            ),
            SizedBox(width: 12.w),

            Expanded(
              child: Text(
                title,
                style: AppTypography.titleSmall,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 18.sp,
              color: AppColors.mutedLight,
            ),
          ],
        ),
      ),
    );
  }
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
    final hasChildren = widget.category.children.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: AppRadius.buttonRadius,
          splashColor: AppColors.pickabooBlue.withValues(alpha: 0.15),
          highlightColor: AppColors.pickabooBlue.withValues(alpha: 0.05),
          onTap: () {
            widget.onCategoryTap(widget.category);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.level > 0 ? 0 : 4.h,
              horizontal: 4.w,
            ),
            child: Row(
              children: [
                if (widget.level > 0)
                  SizedBox(width: 48.w + (12.w * (widget.level - 1))),

                if (widget.level == 0) ...[
                  if (widget.category.icon.isNotEmpty)
                    Container(
                      width: 36.w,
                      height: 36.w,
                      padding: EdgeInsets.all(6.w),
                      decoration: const BoxDecoration(
                        borderRadius: AppRadius.buttonRadius,
                        color: AppColors.surfaceBlue,
                      ),
                      child: AppImage(
                        imageUrl: widget.category.icon,
                        fit: BoxFit.contain,
                        errorWidget: Icon(
                          Icons.category_outlined,
                          size: 18.sp,
                          color: AppColors.pickabooBlue,
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: const BoxDecoration(
                        borderRadius: AppRadius.buttonRadius,
                        color: AppColors.surfaceBlue,
                      ),
                      child: Icon(
                        Icons.category_outlined,
                        color: AppColors.pickabooBlue,
                        size: 18.sp,
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
                                color: AppColors.border.withValues(
                                  alpha: 0.7,
                                ),
                                width: 1.h,
                              ),
                            ),
                          )
                        : null,
                    padding: widget.level > 0
                        ? EdgeInsets.only(top: 10.h, bottom: 10.h)
                        : EdgeInsets.zero,
                    child: Text(
                      widget.category.name,
                      style: AppTypography.titleSmall,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: AppColors.muted,
                        size: 22.sp,
                      ),
                    ),
                  )
                else if (widget.level == 0)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.mutedLight,
                      size: 18.sp,
                    ),
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
                borderRadius: AppRadius.buttonRadius,
                splashColor: AppColors.pickabooBlue.withValues(alpha: 0.15),
                highlightColor:
                    AppColors.pickabooBlue.withValues(alpha: 0.05),
                onTap: () => widget.onCategoryTap(widget.category),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: [
                      SizedBox(width: 48.w + (12.w * widget.level)),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.border.withValues(
                                  alpha: 0.7,
                                ),
                                width: 1.h,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          child: Text(
                            'All in ${widget.category.name}',
                            style: AppTypography.brandAction,
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
