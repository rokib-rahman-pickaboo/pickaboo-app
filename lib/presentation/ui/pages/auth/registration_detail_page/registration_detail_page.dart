import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/registration_bloc/registration_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';

class RegistrationDetailPage extends StatefulWidget {
  final String phone;
  final String otp;

  const RegistrationDetailPage({
    super.key,
    required this.phone,
    required this.otp,
  });

  @override
  State<RegistrationDetailPage> createState() => _RegistrationDetailPageState();
}

class _RegistrationDetailPageState extends State<RegistrationDetailPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _handleRegister() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<RegistrationBloc>().add(
      RegistrationEvent.registerUser(
        email: _emailController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        password: _passwordController.text,
        mobile: widget.phone,
        otp: widget.otp,
      ),
    );
  }

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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colors.redBright),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: colors.redBright, width: 2.w),
      ),
      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        state.maybeWhen(
          registrationLoading: () {
            setState(() => _isLoading = true);
          },
          registrationSuccess: (message) {
            TextInput.finishAutofillContext();
            setState(() => _isLoading = false);
            SnackBarUtils.showSuccess(context, message);
            context.go(Routes.login);
          },
          registrationFailure: (error) {
            setState(() => _isLoading = false);
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
                          Navigator.of(context).pop();
                        },
                        iconColor: colors.text,
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 40.h),

                                  Text(
                                    'Enter Information for',
                                    style: textTheme.displayLarge.copyWith(
                                      color: colors.text,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Create Account',
                                    style: textTheme.displayLarge.copyWith(
                                      color: colors.text,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),

                                  SizedBox(height: 40.h),

                                  TextFormField(
                                    controller: _firstNameController,
                                    decoration: _inputDecoration(
                                      label: 'Enter your first name',
                                      hintText: 'e.g. John',
                                    ),
                                    autofillHints: const [
                                      AutofillHints.givenName,
                                    ],
                                    validator: validateName,
                                  ),

                                  SizedBox(height: 16.h),

                                  TextFormField(
                                    controller: _lastNameController,
                                    decoration: _inputDecoration(
                                      label: 'Enter your last name',
                                      hintText: 'e.g. Doe',
                                    ),
                                    autofillHints: const [
                                      AutofillHints.familyName,
                                    ],
                                    validator: validateName,
                                  ),

                                  SizedBox(height: 16.h),

                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: _inputDecoration(
                                      label: 'Enter your email',
                                      hintText: 'Example: yourname@gmail.com',
                                    ),
                                    autofillHints: const [AutofillHints.email],
                                    validator: validateEmail,
                                  ),

                                  SizedBox(height: 16.h),

                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscurePassword,
                                    decoration: _inputDecoration(
                                      label: 'Enter your password',
                                      hintText: 'Use at least 6 characters',
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
                                      AutofillHints.newPassword,
                                    ],
                                    validator: validatePassword,
                                  ),

                                  SizedBox(height: 16.h),

                                  TextFormField(
                                    controller: _confirmPasswordController,
                                    obscureText: _obscureConfirmPassword,
                                    decoration: _inputDecoration(
                                      label: 'Confirm your password',
                                      hintText: 'Re-enter your password',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureConfirmPassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureConfirmPassword =
                                                !_obscureConfirmPassword;
                                          });
                                        },
                                      ),
                                    ),
                                    autofillHints: const [
                                      AutofillHints.newPassword,
                                    ],
                                    validator: _validateConfirmPassword,
                                  ),

                                  SizedBox(height: 24.h),

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
                                          : _handleRegister,
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
                                      child: _isLoading
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
                                              'Register',
                                              style: context
                                                  .textStyle
                                                  .buttonLarge
                                                  .withColor(colors.white),
                                            ),
                                    ),
                                  ),

                                  SizedBox(height: 12.h),

                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: context.textStyle.bodySmall
                                          .withColor(colors.gray),
                                      children: [
                                        const TextSpan(
                                          text: 'Already Registered? ',
                                        ),
                                        WidgetSpan(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              context.go('/login');
                                            },
                                            child: Text(
                                              'Sign in here',
                                              style: context.textStyle.bodySmall
                                                  .withColor(colors.primary)
                                                  .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor:
                                                        colors.primary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
