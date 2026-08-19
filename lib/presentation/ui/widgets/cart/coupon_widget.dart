import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';

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
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: context.colors.borderColor),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apply Discount Code',
            style: context.textStyle.inputLabel.copyWith(
              fontWeight: FontWeight.bold,
              color: colors.text,
            ),
          ),
          SizedBox(height: 10.h),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  enabled: !_isCouponApplied,
                  decoration: InputDecoration(
                    hintText: 'Enter Discount Code',
                    hintStyle: context.textStyle.inputPlaceholder.withColor(
                      colors.silverChalice,
                    ),
                    filled: true,
                    fillColor:
                        _isCouponApplied ? colors.whiteSmoke : colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: colors.borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: colors.borderColor),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: colors.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: colors.primary, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  if (_isCouponApplied) {
                    _controller.clear();
                    widget.onCancel?.call();
                    return;
                  }
                  final code = _controller.text.trim();
                  if (code.isEmpty) {
                    SnackBarUtils.showWarning(
                      context,
                      'Please enter a discount code',
                    );
                    return;
                  }
                  widget.onApply(code);
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B5DD5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    _isCouponApplied ? 'Cancel' : 'Apply',
                    style: context.textStyle.buttonSmall.withColor(
                      colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          if (_isCouponApplied) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFF4CAF50), width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_offer,
                    size: 16.sp,
                    color: const Color(0xFF4CAF50),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    widget.appliedCoupon,
                    style: context.textStyle.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2E7D32),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      _controller.clear();
                      widget.onCancel?.call();
                    },
                    child: Icon(
                      Icons.close,
                      size: 16.sp,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
