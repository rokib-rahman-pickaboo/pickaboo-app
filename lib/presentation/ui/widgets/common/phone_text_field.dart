import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/validatator/validator.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const PhoneTextField({
    super.key,
    required this.controller,
    this.label = 'Mobile Number',
    this.hint = 'Enter your mobile number',
    this.validator,
    this.onChanged,
  });

  static final List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.allow(RegExp(r'[\d+]')),
    LengthLimitingTextInputFormatter(14),
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodyLarge.copyWith(color: AppColors.text)),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          inputFormatters: inputFormatters,
          validator: validator ?? validateMobileNumber,
          onChanged: onChanged,
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
