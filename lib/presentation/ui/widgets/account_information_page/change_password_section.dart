import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class ChangePasswordSection extends StatefulWidget {
  final bool isEnabled;
  final VoidCallback onToggle;
  final Function(String, String) onSave;

  const ChangePasswordSection({
    super.key,
    required this.isEnabled,
    required this.onToggle,
    required this.onSave,
  });

  @override
  State<ChangePasswordSection> createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSave(
        _currentPasswordController.text.trim(),
        _newPasswordController.text.trim(),
      );
      _currentPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
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
                  'Change Password',
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
                    controller: _currentPasswordController,
                    obscureText: true,
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.text),
                    decoration: InputDecoration(
                      hintText: 'Current password',
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
                        return 'Please enter current password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    controller: _newPasswordController,
                    obscureText: true,
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.text),
                    decoration: InputDecoration(
                      hintText: 'New password',
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
                        return 'Please enter new password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.text),
                    decoration: InputDecoration(
                      hintText: 'Confirm new password',
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
                        return 'Please enter confirm password';
                      }
                      if (value != _newPasswordController.text) {
                        return 'New password and Confirm password are not same';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  AppButton.primary(
                    height: 48.h,
                    borderRadius: AppRadius.cardRadius,
                    text: 'Save Password',
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
