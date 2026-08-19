import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';

class NotificationListPage extends StatelessWidget {
  const NotificationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: const Text('Notification List'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Component: IndexNotificationList')],
        ),
      ),
    );
  }
}
