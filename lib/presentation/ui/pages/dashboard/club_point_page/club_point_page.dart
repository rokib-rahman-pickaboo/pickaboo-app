// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_event.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_state.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/club_point_page/club_points_header.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/club_point_page/point_history_item.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class ClubPointPage extends StatefulWidget {
  const ClubPointPage({super.key});

  @override
  State<ClubPointPage> createState() => _ClubPointPageState();
}

class _ClubPointPageState extends State<ClubPointPage> {
  int _historyLimit = 5;
  ClubPointEntity? _lastData;

  @override
  void initState() {
    super.initState();
    context.read<ClubPointBloc>().add(
      const ClubPointEvent.getClubPoints(limit: 5),
    );
  }

  void _loadMore(int totalCount) {
    if (_historyLimit < totalCount) {
      setState(() => _historyLimit += 5);
      context.read<ClubPointBloc>().add(
        ClubPointEvent.getClubPoints(limit: _historyLimit),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'Club Points',
      ),
      body: BlocConsumer<ClubPointBloc, ClubPointState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (data) => _lastData = data,
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => _lastData != null
                ? _buildContent(context, _lastData!, isLoadingMore: true)
                : const AppLoader.fullPage(),
            error: (message) => _lastData != null
                ? _buildContent(context, _lastData!)
                : Center(
                    child: Text(
                      message,
                      style: AppTypography.inputError,
                    ),
                  ),
            loaded: (data) => _buildContent(context, data),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ClubPointEntity data, {
    bool isLoadingMore = false,
  }) {
    final totalHistoryCount = int.tryParse(data.pointHistoryCount) ??
        data.pointHistory.length;
    final hasMore = data.pointHistory.length < totalHistoryCount;

    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          AppSpacing.sameGroupItemSpacing.w,
          0,
          AppSpacing.sameGroupItemSpacing.w,
          AppSpacing.sameGroupItemSpacing.h + 16.h,
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. TOP HEADER HERO CARD (BLUE GRADIENT WITH LIFETIME POINTS & BALANCE) ──
          ClubPointsHeader(data: data),

          AppSpacing.groupToGroupGap,

          // ── 2. POINT HISTORY SECTION (TIMELINE PLUS) ──
          if (data.pointHistory.isNotEmpty) ...[
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
                          Icons.history_rounded,
                          color: AppColors.pickabooBlue,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Points History',
                        style: AppTypography.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // TIMELINE ITEM
                  PointHistoryTimeline(history: data.pointHistory),

                  if (hasMore) ...[
                    AppSpacing.gapV14,
                    Center(
                      child: AppButton.outline(
                        text: 'Load More',
                        textColor: AppColors.pickabooBlue,
                        borderColor: AppColors.pickabooBlue,
                        borderRadius: BorderRadius.circular(10.r),
                        isFullWidth: false,
                        size: AppButtonSize.sm,
                        isLoading: isLoadingMore,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        onPressed: isLoadingMore
                            ? null
                            : () => _loadMore(totalHistoryCount),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            AppSpacing.groupToGroupGap,
          ],

          // ── 3. HOW TO EARN POINTS ──
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
                        color: AppColors.greenBg,
                        borderRadius: AppRadius.buttonRadius,
                      ),
                      child: Icon(
                        Icons.card_giftcard_rounded,
                        color: AppColors.green,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'How to Earn Points',
                      style: AppTypography.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 14.h),

                if (data.generalEarningRules.isNotEmpty)
                  ...data.generalEarningRules.map((rule) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: _buildRuleTile(
                        icon: Icons.card_giftcard_outlined,
                        iconBg: AppColors.surfaceBlue,
                        iconColor: AppColors.pickabooBlue,
                        title: rule.title,
                        subtitle: rule.message,
                      ),
                    );
                  })
                else ...[
                  _buildRuleTile(
                    icon: Icons.shopping_bag_outlined,
                    iconBg: AppColors.surfaceBlue,
                    iconColor: AppColors.pickabooBlue,
                    title: 'Earn by shopping on Pickaboo',
                    subtitle:
                        'Earn club points on every purchase made on the Pickaboo platform.',
                  ),
                  SizedBox(height: 12.h),
                  _buildRuleTile(
                    icon: Icons.share_outlined,
                    iconBg: AppColors.greenBg,
                    iconColor: AppColors.green,
                    title: 'Refer & Earn',
                    subtitle:
                        'Earn bonus club points when friends join & place their first order using your referral link.',
                  ),
                  SizedBox(height: 12.h),
                  _buildRuleTile(
                    icon: Icons.rate_review_outlined,
                    iconBg: AppColors.amber.withValues(alpha: 0.12),
                    iconColor: AppColors.amber,
                    title: 'Review & Win',
                    subtitle:
                        'Earn club points by reviewing your delivered products on the Pickaboo app.',
                  ),
                ],
              ],
            ),
          ),

          AppSpacing.groupToGroupGap,

          // ── 4. HOW TO SPEND POINTS ──
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
                        color: AppColors.redBg,
                        borderRadius: AppRadius.buttonRadius,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.red,
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'How to Spend Points',
                      style: AppTypography.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  'You can redeem your Club Points directly at checkout during payment to receive instant discounts on your orders.',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),

          SizedBox(height: 30.h),
        ],
      ),
    ),
  );
}

  Widget _buildRuleTile({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: iconColor, size: 18.sp),
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
