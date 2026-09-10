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
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/account_information_page/widgets/change_email_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/account_information_page/widgets/change_phone_number_bottom_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/personal_information_card.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/profile_header_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/app_menu_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({super.key});

  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  bool _isLoggingOut = false;

  @override
  void initState() {
    super.initState();
    context.read<UserProfileBloc>().add(
      const UserProfileEvent.loadUserProfile(),
    );
  }

  bool _isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  void _openChangeEmailBottomSheet(BuildContext pageContext) {
    ChangeEmailBottomSheet.show(pageContext);
  }

  void _openChangePasswordBottomSheet(BuildContext pageContext) {
    final formKey = GlobalKey<FormState>();
    final currentPassController = TextEditingController();
    final newPassController = TextEditingController();
    final confirmPassController = TextEditingController();
    bool obscureCurrent = true;
    bool obscureNew = true;
    bool obscureConfirm = true;

    showModalBottomSheet(
      context: pageContext,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        final mediaQuery = MediaQuery.of(bottomSheetContext);
        final bottomInset = mediaQuery.viewInsets.bottom;

        return BlocProvider.value(
          value: pageContext.read<UserProfileBloc>(),
          child: StatefulBuilder(
            builder: (context, setBottomSheetState) {
              return BlocConsumer<UserProfileBloc, UserProfileState>(
                listener: (context, state) {
                  state.mapOrNull(
                    error: (e) {
                      SnackBarUtils.showError(
                        bottomSheetContext,
                        e.message.isNotEmpty
                            ? e.message
                            : AppStrings.somethingWentWrong,
                      );
                    },
                    updateRequiresLogout: (s) {
                      _isLoggingOut = true;
                      Navigator.of(bottomSheetContext).pop();
                      SnackBarUtils.showSuccess(
                        pageContext,
                        s.message.isNotEmpty
                            ? s.message
                            : AppStrings.operationSuccessful,
                      );
                      pageContext
                          .read<AuthBloc>()
                          .add(const AuthEvent.userLoggedOut());
                      pageContext.go(Routes.login);
                    },
                  );
                },
                builder: (context, state) {
                  final isUpdating = state.maybeMap(
                    updating: (_) => true,
                    orElse: () => false,
                  );

                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      bottom: true,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 20.h,
                          bottom: bottomInset > 0 ? bottomInset + 16.h : 16.h,
                        ),
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Handle Bar
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

                                // Header Row
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Change Password',
                                      style: AppTypography.pageTitle,
                                    ),
                                    IconButton(
                                      onPressed: isUpdating
                                          ? null
                                          : () => Navigator.pop(
                                                bottomSheetContext,
                                              ),
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: AppColors.muted,
                                        size: 22.sp,
                                      ),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  AppStrings.passwordRequirement,
                                  style: AppTypography.bodyMuted,
                                ),
                                SizedBox(height: 20.h),

                                // Current Password
                                Text(
                                  'Current Password',
                                  style: AppTypography.inputLabel,
                                ),
                                SizedBox(height: 6.h),
                                TextFormField(
                                  controller: currentPassController,
                                  enabled: !isUpdating,
                                  obscureText: obscureCurrent,
                                  style: AppTypography.inputText,
                                  decoration: InputDecoration(
                                    hintText: AppStrings.enterCurrentPassword,
                                    hintStyle: AppTypography.inputHint,
                                    filled: true,
                                    fillColor: AppColors.pageBg,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        obscureCurrent
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 18.sp,
                                        color: AppColors.muted,
                                      ),
                                      onPressed: isUpdating
                                          ? null
                                          : () => setBottomSheetState(
                                                () => obscureCurrent =
                                                    !obscureCurrent,
                                              ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide:
                                          const BorderSide(color: AppColors.border),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide:
                                          const BorderSide(color: AppColors.border),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: AppColors.pickabooBlue,
                                        width: 1.5,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 12.h,
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return AppStrings.pleaseEnterCurrentPassword;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 14.h),

                                // New Password
                                Text(
                                  'New Password',
                                  style: AppTypography.inputLabel,
                                ),
                                SizedBox(height: 6.h),
                                TextFormField(
                                  controller: newPassController,
                                  enabled: !isUpdating,
                                  obscureText: obscureNew,
                                  style: AppTypography.inputText,
                                  decoration: InputDecoration(
                                    hintText: 'Enter new password',
                                    hintStyle: AppTypography.inputHint,
                                    filled: true,
                                    fillColor: AppColors.pageBg,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        obscureNew
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 18.sp,
                                        color: AppColors.muted,
                                      ),
                                      onPressed: isUpdating
                                          ? null
                                          : () => setBottomSheetState(
                                                () =>
                                                    obscureNew = !obscureNew,
                                              ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide:
                                          const BorderSide(color: AppColors.border),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide:
                                          const BorderSide(color: AppColors.border),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: AppColors.pickabooBlue,
                                        width: 1.5,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 12.h,
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.length < 6) {
                                      return AppStrings.passwordMinLength;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 14.h),

                                // Confirm Password
                                Text(
                                  'Confirm New Password',
                                  style: AppTypography.inputLabel,
                                ),
                                SizedBox(height: 6.h),
                                TextFormField(
                                  controller: confirmPassController,
                                  enabled: !isUpdating,
                                  obscureText: obscureConfirm,
                                  style: AppTypography.inputText,
                                  decoration: InputDecoration(
                                    hintText: AppStrings.enterConfirmPassword,
                                    hintStyle: AppTypography.inputHint,
                                    filled: true,
                                    fillColor: AppColors.pageBg,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        obscureConfirm
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 18.sp,
                                        color: AppColors.muted,
                                      ),
                                      onPressed: isUpdating
                                          ? null
                                          : () => setBottomSheetState(
                                                () => obscureConfirm =
                                                    !obscureConfirm,
                                              ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide:
                                          const BorderSide(color: AppColors.border),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide:
                                          const BorderSide(color: AppColors.border),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: AppColors.pickabooBlue,
                                        width: 1.5,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 12.h,
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return AppStrings.pleaseConfirmNewPassword;
                                    }
                                    if (val != newPassController.text) {
                                      return AppStrings.passwordsDoNotMatch;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 24.h),

                                // Submit Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48.h,
                                  child: ElevatedButton(
                                    onPressed: isUpdating
                                        ? null
                                        : () {
                                            if (formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              final currentPass =
                                                  currentPassController.text
                                                      .trim();
                                              final newPass =
                                                  newPassController.text
                                                      .trim();
                                              pageContext
                                                  .read<UserProfileBloc>()
                                                  .add(
                                                    UserProfileEvent
                                                        .changePassword(
                                                      currentPassword:
                                                          currentPass,
                                                      newPassword: newPass,
                                                    ),
                                                  );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.pickabooBlue,
                                      foregroundColor: AppColors.white,
                                      disabledBackgroundColor:
                                          AppColors.pickabooBlue.withValues(
                                        alpha: 0.6,
                                      ),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                    ),
                                    child: isUpdating
                                        ? SizedBox(
                                            height: 20.h,
                                            width: 20.h,
                                            child: const CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                AppColors.white,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            'Save Password',
                                            style: AppTypography.buttonPrimary,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (_isLoggingOut) return;
        state.mapOrNull(
          error: (e) {
            SnackBarUtils.showError(
              context,
              e.message.isNotEmpty ? e.message : AppStrings.somethingWentWrong,
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.pageBg,
        appBar: const PickabooAppBar(
          title: 'Account Information',
        ),
        bottomNavigationBar: Container(
          color: AppColors.pageBg,
          padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 48.h,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.push(Routes.editAccountInformation);
                },
                icon: Icon(
                  Icons.edit_outlined,
                  size: 18.sp,
                  color: AppColors.white,
                ),
                label: Text(
                  'Edit Account Information',
                  style: AppTypography.buttonPrimary,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pickabooBlue,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            final userData = state.mapOrNull(
              loaded: (s) =>
                  (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
              updating: (s) => (
                user: s.currentUser,
                imageUrl: s.imageUrl,
                mobile: s.mobileNumber,
              ),
              phoneUpdateOtpSent: (s) => (
                user: s.user,
                imageUrl: s.imageUrl,
                mobile: s.mobileNumber,
              ),
              loading: (s) => s.currentUser != null
                  ? (
                      user: s.currentUser!,
                      imageUrl: s.imageUrl,
                      mobile: s.mobileNumber,
                    )
                  : null,
              basicInfoUpdateSuccess: (s) =>
                  (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
              mobileUpdateSuccess: (s) =>
                  (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
              imageUploadSuccess: (s) =>
                  (user: s.user, imageUrl: s.imageUrl, mobile: s.mobileNumber),
            );

            if (userData == null) {
              final isLoading = state.maybeMap(
                loading: (_) => true,
                orElse: () => false,
              );
              if (isLoading) {
                return const AppLoader.fullPage();
              }
              return const SizedBox.shrink();
            }

            final user = userData.user;
            final imageUrl = userData.imageUrl;
            final mobileNumber = userData.mobile;
            final validImageUrl = _isValidImageUrl(imageUrl) ? imageUrl : null;

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                AppSpacing.sameGroupItemSpacing.w,
                0,
                AppSpacing.sameGroupItemSpacing.w,
                AppSpacing.sameGroupItemSpacing.h,
              ),
              child: Column(
                children: [
                  ProfileHeaderCard(
                    user: user,
                    validImageUrl: validImageUrl,
                  ),

                  AppSpacing.groupToGroupGap,

                  PersonalInformationCard(
                    user: user,
                    mobileNumber: mobileNumber,
                  ),

                  AppSpacing.groupToGroupGap,

                  // ── Security & Credentials Menu Tiles ──
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
                            AppStrings.accountSecurity,
                            style: AppTypography.sectionTitle,
                          ),
                        ),
                        Divider(height: 1.h, color: AppColors.border),
                        AppMenuTile(
                          icon: Icons.phone_outlined,
                          title: 'Change Phone Number',
                          subtitle: 'Update your registered mobile number',
                          onTap: () => ChangePhoneNumberBottomSheet.show(context),
                          showDivider: true,
                        ),
                        AppMenuTile(
                          icon: Icons.email_outlined,
                          title: 'Change Email',
                          subtitle: 'Update your registered email address',
                          onTap: () => _openChangeEmailBottomSheet(context),
                          showDivider: true,
                        ),
                        AppMenuTile(
                          icon: Icons.lock_outline_rounded,
                          title: 'Change Password',
                          subtitle: 'Update your account login password',
                          onTap: () => _openChangePasswordBottomSheet(context),
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
