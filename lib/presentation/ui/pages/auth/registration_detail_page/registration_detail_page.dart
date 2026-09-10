// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/core/validatator/validator.dart';
import 'package:pickaboo/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'package:pickaboo/presentation/bloc/auth/registration_bloc/registration_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/main_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modernized Pickaboo Registration Detail Page
/// Form for entering personal details & password to finalize account creation.
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

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
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
    _dismissKeyboard();
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
            context.read<AuthBloc>().add(const AuthEvent.userLoggedIn());
            MainPage.hideBottomNav.value = false;
            context.go(Routes.home);
          },
          registrationFailure: (error) {
            setState(() => _isLoading = false);
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
                            child: Form(
                              key: _formKey,
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

                                  // Header Text
                                  Text(
                                    'Enter Information for',
                                    style: AppTypography.heroTitle,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    'Create Account',
                                    style: AppTypography.heroTitle,
                                    textAlign: TextAlign.center,
                                  ),

                                  SizedBox(height: 24.h),

                                  // First Name Field
                                  TextFormField(
                                    controller: _firstNameController,
                                    style: AppTypography.inputText,
                                    decoration: _buildInputDecoration(
                                      hintText: 'Enter your first name',
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        size: 18.sp,
                                        color: AppColors.mutedLight,
                                      ),
                                    ),
                                    autofillHints: const [
                                      AutofillHints.givenName,
                                    ],
                                    validator: validateName,
                                  ),

                                  SizedBox(height: 12.h),

                                  // Last Name Field
                                  TextFormField(
                                    controller: _lastNameController,
                                    style: AppTypography.inputText,
                                    decoration: _buildInputDecoration(
                                      hintText: 'Enter your last name',
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        size: 18.sp,
                                        color: AppColors.mutedLight,
                                      ),
                                    ),
                                    autofillHints: const [
                                      AutofillHints.familyName,
                                    ],
                                    validator: validateName,
                                  ),

                                  SizedBox(height: 12.h),

                                  // Email Field
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: AppTypography.inputText,
                                    decoration: _buildInputDecoration(
                                      hintText: 'Enter your email',
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        size: 18.sp,
                                        color: AppColors.mutedLight,
                                      ),
                                    ),
                                    autofillHints: const [AutofillHints.email],
                                    validator: validateEmail,
                                  ),

                                  SizedBox(height: 12.h),

                                  // Password Field
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscurePassword,
                                    style: AppTypography.inputText,
                                    decoration: _buildInputDecoration(
                                      hintText: 'Enter your password (min. 6 chars)',
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
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

                                  SizedBox(height: 12.h),

                                  // Confirm Password Field
                                  TextFormField(
                                    controller: _confirmPasswordController,
                                    obscureText: _obscureConfirmPassword,
                                    style: AppTypography.inputText,
                                    decoration: _buildInputDecoration(
                                      hintText: 'Confirm your password',
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
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
                                    autofillHints: const [
                                      AutofillHints.newPassword,
                                    ],
                                    validator: _validateConfirmPassword,
                                  ),

                                  SizedBox(height: 24.h),

                                  // Primary CTA Button (Register)
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50.h,
                                    child: ElevatedButton(
                                      onPressed:
                                          _isLoading ? null : _handleRegister,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.pickabooBlue,
                                        foregroundColor: AppColors.white,
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: AppRadius.cardRadius,
                                        ),
                                      ),
                                      child: _isLoading
                                          ? const AppLoader.button()
                                          : Text(
                                              'Register',
                                              style: AppTypography.buttonPrimary,
                                            ),
                                    ),
                                  ),

                                  SizedBox(height: 18.h),

                                  // Already Registered Link
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already Registered? ',
                                        style: AppTypography.bodyMutedLight,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _dismissKeyboard();
                                          context.go(Routes.login);
                                        },
                                        child: Text(
                                          'Sign in here',
                                          style: AppTypography.brandActionText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
    );
  }
}
