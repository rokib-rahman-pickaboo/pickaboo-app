// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

/// Shared "we can't ask again" dialog.
///
/// Android stops showing the system permission sheet after two denials and
/// every later request returns `deniedForever` instantly; iOS does the same
/// after one denial. Re-requesting is a silent no-op, so the only way forward
/// is the app's own settings page — without this the button simply does
/// nothing and looks broken.
class PermissionPrompt {
  const PermissionPrompt._();

  /// Shows the explanation and, if the user agrees, opens the OS settings for
  /// this app. Returns `true` when the user was sent to Settings, so the
  /// caller can re-check the permission on resume.
  static Future<bool> openSettings(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.dialogRadius,
        ),
        title: Text(title),
        content: Text(message),
        actions: [
          AppButton.ghost(
            text: AppStrings.notNow,
            isFullWidth: false,
            size: AppButtonSize.sm,
            textColor: AppColors.muted,
            onPressed: () => Navigator.of(dialogContext).pop(false),
          ),
          AppButton.primary(
            text: AppStrings.openSettings,
            isFullWidth: false,
            size: AppButtonSize.sm,
            borderRadius: AppRadius.buttonRadius,
            onPressed: () => Navigator.of(dialogContext).pop(true),
          ),
        ],
      ),
    );

    if (confirmed != true) return false;

    await Geolocator.openAppSettings();
    return true;
  }

  /// Copy for the location permission, used by the product page and the
  /// delivery sheet so both read the same.
  static Future<bool> location(BuildContext context) => openSettings(
    context,
    title: 'Turn on location',
    message:
        'Allow location access to see delivery time and charges for your '
        'area. You can turn it on any time in Settings.',
  );

  /// Copy for notifications.
  static Future<bool> notifications(BuildContext context) => openSettings(
    context,
    title: 'Turn on notifications',
    message:
        'Allow notifications to get order updates, delivery alerts and offers. '
        'You can turn them on any time in Settings.',
  );
}
