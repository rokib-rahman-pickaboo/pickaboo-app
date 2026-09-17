// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/user_image_widget.dart';

class ProfileHeaderCard extends StatelessWidget {
  final UserEntity user;
  final String? validImageUrl;

  const ProfileHeaderCard({super.key, required this.user, this.validImageUrl});

  @override
  Widget build(BuildContext context) {
    final fullName = '${user.firstname} ${user.lastname}'.trim();
    final displayName = fullName.isNotEmpty ? fullName : 'Pickaboo User';

    return AppCard(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w + 6.w,
        vertical: 20.h,
      ),
      child: Column(
        children: [
          // ── Large Avatar with Initials Fallback ──
          UserImageWidget.profileHeader(
            imageUrl: validImageUrl,
            name: displayName,
          ),
          SizedBox(height: 12.h),

          // ── Name & Email ──
          Text(
            displayName,
            style: AppTypography.titleLarge,
          ),
          if (user.email.isNotEmpty) ...[
            SizedBox(height: 2.h),
            Text(
              user.email,
              style: AppTypography.bodySmall,
            ),
          ],
          if (user.id != 0) ...[
            SizedBox(height: 2.h),
            Text(
              'User ID: ${user.id}',
              style: AppTypography.bodySmall,
            ),
          ],
        ],
      ),
    );
  }
}
