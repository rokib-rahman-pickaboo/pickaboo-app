import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_bloc.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_event.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_state.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  final List<EarningRule> _earningRules = [
    EarningRule(
      title: 'Referral Signup',
      message:
          'Get 100 points when your friend signs up using your referral link',
    ),
    EarningRule(
      title: 'First Purchase',
      message:
          'Earn 500 points when your referred friend makes their first purchase',
    ),
    EarningRule(
      title: 'Ongoing Rewards',
      message:
          'Get 5% of your friend\'s purchase as points for their first 3 orders',
    ),
  ];

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
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: const Text('Share & Earn'),
      ),
      body: BlocBuilder<ReferralBloc, ReferralState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: CircularProgressIndicator(
                color: colors.primary,
                strokeWidth: 2.w,
              ),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(
                color: colors.primary,
                strokeWidth: 2.w,
              ),
            ),
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
                style: textTheme.bodyLarge.copyWith(color: colors.text),
              ),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48.sp, color: colors.salmon),
                  SizedBox(height: 16.h),
                  Text(
                    message,
                    style: textTheme.bodyMedium.copyWith(color: colors.text),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ReferralBloc>().add(
                        const ReferralEvent.getReferralHistory(),
                      );
                    },
                    child: const Text('Retry'),
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
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: colors.black.withValues(alpha: 0.05),
                      blurRadius: 10.r,
                      offset: Offset(0, -2.h),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton.icon(
                      onPressed: () => _shareReferralLink(referralUrl),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.button,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 2,
                      ),
                      icon: Icon(
                        Icons.share,
                        color: context.colors.white,
                        size: 20.sp,
                      ),
                      label: Text(
                        'Share Invitation',
                        style: textTheme.buttonMedium.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    ),
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: context.colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: context.colors.black.withValues(alpha: 0.05),
                  blurRadius: 10.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: _buildReferralUrlSection(
              context,
              referralUrl: referralUrl,
              pendingCount: pendingCount,
              completedCount: completedCount,
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: context.colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: context.colors.black.withValues(alpha: 0.05),
                  blurRadius: 10.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: _buildTimelineSection(context, pendingCount: pendingCount),
          ),
        ),

        if (_earningRules.isNotEmpty)
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: context.colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: _buildEarningRulesSection(context),
            ),
          ),

        SliverToBoxAdapter(child: SizedBox(height: 16.h)),
      ],
    );
  }

  Widget _buildReferralUrlSection(
    BuildContext context, {
    required String referralUrl,
    required int pendingCount,
    required int completedCount,
  }) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.share, color: colors.primary, size: 20.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Share your referral link',
                style: textTheme.bodyLargeMedium.copyWith(
                  color: colors.text,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          'Send this link to your friends and earn rewards',
          style: textTheme.bodyMedium.copyWith(color: colors.gray),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: colors.grayLight,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  referralUrl,
                  style: textTheme.bodySmall.copyWith(
                    color: colors.text,
                    fontSize: 12.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.w),
              Material(
                color: colors.primary,
                borderRadius: BorderRadius.circular(8.r),
                child: InkWell(
                  onTap: () => _copyToClipboard(referralUrl),
                  borderRadius: BorderRadius.circular(8.r),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.copy, color: colors.white, size: 16.sp),
                        SizedBox(width: 6.w),
                        Text(
                          'Copy',
                          style: textTheme.bodySmall.copyWith(
                            color: colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.pending_outlined,
                label: 'Pending',
                value: '$pendingCount',
                color: colors.salmon,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle_outline,
                label: 'Completed',
                value: '$completedCount',
                color: colors.shamrock,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineSection(
    BuildContext context, {
    required int pendingCount,
  }) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Referral Journey',
          style: textTheme.bodyLargeMedium.copyWith(
            color: colors.text,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 24.h),
        _TimelineItem(
          isCompleted: true,
          text: 'You created an account',
          showConnector: true,
          colors: colors,
        ),
        _TimelineItem(
          isCompleted: pendingCount > 0,
          text: pendingCount > 0
              ? 'You have referred a friend'
              : 'You haven\'t referred a friend yet',
          showConnector: false,
          colors: colors,
        ),
      ],
    );
  }

  Widget _buildEarningRulesSection(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colors.shamrock.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.stars, color: colors.shamrock, size: 20.sp),
            ),
            SizedBox(width: 12.w),
            Text(
              'How to Earn',
              style: textTheme.bodyLargeMedium.copyWith(
                color: colors.text,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        ..._earningRules.asMap().entries.map((entry) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${entry.key + 1}',
                    style: textTheme.bodySmall.copyWith(
                      color: colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    entry.value.message,
                    style: textTheme.bodyMedium.copyWith(
                      color: colors.text,
                      height: 1.4.h,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.w),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: textTheme.headingLarge.copyWith(
              color: colors.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: textTheme.bodySmall.copyWith(
              color: colors.gray,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final bool isCompleted;
  final String text;
  final bool showConnector;
  final AppColors colors;

  const _TimelineItem({
    required this.isCompleted,
    required this.text,
    required this.showConnector,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textStyle;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              margin: EdgeInsets.only(right: 12.w, top: 2.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? colors.primary : colors.grayLight,
                border: Border.all(
                  color: isCompleted ? colors.primary : colors.gray,
                  width: 2.w,
                ),
              ),
              child: isCompleted
                  ? Icon(Icons.check, size: 12.sp, color: colors.white)
                  : null,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                  text,
                  style: textTheme.bodyMedium.copyWith(
                    color: isCompleted ? colors.text : colors.gray,
                    fontWeight: isCompleted
                        ? FontWeight.w500
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (showConnector)
          Container(
            width: 2.w,
            height: 32.h,
            margin: EdgeInsets.only(left: 9.w, top: 1.w, bottom: 1.w),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colors.primary, colors.primary.withValues(alpha: 0.3)],
              ),
            ),
          ),
      ],
    );
  }
}

class ReferralData {
  final String referralCode;
  final int pendingCount;
  final int completedCount;

  ReferralData({
    required this.referralCode,
    required this.pendingCount,
    required this.completedCount,
  });
}

class EarningRule {
  final String title;
  final String message;

  EarningRule({required this.title, required this.message});
}
