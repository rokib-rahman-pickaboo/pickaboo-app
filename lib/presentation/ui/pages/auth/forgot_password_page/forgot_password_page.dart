// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart' as validators;
import 'package:pickaboo/presentation/bloc/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Modernized Pickaboo Forgot Password Page
/// Allows users to request a password reset OTP via mobile number or email.
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailOrPhoneController =
      TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  String _timerMessage = '';

  Timer? _timer;
  int _secondsRemaining = 0;

  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsRemaining = 300);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _emailOrPhoneController.dispose();
    super.dispose();
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  bool _validateEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _validateMobileNumber(String phone) {
    return validators.validateMobileNumber(phone) == null;
  }

  void _handleContinue() {
    if (_isLoading) return;

    _dismissKeyboard();
    final input = _emailOrPhoneController.text.trim();

    setState(() => _errorMessage = null);

    if (input.isEmpty) {
      setState(() => _errorMessage = 'Please enter mobile number or email');
      SnackBarUtils.showError(context, 'Please enter mobile number or email');
      return;
    }

    bool isEmail = _validateEmail(input);
    bool isMobile = _validateMobileNumber(input);

    if (!isEmail && !isMobile) {
      setState(
        () => _errorMessage = 'Please enter a valid mobile number or email',
      );
      SnackBarUtils.showError(
        context,
        'Please enter a valid mobile number or email',
      );
      return;
    }

    setState(() => _isLoading = true);
    context.read<ForgotPasswordBloc>().add(
      ForgotPasswordEvent.sendOtp(identifier: input, isEmail: isEmail),
    );
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
    return MultiBlocListener(
      listeners: [
        BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            state.maybeWhen(
              sendingOtp: () {
                setState(() {
                  _isLoading = true;
                  _errorMessage = null;
                });
              },
              otpSent: (message) {
                TextInput.finishAutofillContext();
                setState(() => _isLoading = false);
                SnackBarUtils.showSuccess(context, message);
                final input = _emailOrPhoneController.text.trim();
                context.push(
                  Routes.forgotPasswordConfirm,
                  extra: {'isEmail': _validateEmail(input), 'value': input},
                );
              },
              otpSendFailed: (error) {
                final isTimerError =
                    error.contains('already sent') ||
                    error.contains('5 minutes');
                setState(() {
                  _isLoading = false;
                  if (!isTimerError) {
                    _errorMessage = error;
                  } else {
                    _errorMessage = '';
                  }
                });
                SnackBarUtils.showError(context, error);
                if (isTimerError) {
                  _timerMessage = error;
                  _startTimer();
                }
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: GestureDetector(
          onTap: _dismissKeyboard,
          behavior: HitTestBehavior.opaque,
          child: Scaffold(
            backgroundColor: AppColors.white,
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
                                  AppAssets.logoNew,
                                  height: 44.h,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      AppAssets.logoLogin,
                                      height: 44.h,
                                      fit: BoxFit.contain,
                                    );
                                  },
                                ),

                                SizedBox(height: 20.h),

                                // Header Text
                                Text(
                                  'Reset Your',
                                  style: AppTypography.heroTitle,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'Password',
                                  style: AppTypography.heroTitle,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 10.h),

                                Text(
                                  'Enter your mobile number or email address below to receive an OTP code.',
                                  style: AppTypography.bodySmall.mutedLight,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 28.h),

                                // Email / Phone Input Field
                                AutofillGroup(
                                  child: TextField(
                                    controller: _emailOrPhoneController,
                                    keyboardType: TextInputType.text,
                                    style: AppTypography.bodyLarge.regular(),
                                    decoration: _buildInputDecoration(
                                      hintText: 'Mobile number or email address',
                                      prefixIcon: Icon(
                                        Icons.alternate_email,
                                        size: 18.sp,
                                        color: AppColors.mutedLight,
                                      ),
                                    ).copyWith(
                                      errorText: _errorMessage,
                                      errorStyle: _errorMessage?.isEmpty == true
                                          ? AppTypography.bodyTiny.size(0.01).withHeight(0.01)
                                          : null,
                                    ),
                                    autofillHints: const [
                                      AutofillHints.email,
                                      AutofillHints.telephoneNumber,
                                    ],
                                    onChanged: (val) {
                                      if (_errorMessage != null) {
                                        setState(() => _errorMessage = null);
                                      }
                                    },
                                    onSubmitted: (_) => _handleContinue(),
                                  ),
                                ),

                                SizedBox(height: 14.h),

                                // Timer Warning (if resend cooldown is active)
                                if (_secondsRemaining > 0)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 14.h),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(12.w),
                                      decoration: BoxDecoration(
                                        color: AppColors.amber.withValues(alpha: 0.1),
                                        borderRadius: AppRadius.cardRadius,
                                        border: Border.all(
                                          color: AppColors.amber.withValues(alpha: 0.4),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.timer_outlined,
                                            color: AppColors.amber,
                                            size: 20.sp,
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: Text(
                                              _timerMessage.replaceAll(
                                                '5 minutes',
                                                _formattedTime,
                                              ),
                                              style: AppTypography.titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                // Primary CTA Button
                                AppButton.primary(
                                  height: 50.h,
                                  isLoading: _isLoading,
                                  isDisabled: _secondsRemaining > 0,
                                  onPressed: _handleContinue,
                                  text: 'Continue',
                                ),

                                SizedBox(height: 20.h),

                                // Identity Verification Info Card
                                Container(
                                  padding: EdgeInsets.all(14.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.surfaceBlue,
                                    borderRadius: AppRadius.cardRadius,
                                    border: Border.all(
                                      color: AppColors.pickabooBlue.withValues(alpha: 0.15),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: AppColors.pickabooBlue,
                                        size: 20.sp,
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Text(
                                          "We'll send you an OTP to verify your identity.",
                                          style: AppTypography.bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 28.h),

                                // Remember Password Link
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Remember your password? ',
                                      style: AppTypography.bodySmall.mutedLight,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _dismissKeyboard();
                                        context.go(Routes.login);
                                      },
                                      child: Text(
                                        'Sign in',
                                        style: AppTypography.brandAction,
                                      ),
                                    ),
                                  ],
                                ),
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
                      color: AppColors.transparent,
                      child: InkWell(
                        onTap: () {
                          _dismissKeyboard();
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          } else {
                            context.go(Routes.login);
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
