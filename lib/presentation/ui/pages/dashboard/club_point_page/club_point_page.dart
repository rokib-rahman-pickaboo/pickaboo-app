import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_bloc.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_event.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_state.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/club_point_page/club_points_header.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/club_point_page/earning_rule_item.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/club_point_page/point_history_item.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ClubPointPage extends StatefulWidget {
  const ClubPointPage({super.key});

  @override
  State<ClubPointPage> createState() => _ClubPointPageState();
}

class _ClubPointPageState extends State<ClubPointPage> {
  int _historyLimit = 5;

  final ScrollController _scrollController = ScrollController();

  ClubPointEntity? _lastData;

  @override
  void initState() {
    super.initState();
    context.read<ClubPointBloc>().add(
      const ClubPointEvent.getClubPoints(limit: 5),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore(int currentCount) {
    if (_historyLimit < currentCount) {
      setState(() => _historyLimit += 5);
      context.read<ClubPointBloc>().add(
        ClubPointEvent.getClubPoints(limit: _historyLimit),
      );
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
        title: const Text('Club Points'),
      ),
      body: SafeArea(
        top: false,
        child: BlocConsumer<ClubPointBloc, ClubPointState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (data) => _lastData = data,
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => _lastData != null
                  ? _buildContent(
                      context,
                      _lastData!,
                      colors,
                      textTheme,
                      isLoadingMore: true,
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: colors.primary,
                        strokeWidth: 2.w,
                      ),
                    ),
              error: (message) => _lastData != null
                  ? _buildContent(context, _lastData!, colors, textTheme)
                  : Center(child: Text(message)),
              loaded: (data) => _buildContent(context, data, colors, textTheme),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ClubPointEntity data,
    AppColors colors,
    AppTextStyles textTheme, {
    bool isLoadingMore = false,
  }) {
    return CustomScrollView(
      controller: _scrollController,
      key: const PageStorageKey('clubPointScroll'),
      slivers: [
        SliverToBoxAdapter(child: ClubPointsHeader(data: data)),

        if (data.pointHistory.isNotEmpty)
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: colors.black.withValues(alpha: 0.04),
                    blurRadius: 8.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Point History',
                    style: textTheme.bodyLargeMedium.copyWith(
                      color: colors.text,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  PointHistoryTimeline(history: data.pointHistory),
                  if (_historyLimit <
                      (int.tryParse(data.pointHistoryCount) ?? 0))
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: OutlinedButton(
                          onPressed: isLoadingMore
                              ? null
                              : () => _loadMore(
                                  int.tryParse(data.pointHistoryCount) ?? 0,
                                ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: colors.primary, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: isLoadingMore
                              ? SizedBox(
                                  height: 16.w,
                                  width: 16.w,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.w,
                                    color: colors.primary,
                                  ),
                                )
                              : Text(
                                  'Load More',
                                  style: textTheme.bodySmall.copyWith(
                                    color: colors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

        SizedBox(height: 16.h).toSliver,

        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: colors.black.withValues(alpha: 0.04),
                  blurRadius: 8.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: colors.shamrock.withAlpha(25),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.card_giftcard,
                        color: colors.shamrock,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'How to Earn Points',
                      style: textTheme.bodyLargeMedium.copyWith(
                        color: colors.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                if (data.generalEarningRules.isNotEmpty)
                  ...data.generalEarningRules.asMap().entries.map((entry) {
                    return Column(
                      children: [
                        EarningRuleItem(rule: entry.value, index: entry.key),
                        if (entry.key < data.generalEarningRules.length - 1)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            child: Divider(
                              height: 1.h,
                              color: colors.borderColor.withAlpha(76),
                            ),
                          ),
                      ],
                    );
                  }),
              ],
            ),
          ),
        ),

        SizedBox(height: 16.h).toSliver,

        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: colors.black.withValues(alpha: 0.04),
                  blurRadius: 8.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: colors.salmon.withAlpha(25),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: colors.salmon,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'How to Spend Points',
                      style: textTheme.bodyLargeMedium.copyWith(
                        color: colors.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  'You can use your club points at checkout while placing order.',
                  style: textTheme.bodyMedium.copyWith(
                    color: colors.gray,
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
      ],
    );
  }
}

extension on SizedBox {
  Widget get toSliver => SliverToBoxAdapter(child: this);
}
