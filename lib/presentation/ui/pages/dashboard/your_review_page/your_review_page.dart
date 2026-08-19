import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/bloc/review_bloc/review_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/your_review_page/review_row_item.dart';

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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: Text(
          'Your Reviews',
          style: context.textStyle.appBarTitle,
        ),
        backgroundColor: colors.white,
        elevation: 0.5,
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<ReviewBloc, ReviewState>(
          builder: (context, state) {
            if (state.userReviewsError != null) {
              return Center(
                child: Text('Error: ${state.userReviewsError!.message}'),
              );
            }

            if (state.isUserReviewsLoading || state.userReviews == null) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }

            final reviews = state.userReviews!;
            if (reviews.isEmpty) {
              return _buildEmptyState(context);
            }

            return ListView.builder(
              padding: EdgeInsets.all(15.w),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return ReviewRowItem(
                  review: review,
                  isLast: index == reviews.length - 1,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.rate_review_outlined, size: 80.w, color: colors.gray),
          SizedBox(height: 20.h),
          Text(
            'Empty Review',
            style: textStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w500,
              color: colors.text,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'You have no review',
            style: textStyle.bodyMedium.copyWith(color: colors.gray),
          ),
        ],
      ),
    );
  }
}
