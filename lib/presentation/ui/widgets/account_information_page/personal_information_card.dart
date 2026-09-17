// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/enums/gender_enum.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/app_menu_tile.dart';

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
    final fullName = '${user.firstname} ${user.lastname}'.trim();
    final genderText =
        Gender.fromValue(user.gender ?? 0)?.label ?? AppStrings.notProvided;
    final dobText =
        user.dob?.isNotEmpty == true ? _formatDate(user.dob!) : AppStrings.notProvided;
    final phoneText = mobileNumber?.isNotEmpty == true
        ? mobileNumber!
        : AppStrings.notProvided;

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.sameGroupItemSpacing.w * 1.5,
              12.h,
              AppSpacing.sameGroupItemSpacing.w * 1.5,
              8.h,
            ),
            child: Text(
              AppStrings.personalInformation,
              style: AppTypography.titleMedium,
            ),
          ),
          Divider(height: 1.h, color: AppColors.border),

          AppMenuTile(
            icon: Icons.person_outline_rounded,
            title: AppStrings.fullName,
            subtitle: fullName.isNotEmpty ? fullName : AppStrings.notProvided,
            isDetailMode: true,
          ),
          Divider(
            height: 1.h,
            thickness: 1.h,
            indent: AppMenuTile.dividerIndent,
            color: AppColors.border,
          ),

          AppMenuTile(
            icon: Icons.email_outlined,
            title: AppStrings.emailAddress,
            subtitle: user.email.isNotEmpty ? user.email : AppStrings.notProvided,
            isDetailMode: true,
          ),
          Divider(
            height: 1.h,
            thickness: 1.h,
            indent: AppMenuTile.dividerIndent,
            color: AppColors.border,
          ),

          AppMenuTile(
            icon: Icons.phone_outlined,
            title: AppStrings.mobileNumber,
            subtitle: phoneText,
            isDetailMode: true,
          ),
          Divider(
            height: 1.h,
            thickness: 1.h,
            indent: AppMenuTile.dividerIndent,
            color: AppColors.border,
          ),

          AppMenuTile(
            icon: Icons.wc_outlined,
            title: AppStrings.gender,
            subtitle: genderText,
            isDetailMode: true,
          ),
          Divider(
            height: 1.h,
            thickness: 1.h,
            indent: AppMenuTile.dividerIndent,
            color: AppColors.border,
          ),

          AppMenuTile(
            icon: Icons.cake_outlined,
            title: AppStrings.dateOfBirth,
            subtitle: dobText,
            isDetailMode: true,
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
