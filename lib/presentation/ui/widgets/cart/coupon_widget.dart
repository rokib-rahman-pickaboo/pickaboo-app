// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';

/// Clean CouponWidget matching Image 1 & 2:
/// - Rounded card container
/// - 'Apply Discount Code' title
/// - Textfield + 'Apply' button with matched height using IntrinsicHeight
class CouponWidget extends StatefulWidget {
  final Function(String) onApply;
  final VoidCallback? onCancel;
  final String appliedCoupon;

  const CouponWidget({
    super.key,
    required this.onApply,
    this.onCancel,
    this.appliedCoupon = '',
  });

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  final TextEditingController _controller = TextEditingController();

  bool get _isCouponApplied => widget.appliedCoupon.isNotEmpty;

  @override
  void initState() {
    super.initState();
    if (_isCouponApplied) {
      _controller.text = widget.appliedCoupon;
    }
  }

  @override
  void didUpdateWidget(covariant CouponWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.appliedCoupon != oldWidget.appliedCoupon) {
      if (widget.appliedCoupon.isNotEmpty) {
        _controller.text = widget.appliedCoupon;
      } else {
        _controller.clear();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleApply() {
    final code = _controller.text.trim();
    if (code.isEmpty) {
      SnackBarUtils.showWarning(context, 'Please enter a discount code');
      return;
    }
    FocusScope.of(context).unfocus();
    widget.onApply(code);
  }

  void _handleCancel() {
    FocusScope.of(context).unfocus();
    _controller.clear();
    widget.onCancel?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(
          color: _isCouponApplied
              ? AppColors.pickabooBlue.withValues(alpha: 0.3)
              : AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.02),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apply Discount Code',
            style: AppTypography.cardTitle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
          ),
          SizedBox(height: 12.h),
          if (_isCouponApplied)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.surfaceBlue,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.pickabooBlue.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 18.sp,
                    color: AppColors.pickabooBlue,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.appliedCoupon,
                          style: AppTypography.cardTitle.copyWith(
                            color: AppColors.pickabooBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Coupon code applied',
                          style: AppTypography.bodyMuted,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _handleCancel,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      child: Text(
                        'Remove',
                        style: AppTypography.bodyMuted.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: AppTypography.cardTitle.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.navy,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Discount Code',
                        hintStyle: AppTypography.inputHint,
                        filled: true,
                        fillColor: AppColors.white,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.5.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: AppColors.pickabooBlue,
                            width: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    onPressed: _handleApply,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pickabooBlue,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Apply',
                      style: AppTypography.buttonPrimary,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
