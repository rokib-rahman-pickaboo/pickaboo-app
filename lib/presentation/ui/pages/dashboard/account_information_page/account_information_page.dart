import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';

import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/change_email_section.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/change_password_section.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/personal_information_card.dart';
import 'package:pickaboo/presentation/ui/widgets/account_information_page/profile_header_card.dart';

class AccountInformationPage extends StatefulWidget {
  const AccountInformationPage({super.key});

  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  bool _isChangeEmailEnabled = false;

  bool _isChangePasswordEnabled = false;

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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        state.mapOrNull(
          error: (e) {
            debugPrint('AccountInfoPage: Error state received: ${e.message}');
            SnackBarUtils.showError(context, e.message);
          },
          updateRequiresLogout: (s) {
            debugPrint(
              'AccountInfoPage: UpdateRequiresLogout state received: ${s.message}',
            );
            SnackBarUtils.showSuccess(context, s.message);
            context.go(Routes.login);
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Information'),
          leading: AppBarButton(
            iconPath: 'assets/new/svg/back_nav_icon.svg',
            width: 7.w,
            height: 14.h,
            onPressed: () => Navigator.of(context).pop(),
            iconColor: colors.text,
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: colors.white,
            boxShadow: [
              BoxShadow(
                color: colors.black.withValues(alpha: 0.05),
                blurRadius: 10.r,
                offset: Offset(0, -2.h),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: ElevatedButton(
              onPressed: () {
                context.push(Routes.editAccountInformation);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.button,
                minimumSize: Size(double.infinity, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Edit Profile',
                style: context.textStyle.buttonMedium.copyWith(
                  color: colors.white,
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
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.primary,
                    strokeWidth: 2.w,
                  ),
                );
              }
              return const SizedBox.shrink();
            }

            final user = userData.user;
            final imageUrl = userData.imageUrl;
            final mobileNumber = userData.mobile;
            final validImageUrl = _isValidImageUrl(imageUrl) ? imageUrl : null;

            return CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverToBoxAdapter(
                  child: ProfileHeaderCard(
                    user: user,
                    validImageUrl: validImageUrl,
                  ),
                ),

                SliverToBoxAdapter(
                  child: PersonalInformationCard(
                    user: user,
                    mobileNumber: mobileNumber,
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                SliverToBoxAdapter(
                  child: ChangeEmailSection(
                    isEnabled: _isChangeEmailEnabled,
                    onToggle: () {
                      setState(
                        () => _isChangeEmailEnabled = !_isChangeEmailEnabled,
                      );
                    },
                    onSave: (newEmail) {
                      debugPrint(
                        'AccountInfoPage: Initiating email update: $newEmail',
                      );
                      context.read<UserProfileBloc>().add(
                        UserProfileEvent.updateEmail(newEmail),
                      );
                    },
                  ),
                ),

                SliverToBoxAdapter(
                  child: ChangePasswordSection(
                    isEnabled: _isChangePasswordEnabled,
                    onToggle: () {
                      setState(
                        () => _isChangePasswordEnabled =
                            !_isChangePasswordEnabled,
                      );
                    },
                    onSave: (currentPass, newPass) {
                      debugPrint('AccountInfoPage: Initiating password change');
                      context.read<UserProfileBloc>().add(
                        UserProfileEvent.changePassword(
                          currentPassword: currentPass,
                          newPassword: newPass,
                        ),
                      );
                    },
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              ],
            );
          },
        ),
      ),
    );
  }
}
