import 'package:flutter/material.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/bloc/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';

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
  String? _errorMessage;

  static const double _horizontalPadding = 16;
  static const double _fieldSpacing = 16;
  static final BorderRadius _radius = BorderRadius.all(Radius.circular(10.r));

  InputDecoration _inputDecoration({
    required String label,
    String? hint,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    final colors = context.colors;

    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: colors.grayLight,
      labelStyle: context.textStyle.bodyMedium.withColor(colors.silverChalice),
      hintStyle: context.textStyle.bodyMedium.withColor(colors.silverChalice),
      floatingLabelStyle: context.textStyle.bodyMediumMedium.withColor(
        colors.primary,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
      border: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: BorderSide(color: colors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: BorderSide(color: colors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _radius,
        borderSide: BorderSide(color: colors.primary, width: 1.2.w),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  Widget _visibilityIcon({
    required bool isObscured,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;
    return IconButton(
      icon: Icon(
        isObscured ? Icons.visibility_off : Icons.visibility,
        color: colors.gray,
      ),
      onPressed: onTap,
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    final otp = _otpController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    setState(() => _errorMessage = null);

    if (otp.isEmpty) {
      setState(() => _errorMessage = 'Please enter OTP');
      SnackBarUtils.showError(context, 'Please enter OTP');
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
    FocusScope.of(context).unfocus();
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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
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
      child: Scaffold(
        body: ResponsiveContainer(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _horizontalPadding.w,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppBarButton(
                          iconPath: 'assets/new/svg/back_nav_icon.svg',
                          width: 7.w,
                          height: 14.h,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else {
                              context.pushReplacement(Routes.login);
                            }
                          },
                          iconColor: colors.text,
                        ),
                      ),
                      Text(
                        'SET NEW PASSWORD',
                        style: textTheme.appBarTitle.copyWith(
                          color: colors.codGary,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: _horizontalPadding.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 80.h),

                        Text(
                          'Please enter OTP & set your new password.',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: _fieldSpacing.h),

                        TextField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: _inputDecoration(
                            label: 'OTP',
                            hint: 'Enter 6-digit OTP',
                            prefixIcon: Icon(Icons.lock_outline),
                          ).copyWith(counterText: ''),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          textInputAction: TextInputAction.next,
                          autofillHints: [AutofillHints.oneTimeCode],
                          onChanged: (val) {
                            if (_errorMessage != null) {
                              setState(() => _errorMessage = null);
                            }
                          },
                        ),
                        SizedBox(height: (_fieldSpacing - 1).h),

                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: _inputDecoration(
                            label: 'New Password',
                            hint: 'Enter new password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: _visibilityIcon(
                              isObscured: _obscurePassword,
                              onTap: () {
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
                        SizedBox(height: (_fieldSpacing - 1).h),

                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          decoration: _inputDecoration(
                            label: 'Confirm New Password',
                            hint: 'Re-enter new password',
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: _visibilityIcon(
                              isObscured: _obscureConfirmPassword,
                              onTap: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),
                          onSubmitted: (_) => _handleSubmit(),
                          textInputAction: TextInputAction.done,
                          onChanged: (val) {
                            if (_errorMessage != null) {
                              setState(() => _errorMessage = null);
                            }
                          },
                        ),
                        SizedBox(height: (_fieldSpacing - 1).h),

                        if (_errorMessage != null)
                          Padding(
                            padding: EdgeInsets.only(bottom: _fieldSpacing.h),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: colors.primary.withOpacity(0.1),
                                borderRadius: _radius,
                                border: Border.all(
                                  color: colors.primary.withOpacity(0.5),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: colors.primary,
                                    size: 18.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      _errorMessage!,
                                      style: textTheme.bodySmall.copyWith(
                                        color: colors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleSubmit,
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              backgroundColor: colors.button,
                              shape: RoundedRectangleBorder(
                                borderRadius: _radius,
                              ),
                              disabledBackgroundColor: colors.grayLight,
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.w,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'Submit',
                                    style: context.textStyle.buttonLarge,
                                  ),
                          ),
                        ),
                        SizedBox(height: _fieldSpacing.h),

                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: colors.meNot,
                            borderRadius: _radius,
                            border: Border.all(color: colors.borderColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: colors.orange,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    'Password Requirements',
                                    style: textTheme.buttonText.copyWith(
                                      color: colors.text,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              _PasswordRequirement(
                                text: 'At least 6 characters',
                                colors: colors,
                              ),
                              _PasswordRequirement(
                                text: 'Passwords must match',
                                colors: colors,
                              ),
                            ],
                          ),
                        ),
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

class _PasswordRequirement extends StatelessWidget {
  final String text;
  final AppColors colors;

  const _PasswordRequirement({required this.text, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, size: 16.sp, color: colors.gray),
          SizedBox(width: 8.w),
          Text(text, style: context.textStyle.bodySmall.withColor(colors.gray)),
        ],
      ),
    );
  }
}
