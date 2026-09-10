import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'app_menu_tile.dart';

/// Wraps a grouped list of [AppMenuTile]s inside an [AppCard] with dividers.
class ProfileSectionCard extends StatelessWidget {
  final List<AppMenuTile> children;

  const ProfileSectionCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i < children.length - 1)
              Divider(
                height: 1.h,
                thickness: 1.h,
                indent: AppMenuTile.dividerIndent,
                color: AppColors.border,
              ),
          ],
        ],
      ),
    );
  }
}
