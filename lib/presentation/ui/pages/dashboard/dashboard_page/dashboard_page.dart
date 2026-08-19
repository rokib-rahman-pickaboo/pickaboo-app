import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/entity/common/custom_attribute_entity.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? _promotionalText;

  @override
  void initState() {
    super.initState();
    _loadPromotionalContent();
  }

  Future<void> _loadPromotionalContent() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _promotionalText = 'Special Offer! Get 20% off on your next purchase';
    });
  }

  String _getAttributeValue(UserEntity user, String code) {
    final attr = user.customAttributes?.firstWhere(
      (element) => element.attributeCode == code,
      orElse: () => const CustomAttributeEntity(attributeCode: '', value: null),
    );
    return attr?.value?.toString() ?? '';
  }

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

  bool _isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  void _requireAuth(
    BuildContext context,
    VoidCallback action, {
    UserEntity? user,
  }) {
    if (user == null) {
      context.push(Routes.login);
    } else {
      action();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.go(Routes.home);
        }
      },
      child: Scaffold(
        backgroundColor: colors.scaffoldBackground,
        body: CustomScrollView(
          slivers: [
            _buildDashboardAppBar(context, colors),

            _buildGridMenu(context, colors),

            SliverToBoxAdapter(child: SizedBox(height: 8.h)),

            _buildListMenu(context, colors),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardAppBar(BuildContext context, AppColors colors) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        final user = _userFrom(state);

        if (user != null) {
          final imageUrl = _imageUrlFrom(state);
          final validImageUrl = _isValidImageUrl(imageUrl) ? imageUrl : null;

          return SliverAppBar(
              pinned: true,
              title: Text('Dashboard', style: context.textStyle.appBarTitle),
              backgroundColor: colors.scaffoldBackground,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(130.w),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: colors.black.withValues(alpha: 0.05),
                        blurRadius: 10.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colors.primary.withValues(alpha: 0.1),
                            width: 2.w,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 32.r,
                          backgroundColor: colors.grayLight,
                          backgroundImage: validImageUrl != null
                              ? CachedNetworkImageProvider(validImageUrl)
                              : null,
                          child: validImageUrl == null
                              ? SvgPicture.asset(
                                  'assets/new/svg/profile_icon.svg',
                                  width: 44.sp,
                                  height: 44.sp,
                                )
                              : null,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.firstname} ${user.lastname}',
                              style: context.textStyle.profileName.withColor(
                                colors.text,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.badge_outlined,
                                  size: 14.sp,
                                  color: colors.gray,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'ID #${user.id}',
                                  style: context.textStyle.profileLabel
                                      .withColor(colors.gray),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  size: 14.sp,
                                  color: colors.gray,
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                    _getAttributeValue(
                                          user,
                                          'mobile_number',
                                        ).isNotEmpty
                                        ? _getAttributeValue(
                                            user,
                                            'mobile_number',
                                          )
                                        : user.email,
                                    style: context.textStyle.profileEmail
                                        .withColor(colors.gray),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Material(
                          color: colors.black.withValues(alpha: 0.0),
                          child: InkWell(
                            onTap: () {
                              context.push(Routes.accountInformation);
                            },
                            borderRadius: BorderRadius.circular(8.r),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              child: Icon(
                                Icons.edit_outlined,
                                color: colors.primary,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        }

        return SliverAppBar(
              pinned: true,
              title: Text('Dashboard', style: context.textStyle.appBarTitle),
              backgroundColor: colors.scaffoldBackground,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(130.w),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: colors.black.withValues(alpha: 0.05),
                        blurRadius: 10.r,
                        offset: Offset(0, 2.h),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colors.primary.withValues(alpha: 0.1),
                            width: 2.w,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 32.r,
                          backgroundColor: colors.grayLight,
                          child: SvgPicture.asset(
                            'assets/new/svg/profile_icon.svg',
                            width: 44.sp,
                            height: 44.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome to Pickaboo!',
                              style: context.textStyle.profileName.withColor(
                                colors.text,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              'Login to continue',
                              style: context.textStyle.profileLabel.withColor(
                                colors.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: colors.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Material(
                          color: colors.black.withValues(alpha: 0.0),
                          child: InkWell(
                            onTap: () {
                              context.push(Routes.login);
                            },
                            borderRadius: BorderRadius.circular(8.r),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              child: Text(
                                'Login',
                                style: context.textStyle.bodyMediumBold
                                    .copyWith(color: colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
      },
    );
  }

  // ignore: unused_element
  Widget _buildPromotionalBanner(AppColors colors) {
    return SliverToBoxAdapter(
      child: Material(
        color: colors.black.withValues(alpha: 0.0),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colors.primary, colors.scampi],
              ),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: colors.primary.withValues(alpha: 0.3),
                  blurRadius: 12.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.local_offer,
                    color: colors.white,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Special Offer!',
                        style: context.textStyle.headingSmall.withColor(
                          colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        _promotionalText!,
                        style: context.textStyle.bodySmall.withColor(
                          colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: colors.white, size: 16.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridMenu(BuildContext context, AppColors colors) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        final user = _userFrom(state);

        return SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _DashboardGridItem(
                        title: 'My Orders',
                        icon: Icons.shopping_bag_outlined,
                        backgroundColor: colors.geraldine,
                        onTap: () => _requireAuth(context, () {
                          context.push(Routes.orderList);
                        }, user: user),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _DashboardGridItem(
                        title: 'Support Tickets',
                        icon: Icons.support_agent_outlined,
                        backgroundColor: colors.salmon,
                        onTap: () => _requireAuth(context, () {
                          context.push(Routes.ticketMain);
                        }, user: user),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: _DashboardGridItem(
                        title: 'Pickaboo Club Points',
                        icon: Icons.stars_outlined,
                        backgroundColor: colors.shamrock,
                        onTap: () => _requireAuth(context, () {
                          context.push(Routes.clubPoint);
                        }, user: user),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _DashboardGridItem(
                        title: 'Reviews & Win',
                        icon: Icons.rate_review_outlined,
                        backgroundColor: colors.primary,
                        onTap: () => _requireAuth(context, () {
                          context.push(Routes.yourReview);
                        }, user: user),
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

  Widget _buildListMenu(BuildContext context, AppColors colors) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        final user = _userFrom(state);

        return SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              children: [
                _DashboardListItem(
                  icon: Icons.share_outlined,
                  title: 'Share & Earn',
                  onTap: () => _requireAuth(
                    context,
                    () => context.push(Routes.referral),
                    user: user,
                  ),
                ),
                _DashboardListItem(
                  icon: Icons.help_outline,
                  title: 'FAQ & Support',
                  onTap: () => context.go(Routes.knowledgeBase),
                ),
                _DashboardListItem(
                  icon: Icons.description_outlined,
                  title: 'Terms and Conditions',
                  onTap: () => context.push(Routes.terms),
                ),
                _DashboardListItem(
                  icon: Icons.account_circle_outlined,
                  title: 'Account Information',
                  onTap: () => _requireAuth(
                    context,
                    () => context.push(Routes.accountInformation),
                    user: user,
                  ),
                ),
                _DashboardListItem(
                  icon: Icons.location_on_outlined,
                  title: 'Manage Address',
                  onTap: () => _requireAuth(
                    context,
                    () => context.push(Routes.address),
                    user: user,
                  ),
                ),
                _DashboardListItem(
                  icon: Icons.payment_outlined,
                  title: 'Saved Payment Method',
                  onTap: () => _requireAuth(
                    context,
                    () => context.push(Routes.savePayment),
                    user: user,
                  ),
                ),
                _DashboardListItem(
                  icon: Icons.contact_support_outlined,
                  title: 'Contact Us',
                  onTap: () => context.push(Routes.contactUs),
                ),
                _DashboardListItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () => context.push(Routes.setting),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DashboardGridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _DashboardGridItem({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: colors.black.withValues(alpha: 0.0),
      borderRadius: BorderRadius.circular(16.r),
      elevation: 2,
      shadowColor: backgroundColor.withValues(alpha: 0.3),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            height: 135.h,
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, color: colors.white, size: 28.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: context.textStyle.bodyMediumBold.copyWith(
                    color: colors.white,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DashboardListItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
      child: Material(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        elevation: 0.5,
        shadowColor: colors.black.withValues(alpha: 0.1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
            decoration: BoxDecoration(
              border: Border.all(color: colors.borderColor, width: 1.w),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(icon, color: colors.primary, size: 22.sp),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: context.textStyle.bodyMediumMedium.copyWith(
                      color: colors.text,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: colors.gray.withValues(alpha: 0.5),
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
