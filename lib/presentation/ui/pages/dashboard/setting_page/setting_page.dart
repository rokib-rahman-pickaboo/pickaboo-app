// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/app_menu_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  final Future<PackageInfo> _appPackageInfo = PackageInfo.fromPlatform();
  bool _notificationsEnabled = false;
  bool _isLoading = true;
  bool _sentToSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadNotificationSettings();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    _sentToSettings = false;
    _syncNotificationSettings();
  }

  Future<void> _loadNotificationSettings() async {
    setState(() => _isLoading = true);
    await _syncNotificationSettings();
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _syncNotificationSettings() async {
    try {
      final notificationService = getIt<PushNotificationService>();
      final isPrefEnabled = await notificationService.isNotificationsEnabled();
      final status = await Permission.notification.status;

      if (!status.isGranted && isPrefEnabled) {
        await notificationService.disableNotifications();
      } else if (status.isGranted && !isPrefEnabled && _sentToSettings) {
        await notificationService.enableNotifications();
      }

      final updatedPref = await notificationService.isNotificationsEnabled();
      if (mounted) {
        setState(() {
          _notificationsEnabled = status.isGranted && updatedPref;
        });
      }
    } catch (e) {
      debugPrint('Error syncing notification settings: $e');
    }
  }

  Future<void> _toggleNotifications(bool value) async {
    final notificationService = getIt<PushNotificationService>();

    if (value) {
      final status = await Permission.notification.status;
      if (!status.isGranted) {
        final requested = await Permission.notification.request();
        if (!mounted) return;
        if (!requested.isGranted) {
          _sentToSettings = true;
          await openAppSettings();
          return;
        }
      }

      setState(() => _isLoading = true);
      try {
        await notificationService.enableNotifications();
        if (mounted) {
          setState(() => _notificationsEnabled = true);
          SnackBarUtils.showSuccess(
            context,
            'Notifications enabled successfully',
          );
        }
      } catch (e) {
        debugPrint('Error enabling notifications: $e');
        if (mounted) {
          SnackBarUtils.showError(
            context,
            'Failed to update notification settings',
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    } else {
      // User is turning OFF notifications
      try {
        await notificationService.disableNotifications();
      } catch (e) {
        debugPrint('Error disabling notifications: $e');
      }

      if (mounted) {
        setState(() => _notificationsEnabled = false);
        SnackBarUtils.showRegular(
          context,
          'Opening App Settings to disable notifications...',
        );
      }

      _sentToSettings = true;
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: AppStrings.appSettings,
      ),
      body: _isLoading
          ? const AppLoader.fullPage()
          : SafeArea(
              top: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.sameGroupItemSpacing.w,
                  0,
                  AppSpacing.sameGroupItemSpacing.w,
                  AppSpacing.sameGroupItemSpacing.h + 16.h,
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── 1. NOTIFICATIONS CARD ──
                  AppCard(
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
                            AppStrings.notifications,
                            style: AppTypography.titleMedium,
                          ),
                        ),
                        Divider(height: 1.h, color: AppColors.border),
                        AppMenuTile(
                          icon: Icons.notifications_none_rounded,
                          title: 'All Notifications',
                          subtitle: 'Push notification alerts & updates',
                          onTap: () async {
                            _sentToSettings = true;
                            await openAppSettings();
                          },
                          trailing: Switch(
                            value: _notificationsEnabled,
                            activeTrackColor: AppColors.pickabooBlue,
                            onChanged: _toggleNotifications,
                          ),
                        ),
                      ],
                    ),
                  ),

                  AppSpacing.groupToGroupGap,

                  // ── 2. APP INFORMATION CARD ──
                  AppCard(
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
                            AppStrings.appInformation,
                            style: AppTypography.titleMedium,
                          ),
                        ),
                        Divider(height: 1.h, color: AppColors.border),

                        // Version
                        FutureBuilder<PackageInfo>(
                          future: _appPackageInfo,
                          builder: (context, snapshot) {
                            final version = snapshot.data?.version ?? '';
                            return AppMenuTile(
                              icon: Icons.info_outline_rounded,
                              title: AppStrings.appVersion,
                              subtitle: version.isNotEmpty ? version : '...',
                              showTrailing: false,
                            );
                          },
                        ),
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          indent: AppMenuTile.dividerIndent,
                          color: AppColors.border,
                        ),

                        // Privacy Policy
                        AppMenuTile(
                          icon: Icons.privacy_tip_outlined,
                          title: AppStrings.privacyPolicy,
                          subtitle: 'Policies, terms & privacy statement',
                          onTap: () {
                            context.push(
                              Routes.privacyPolicy,
                              extra: {
                                'title': AppStrings.privacyPolicy,
                                'url': 'privacy-policy',
                              },
                            );
                          },
                        ),
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          indent: AppMenuTile.dividerIndent,
                          color: AppColors.border,
                        ),

                        // Terms & Conditions
                        AppMenuTile(
                          icon: Icons.description_outlined,
                          title: AppStrings.termsAndConditions,
                          subtitle: 'Policies, terms & user agreement',
                          onTap: () => context.push(Routes.terms),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
    );
  }
}
