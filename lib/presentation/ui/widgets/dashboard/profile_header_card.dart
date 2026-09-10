import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/user_image_widget.dart';

/// Smart profile header card switching between authenticated user and guest view.
class ProfileHeaderCard extends StatelessWidget {
  final bool isLoggedIn;
  final UserEntity? user;
  final String? imageUrl;
  final VoidCallback? onEditTap;
  final VoidCallback? onLoginTap;

  const ProfileHeaderCard({
    super.key,
    required this.isLoggedIn,
    this.user,
    this.imageUrl,
    this.onEditTap,
    this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return (isLoggedIn && user != null)
        ? _buildLoggedIn(context, user!)
        : _buildGuest(context);
  }

  Widget _buildLoggedIn(BuildContext context, UserEntity user) {
    return AppCard(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing + 4.w),
      child: Row(
        children: [
          UserImageWidget(
            size: 52.w,
            imageUrl: imageUrl,
            name: '${user.firstname} ${user.lastname}'.trim(),
            borderColor: AppColors.pickabooBlue,
            borderWidth: 2.0.w,
          ),
          SizedBox(width: AppSpacing.sameGroupItemSpacing + 4.w),

          // ── User Information ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstname} ${user.lastname}'.trim(),
                  style: NewAppTypography.mainHeaderTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  user.email.isNotEmpty ? user.email : 'Pickaboo Customer',
                  style: NewAppTypography.bodyMuted,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  'User ID: #${user.id}',
                  style: NewAppTypography.bodyMuted,
                ),
              ],
            ),
          ),

          // ── Edit Button ──
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: AppColors.pickabooBlue.withValues(alpha: 0.08),
              borderRadius: AppRadius.buttonRadius,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.edit_outlined,
                color: AppColors.pickabooBlue,
                size: 18.sp,
              ),
              onPressed: onEditTap,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuest(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing + 4.w),
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.pickabooBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.pickabooBlue.withValues(alpha: 0.4),
                width: 1.5.w,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.person_outline_rounded,
                color: AppColors.pickabooBlue,
                size: 28.sp,
              ),
            ),
          ),
          SizedBox(width: AppSpacing.sameGroupItemSpacing + 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Pickaboo!',
                  style: NewAppTypography.mainHeaderTitle,
                ),
                SizedBox(height: 2.h),
                Text(
                  'Login to continue & unlock exclusive deals',
                  style: NewAppTypography.bodyMuted,
                ),
                SizedBox(height: 10.h),
                ElevatedButton.icon(
                  onPressed: onLoginTap,
                  icon: Icon(
                    Icons.login_rounded,
                    size: 14.sp,
                    color: AppColors.white,
                  ),
                  label: Text(
                    'LOGIN / REGISTER',
                    style: AppTypography.buttonPrimary.copyWith(
                      fontSize: 11.sp,
                      letterSpacing: 0.3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pickabooBlue,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
