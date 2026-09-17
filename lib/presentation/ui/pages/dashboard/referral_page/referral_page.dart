// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_bloc.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_event.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_state.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:share_plus/share_plus.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReferralBloc>().add(const ReferralEvent.getReferralHistory());
  }

  String _buildReferralUrl(String? referralCode) {
    if (referralCode == null || referralCode.isEmpty) return '';
    return '${ApiEndpoints.baseUrl}/r/$referralCode/';
  }

  Future<void> _shareReferralLink(String url) async {
    if (url.isEmpty) return;
    try {
      await SharePlus.instance.share(
        ShareParams(text: url, subject: 'Join me on Pickaboo!'),
      );
    } catch (e) {
      if (mounted) {
        SnackBarUtils.showError(context, 'Failed to share link');
      }
    }
  }

  Future<void> _copyToClipboard(String url) async {
    if (url.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: url));
    if (mounted) {
      SnackBarUtils.showSuccess(context, 'Link copied to clipboard!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'Share & Earn',
      ),
      body: BlocBuilder<ReferralBloc, ReferralState>(
        builder: (context, state) {
          return state.when(
            initial: () => const AppLoader.fullPage(),
            loading: () => const AppLoader.fullPage(),
            referralHistoryLoaded: (referralData, hasReachedMax) {
              final referralCode = referralData.referralCode ?? 'GUEST';
              final pendingCount = referralData.referralPendingCount ?? 0;
              final completedCount = referralData.referralCompletedCount ?? 0;
              final referralUrl = _buildReferralUrl(referralCode);

              return _buildContent(
                context,
                referralUrl: referralUrl,
                pendingCount: pendingCount,
                completedCount: completedCount,
              );
            },
            inviteSuccess: () => Center(
              child: Text(
                'Invitation sent successfully!',
                style: AppTypography.titleSmall,
              ),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48.sp,
                    color: AppColors.red,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    message,
                    style: AppTypography.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.gapV16,
                  AppButton.primary(
                    text: 'Retry',
                    isFullWidth: false,
                    onPressed: () {
                      context.read<ReferralBloc>().add(
                        const ReferralEvent.getReferralHistory(),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<ReferralBloc, ReferralState>(
        builder: (context, state) {
          return state.maybeWhen(
            referralHistoryLoaded: (referralData, hasReachedMax) {
              final referralCode = referralData.referralCode ?? 'GUEST';
              final referralUrl = _buildReferralUrl(referralCode);

              return Container(
                color: AppColors.pageBg,
                padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
                child: SafeArea(
                  top: false,
                  child: AppButton.primary(
                    text: 'Share Invitation',
                    icon: Icon(
                      Icons.share_rounded,
                      color: AppColors.white,
                      size: 18.sp,
                    ),
                    isFullWidth: true,
                    height: 48.h,
                    borderRadius: BorderRadius.circular(12.r),
                    onPressed: () => _shareReferralLink(referralUrl),
                  ),
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required String referralUrl,
    required int pendingCount,
    required int completedCount,
  }) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        AppSpacing.sameGroupItemSpacing.w,
        0,
        AppSpacing.sameGroupItemSpacing.w,
        AppSpacing.sameGroupItemSpacing.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. REFERRAL CODE & LINK CARD ──
          AppCard(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(7.w),
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBlue,
                        borderRadius: AppRadius.buttonRadius,
                      ),
                      child: Icon(
                        Icons.share_outlined,
                        color: AppColors.pickabooBlue,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Share your referral link',
                      style: AppTypography.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  'Send this link to your friends and earn rewards',
                  style: AppTypography.bodySmall,
                ),
                SizedBox(height: 12.h),

                // Copy Link Box
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceBlue,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.35),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          referralUrl,
                          style: AppTypography.bodyLarge.regular(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      AppSpacing.gapH8,
                      AppButton.primary(
                        text: 'Copy',
                        icon: Icon(Icons.copy_rounded, size: 14.sp, color: AppColors.white),
                        isFullWidth: false,
                        size: AppButtonSize.sm,
                        height: 32.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        borderRadius: BorderRadius.circular(8.r),
                        onPressed: () => _copyToClipboard(referralUrl),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 14.h),

                // Pending & Completed Badges
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.amber.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColors.amber.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.pending_outlined,
                              color: AppColors.amber,
                              size: 20.sp,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '$pendingCount',
                              style: AppTypography.heroTitle.size(18.sp),
                            ),
                            Text(
                              'Pending',
                              style: AppTypography.bodyTiny,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.greenBg,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: AppColors.green.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.check_circle_outline_rounded,
                              color: AppColors.green,
                              size: 20.sp,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '$completedCount',
                              style: AppTypography.heroTitle.size(18.sp),
                            ),
                            Text(
                              'Completed',
                              style: AppTypography.bodyTiny,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          AppSpacing.groupToGroupGap,

          // ── 2. YOUR REFERRAL JOURNEY STEPPER ──
          AppCard(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Referral Journey',
                  style: AppTypography.titleMedium,
                ),
                SizedBox(height: 14.h),

                Builder(
                  builder: (context) {
                    final hasReferred = pendingCount > 0;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 22.w,
                              height: 22.h,
                              decoration: const BoxDecoration(
                                color: AppColors.pickabooBlue,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_rounded,
                                  color: AppColors.white,
                                  size: 14.sp,
                                ),
                              ),
                            ),
                            Container(
                              width: 2.w,
                              height: 28.h,
                              color: hasReferred
                                  ? AppColors.pickabooBlue
                                  : AppColors.border,
                            ),
                            Container(
                              width: 22.w,
                              height: 22.h,
                              decoration: BoxDecoration(
                                color: hasReferred
                                    ? AppColors.pickabooBlue
                                    : AppColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: hasReferred
                                      ? AppColors.pickabooBlue
                                      : AppColors.muted,
                                  width: 2.w,
                                ),
                              ),
                              child: hasReferred
                                  ? Center(
                                      child: Icon(
                                        Icons.check_rounded,
                                        color: AppColors.white,
                                        size: 14.sp,
                                      ),
                                    )
                                  : null,
                            ),
                          ],
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1.h),
                              Text(
                                'You created an account',
                                style: AppTypography.titleSmall,
                              ),
                              SizedBox(height: 30.h),
                              Text(
                                hasReferred
                                    ? 'You have referred a friend'
                                    : 'You haven\'t referred a friend yet',
                                style: hasReferred ? AppTypography.titleSmall : AppTypography.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          AppSpacing.groupToGroupGap,

          // ── 3. HOW TO EARN CARD ──
          AppCard(
            padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How to Earn',
                  style: AppTypography.titleMedium,
                ),
                SizedBox(height: 14.h),

                _buildHowToEarnTile(
                  icon: Icons.share_outlined,
                  title: 'Share Link & Code',
                  subtitle:
                      'Get 100 points when your friend signs up using your referral link',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Divider(
                    height: 1.h,
                    indent: 48.w,
                    color: AppColors.border,
                  ),
                ),
                _buildHowToEarnTile(
                  icon: Icons.person_add_alt_1_outlined,
                  title: 'Friend Registers',
                  subtitle:
                      'Earn 500 points when your referred friend makes their first purchase',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Divider(
                    height: 1.h,
                    indent: 48.w,
                    color: AppColors.border,
                  ),
                ),
                _buildHowToEarnTile(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Friend Purchases',
                  subtitle:
                      'Get 5% of your friend\'s purchase as points for their first 3 orders',
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildHowToEarnTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: AppColors.pickabooBlue.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.pickabooBlue,
              size: 18.sp,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.titleSmall,
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
