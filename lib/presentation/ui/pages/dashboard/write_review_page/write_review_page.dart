// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_event.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_state.dart';
import 'package:pickaboo/presentation/bloc/write_review_bloc/write_review_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/ui/widgets/write_review_page/rating_input_row.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Modern WriteReviewPage matching Pickaboo-App-UI design language.
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
  void initState() {
    super.initState();
    context.read<PhotoPickerBloc>().add(const PhotoPickerEvent.clear());
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _showPhotoPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      builder: (c) => Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        padding: EdgeInsets.fromLTRB(
          20.w,
          16.h,
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
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Add Photos",
              style: AppTypography.titleLarge,
            ),
            SizedBox(height: 24.h),
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
            SizedBox(height: 16.h),
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
              color: AppColors.surfaceBlue,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.pickabooBlue.withValues(alpha: 0.3),
              ),
            ),
            child: Icon(icon, color: AppColors.pickabooBlue, size: 28.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: AppTypography.bodyLarge,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: "Write Review",
      ),
      bottomNavigationBar: Container(
        color: AppColors.pageBg,
        padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
        child: SafeArea(
          top: false,
          child: BlocBuilder<WriteReviewBloc, WriteReviewState>(
            builder: (context, state) {
              final isSubmitting = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return AppButton.primary(
                height: 48.h,
                borderRadius: AppRadius.cardRadius,
                isLoading: isSubmitting,
                text: "Submit Review",
                onPressed: isSubmitting
                    ? null
                    : () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<WriteReviewBloc>().add(
                            WriteReviewEvent.submitReview(
                              widget.productId,
                            ),
                          );
                        }
                      },
              );
            },
          ),
        ),
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
            if (photoState.status == PhotoPickerStatus.error) {
              SnackBarUtils.showError(
                context,
                photoState.errorMessage ?? AppStrings.somethingWentWrong,
              );
            }
          },
          child: BlocConsumer<WriteReviewBloc, WriteReviewState>(
            listener: (context, state) {
              state.mapOrNull(
                success: (_) {
                  SnackBarUtils.showSuccess(
                    context,
                    "Review submitted successfully!",
                  );
                  context.pop();
                },
                error: (err) {
                  SnackBarUtils.showError(context, err.message);
                },
              );
            },
            builder: (context, state) {
              return state.maybeMap(
                loading: (_) => const AppLoader.fullPage(),
                initial: (initialData) {
                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 12.h)),

                      // ── Product Summary Card ──
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sameGroupItemSpacing.w,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppRadius.cardRadius,
                              border: Border.all(color: AppColors.border),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.navy.withValues(alpha: 0.03),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 2.h),
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
                                    borderRadius: AppRadius.cardRadius,
                                    color: AppColors.pageBg,
                                    border: Border.all(
                                      color: AppColors.border,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: AppRadius.cardRadius,
                                    child: AppImage(
                                      imageUrl: widget.productImage,
                                      fit: BoxFit.contain,
                                      errorWidget: const Icon(
                                        Icons.image_not_supported_outlined,
                                        color: AppColors.mutedLight,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 14.w),
                                Expanded(
                                  child: Text(
                                    widget.productName,
                                    style: AppTypography.titleSmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                      // ── Ratings Section ──
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sameGroupItemSpacing.w,
                          ),
                          child: Text(
                            "Rating",
                            style: AppTypography.titleSmall,
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 8.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sameGroupItemSpacing.w,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: AppRadius.cardRadius,
                              border: Border.all(color: AppColors.border),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.navy.withValues(alpha: 0.03),
                                  blurRadius: 8.r,
                                  offset: Offset(0, 2.h),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                RatingInputRow(
                                  label: "Price",
                                  rating: initialData.priceRating,
                                  onRatingChanged: (r) =>
                                      context.read<WriteReviewBloc>().add(
                                        WriteReviewEvent.updateRating('price', r),
                                      ),
                                ),
                                const Divider(height: 12, color: AppColors.border),
                                RatingInputRow(
                                  label: "Value",
                                  rating: initialData.valueRating,
                                  onRatingChanged: (r) =>
                                      context.read<WriteReviewBloc>().add(
                                        WriteReviewEvent.updateRating('value', r),
                                      ),
                                ),
                                const Divider(height: 12, color: AppColors.border),
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
                                const Divider(height: 12, color: AppColors.border),
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

                      SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                      // ── Review Text Field ──
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sameGroupItemSpacing.w,
                          ),
                          child: Text(
                            "Review",
                            style: AppTypography.titleSmall,
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 8.h)),

                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sameGroupItemSpacing.w,
                          ),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _reviewController,
                              maxLines: 5,
                              maxLength: 500,
                              style: AppTypography.bodyLarge.regular(),
                              decoration: InputDecoration(
                                hintText: "Enter your message here",
                                hintStyle: AppTypography.inputHint,
                                border: const OutlineInputBorder(
                                  borderRadius: AppRadius.cardRadius,
                                  borderSide: BorderSide(
                                    color: AppColors.border,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: AppRadius.cardRadius,
                                  borderSide: BorderSide(
                                    color: AppColors.border,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: AppRadius.cardRadius,
                                  borderSide: BorderSide(
                                    color: AppColors.pickabooBlue,
                                    width: 1.5,
                                  ),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius: AppRadius.cardRadius,
                                  borderSide: BorderSide(
                                    color: AppColors.red,
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(14.w),
                                filled: true,
                                fillColor: AppColors.white,
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

                      SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                      // ── Add Photos Button ──
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.sameGroupItemSpacing.w,
                          ),
                          child: GestureDetector(
                            onTap: () => _showPhotoPickerOptions(context),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceBlue,
                                borderRadius: AppRadius.cardRadius,
                                border: Border.all(
                                  color: AppColors.pickabooBlue.withValues(
                                    alpha: 0.4,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_outlined,
                                    color: AppColors.pickabooBlue,
                                    size: 26.sp,
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "Add Photos",
                                    style: AppTypography.brandAction,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // ── Attached Photos Preview ──
                      SliverToBoxAdapter(
                        child: BlocBuilder<PhotoPickerBloc, PhotoPickerState>(
                          builder: (context, photoState) {
                            final images = photoState.images ?? [];
                            if (images.isEmpty) {
                              return const SizedBox.shrink();
                            }

                            return Padding(
                              padding: EdgeInsets.only(
                                top: 12.h,
                                left: AppSpacing.sameGroupItemSpacing.w,
                                right: AppSpacing.sameGroupItemSpacing.w,
                              ),
                              child: SizedBox(
                                height: 74.w,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: images.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 10.w),
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width: 74.w,
                                          height: 74.w,
                                          decoration: BoxDecoration(
                                            borderRadius: AppRadius.cardRadius,
                                            border: Border.all(
                                              color: AppColors.border,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: AppRadius.cardRadius,
                                            child: Image.file(
                                              File(images[index].path),
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  color: AppColors.pageBg,
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.error_outline,
                                                      color: AppColors.red,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
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
                                              padding: EdgeInsets.all(3.w),
                                              decoration: BoxDecoration(
                                                color: AppColors.black.withValues(
                                                  alpha: 0.6,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: AppColors.white,
                                                size: 12.sp,
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

                      SliverToBoxAdapter(child: SizedBox(height: 16.h)),
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
