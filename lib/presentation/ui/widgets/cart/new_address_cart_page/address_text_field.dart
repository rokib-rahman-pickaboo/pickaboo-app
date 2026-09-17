import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';

class AddressTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const AddressTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodyLarge.copyWith(color: AppColors.text)),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: AppTypography.bodyLarge.regular().copyWith(color: AppColors.text),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTypography.inputHint.copyWith(
              color: AppColors.muted.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: AppRadius.inputRadius,
              borderSide: BorderSide(color: AppColors.muted.withValues(alpha: 0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.inputRadius,
              borderSide: BorderSide(color: AppColors.muted.withValues(alpha: 0.2)),
            ),
          ),
        ),
      ],
    );
  }
}
