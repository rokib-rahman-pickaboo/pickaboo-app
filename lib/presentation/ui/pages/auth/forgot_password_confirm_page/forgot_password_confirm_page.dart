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
import 'package:pickaboo/presentation/bloc/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

import 'package:pickaboo/core/color/app_colors.dart';

/// Modernized Pickaboo Forgot Password Confirm Page
/// Allows users to enter OTP and set a new password with a 5-minute expiration timer.
class ForgotPasswordConfirmPage extends StatefulWidget {
  final bool isEmail;
  final String value;

  const ForgotPasswordConfirmPage({
    super.key,
    required this.isEmail,
    required this.value,
  });

  @override
  State<ForgotPasswordConfirmPage> createState() =>
      _ForgotPasswordConfirmPageState();
}

class _ForgotPasswordConfirmPageState extends State<ForgotPasswordConfirmPage> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  bool _isResending = false;
  String? _errorMessage;

  Timer? _resendTimer;
  int _resendCountdown = 300; // 5 minutes = 300 seconds

  bool get _isExpired => _resendCountdown <= 0;

  String get _formattedCountdown {
    final minutes = (_resendCountdown ~/ 60).toString().padLeft(2, '0');
    final seconds = (_resendCountdown % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    _startResendTimer();
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
  void dispose() {
    _resendTimer?.cancel();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _handleResendOtp() {
    _dismissKeyboard();
    if (_isResending || _isLoading) return;
    if (widget.value.trim().isEmpty) {
      SnackBarUtils.showError(context, 'Missing mobile number or email');
      return;
    }

    context.read<ForgotPasswordBloc>().add(
      ForgotPasswordEvent.sendOtp(
        identifier: widget.value,
        isEmail: widget.isEmail,
      ),
    );
  }

  bool _validateFields() {
    final otp = _otpController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    setState(() => _errorMessage = null);

    if (_isExpired) {
      setState(() => _errorMessage = 'OTP has expired. Please request a new OTP.');
      SnackBarUtils.showError(context, 'OTP has expired. Please request a new OTP.');
      return false;
    }

    if (otp.isEmpty) {
      setState(() => _errorMessage = 'Please enter your OTP');
      SnackBarUtils.showError(context, 'Please enter your OTP');
      return false;
    }

    // OTP can be 4 digits (or up to 6 digits)
    if (otp.length < 4) {
      setState(() => _errorMessage = 'Please enter a valid OTP');
      SnackBarUtils.showError(context, 'Please enter a valid OTP');
      return false;
    }

    if (password.isEmpty) {
      setState(() => _errorMessage = 'Please enter password');
      SnackBarUtils.showError(context, 'Please enter password');
      return false;
    }

    if (confirmPassword.isEmpty) {
      setState(() => _errorMessage = 'Please enter confirm password');
      SnackBarUtils.showError(context, 'Please enter confirm password');
      return false;
    }

    if (password != confirmPassword) {
      setState(
        () => _errorMessage = 'Password and Confirm Password are not same',
      );
      SnackBarUtils.showError(
        context,
        'Password and Confirm Password are not same',
      );
      return false;
    }

    if (password.length < 6) {
      setState(() => _errorMessage = 'Password must be at least 6 characters');
      SnackBarUtils.showError(
        context,
        'Password must be at least 6 characters',
      );
      return false;
    }

    return true;
  }

  void _handleSubmit() {
    _dismissKeyboard();
    if (_isExpired) {
      setState(() => _errorMessage = 'OTP has expired. Please request a new OTP.');
      SnackBarUtils.showError(context, 'OTP has expired. Please request a new OTP.');
      return;
    }
    if (!_validateFields()) return;

    context.read<ForgotPasswordBloc>().add(
      ForgotPasswordEvent.resetPassword(
        identifier: widget.value,
        isEmail: widget.isEmail,
        otp: _otpController.text.trim(),
        newPassword: _passwordController.text.trim(),
      ),
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
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          sendingOtp: () {
            setState(() {
              _isResending = true;
              _errorMessage = null;
            });
          },
          otpSent: (message) {
            setState(() {
              _isResending = false;
              _errorMessage = null;
              _otpController.clear();
            });
            _startResendTimer();
            SnackBarUtils.showSuccess(context, message);
          },
          otpSendFailed: (error) {
            setState(() {
              _isResending = false;
              _errorMessage = error;
            });
            SnackBarUtils.showError(context, error);
          },
          resettingPassword: () {
            setState(() {
              _isLoading = true;
              _errorMessage = null;
            });
          },
          passwordResetSuccess: (message) {
            setState(() => _isLoading = false);
            SnackBarUtils.showSuccess(context, message);
            context.go(Routes.login);
          },
          passwordResetFailure: (error) {
            setState(() {
              _isLoading = false;
              _errorMessage = error;
            });
            SnackBarUtils.showError(context, error);
          },
          orElse: () {},
        );
      },
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
                                  'Set New',
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
                                  'Please enter the OTP & set your new password.',
                                  style: AppTypography.bodySmall.mutedLight,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 24.h),

                                // OTP Field (Supports 4 to 6 digit OTP)
                                TextField(
                                  controller: _otpController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 6,
                                  enabled: !_isExpired && !_isLoading,
                                  style: AppTypography.bodyLarge.regular(),
                                  decoration: _buildInputDecoration(
                                    hintText: 'Enter your otp',
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      size: 18.sp,
                                      color: AppColors.mutedLight,
                                    ),
                                  ).copyWith(counterText: ''),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(6),
                                  ],
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [AutofillHints.oneTimeCode],
                                  onChanged: (val) {
                                    if (_errorMessage != null) {
                                      setState(() => _errorMessage = null);
                                    }
                                  },
                                ),

                                SizedBox(height: 12.h),

                                // New Password Field
                                TextField(
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  enabled: !_isExpired && !_isLoading,
                                  style: AppTypography.bodyLarge.regular(),
                                  decoration: _buildInputDecoration(
                                    hintText: 'Enter new password',
                                    prefixIcon: Icon(
                                      Icons.key_outlined,
                                      size: 18.sp,
                                      color: AppColors.mutedLight,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscurePassword
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 18.sp,
                                        color: AppColors.mutedLight,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscurePassword = !_obscurePassword;
                                        });
                                      },
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onChanged: (val) {
                                    if (_errorMessage != null) {
                                      setState(() => _errorMessage = null);
                                    }
                                  },
                                ),

                                SizedBox(height: 12.h),

                                // Confirm Password Field
                                TextField(
                                  controller: _confirmPasswordController,
                                  obscureText: _obscureConfirmPassword,
                                  enabled: !_isExpired && !_isLoading,
                                  style: AppTypography.bodyLarge.regular(),
                                  decoration: _buildInputDecoration(
                                    hintText: 'Confirm new password',
                                    prefixIcon: Icon(
                                      Icons.key_outlined,
                                      size: 18.sp,
                                      color: AppColors.mutedLight,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureConfirmPassword
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                        size: 18.sp,
                                        color: AppColors.mutedLight,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureConfirmPassword =
                                              !_obscureConfirmPassword;
                                        });
                                      },
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (_) => _handleSubmit(),
                                  onChanged: (val) {
                                    if (_errorMessage != null) {
                                      setState(() => _errorMessage = null);
                                    }
                                  },
                                ),

                                SizedBox(height: 14.h),

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
                                            AppStrings.resendOtpCountdown(_formattedCountdown),
                                            style: AppTypography.bodySmall,
                                          ),
                                        ],
                                      )
                                    : AppButton.ghost(
                                        shrinkWrap: true,
                                        isDisabled: _isLoading || _isResending,
                                        onPressed:
                                            _isLoading || _isResending
                                                ? null
                                                : _handleResendOtp,
                                        child: _isResending
                                            ? Row(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                children: [
                                                  AppLoader.inline(
                                                    size: 12.w,
                                                    strokeWidth: 2,
                                                    color: AppColors.pickabooBlue,
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  Text(
                                                    'Resending...',
                                                    style: AppTypography
                                                        .brandAction,
                                                  ),
                                                ],
                                              )
                                            : Text(
                                                AppStrings.resendOtp,
                                                style: AppTypography
                                                    .brandAction,
                                              ),
                                      ),

                                if (_errorMessage != null) ...[
                                  SizedBox(height: 12.h),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.red.withValues(alpha: 0.1),
                                      borderRadius: AppRadius.cardRadius,
                                      border: Border.all(
                                        color: AppColors.red.withValues(
                                            alpha: 0.4),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          color: AppColors.red,
                                          size: 18.sp,
                                        ),
                                        SizedBox(width: 8.w),
                                        Expanded(
                                          child: Text(
                                            _errorMessage!,
                                            style: AppTypography.inputError,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],

                                SizedBox(height: 20.h),

                                // Primary CTA Button
                                AppButton.primary(
                                  height: 50.h,
                                  isLoading: _isLoading,
                                  onPressed: _handleSubmit,
                                  text: 'Reset Password',
                                ),

                                SizedBox(height: 20.h),

                                // Password Requirements Card
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(14.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.surfaceBlue,
                                    borderRadius: AppRadius.cardRadius,
                                    border: Border.all(
                                      color: AppColors.pickabooBlue.withValues(
                                          alpha: 0.15),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.info_outline,
                                            color: AppColors.pickabooBlue,
                                            size: 18.sp,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            'Password Requirements',
                                            style: AppTypography.titleSmall,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      const _PasswordRequirementRow(
                                        text: 'At least 6 characters long',
                                      ),
                                      SizedBox(height: 4.h),
                                      const _PasswordRequirementRow(
                                        text: 'Passwords must match',
                                      ),
                                    ],
                                  ),
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

class _PasswordRequirementRow extends StatelessWidget {
  final String text;

  const _PasswordRequirementRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          size: 14.sp,
          color: AppColors.pickabooBlue,
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: AppTypography.bodySmall,
        ),
      ],
    );
  }
}
