import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/phone_text_field.dart';
import 'package:pickaboo/presentation/bloc/auth/login_bloc/login_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/login_page/social_login_button.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  final bool isPop;
  final bool isBuyNow;
  final bool isPopGuest;

  const LoginPage({
    super.key,
    this.isPop = false,
    this.isBuyNow = false,
    this.isPopGuest = false,
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

  double get _fieldSpacing => 16.h;

  InputDecoration _inputDecoration({
    required String label,
    required String hintText,
    Widget? suffixIcon,
  }) {
    final colors = context.colors;

    return InputDecoration(
      labelText: label,
      labelStyle: context.textStyle.bodyMedium.withColor(colors.silverChalice),
      hintText: hintText,
      hintStyle: context.textStyle.bodyMedium.withColor(colors.silverChalice),
      floatingLabelStyle: context.textStyle.bodyMediumMedium.withColor(
        colors.primary,
      ),
      filled: true,
      fillColor: colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colors.primary, width: 2.w),
      ),
      suffixIcon: suffixIcon,
    );
  }

  @override
  void dispose() {
    _emailOrMobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleToggleLoginMethod() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isEmail = !_isEmail;
      _isUser = false;
      _emailOrMobileController.clear();
      _passwordController.clear();
      _formKey.currentState?.reset();
    });
  }

  void _handleSignIn() {
    FocusScope.of(context).unfocus();
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

    return BlocListener<LoginBloc, LoginState>(
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

            if (widget.isPop || Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
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
                          if (_isUser) {
                            setState(() => _isUser = false);
                          } else {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else {
                              context.go(Routes.home);
                            }
                          }
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
                                SizedBox(height: 16.h),

                                Text(
                                  _isUser
                                      ? 'Enter Password'
                                      : 'Welcome to Pickaboo!',
                                  style: textTheme.displayLarge.copyWith(
                                    color: colors.text,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  _isUser ? 'for login.' : 'Please login.',
                                  style: textTheme.displayLarge.copyWith(
                                    color: colors.text,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16.h),

                                InkWell(
                                  onTap: _handleToggleLoginMethod,
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: colors.white,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: colors.primary.withValues(
                                          alpha: 0.2,
                                        ),
                                        width: 1.5.w,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: colors.black.withValues(
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.w,
                                            vertical: 4.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: colors.primary.withValues(
                                              alpha: 0.1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          child: Icon(
                                            _isEmail
                                                ? Icons.phone_android
                                                : Icons.email_outlined,
                                            size: 18.sp,
                                            color: colors.primary,
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Login with',
                                              ),
                                              TextSpan(
                                                text:
                                                    ' ${_isEmail ? 'Phone Number' : 'Email'}',
                                                style: textTheme.bodyMedium
                                                    .copyWith(
                                                      color: colors.text,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          style: textTheme.bodyMedium.copyWith(
                                            color: colors.silverChalice,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                                        'Or',
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
                                SizedBox(height: 20.h),

                                Form(
                                  key: _formKey,
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    switchInCurve: Curves.easeOut,
                                    switchOutCurve: Curves.easeIn,
                                    transitionBuilder: (child, animation) {
                                      final slideAnimation = Tween<Offset>(
                                        begin: const Offset(0.08, 0),
                                        end: Offset.zero,
                                      ).animate(animation);

                                      return FadeTransition(
                                        opacity: animation,
                                        child: SlideTransition(
                                          position: slideAnimation,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: _isEmail
                                        ? Column(
                                            key: const ValueKey('email'),
                                            children: [
                                              TextFormField(
                                                controller:
                                                    _emailOrMobileController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                decoration: _inputDecoration(
                                                  label: 'Enter your email',
                                                  hintText:
                                                      'Example: yourname@gmail.com',
                                                ),
                                                autofillHints: const [
                                                  AutofillHints.email,
                                                ],
                                                validator: validateEmail,
                                              ),
                                              SizedBox(height: _fieldSpacing),
                                              TextFormField(
                                                controller: _passwordController,
                                                obscureText: _obscurePassword,
                                                decoration: _inputDecoration(
                                                  label: 'Enter your password',
                                                  hintText:
                                                      'Use at least 8 characters',
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      _obscurePassword
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
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
                                            key: const ValueKey('phone'),
                                            children: [
                                              if (_isUser)
                                                TextFormField(
                                                  controller:
                                                      _passwordController,
                                                  obscureText: _obscurePassword,
                                                  decoration: _inputDecoration(
                                                    label:
                                                        'Enter your password',
                                                    hintText:
                                                        'Use at least 8 characters',
                                                    suffixIcon: IconButton(
                                                      icon: Icon(
                                                        _obscurePassword
                                                            ? Icons
                                                                  .visibility_off
                                                            : Icons.visibility,
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
                                                  decoration: _inputDecoration(
                                                    label:
                                                        'Enter your mobile number',
                                                    hintText:
                                                        'Mobile number (e.g. 017XXXXXXXX)',
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
                                SizedBox(height: 20.h),

                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    final isLoading = state.maybeWhen(
                                      checkingUser: () => true,
                                      loginLoading: () => true,
                                      orElse: () => false,
                                    );

                                    return Container(
                                      width: double.infinity,
                                      height: 48.h,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            colors.button,
                                            colors.button.withValues(
                                              alpha: 0.85,
                                            ),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
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
                                        onPressed: isLoading
                                            ? null
                                            : _handleSignIn,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: colors.black
                                              .withValues(alpha: 0.0),
                                          shadowColor: colors.black.withValues(
                                            alpha: 0.0,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                          ),
                                        ),
                                        child: isLoading
                                            ? SizedBox(
                                                height: 22.h,
                                                width: 22.w,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 2.5.w,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                        Color
                                                      >(colors.white),
                                                ),
                                              )
                                            : Text(
                                                _isEmail || _isUser
                                                    ? 'Login'
                                                    : 'Sign Up/Login',
                                                style: context
                                                    .textStyle
                                                    .buttonLarge
                                                    .withColor(colors.white),
                                              ),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 12.h),

                                TextButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    context.push(Routes.forgotPassword);
                                  },
                                  child: Text(
                                    'Forgot Your Password?',
                                    style: textTheme.bodyMedium.copyWith(
                                      color: colors.gray,
                                    ),
                                  ),
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

                            if (Platform.isIOS)
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
}
