import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart' as validators;
import 'package:pickaboo/presentation/bloc/auth/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
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

  static final BorderRadius _radius = BorderRadius.all(Radius.circular(10.r));

  InputDecoration _inputDecoration({
    required String label,
    String? hint,
    Widget? prefixIcon,
  }) {
    final colors = context.colors;

    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      labelStyle: context.textStyle.bodyMedium.withColor(colors.silverChalice),
      hintStyle: context.textStyle.bodyMedium.withColor(colors.silverChalice),
      floatingLabelStyle: context.textStyle.bodyMediumMedium.withColor(
        colors.primary,
      ),
      fillColor: colors.grayLight,
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
        borderSide: BorderSide(color: colors.primary, width: 1.2),
      ),
      prefixIcon: prefixIcon,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _emailOrPhoneController.dispose();
    super.dispose();
  }

  bool _validateEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _validateMobileNumber(String phone) {
    return validators.validateMobileNumber(phone) == null;
  }

  void _handleContinue() {
    if (_isLoading) return;

    FocusScope.of(context).unfocus();
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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

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
      child: Scaffold(
        body: ResponsiveContainer(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
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
                              context.go(Routes.login);
                            }
                          },
                          iconColor: colors.text,
                        ),
                      ),
                      Text(
                        'FORGOT PASSWORD?',
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
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 80.h),

                        Text(
                          'Please enter your email address or phone number below & set your new password.',
                          style: textTheme.bodyMedium.copyWith(
                            color: colors.gray,
                            height: 1.5.h,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),

                        AutofillGroup(
                          child: TextField(
                            controller: _emailOrPhoneController,
                            keyboardType: TextInputType.text,
                            decoration:
                                _inputDecoration(
                                  label: 'Mobile Number / Email',
                                  hint: 'Enter email or phone number',
                                  prefixIcon: Icon(
                                    Icons.alternate_email,
                                    color: colors.gray,
                                    size: 20.sp,
                                  ),
                                ).copyWith(
                                  errorText: _errorMessage,
                                  errorStyle: _errorMessage?.isEmpty == true
                                      ? const TextStyle(
                                          height: 0.01,
                                          fontSize: 0.01,
                                        )
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
                        SizedBox(height: (16 - 1).h),

                        if (_secondsRemaining > 0)
                          Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: colors.orange.withOpacity(0.1),
                                borderRadius: _radius,
                                border: Border.all(
                                  color: colors.orange.withOpacity(0.5),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    color: colors.orange,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      _timerMessage.replaceAll(
                                        '5 minutes',
                                        _formattedTime,
                                      ),
                                      style: textTheme.bodySmall.copyWith(
                                        color: colors.orange,
                                        fontWeight: FontWeight.w600,
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
                            onPressed: (_isLoading || _secondsRemaining > 0)
                                ? null
                                : _handleContinue,
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
                                    'Continue',
                                    style: context.textStyle.buttonLarge
                                        .withColor(
                                          (_isLoading || _secondsRemaining > 0)
                                              ? colors.gray
                                              : colors.white,
                                        ),
                                  ),
                          ),
                        ),
                        SizedBox(height: 32.h),

                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: colors.solitude,
                            borderRadius: _radius,
                            border: Border.all(color: colors.borderColor),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: colors.primary,
                                size: 20.sp,
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  'We\'ll send you an OTP to verify your identity',
                                  style: textTheme.bodySmall.copyWith(
                                    color: colors.text,
                                  ),
                                ),
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
