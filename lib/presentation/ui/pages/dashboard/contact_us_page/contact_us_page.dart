// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/app_menu_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  void _requireAuth(
    BuildContext context,
    VoidCallback action, {
    UserEntity? user,
  }) {
    if (user == null) {
      context.push(Routes.login);
    } else {
      action();
    }
  }

  Future<void> _launchPhone(BuildContext context, String phone) async {
    final cleaned = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    final uri = Uri(scheme: 'tel', path: cleaned);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse('tel:$cleaned'), mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      try {
        await launchUrl(Uri.parse('tel:$cleaned'), mode: LaunchMode.externalApplication);
      } catch (_) {
        if (context.mounted) {
          SnackBarUtils.showError(context, 'Could not open dialer');
        }
      }
    }
  }

  Future<void> _launchWhatsApp(BuildContext context, String phone) async {
    final cleaned = phone.replaceAll(RegExp(r'[^0-9]'), '');
    final nativeUri = Uri.parse('whatsapp://send?phone=$cleaned');
    final webUri = Uri.parse('https://wa.me/$cleaned');
    try {
      if (await canLaunchUrl(nativeUri)) {
        await launchUrl(nativeUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      try {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } catch (_) {
        if (context.mounted) {
          SnackBarUtils.showError(context, 'Could not open WhatsApp');
        }
      }
    }
  }

  /*
  Future<void> _launchEmail(BuildContext context, String email) async {
    final cleanEmail = email.trim();
    final uri = Uri(scheme: 'mailto', path: cleanEmail);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse('mailto:$cleanEmail'), mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      try {
        await launchUrl(Uri.parse('mailto:$cleanEmail'), mode: LaunchMode.externalApplication);
      } catch (_) {
        if (context.mounted) {
          SnackBarUtils.showError(context, 'Could not open email client');
        }
      }
    }
  }

  Future<void> _launchMaps(BuildContext context, String address) async {
    final encoded = Uri.encodeComponent(address);
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encoded');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }

  void _showOfficeAddressBottomSheet(BuildContext context) {
    const address =
        '9 KA/KHA, Level 5, Tejgaon Industrial Area, Tejgaon, Dhaka - 1215';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.groupToGroupSpacing.w,
              12.h,
              AppSpacing.groupToGroupSpacing.w,
              AppSpacing.groupToGroupSpacing.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top drag handle
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // Title row with icon and close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: AppColors.amber.withValues(alpha: 0.12),
                            borderRadius: AppRadius.buttonRadius,
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.amber,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        const Text(
                          'Corporate Office',
                          style: AppTypography.titleMedium,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppColors.muted,
                        size: 20.sp,
                      ),
                      onPressed: () => Navigator.pop(sheetContext),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Divider(height: 1.h, color: AppColors.border),
                SizedBox(height: 16.h),

                // Address info card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: AppColors.pageBg,
                    borderRadius: AppRadius.cardRadius,
                    border: Border.all(color: AppColors.border, width: 1.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pickaboo Headquarters',
                        style: AppTypography.titleSmall.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        address,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.navy,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                // "Open in Google Maps" button
                AppButton.primary(
                  height: 46.h,
                  borderRadius: AppRadius.buttonRadius,
                  icon: Icon(
                    Icons.map_outlined,
                    size: 18.sp,
                    color: AppColors.white,
                  ),
                  text: 'Open in Google Maps',
                  onPressed: () {
                    Navigator.pop(sheetContext);
                    _launchMaps(context, address);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: AppStrings.contactUs,
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          final user = state.maybeWhen(
            loaded: (user, _, _) => user,
            orElse: () => null,
          );

          return SafeArea(
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
                // ── 1. SUPPORT TICKET HERO CARD ──
                AppCard(
                  padding: EdgeInsets.all(
                    AppSpacing.sameGroupItemSpacing.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: const BoxDecoration(
                              color: AppColors.surfaceBlue,
                              borderRadius: AppRadius.buttonRadius,
                            ),
                            child: Icon(
                              Icons.confirmation_num_outlined,
                              color: AppColors.pickabooBlue,
                              size: 20.sp,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create a Support Ticket',
                                  style: AppTypography.titleMedium,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Have an issue with your order? Our team is here to help',
                                  style: AppTypography.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      AppButton.primary(
                        height: 44.h,
                        borderRadius: BorderRadius.circular(10.r),
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          size: 18.sp,
                          color: AppColors.white,
                        ),
                        text: AppStrings.createTicket,
                        onPressed: () => _requireAuth(
                          context,
                          () => context.push(Routes.createTicket),
                          user: user,
                        ),
                      ),
                    ],
                  ),
                ),

                AppSpacing.groupToGroupGap,

                // ── 2. REACH US DIRECTLY CARD ──
                AppCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Customer Hotline
                      AppMenuTile(
                        icon: Icons.phone_in_talk_outlined,
                        customIconColor: AppColors.green,
                        title: 'Customer Hotline',
                        subtitle: '+88 09666 745 745 (10 AM - 9 PM)',
                        onTap: () => _launchPhone(context, '+8809666745745'),
                      ),
                      Divider(
                        height: 1.h,
                        thickness: 1.h,
                        indent: AppMenuTile.dividerIndent,
                        color: AppColors.border,
                      ),

                      // 2. WhatsApp
                      // AppMenuTile(
                      //   icon: Icons.chat_outlined,
                      //   customIconColor: AppColors.whatsApp,
                      //   title: 'WhatsApp',
                      //   onTap: () => _launchWhatsApp(context, '+8801708127000'),
                      // ),

                      // // 3. Support Email
                      // Divider(
                      //   height: 1.h,
                      //   thickness: 1.h,
                      //   indent: AppMenuTile.dividerIndent,
                      //   color: AppColors.border,
                      // ),
                      // AppMenuTile(
                      //   icon: Icons.email_outlined,
                      //   customIconColor: AppColors.pickabooBlue,
                      //   title: 'Support Email',
                      //   subtitle: 'support@pickaboo.com',
                      //   onTap: () => _launchEmail(context, 'support@pickaboo.com'),
                      // ),

                      // // 4. Corporate Office
                      // Divider(
                      //   height: 1.h,
                      //   thickness: 1.h,
                      //   indent: AppMenuTile.dividerIndent,
                      //   color: AppColors.border,
                      // ),
                      // AppMenuTile(
                      //   icon: Icons.location_on_outlined,
                      //   customIconColor: AppColors.amber,
                      //   title: 'Corporate Office',
                      //   subtitle:
                      //       '9 KA/KHA, Level 5, Tejgaon Industrial Area, Tejgaon, Dhaka - 1215',
                      //   onTap: () => _showOfficeAddressBottomSheet(context),
                      // ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
      },
    ),
  );
}
}
