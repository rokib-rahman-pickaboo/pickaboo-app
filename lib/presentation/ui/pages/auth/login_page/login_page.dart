// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/login_bloc/login_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/phone_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';

/// Modernized Pickaboo Login Page
/// Maintains exact requested brand typography, balanced upper & lower margins, and clean inputs.
class LoginPage extends StatefulWidget {
  final bool isPop;
  final bool isBuyNow;
  final bool isPopGuest;
  final bool redirectToHome;

  const LoginPage({
    super.key,
    this.isPop = false,
    this.isBuyNow = false,
    this.isPopGuest = false,
    this.redirectToHome = false,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailOrMobileController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isUser = false;
  bool _isEmail = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailOrMobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _handleToggleLoginMethod() {
    _dismissKeyboard();
    setState(() {
      _isEmail = !_isEmail;
      _isUser = false;
      _emailOrMobileController.clear();
      _passwordController.clear();
      _formKey.currentState?.reset();
    });
  }

  void _handleSignIn() {
    _dismissKeyboard();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final emailOrMobile = _emailOrMobileController.text.trim();
    final password = _passwordController.text.trim();

    if (_isEmail) {
      TextInput.finishAutofillContext();
      context.read<LoginBloc>().add(
        LoginEvent.loginWithPassword(
          username: emailOrMobile,
          password: password,
        ),
      );
    } else {
      if (_isUser) {
        TextInput.finishAutofillContext();
        context.read<LoginBloc>().add(
          LoginEvent.loginWithPassword(
            username: emailOrMobile,
            password: password,
          ),
        );
      } else {
        context.read<LoginBloc>().add(
          LoginEvent.checkUserExists(emailOrMobile),
        );
      }
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

  InputDecoration _buildInputDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTypography.inputHint,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      filled: true,
      fillColor: AppColors.white,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: const OutlineInputBorder(
        borderRadius: AppRadius.cardRadius,
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: AppRadius.cardRadius,
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppRadius.cardRadius,
        borderSide: BorderSide(color: AppColors.pickabooBlue, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.cardRadius,
        borderSide: BorderSide(color: AppColors.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.cardRadius,
        borderSide: BorderSide(color: AppColors.red, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _dismissKeyboard();
        if (_isUser) {
          setState(() => _isUser = false);
        } else if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          context.go(Routes.home);
        }
      },
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            userExists: (status, message, httpCode) {
              setState(() => _isUser = true);
            },
            userNotFound: (status, message, httpCode) {
              SnackBarUtils.showInfo(context, message);
              final phone = _emailOrMobileController.text.trim();
              context.push('${Routes.registration}?phone=$phone');
            },
            loginSuccess: (status, isLogin) {
              context.read<AuthBloc>().add(const AuthEvent.userLoggedIn());

              if (widget.redirectToHome) {
                MainPage.hideBottomNav.value = false;
                context.go(Routes.home);
              } else if (widget.isPop || Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                MainPage.hideBottomNav.value = false;
                context.go(Routes.home);
              }

              SnackBarUtils.showSuccess(context, 'Login Successful');
            },
            loginFailure: (error) {
              SnackBarUtils.showError(context, error);
            },
            orElse: () {},
          );
        },
        child: GestureDetector(
          onTap: _dismissKeyboard,
          behavior: HitTestBehavior.opaque,
          child: Scaffold(
            backgroundColor: AppColors.pageBg,
            body: ResponsiveContainer(
              child: SafeArea(
                child: Stack(
                  children: [
                    // ── PERFECTLY CENTERED MAIN CONTENT ──
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

                                // Welcome to Pickaboo! / Enter Password Text
                                Text(
                                  _isUser
                                      ? 'Enter Password'
                                      : 'Welcome to Pickaboo!',
                                  style: AppTypography.heroTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  _isUser ? 'for login.' : 'Please login.',
                                  style: AppTypography.bodyRegular,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 20.h),

                                // Login Method Toggle Pill (Phone vs Email)
                                if (!_isUser) ...[
                                  InkWell(
                                    onTap: _handleToggleLoginMethod,
                                    borderRadius: AppRadius.cardRadius,
                                    child: Container(
                                      width: double.infinity,
                                      height: 44.h,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: AppRadius.cardRadius,
                                        border: Border.all(
                                          color: AppColors.pickabooBlue
                                              .withValues(alpha: 0.25),
                                          width: 1.2.w,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.navy.withValues(
                                              alpha: 0.04,
                                            ),
                                            blurRadius: 8.r,
                                            offset: Offset(0, 2.h),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.w),
                                            decoration: const BoxDecoration(
                                              color: AppColors.surfaceBlue,
                                              borderRadius:
                                                  AppRadius.badgeRadius,
                                            ),
                                            child: Icon(
                                              _isEmail
                                                  ? Icons.phone_android
                                                  : Icons.email_outlined,
                                              size: 16.sp,
                                              color: AppColors.pickabooBlue,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'Login with ',
                                                ),
                                                TextSpan(
                                                  text: _isEmail
                                                      ? 'Phone Number'
                                                      : 'Email',
                                                  style: AppTypography.bodyLarge,
                                                ),
                                              ],
                                            ),
                                            style: AppTypography.bodyMuted,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  // Or Divider
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
                                          'Or',
                                          style: AppTypography.bodyMutedLight,
                                        ),
                                      ),
                                      const Expanded(
                                        child: Divider(color: AppColors.border),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h),
                                ],

                                // Form Inputs
                                Form(
                                  key: _formKey,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 250),
                                    child: _isEmail
                                        ? Column(
                                            key: const ValueKey('email_form'),
                                            children: [
                                              TextFormField(
                                                controller:
                                                    _emailOrMobileController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                style: AppTypography.inputText,
                                                decoration:
                                                    _buildInputDecoration(
                                                  hintText: 'Enter your email',
                                                  prefixIcon: Icon(
                                                    Icons.email_outlined,
                                                    size: 18.sp,
                                                    color:
                                                        AppColors.mutedLight,
                                                  ),
                                                ),
                                                autofillHints: const [
                                                  AutofillHints.email,
                                                ],
                                                validator: validateEmail,
                                              ),
                                              SizedBox(height: 12.h),
                                              TextFormField(
                                                controller: _passwordController,
                                                obscureText: _obscurePassword,
                                                style: AppTypography.inputText,
                                                decoration:
                                                    _buildInputDecoration(
                                                  hintText:
                                                      'Enter your password',
                                                  prefixIcon: Icon(
                                                    Icons.lock_outline,
                                                    size: 18.sp,
                                                    color:
                                                        AppColors.mutedLight,
                                                  ),
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      _obscurePassword
                                                          ? Icons
                                                              .visibility_off_outlined
                                                          : Icons
                                                              .visibility_outlined,
                                                      size: 18.sp,
                                                      color: AppColors.mutedLight,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _obscurePassword =
                                                            !_obscurePassword;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                autofillHints: const [
                                                  AutofillHints.password,
                                                ],
                                                validator: validatePassword,
                                              ),
                                            ],
                                          )
                                        : Column(
                                            key: const ValueKey('phone_form'),
                                            children: [
                                              if (_isUser)
                                                TextFormField(
                                                  controller:
                                                      _passwordController,
                                                  obscureText:
                                                      _obscurePassword,
                                                  style: AppTypography.inputText,
                                                  decoration:
                                                      _buildInputDecoration(
                                                    hintText:
                                                        'Enter your password',
                                                    prefixIcon: Icon(
                                                      Icons.lock_outline,
                                                      size: 18.sp,
                                                      color: AppColors.mutedLight,
                                                    ),
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        _obscurePassword
                                                            ? Icons
                                                                .visibility_off_outlined
                                                            : Icons
                                                                .visibility_outlined,
                                                        size: 18.sp,
                                                        color: AppColors.mutedLight,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          _obscurePassword =
                                                              !_obscurePassword;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  autofillHints: const [
                                                    AutofillHints.password,
                                                  ],
                                                  validator: validatePassword,
                                                )
                                              else
                                                TextFormField(
                                                  controller:
                                                      _emailOrMobileController,
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  inputFormatters:
                                                      PhoneTextField
                                                          .inputFormatters,
                                                  style: AppTypography.inputText,
                                                  decoration:
                                                      _buildInputDecoration(
                                                    hintText:
                                                        'Enter Mobile Number (01XXXXXXXXX)',
                                                    prefixIcon: Icon(
                                                      Icons.phone_outlined,
                                                      size: 18.sp,
                                                      color: AppColors.mutedLight,
                                                    ),
                                                  ),
                                                  autofillHints: const [
                                                    AutofillHints
                                                        .telephoneNumber,
                                                  ],
                                                  validator:
                                                      validateMobileNumber,
                                                ),
                                            ],
                                          ),
                                  ),
                                ),

                                // Forgot Password Link
                                if (_isEmail || _isUser) ...[
                                  SizedBox(height: 10.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        _dismissKeyboard();
                                        context.push(Routes.forgotPassword);
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        'Forgot password?',
                                        style: AppTypography.brandActionText,
                                      ),
                                    ),
                                  ),
                                ],

                                SizedBox(height: 20.h),

                                // Primary Action Button (Pickaboo Sky Blue #00AEEF)
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    final isLoading = state.maybeWhen(
                                      checkingUser: () => true,
                                      loginLoading: () => true,
                                      orElse: () => false,
                                    );

                                    return SizedBox(
                                      width: double.infinity,
                                      height: 50.h,
                                      child: ElevatedButton(
                                        onPressed:
                                            isLoading ? null : _handleSignIn,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.pickabooBlue,
                                          foregroundColor: AppColors.white,
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: AppRadius.cardRadius,
                                          ),
                                        ),
                                        child: isLoading
                                            ? const AppLoader.button()
                                            : Text(
                                                _isEmail || _isUser
                                                    ? 'Login'
                                                    : 'Continue',
                                                style: AppTypography.buttonPrimary,
                                              ),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 12.h),

                                // Forgot Password Link (Always visible - matches Pickaboo-App-BK and Pickaboo-App-DC)
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      _dismissKeyboard();
                                      context.push(Routes.forgotPassword);
                                    },
                                    child: Text(
                                      'Forgot Your Password?',
                                      style: AppTypography.brandActionText.copyWith(
                                        color: AppColors.muted,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 12.h),

                                // Or Login With Divider
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

                                // Social Login Buttons
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

                  // ── TOP BACK BUTTON (Positioned ON TOP of Stack for reliable hit testing) ──
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          _dismissKeyboard();
                          if (_isUser) {
                            setState(() => _isUser = false);
                          } else if (Navigator.of(context).canPop()) {
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
    ),
  );
}
}
