import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class ChangeEmailSection extends StatefulWidget {
  final bool isEnabled;
  final VoidCallback onToggle;
  final Function(String) onSave;

  const ChangeEmailSection({
    super.key,
    required this.isEnabled,
    required this.onToggle,
    required this.onSave,
  });

  @override
  State<ChangeEmailSection> createState() => _ChangeEmailSectionState();
}

class _ChangeEmailSectionState extends State<ChangeEmailSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _confirmEmailController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSave(_emailController.text.trim());
      _emailController.clear();
      _confirmEmailController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.dialogRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Change Email Address',
                  style: AppTypography.bodyMedium.medium().copyWith(
                    color: AppColors.text,
                  ),
                ),
              ),
              Switch(
                value: widget.isEnabled,
                onChanged: (_) => widget.onToggle(),
                activeThumbColor: AppColors.pickabooBlue,
                activeTrackColor: AppColors.pickabooBlue.withAlpha(128),
              ),
            ],
          ),
          if (widget.isEnabled)
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  TextFormField(
                    controller: _emailController,
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.text),
                    decoration: InputDecoration(
                      hintText: 'Enter your email id',
                      hintStyle: AppTypography.bodyMedium.copyWith(
                        color: AppColors.muted,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: AppRadius.cardRadius,
                        borderSide: BorderSide(
                          color: AppColors.border.withAlpha(128),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppRadius.cardRadius,
                        borderSide: BorderSide(
                          color: AppColors.border.withAlpha(128),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppRadius.cardRadius,
                        borderSide: BorderSide(
                          color: AppColors.pickabooBlue,
                          width: 1.5.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(16.w),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email id';
                      }
                      if (!_isValidEmail(value)) {
                        return 'Please enter valid email id';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    controller: _confirmEmailController,
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.text),
                    decoration: InputDecoration(
                      hintText: 'Confirm your email id',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
                      hintStyle: AppTypography.bodyMedium.copyWith(
                        color: AppColors.muted,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: AppRadius.cardRadius,
                        borderSide: BorderSide(
                          color: AppColors.border.withAlpha(128),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppRadius.cardRadius,
                        borderSide: BorderSide(
                          color: AppColors.border.withAlpha(128),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppRadius.cardRadius,
                        borderSide: BorderSide(
                          color: AppColors.pickabooBlue,
                          width: 1.5.w,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your confirm email id';
                      }
                      if (!_isValidEmail(value)) {
                        return 'Please enter valid email id';
                      }
                      if (value != _emailController.text) {
                        return 'Email and Confirm Email are not same';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  AppButton.primary(
                    height: 48.h,
                    borderRadius: AppRadius.cardRadius,
                    text: 'Save Email',
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
