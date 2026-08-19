import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyle.inputLabel.copyWith(color: colors.text)),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          inputFormatters: inputFormatters,
          validator: validator ?? validateMobileNumber,
          onChanged: onChanged,
          style: textStyle.inputText.copyWith(color: colors.text),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textStyle.inputPlaceholder.copyWith(
              color: colors.gray.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: colors.gray.withValues(alpha: 0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: colors.gray.withValues(alpha: 0.2)),
            ),
          ),
        ),
      ],
    );
  }
}
