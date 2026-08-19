import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/data/services/push_notification_service.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/permission_prompt.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/setting_page/setting_list_item.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/setting_page/setting_toggle_item.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/setting_page/settings_section.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  bool _notificationsEnabled = false;
  bool _isLoading = true;

  /// True while the user is in the OS settings screen after being prompted
  /// from the notifications toggle.
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
    // Granted while away → finish what the toggle started.
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
    // Flipping the app's own switch on is pointless while the OS permission is
    // permanently denied — the system dialog never appears again, so the
    // toggle would snap on and no notification would ever arrive.
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

  Future<void> _handleLogout() async {
    if (kDebugMode) {
      print('🚪 [LOGOUT] Logout button pressed in Settings');
      print('   Capturing AuthBloc reference...');
    }

    final authBloc = context.read<AuthBloc>();
    final colors = context.colors;
    final textTheme = context.textStyle;

    if (kDebugMode) {
      print('   Showing confirmation dialog...');
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Logout',
          style: textTheme.headingLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: colors.text,
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: textTheme.bodyMedium.copyWith(color: colors.gray),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (kDebugMode) {
                print('   Logout cancelled');
              }
              Navigator.pop(ctx, false);
            },
            child: Text(
              'Cancel',
              style: textTheme.bodyMedium.copyWith(color: colors.gray),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (kDebugMode) {
                print('✅ [LOGOUT] Logout confirmed!');
                print('   Closing dialog...');
              }
              Navigator.pop(ctx, true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.salmon,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Logout',
              style: textTheme.bodyMedium.copyWith(
                color: colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      if (kDebugMode) {
        print('   Triggering AuthEvent.userLoggedOut()');
      }

      authBloc.add(const AuthEvent.userLoggedOut());

      if (kDebugMode) {
        print('   Logout event dispatched successfully');
      }
    }
  }

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
        title: Text('Settings', style: context.textStyle.appBarTitle),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: colors.primary,
                strokeWidth: 2.w,
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SettingsSection(
                    title: 'Notifications',
                    children: [
                      SettingToggleItem(
                        title: 'All Notifications',
                        value: _notificationsEnabled,
                        onChanged: _toggleNotifications,
                      ),
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: SettingsSection(
                    title: 'App Information',
                    children: [
                      const SettingListItem(
                        title: 'Version',
                        subtitle: '1.0.0',
                        onTap: null,
                      ),
                      SettingListItem(
                        title: 'Privacy Policy',
                        onTap: () {
                          context.push(
                            Routes.privacyPolicy,
                            extra: {
                              'title': 'Privacy Policy',
                              'url': 'privacy-policy',
                            },
                          );
                        },
                      ),
                      SettingListItem(
                        title: 'Terms & Conditions',
                        onTap: () => context.push(Routes.terms),
                        showDivider: false,
                      ),
                    ],
                  ),
                ),

                BlocBuilder<UserProfileBloc, UserProfileState>(
                  builder: (context, state) {
                    final isLoggedIn = state.maybeWhen(
                      loaded: (_, _, _) => true,
                      basicInfoUpdateSuccess: (_, _, _, _) => true,
                      mobileUpdateSuccess: (_, _, _, _) => true,
                      imageUploadSuccess: (_, _, _, _) => true,
                      orElse: () => false,
                    );

                    if (!isLoggedIn) {
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    }

                    return SliverToBoxAdapter(
                      child: SettingsSection(
                        title: 'Account',
                        children: [
                          SettingListItem(
                            title: 'Logout',
                            titleColor: colors.salmon,
                            icon: Icons.logout,
                            onTap: _handleLogout,
                            showDivider: false,
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              ],
            ),
    );
  }
}
