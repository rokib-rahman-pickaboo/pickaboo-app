// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pinput/pinput.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/auth/login_bloc/login_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/registration_bloc/registration_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modernized Pickaboo Registration OTP Page
/// Seamlessly bridges Pickaboo-App-UI aesthetics with OTP BLoC state architecture.
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

  Timer? _resendTimer;
  int _resendCountdown = 300; // 5 minutes timeout

  String get _formattedCountdown {
    final minutes = (_resendCountdown ~/ 60).toString().padLeft(2, '0');
    final seconds = (_resendCountdown % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    setState(() => _resendCountdown = 300);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_resendCountdown > 0) {
        setState(() => _resendCountdown--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sendOtp();
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
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
    _dismissKeyboard();
    if (_resendCountdown <= 0) {
      SnackBarUtils.showError(context, 'OTP has expired. Please request a new OTP.');
      return;
    }
    if (_otp.length == 4) {
      context.read<RegistrationBloc>().add(
        RegistrationEvent.verifyOtp(mobile: widget.phone, otp: _otp),
      );
    } else {
      SnackBarUtils.showInfo(context, 'Please enter 4-digit OTP');
    }
  }

  Future<void> _signInWithGoogle() async {
    _dismissKeyboard();
    try {
      if (kDebugMode) {
        print('🔵 [Google Sign-In] Starting Google sign-in process...');
      }

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: Platform.isIOS ? AppConstants.googleIosClientId : null,
        serverClientId: AppConstants.googleAndroidWebClientId,
        scopes: const ['email', 'profile'],
      );

      // Sign out first to clear any cached/stale sessions
      try {
        await googleSignIn.signOut();
      } catch (_) {}

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        if (kDebugMode) {
          print('⚠️ [Google Sign-In] User canceled the sign-in');
        }
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? accessToken = googleAuth.accessToken ?? googleAuth.idToken;

      if (accessToken != null) {
        final source = Platform.isAndroid ? 'android' : 'ios';
        if (!mounted) return;
        context.read<LoginBloc>().add(
          LoginEvent.loginWithSocial(
            accessToken: accessToken,
            provider: 'google',
            source: source,
          ),
        );
      } else {
        if (mounted) {
          SnackBarUtils.showError(context, 'Failed to get Google access token');
        }
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('❌ [Google Sign-In] Exception occurred: $e\n$stackTrace');
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
    _dismissKeyboard();
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: const ['public_profile', 'email'],
      );

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
    _dismissKeyboard();
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
                _startResendTimer();
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
      child: GestureDetector(
        onTap: _dismissKeyboard,
        behavior: HitTestBehavior.opaque,
        child: Scaffold(
          backgroundColor: AppColors.pageBg,
          body: ResponsiveContainer(
            child: SafeArea(
              child: Stack(
                children: [
                  // ── BALANCED MAIN CONTENT ──
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 24.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Brand Logo
                                Image.asset(
                                  'assets/images/pickaboo_new_logo.png',
                                  height: 44.h,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/pickaboo-login-logo.png',
                                      height: 44.h,
                                      fit: BoxFit.contain,
                                    );
                                  },
                                ),

                                SizedBox(height: 20.h),

                                // Title text
                                Text(
                                  'Enter OTP for',
                                  style: AppTypography.heroTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'verification',
                                  style: AppTypography.heroTitle,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 10.h),

                                Text(
                                  'Enter the 4-digit code sent to ${widget.phone}',
                                  style: AppTypography.bodyMutedLight,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 28.h),

                                // ── OTP PIN INPUT ──
                                _buildOtpInput(),

                                SizedBox(height: 16.h),

                                // ── RESEND OTP / 5-MIN TIMER (Matching Phone Change Style) ──
                                _resendCountdown > 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.access_time_rounded,
                                            size: 14.sp,
                                            color: AppColors.muted,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            'Resend OTP in $_formattedCountdown',
                                            style: AppTypography.bodyMuted,
                                          ),
                                        ],
                                      )
                                    : TextButton(
                                        onPressed:
                                            _isLoading
                                                ? null
                                                : () => _sendOtp(resend: true),
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: Text(
                                          'Resend OTP',
                                          style: AppTypography.brandActionText,
                                        ),
                                      ),

                                SizedBox(height: 20.h),

                                // ── PRIMARY ACTION BUTTON ──
                                SizedBox(
                                  width: double.infinity,
                                  height: 50.h,
                                  child: ElevatedButton(
                                    onPressed: _isLoading ? null : _handleContinue,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.pickabooBlue,
                                      foregroundColor: AppColors.white,
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: AppRadius.cardRadius,
                                      ),
                                    ),
                                    child: _isLoading
                                        ? const AppLoader.button()
                                        : Text(
                                            'Continue',
                                            style: AppTypography.buttonPrimary,
                                          ),
                                  ),
                                ),

                                SizedBox(height: 16.h),

                                // ── TERMS & PRIVACY ──
                                _buildTermsAndPrivacy(),

                                SizedBox(height: 24.h),

                                // ── DIVIDER ──
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(color: AppColors.border),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                      ),
                                      child: Text(
                                        'Or continue with',
                                        style: AppTypography.bodyMutedLight,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Divider(color: AppColors.border),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 18.h),

                                // ── SOCIAL LOGIN BUTTONS ──
                                Row(
                                  children: [
                                    // Google
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: _signInWithGoogle,
                                        style: OutlinedButton.styleFrom(
                                          minimumSize:
                                              Size(double.infinity, 46.h),
                                          side: const BorderSide(
                                            color: AppColors.border,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: AppRadius.cardRadius,
                                          ),
                                          backgroundColor: AppColors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/new/svg/google_icon.svg',
                                              width: 18.w,
                                              height: 18.h,
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              'Google',
                                              style: AppTypography.cardTitle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    // Facebook
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: _signInWithFacebook,
                                        style: OutlinedButton.styleFrom(
                                          minimumSize:
                                              Size(double.infinity, 46.h),
                                          side: const BorderSide(
                                            color: AppColors.border,
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: AppRadius.cardRadius,
                                          ),
                                          backgroundColor: AppColors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/new/svg/facebook_icon.svg',
                                              width: 18.w,
                                              height: 18.h,
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              'Facebook',
                                              style: AppTypography.cardTitle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                if (Platform.isIOS) ...[
                                  SizedBox(height: 12.h),
                                  OutlinedButton(
                                    onPressed: _signInWithApple,
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 46.h),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: AppRadius.cardRadius,
                                      ),
                                      backgroundColor: AppColors.navy,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/new/svg/apple_icon.svg',
                                          width: 18.w,
                                          height: 18.h,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.white,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          'Continue with Apple',
                                          style: AppTypography.buttonPrimary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // ── TOP BACK BUTTON (Positioned ON TOP of Stack) ──
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _dismissKeyboard();
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          } else {
                            context.go(Routes.home);
                          }
                        },
                        borderRadius: BorderRadius.circular(20.r),
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.navy,
                            size: 20.sp,
                          ),
                        ),
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
  }

  Widget _buildOtpInput() {
    final defaultPinTheme = PinTheme(
      width: 52.w,
      height: 52.h,
      textStyle: AppTypography.sectionTitle.size(18.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadius.cardRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.pickabooBlue, width: 1.8.w),
        boxShadow: [
          BoxShadow(
            color: AppColors.pickabooBlue.withValues(alpha: 0.12),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColors.surfaceBlue,
        border: Border.all(color: AppColors.pickabooBlue, width: 1.5.w),
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
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTypography.bodyRegular.withColor(AppColors.muted),
          children: [
            const TextSpan(text: 'By continuing, I accept the '),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: () {
                  context.push(Routes.terms);
                },
                child: Text(
                  'Terms and conditions',
                  style: AppTypography.linkText,
                ),
              ),
            ),
            const TextSpan(text: ' and the '),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: () {
                  context.push(Routes.privacyPolicy);
                },
                child: Text(
                  'Privacy Policy.',
                  style: AppTypography.linkText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
