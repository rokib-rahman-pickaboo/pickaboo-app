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
import 'package:pickaboo/presentation/ui/widgets/common/permission_prompt.dart';
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
    if (state != AppLifecycleState.resumed || !_sentToSettings) return;
    _sentToSettings = false;
    Permission.notification.status.then((status) {
      if (!mounted || !status.isGranted) return;
      _toggleNotifications(true);
    });
  }

  Future<void> _loadNotificationSettings() async {
    setState(() => _isLoading = true);

    try {
      final notificationService = getIt<PushNotificationService>();
      final isEnabled = await notificationService.isNotificationsEnabled();

      if (mounted) {
        setState(() => _notificationsEnabled = isEnabled);
      }
    } catch (e) {
      debugPrint('Error loading notification settings: $e');
      if (mounted) {
        setState(() => _notificationsEnabled = true);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _toggleNotifications(bool value) async {
    if (value) {
      final status = await Permission.notification.status;
      if (status.isPermanentlyDenied || status.isDenied) {
        final requested = await Permission.notification.request();
        if (!mounted) return;
        if (requested.isPermanentlyDenied) {
          _sentToSettings = await PermissionPrompt.notifications(context);
          return;
        }
        if (!requested.isGranted) return;
      }
    }

    setState(() => _isLoading = true);

    try {
      final notificationService = getIt<PushNotificationService>();

      if (value) {
        await notificationService.enableNotifications();
      } else {
        await notificationService.disableNotifications();
      }

      if (mounted) {
        setState(() => _notificationsEnabled = value);

        SnackBarUtils.showSuccess(
          context,
          value
              ? 'Notifications enabled successfully'
              : 'Notifications disabled successfully',
        );
      }
    } catch (e) {
      debugPrint('Error toggling notifications: $e');
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
                            style: AppTypography.sectionTitle,
                          ),
                        ),
                        Divider(height: 1.h, color: AppColors.border),
                        AppMenuTile(
                          icon: Icons.notifications_none_rounded,
                          title: 'All Notifications',
                          subtitle: 'Push notification alerts & updates',
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
                            style: AppTypography.sectionTitle,
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
