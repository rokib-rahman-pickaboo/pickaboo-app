import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProfileHeaderCard extends StatelessWidget {
  final UserEntity user;
  final String? validImageUrl;

  const ProfileHeaderCard({super.key, required this.user, this.validImageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Container(
      margin: EdgeInsets.all(16.w),
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
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors.primary.withAlpha(25),
              image: validImageUrl != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(validImageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: validImageUrl == null
                ? Icon(Icons.person, size: 40.sp, color: colors.primary)
                : null,
          ),
          SizedBox(width: 16.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstname} ${user.lastname}',
                  style: textTheme.headingSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.text,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  user.email,
                  style: textTheme.bodySmall.copyWith(color: colors.gray),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
