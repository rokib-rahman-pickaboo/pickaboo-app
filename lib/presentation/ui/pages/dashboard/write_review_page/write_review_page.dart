import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_event.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_state.dart';
import 'package:pickaboo/presentation/bloc/write_review_bloc/write_review_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/ui/widgets/write_review_page/rating_input_row.dart';
import 'dart:io';

class WriteReviewPage extends StatefulWidget {
  final String productId;
  final String productName;
  final String productImage;

  const WriteReviewPage({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImage,
  });

  @override
  State<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  final TextEditingController _reviewController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _showPhotoPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.black.withValues(alpha: 0.0),
      builder: (c) => Container(
        decoration: BoxDecoration(
          color: context.colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.fromLTRB(
          20.w,
          24.h,
          20.w,
          24.h + MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: context.colors.grayLight,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "Add Photos",
              style: context.textStyle.headingMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPickerOption(
                  context,
                  icon: Icons.camera_alt_rounded,
                  label: "Camera",
                  onTap: () {
                    Navigator.pop(c);
                    context.read<PhotoPickerBloc>().add(
                      const PhotoPickerEvent.pickFromCamera(
                        maxWidth: 500,
                        maxHeight: 500,
                      ),
                    );
                  },
                ),
                _buildPickerOption(
                  context,
                  icon: Icons.photo_library_rounded,
                  label: "Gallery",
                  onTap: () {
                    Navigator.pop(c);
                    context.read<PhotoPickerBloc>().add(
                      const PhotoPickerEvent.pickFromGallery(
                        maxWidth: 500,
                        maxHeight: 500,
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: context.colors.primary, size: 32.sp),
          ),
          SizedBox(height: 8.h),
          Text(label, style: context.textStyle.bodyMedium),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: Text("Write Review", style: context.textStyle.appBarTitle),
      ),
      body: ResponsiveContainer(
        child: BlocListener<PhotoPickerBloc, PhotoPickerState>(
          listener: (context, photoState) {
            if (photoState.status == PhotoPickerStatus.success ||
                photoState.status == PhotoPickerStatus.clear ||
                photoState.status == PhotoPickerStatus.empty) {
              final paths =
                  photoState.images?.map((e) => e.path).toList() ?? [];
              context.read<WriteReviewBloc>().add(
                WriteReviewEvent.updateImages(paths),
              );
            }
            if (photoState.status == PhotoPickerStatus.error &&
                photoState.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(photoState.errorMessage!)));
            }
          },
          child: BlocConsumer<WriteReviewBloc, WriteReviewState>(
            listener: (context, state) {
              state.mapOrNull(
                success: (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Review submitted successfully!"),
                    ),
                  );
                  context.pop();
                },
                error: (err) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(err.message)));
                },
              );
            },
            builder: (context, state) {
              return state.maybeMap(
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                initial: (initialData) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: colors.borderColor),
                              boxShadow: [
                                BoxShadow(
                                  color: colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.w,
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: colors.white,
                                    border: Border.all(
                                      color: colors.borderColor.withValues(
                                        alpha: 0.5,
                                      ),
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.productImage,
                                    fit: BoxFit.contain,
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.image_not_supported_outlined,
                                      color: colors.textMedium,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Text(
                                    widget.productName,
                                    style: textStyle.bodyLargeBold.copyWith(
                                      fontSize: 16.sp,
                                      height: 1.3.h,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 24.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            "Rating",
                            style: textStyle.headingMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 12.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: colors.borderColor),
                            ),
                            child: Column(
                              children: [
                                RatingInputRow(
                                  label: "Price",
                                  rating: initialData.priceRating,
                                  onRatingChanged: (r) =>
                                      context.read<WriteReviewBloc>().add(
                                        WriteReviewEvent.updateRating(
                                          'price',
                                          r,
                                        ),
                                      ),
                                ),
                                RatingInputRow(
                                  label: "Value",
                                  rating: initialData.valueRating,
                                  onRatingChanged: (r) =>
                                      context.read<WriteReviewBloc>().add(
                                        WriteReviewEvent.updateRating(
                                          'value',
                                          r,
                                        ),
                                      ),
                                ),
                                RatingInputRow(
                                  label: "Quality",
                                  rating: initialData.qualityRating,
                                  onRatingChanged: (r) =>
                                      context.read<WriteReviewBloc>().add(
                                        WriteReviewEvent.updateRating(
                                          'quality',
                                          r,
                                        ),
                                      ),
                                ),
                                RatingInputRow(
                                  label: "Service",
                                  rating: initialData.serviceRating,
                                  onRatingChanged: (r) =>
                                      context.read<WriteReviewBloc>().add(
                                        WriteReviewEvent.updateRating(
                                          'service',
                                          r,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 24.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            "Review",
                            style: textStyle.headingMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 12.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _reviewController,
                              maxLines: 5,
                              maxLength: 500,
                              style: textStyle.bodyMedium,
                              decoration: InputDecoration(
                                hintText: "Enter your message here",
                                hintStyle: textStyle.bodyMedium.copyWith(
                                  color: colors.textMedium,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                    color: colors.borderColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(
                                    color: colors.borderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: colors.primary),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: colors.red),
                                ),
                                contentPadding: EdgeInsets.all(16.w),
                                filled: true,
                                fillColor: colors.white,
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a review description';
                                }
                                return null;
                              },
                              onChanged: (val) => context
                                  .read<WriteReviewBloc>()
                                  .add(WriteReviewEvent.updateReviewText(val)),
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 24.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: GestureDetector(
                            onTap: () => _showPhotoPickerOptions(context),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              decoration: BoxDecoration(
                                color: colors.primary.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: colors.primary.withValues(alpha: 0.5),
                                  style: BorderStyle.solid,
                                  width: 1.w,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_outlined,
                                    color: colors.primary,
                                    size: 28.sp,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "Add Photos",
                                    style: textStyle.bodyLargeBold.copyWith(
                                      color: colors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: BlocBuilder<PhotoPickerBloc, PhotoPickerState>(
                          builder: (context, photoState) {
                            final images = photoState.images ?? [];
                            if (images.isEmpty) {
                              return const SizedBox.shrink();
                            }

                            return Padding(
                              padding: EdgeInsets.only(
                                top: 16.h,
                                left: 16.w,
                                right: 16.w,
                              ),
                              child: SizedBox(
                                height: 80.w,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: images.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 12.w),
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                          child: Image.file(
                                            File(images[index].path),
                                            width: 80.w,
                                            height: 80.w,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                                  return Container(
                                                    width: 80.w,
                                                    height: 80.w,
                                                    decoration: BoxDecoration(
                                                      color: colors.grayLight,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.r,
                                                          ),
                                                      border: Border.all(
                                                        color:
                                                            colors.borderColor,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.error_outline,
                                                      ),
                                                    ),
                                                  );
                                                },
                                          ),
                                        ),
                                        Positioned(
                                          right: 4.w,
                                          top: 4.w,
                                          child: GestureDetector(
                                            onTap: () => context
                                                .read<PhotoPickerBloc>()
                                                .add(
                                                  PhotoPickerEvent.removeImageAtIndex(
                                                    index,
                                                  ),
                                                ),
                                            child: Container(
                                              padding: EdgeInsets.all(4.w),
                                              decoration: BoxDecoration(
                                                color: colors.black.withValues(
                                                  alpha: 0.6,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: colors.white,
                                                size: 14.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 40.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<WriteReviewBloc>().add(
                                    WriteReviewEvent.submitReview(
                                      widget.productId,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Submit Review",
                                style: textStyle.buttonLarge.copyWith(
                                  color: colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                    ],
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
