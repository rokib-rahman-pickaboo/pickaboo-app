// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/app_menu_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/profile_grid_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/profile_header_card.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/profile_section_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';

/// PROFILE DASHBOARD PAGE
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  UserEntity? _userFrom(UserProfileState state) => state.maybeWhen(
        loaded: (user, _, _) => user,
        updating: (user, _, _) => user,
        loading: (user, _, _) => user,
        basicInfoUpdateSuccess: (_, user, _, _) => user,
        mobileUpdateSuccess: (_, user, _, _) => user,
        imageUploadSuccess: (_, user, _, _) => user,
        phoneUpdateOtpSent: (_, user, _) => user,
        orElse: () => null,
      );

  String? _imageUrlFrom(UserProfileState state) => state.maybeWhen(
        loaded: (_, imageUrl, _) => imageUrl,
        updating: (_, imageUrl, _) => imageUrl,
        loading: (_, imageUrl, _) => imageUrl,
        basicInfoUpdateSuccess: (_, _, imageUrl, _) => imageUrl,
        mobileUpdateSuccess: (_, _, imageUrl, _) => imageUrl,
        imageUploadSuccess: (_, _, imageUrl, _) => imageUrl,
        phoneUpdateOtpSent: (_, _, imageUrl) => imageUrl,
        orElse: () => null,
      );

  void _requireAuth(
    BuildContext context,
    VoidCallback action, {
    UserEntity? user,
  }) {
    if (user == null) {
      context.push('${Routes.login}?from=profile');
    } else {
      action();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          MainPage.popTab(context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.pageBg,
        appBar: PickabooAppBar(
          title: 'Dashboard',
          showBackButton: true,
          onBackTap: () => MainPage.popTab(context),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            final authUser = authState.maybeWhen(
              authenticated: (token, user) => user,
              orElse: () => null,
            );
            final bool isAuthenticated = authUser != null;

            return BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, profileState) {
                final profileUser = _userFrom(profileState);
                final user = isAuthenticated ? (profileUser ?? authUser) : null;
                final imageUrl = isAuthenticated ? _imageUrlFrom(profileState) : null;
                final bool isLoggedIn = isAuthenticated && user != null;

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.sameGroupItemSpacing.w,
                    0,
                    AppSpacing.sameGroupItemSpacing.w,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── 1. DYNAMIC PROFILE HEADER CARD (0 vertical margin, horizontal sameGroupItemSpacing) ──
                      ProfileHeaderCard(
                        isLoggedIn: isLoggedIn,
                        user: user,
                        imageUrl: imageUrl,
                        onEditTap: () => context.push(Routes.accountInformation),
                        onLoginTap: () =>
                            context.push('${Routes.login}?from=profile'),
                      ),

                  AppSpacing.groupToGroupGap,

                  // ── 2. 4-ITEM QUICK ACTION GRID (sameGroupItemSpacing) ──
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    mainAxisSpacing: AppSpacing.sameGroupItemSpacing.h,
                    crossAxisSpacing: AppSpacing.sameGroupItemSpacing.w,
                    childAspectRatio: 2.5,
                    children: [
                      ProfileGridTile(
                        icon: Icons.local_shipping_outlined,
                        title: 'My Orders',
                        accentColor: AppColors.pickabooBlue,
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.orderList),
                          user: user,
                        ),
                      ),
                      ProfileGridTile(
                        icon: Icons.confirmation_number_outlined,
                        title: 'Support Tickets',
                        accentColor: AppColors.pink,
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.ticketMain),
                          user: user,
                        ),
                      ),
                      ProfileGridTile(
                        icon: Icons.stars_outlined,
                        title: AppStrings.clubPointsTitle,
                        accentColor: AppColors.amber,
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.clubPoint),
                          user: user,
                        ),
                      ),
                      ProfileGridTile(
                        icon: Icons.rate_review_outlined,
                        title: 'Reviews',
                        accentColor: AppColors.green,
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.yourReview),
                          user: user,
                        ),
                      ),
                    ],
                  ),

                  AppSpacing.groupToGroupGap,

                  // ── 3. MAIN MENU SECTION ──
                  ProfileSectionCard(
                    children: [
                      AppMenuTile(
                        icon: Icons.share_outlined,
                        title: 'Share & Earn',
                        subtitle: 'Invite friends & earn reward points',
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.referral),
                          user: user,
                        ),
                      ),
                      AppMenuTile(
                        icon: Icons.help_outline_rounded,
                        title: 'FAQ & Support',
                        subtitle: 'Help center & frequent questions',
                        onTap: () => context.go(Routes.knowledgeBase),
                      ),
                      AppMenuTile(
                        icon: Icons.description_outlined,
                        title: AppStrings.termsAndConditions,
                        subtitle: 'Policies, terms & privacy statement',
                        onTap: () => context.push(Routes.terms),
                      ),
                      AppMenuTile(
                        icon: Icons.person_outline_rounded,
                        title: AppStrings.accountInformation,
                        subtitle: 'Personal info & security details',
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.accountInformation),
                          user: user,
                        ),
                      ),
                      AppMenuTile(
                        icon: Icons.location_on_outlined,
                        title: 'Manage Address',
                        subtitle: 'Saved shipping & delivery addresses',
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.address),
                          user: user,
                        ),
                      ),
                      AppMenuTile(
                        icon: Icons.payment_outlined,
                        title: 'Saved Payment Method',
                        subtitle: 'Credit cards & mobile wallets',
                        onTap: () => _requireAuth(
                          context,
                          () => context.push(Routes.savePayment),
                          user: user,
                        ),
                      ),
                      AppMenuTile(
                        icon: Icons.headset_mic_outlined,
                        title: AppStrings.contactUs,
                        subtitle: 'Reach Pickaboo customer support',
                        onTap: () => context.push(Routes.contactUs),
                      ),
                    ],
                  ),

                  AppSpacing.groupToGroupGap,

                  // ── 4. SETTINGS & LOGOUT / LOGIN SECTION ──
                  ProfileSectionCard(
                    children: [
                      AppMenuTile(
                        icon: Icons.settings_outlined,
                        title: AppStrings.appSettings,
                        subtitle: 'App preferences, language & notifications',
                        onTap: () => context.push(Routes.setting),
                      ),
                      if (isLoggedIn)
                        AppMenuTile(
                          icon: Icons.logout_rounded,
                          title: AppStrings.logout,
                          subtitle: 'Sign out of your account',
                          isDestructive: true,
                          onTap: () =>
                              _showLogoutConfirmationBottomSheet(context),
                        )
                      else
                        AppMenuTile(
                          icon: Icons.login_rounded,
                          title: 'Login / Register',
                          subtitle:
                              'Sign in to access your full profile & orders',
                          isBrand: true,
                          onTap: () =>
                              context.push('${Routes.login}?from=profile'),
                        ),
                    ],
                  ),

                  // Bottom clearance for floating bottom navigation bar
                  SizedBox(
                    height: 90.h + MediaQuery.paddingOf(context).bottom,
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ),
);
}

  // ── LOGOUT CONFIRMATION BOTTOM SHEET ──
  void _showLogoutConfirmationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Handle bar
                Container(
                  width: 36.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 18.h),

                // Icon
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: const BoxDecoration(
                    color: AppColors.redBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.logout_rounded,
                    color: AppColors.red,
                    size: 26.sp,
                  ),
                ),
                SizedBox(height: 14.h),

                // Title
                Text(
                  'Confirm Logout',
                  style: AppTypography.titleLarge,
                ),
                SizedBox(height: 6.h),

                // Body
                Text(
                  'Are you sure you want to log out of your Pickaboo account? You can log back in anytime.',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall,
                ),
                SizedBox(height: 22.h),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: AppButton.ghost(
                        text: 'Cancel',
                        backgroundColor: AppColors.pageBg,
                        textColor: AppColors.navy,
                        height: 46.h,
                        isFullWidth: true,
                        borderRadius: BorderRadius.circular(12.r),
                        textStyle: AppTypography.titleSmall,
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ),
                    AppSpacing.gapH12,
                    Expanded(
                      child: AppButton.danger(
                        text: 'Yes, Logout',
                        height: 46.h,
                        isFullWidth: true,
                        borderRadius: BorderRadius.circular(12.r),
                        onPressed: () {
                          Navigator.pop(ctx);
                          context
                              .read<AuthBloc>()
                              .add(const AuthEvent.userLoggedOut());
                          SnackBarUtils.showSuccess(
                            context,
                            'Logged out successfully',
                          );
                          context.go(Routes.home);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
