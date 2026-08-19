import 'dart:io';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';

import 'package:pickaboo/presentation/bloc/auth/login_bloc/login_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/registration_bloc/registration_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/login_page/social_login_button.dart';
import 'package:pinput/pinput.dart';

class RegistrationPage extends StatefulWidget {
  final String phone;

  const RegistrationPage({super.key, required this.phone});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _otpController = TextEditingController();
  String _otp = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sendOtp();
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _sendOtp({bool resend = false}) {
    if (widget.phone.isEmpty) {
      SnackBarUtils.showError(context, 'Phone number is required');
      return;
    }

    context.read<RegistrationBloc>().add(
      RegistrationEvent.sendOtp(encryptedMobile: widget.phone, resend: resend),
    );
  }

  Future<void> _handleContinue() async {
    FocusScope.of(context).unfocus();
    if (_otp.length == 4) {
      context.read<RegistrationBloc>().add(
        RegistrationEvent.verifyOtp(mobile: widget.phone, otp: _otp),
      );
    } else {
      SnackBarUtils.showInfo(context, 'Please enter 4-digit OTP');
    }
  }

  Future<void> _signInWithGoogle() async {
    FocusScope.of(context).unfocus();
    try {
      if (kDebugMode) {
        print('🔵 [Google Sign-In] Starting Google sign-in process...');
      }

      final GoogleSignIn googleSignIn = GoogleSignIn();
      if (kDebugMode) {
        print('🔵 [Google Sign-In] GoogleSignIn instance created');
      }

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (kDebugMode) {
        print(
          '🔵 [Google Sign-In] Sign-in completed. User: ${googleUser?.email ?? "null"}',
        );
      }

      if (googleUser == null) {
        if (kDebugMode) {
          print('⚠️ [Google Sign-In] User canceled the sign-in');
        }
        return;
      }

      if (kDebugMode) {
        print('🔵 [Google Sign-In] Getting authentication details...');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? accessToken = googleAuth.accessToken;

      if (kDebugMode) {
        print(
          '🔵 [Google Sign-In] Access token obtained: ${accessToken != null ? "✅ Yes (length: ${accessToken.length})" : "❌ No"}',
        );
      }

      if (accessToken != null) {
        final source = Platform.isAndroid ? 'android' : 'ios';
        if (kDebugMode) {
          print('🔵 [Google Sign-In] Dispatching loginWithSocial event...');
          print('   - Provider: google');
          print('   - Source: $source');
          print('   - Token length: ${accessToken.length}');
        }

        if (!mounted) return;
        context.read<LoginBloc>().add(
          LoginEvent.loginWithSocial(
            accessToken: accessToken,
            provider: 'google',
            source: source,
          ),
        );

        if (kDebugMode) {
          print('✅ [Google Sign-In] Event dispatched successfully');
        }
      } else {
        if (kDebugMode) {
          print('❌ [Google Sign-In] Failed to get access token');
        }
        if (mounted) {
          SnackBarUtils.showError(context, 'Failed to get Google access token');
        }
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('❌ [Google Sign-In] Exception occurred: $e');
        print('Stack trace: $stackTrace');
      }
      if (mounted) {
        SnackBarUtils.showError(
          context,
          'Google Sign-In failed: ${e.toString()}',
        );
      }
    }
  }

  Future<void> _signInWithFacebook() async {
    FocusScope.of(context).unfocus();
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;

        if (accessToken != null) {
          final source = Platform.isAndroid ? 'android' : 'ios';
          if (!mounted) return;
          context.read<LoginBloc>().add(
            LoginEvent.loginWithSocial(
              accessToken: accessToken.tokenString,
              provider: 'facebook',
              source: source,
            ),
          );
        } else {
          if (mounted) {
            SnackBarUtils.showError(
              context,
              'Failed to get Facebook access token',
            );
          }
        }
      } else if (result.status == LoginStatus.cancelled) {
        return;
      } else {
        if (mounted) {
          SnackBarUtils.showError(
            context,
            'Facebook Sign-In failed: ${result.message ?? "Unknown error"}',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        SnackBarUtils.showError(
          context,
          'Facebook Sign-In failed: ${e.toString()}',
        );
      }
    }
  }

  Future<void> _signInWithApple() async {
    FocusScope.of(context).unfocus();
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final String? identityToken = credential.identityToken;

      if (identityToken != null) {
        if (!mounted) return;
        context.read<LoginBloc>().add(
          LoginEvent.loginWithSocial(
            accessToken: identityToken,
            provider: 'apple',
            source: 'ios',
          ),
        );
      } else {
        if (mounted) {
          SnackBarUtils.showError(
            context,
            'Failed to get Apple identity token',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        SnackBarUtils.showError(
          context,
          'Apple Sign-In failed: ${e.toString()}',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return MultiBlocListener(
      listeners: [
        BlocListener<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            state.maybeWhen(
              sendingOtp: () {
                setState(() => _isLoading = true);
              },
              otpSent: (message) {
                setState(() => _isLoading = false);
                SnackBarUtils.showSuccess(context, message);
              },
              otpSendFailed: (error) {
                setState(() => _isLoading = false);
                SnackBarUtils.showError(context, error);
              },
              verifyingOtp: () {
                setState(() => _isLoading = true);
              },
              otpVerified: () {
                setState(() => _isLoading = false);
                SnackBarUtils.showSuccess(
                  context,
                  'OTP verified successfully!',
                );
                context.push(
                  Routes.registrationDetail,
                  extra: {'phone': widget.phone, 'otp': _otp},
                );
              },
              otpVerificationFailed: (error) {
                setState(() => _isLoading = false);
                SnackBarUtils.showError(context, error);
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            state.maybeWhen(
              loginLoading: () {
                setState(() => _isLoading = true);
              },
              loginSuccess: (message, isLogin) {
                setState(() => _isLoading = false);
                SnackBarUtils.showSuccess(context, 'Login Successful!');
                context.go(Routes.dashboard);
              },
              loginFailure: (error) {
                setState(() => _isLoading = false);
                SnackBarUtils.showError(context, error);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        body: ResponsiveContainer(
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 15.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppBarButton(
                        iconPath: 'assets/new/svg/back_nav_icon.svg',
                        width: 7.w,
                        height: 14.h,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop();
                        },
                        iconColor: colors.text,
                      ),
                    ),
                  ),
                ),

                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        SizedBox(height: 52.h),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 188.w,
                          height: 45.h,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              "assets/images/pickaboo-login-logo.png",
                              width: 188.w,
                              height: 45.h,
                            );
                          },
                        ),

                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 40.h),

                                Text(
                                  'Enter OTP for',
                                  style: textTheme.displayLarge.copyWith(
                                    color: colors.text,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'verification',
                                  style: textTheme.displayLarge.copyWith(
                                    color: colors.text,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 40.h),

                                _buildOtpInput(),

                                SizedBox(height: 20.h),

                                Container(
                                  width: double.infinity,
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        colors.button,
                                        colors.button.withValues(alpha: 0.85),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: colors.button.withValues(
                                          alpha: 0.3,
                                        ),
                                        blurRadius: 12.r,
                                        offset: Offset(0, 4.h),
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: _isLoading
                                        ? null
                                        : _handleContinue,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: colors.black.withValues(
                                        alpha: 0.0,
                                      ),
                                      shadowColor: colors.black.withValues(
                                        alpha: 0.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                    ),
                                    child: _isLoading
                                        ? SizedBox(
                                            height: 22.h,
                                            width: 22.w,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2.5.w,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    colors.white,
                                                  ),
                                            ),
                                          )
                                        : Text(
                                            'Continue',
                                            style: context.textStyle.buttonLarge
                                                .withColor(colors.white),
                                          ),
                                  ),
                                ),

                                SizedBox(height: 12.h),

                                _buildTermsAndPrivacy(),

                                SizedBox(height: 20.h),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(color: colors.borderColor),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                      ),
                                      child: Text(
                                        'Or Login with',
                                        style: textTheme.bodyMedium.copyWith(
                                          color: colors.gray,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(color: colors.borderColor),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 12.h),
                              ],
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            SocialLoginButton(
                              onPressed: _signInWithGoogle,
                              svgIcon: 'assets/new/svg/google_icon.svg',
                              label: 'Continue with Google',
                              backgroundColor: colors.white,
                              textColor: const Color(0xFF1F1F1F),
                              borderColor: const Color(0xFFE0E0E0),
                            ),
                            SizedBox(height: 16.h),

                            SocialLoginButton(
                              onPressed: _signInWithFacebook,
                              svgIcon: 'assets/new/svg/facebook_icon.svg',
                              label: 'Continue with Facebook',
                              backgroundColor: const Color(0xFF1877F2),
                              textColor: colors.white,
                            ),
                            SizedBox(height: 16.h),

                            if (Theme.of(context).platform ==
                                TargetPlatform.iOS)
                              SocialLoginButton(
                                onPressed: _signInWithApple,
                                svgIcon: 'assets/new/svg/apple_icon.svg',
                                label: 'Continue with Apple',
                                backgroundColor: colors.black,
                                textColor: colors.white,
                                iconColor: colors.white,
                              ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpInput() {
    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 48.h,
      textStyle: context.textStyle.bodyLargeBold.withColor(context.colors.text),
      decoration: BoxDecoration(
        color: context.colors.white,
        border: Border.all(color: context.colors.borderColor),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: context.colors.primary, width: 2.w),
        boxShadow: [
          BoxShadow(
            color: context.colors.primary.withValues(alpha: 0.1),
            blurRadius: 12.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: context.colors.primary.withValues(alpha: 0.05),
        border: Border.all(color: context.colors.primary, width: 2.w),
      ),
    );

    return Pinput(
      controller: _otpController,
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      showCursor: true,
      autofillHints: const [AutofillHints.oneTimeCode],
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onChanged: (value) {
        setState(() {
          _otp = value;
        });
      },
      onCompleted: (pin) {
        setState(() {
          _otp = pin;
        });
        _handleContinue();
      },
    );
  }

  Widget _buildTermsAndPrivacy() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: context.textStyle.bodySmall.withColor(context.colors.gray),
          children: [
            const TextSpan(text: 'By continuing, I accept the '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  context.push(Routes.terms);
                },
                child: Text(
                  'Terms and conditions',
                  style: context.textStyle.bodySmall
                      .withColor(context.colors.primary)
                      .copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: context.colors.primary,
                      ),
                ),
              ),
            ),
            const TextSpan(text: ' and the '),
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  context.push(Routes.privacyPolicy);
                },
                child: Text(
                  'Privacy Policy.',
                  style: context.textStyle.bodySmall
                      .withColor(context.colors.primary)
                      .copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: context.colors.primary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
