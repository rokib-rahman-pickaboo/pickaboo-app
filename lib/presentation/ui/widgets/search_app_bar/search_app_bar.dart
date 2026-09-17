import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_state.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_search_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/user_image_widget.dart';

const double _searchHeight = 36;
const double _topGap = 2;
const double _rowToSearchGap = 6;
const double _bottomGap = 4;

const List<String> _kHomeRotatingHints = [
  'Search for Products, Brands and More',
  'Search for Products (For Ex "ZenGlow 1.5 Ton Inverter Air Conditioner")',
  'Search for Brands (For Ex "Haier")',
];

/// Home Top Header: App Bar + Search Bar Button
/// Positioned at the very top of HomePage above HomeCategoryNav.
class HomeTopHeader extends StatelessWidget {
  final VoidCallback onMenuTap;
  final String? categoryName;

  const HomeTopHeader({
    super.key,
    required this.onMenuTap,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final bool isForYou = categoryName == null || categoryName == 'For You';
    final hint = isForYou ? null : 'Search in $categoryName...';
    final rotatingHints = isForYou ? _kHomeRotatingHints : null;

    return Container(
      color: AppColors.pageBg,
      padding: EdgeInsets.fromLTRB(14.w, _topGap.h, 14.w, _bottomGap.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── 1. Top Navigation Row: Menu + Logo + (Points Pill + Avatar if Logged In) ──
          SizedBox(
            height: 38.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sky Blue Drawer Icon
                InkWell(
                  onTap: onMenuTap,
                  borderRadius: AppRadius.smRadius,
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Icon(
                      Icons.menu_rounded,
                      color: AppColors.pickabooBlue,
                      size: 24.sp,
                    ),
                  ),
                ),

                SizedBox(width: 8.w),

                // Pickaboo Brand Logo Asset
                Image.asset(
                  AppAssets.logoNew,
                  height: 25.h,
                  fit: BoxFit.contain,
                ),

                const Spacer(),

                // ── Dynamic Right Section (Logged In vs Logged Out) ──
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, authState) {
                    return authState.maybeWhen(
                      authenticated: (token, user) {
                        final fullName =
                            '${user.firstname} ${user.lastname}'.trim();
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Points Pill: Only visible when club points > 0
                            BlocBuilder<ClubPointBloc, ClubPointState>(
                              builder: (context, pointState) {
                                final points = pointState.maybeWhen(
                                  loaded: (data) => data.myPoints,
                                  orElse: () => 0,
                                );

                                if (points <= 0) {
                                  return const SizedBox.shrink();
                                }

                                return Padding(
                                  padding: EdgeInsets.only(right: 6.w),
                                  child: InkWell(
                                    onTap: () =>
                                        context.push(Routes.clubPoint),
                                    borderRadius: AppRadius.dialogRadius,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                        vertical: 3.5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: AppRadius.dialogRadius,
                                        border: Border.all(
                                          color: AppColors.border,
                                          width: 0.8.w,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            points.toString(),
                                            style: AppTypography.bodySmall,
                                          ),
                                          SizedBox(width: 3.w),
                                          Text(
                                            'Club Points',
                                            style: AppTypography
                                                .brandAction,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(width: 2.w),

                            // User Profile Avatar Widget with Online Status Dot
                            BlocBuilder<UserProfileBloc, UserProfileState>(
                              builder: (context, profileState) {
                                final profileUser = profileState.maybeWhen(
                                  loaded: (u, _, _) => u,
                                  basicInfoUpdateSuccess: (_, u, _, _) => u,
                                  mobileUpdateSuccess: (_, u, _, _) => u,
                                  imageUploadSuccess: (_, u, _, _) => u,
                                  updating: (u, _, _) => u,
                                  phoneUpdateOtpSent: (_, u, _) => u,
                                  orElse: () => null,
                                );
                                final effectiveUser = profileUser ?? user;
                                final displayName =
                                    '${effectiveUser.firstname} ${effectiveUser.lastname}'.trim();
                                final imageUrl = profileState.maybeWhen(
                                  loaded: (_, img, _) => img,
                                  basicInfoUpdateSuccess: (_, _, img, _) => img,
                                  mobileUpdateSuccess: (_, _, img, _) => img,
                                  imageUploadSuccess: (_, _, img, _) => img,
                                  updating: (_, img, _) => img,
                                  phoneUpdateOtpSent: (_, _, img) => img,
                                  orElse: () => null,
                                );
                                return UserImageWidget.appBar(
                                  name: displayName.isNotEmpty
                                      ? displayName
                                      : (fullName.isNotEmpty ? fullName : null),
                                  imageUrl: imageUrl,
                                  onTap: () {
                                    MainPage.hideBottomNav.value = false;
                                    context.go(Routes.dashboard);
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      },
                      orElse: () => InkWell(
                        onTap: () {
                          MainPage.hideBottomNav.value = false;
                          context.push(Routes.login);
                        },
                        borderRadius: AppRadius.dialogRadius,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceBlue,
                            borderRadius: AppRadius.dialogRadius,
                            border: Border.all(
                              color: AppColors.pickabooBlue.withValues(alpha: 0.25),
                              width: 0.8.w,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person_outline_rounded,
                                size: 15.sp,
                                color: AppColors.pickabooBlue,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Sign In',
                                style: AppTypography.brandAction.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: _rowToSearchGap.h),

          // ── 2. Modern Compact Search Bar Button with Animated Rotating Hints ──
          AppSearchBar(
            hintText: hint,
            rotatingHints: rotatingHints,
            readOnly: true,
            height: _searchHeight.h,
            onTap: () => context.push(Routes.search),
          ),
        ],
      ),
    );
  }
}

/// Backwards-compatible Sliver wrapper
class SearchAppBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final int? cartCount;
  final String? categoryName;

  const SearchAppBar({
    super.key,
    required this.onMenuTap,
    this.cartCount,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final double toolbarHeight =
        _topGap.h + 38.h + _rowToSearchGap.h + _searchHeight.h + _bottomGap.h;

    return SliverAppBar(
      backgroundColor: AppColors.pageBg,
      surfaceTintColor: AppColors.pageBg,
      elevation: 0,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.transparent,
      ),
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        bottom: false,
        child: HomeTopHeader(
          onMenuTap: onMenuTap,
          categoryName: categoryName,
        ),
      ),
    );
  }
}

/// Semantic alias for Home Page App Bar
typedef HomeAppBar = SearchAppBar;
