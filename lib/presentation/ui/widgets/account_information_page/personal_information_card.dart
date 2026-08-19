import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/enums/gender_enum.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:intl/intl.dart';
import 'user_info_item.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class PersonalInformationCard extends StatelessWidget {
  final UserEntity user;
  final String? mobileNumber;

  const PersonalInformationCard({
    super.key,
    required this.user,
    this.mobileNumber,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Container(
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
            'Personal Information',
            style: textTheme.bodyMediumMedium.copyWith(
              color: colors.text,
            ),
          ),
          SizedBox(height: 16.h),
          UserInfoItem(
            icon: Icons.person_outline,
            title: 'Full Name',
            value: '${user.firstname} ${user.lastname}',
          ),
          UserInfoItem(
            icon: Icons.phone_outlined,
            title: 'Contact Number',
            value: mobileNumber?.isNotEmpty == true
                ? mobileNumber!
                : 'Not provided',
          ),
          UserInfoItem(
            icon: Icons.email_outlined,
            title: 'Email Address',
            value: user.email,
          ),
          Row(
            children: [
              Expanded(
                child: UserInfoItem(
                  icon: Icons.wc_outlined,
                  title: 'Gender',
                  value:
                      Gender.fromValue(user.gender ?? 0)?.label ??
                      'Not specified',
                  showDivider: false,
                ),
              ),
              Expanded(
                child: UserInfoItem(
                  icon: Icons.cake_outlined,
                  title: 'Date of Birth',
                  value: user.dob?.isNotEmpty == true
                      ? _formatDate(user.dob!)
                      : 'Not specified',
                  showDivider: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(String dob) {
    try {
      final dateTime = DateTime.parse(dob);
      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (_) {
      return dob;
    }
  }
}
