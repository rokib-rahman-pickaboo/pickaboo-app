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
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/your_review_page/review_row_item.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Your Reviews Page matching Pickaboo-App-UI design.
class YourReviewPage extends StatefulWidget {
  const YourReviewPage({super.key});

  @override
  State<YourReviewPage> createState() => _YourReviewPageState();
}

class _YourReviewPageState extends State<YourReviewPage> {
  @override
  void initState() {
    super.initState();
    context.read<ReviewBloc>().add(const ReviewEvent.getUserReviews());
  }

  Future<void> _refreshReviews() async {
    context.read<ReviewBloc>().add(const ReviewEvent.getUserReviews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'Your Reviews',
      ),
      body: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state.userReviewsError != null) {
            return Center(
              child: Text(
                'Error: ${state.userReviewsError!.message}',
                style: AppTypography.inputError,
              ),
            );
          }

          if (state.isUserReviewsLoading || state.userReviews == null) {
            return const AppLoader.fullPage();
          }

          final reviews = state.userReviews!;
          if (reviews.isEmpty) {
            return _buildEmptyState(context);
          }

          return RefreshIndicator(
            onRefresh: _refreshReviews,
            color: AppColors.pickabooBlue,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sameGroupItemSpacing.w,
                vertical: AppSpacing.sameGroupItemSpacing.h,
              ),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return ReviewRowItem(
                        review: review,
                        isLast: index == reviews.length - 1,
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return AppEmptyView.reviews();
  }
}
