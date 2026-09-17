// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

/// Modern minimal RewardPointsWidget matching base Pickaboo logic:
/// - Title & available points subtitle
/// - Optional points to earn indicator
/// - Points input field with single clean OutlineInputBorder
/// - "Use maximum X Club Points" toggle
/// - Full-width Apply Points / Cancel Points button
class RewardPointsWidget extends StatefulWidget {
  final int maxPoints;
  final int minPoints;
  final int pointsToEarn;
  final int appliedPoints;
  final Function(int) onApply;
  final VoidCallback? onCancel;

  const RewardPointsWidget({
    super.key,
    required this.maxPoints,
    required this.minPoints,
    required this.pointsToEarn,
    required this.appliedPoints,
    required this.onApply,
    this.onCancel,
  });

  @override
  State<RewardPointsWidget> createState() => _RewardPointsWidgetState();
}

class _RewardPointsWidgetState extends State<RewardPointsWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _useMaxPoints = false;

  bool get _isPointsApplied => widget.appliedPoints > 0;
  bool get _canRedeem => widget.maxPoints > 0;

  @override
  void initState() {
    super.initState();
    if (_isPointsApplied) {
      _controller.text = widget.appliedPoints.toString();
    }
  }

  @override
  void didUpdateWidget(covariant RewardPointsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.appliedPoints != oldWidget.appliedPoints) {
      if (widget.appliedPoints > 0) {
        _controller.text = widget.appliedPoints.toString();
      } else {
        _controller.clear();
        _useMaxPoints = false;
      }
    } else if (_useMaxPoints &&
        widget.maxPoints != oldWidget.maxPoints &&
        !_isPointsApplied) {
      _controller.text = widget.maxPoints.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleApply() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      SnackBarUtils.showWarning(context, 'Please enter amount of points to spend');
      return;
    }
    final points = int.tryParse(text);
    if (points == null || points <= 0) {
      SnackBarUtils.showWarning(context, 'Please enter a valid point amount');
      return;
    }
    if (widget.minPoints > 0 && points < widget.minPoints) {
      SnackBarUtils.showWarning(
        context,
        'Use minimum ${widget.minPoints} points',
      );
      return;
    }
    if (widget.maxPoints > 0 && points > widget.maxPoints) {
      SnackBarUtils.showWarning(
        context,
        'Use maximum ${widget.maxPoints} points',
      );
      return;
    }
    FocusScope.of(context).unfocus();
    widget.onApply(points);
  }

  void _handleCancel() {
    FocusScope.of(context).unfocus();
    setState(() {
      _useMaxPoints = false;
      _controller.clear();
    });
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
          color: _isPointsApplied
              ? AppColors.amber.withValues(alpha: 0.4)
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
            'Use Club Points',
            style: AppTypography.titleSmall.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            _canRedeem
                ? 'You can use up to ${widget.maxPoints} Club Points on this order'
                : 'No Club Points can be used on this order',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.muted,
            ),
          ),
          if (widget.pointsToEarn > 0) ...[
            SizedBox(height: 4.h),
            Text(
              "You'll earn ${widget.pointsToEarn} Club Points from this order",
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          SizedBox(height: 12.h),
          SizedBox(
            height: 44.h,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              enabled: !_isPointsApplied && _canRedeem,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                _MaxPointsInputFormatter(widget.maxPoints),
              ],
              onChanged: (value) {
                if (_useMaxPoints && value != widget.maxPoints.toString()) {
                  setState(() {
                    _useMaxPoints = false;
                  });
                }
              },
              style: AppTypography.titleSmall.copyWith(
                fontSize: 13.sp,
                color: AppColors.navy,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Amount of Points to Spend',
                hintStyle: AppTypography.inputHint,
                filled: true,
                fillColor: _isPointsApplied
                    ? AppColors.pageBg
                    : AppColors.white,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 12.h,
                ),
                border: const OutlineInputBorder(
                  borderRadius: AppRadius.inputRadius,
                  borderSide: BorderSide(color: AppColors.border),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: AppRadius.inputRadius,
                  borderSide: BorderSide(color: AppColors.border),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: AppRadius.inputRadius,
                  borderSide: BorderSide(color: AppColors.border),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: AppRadius.inputRadius,
                  borderSide: BorderSide(
                    color: AppColors.pickabooBlue,
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ),
          if (!_isPointsApplied && _canRedeem) ...[
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                setState(() {
                  _useMaxPoints = !_useMaxPoints;
                  if (_useMaxPoints) {
                    _controller.text = widget.maxPoints.toString();
                  } else {
                    _controller.clear();
                  }
                });
              },
              child: Row(
                children: [
                  Icon(
                    _useMaxPoints
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 18.sp,
                    color: _useMaxPoints
                        ? AppColors.pickabooBlue
                        : AppColors.mutedLight,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'Use maximum ${widget.maxPoints} Club Points',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.navy,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          AppSpacing.gapV12,
          _isPointsApplied
              ? AppButton.outline(
                  text: 'Cancel Points',
                  onPressed: _handleCancel,
                  isFullWidth: true,
                  height: 42.h,
                  backgroundColor: AppColors.pageBg,
                  borderColor: AppColors.border,
                  textColor: AppColors.navy,
                )
              : AppButton.primary(
                  text: 'Apply Points',
                  onPressed: _canRedeem ? _handleApply : null,
                  isDisabled: !_canRedeem,
                  isFullWidth: true,
                  height: 42.h,
                ),
        ],
      ),
    );
  }
}

class _MaxPointsInputFormatter extends TextInputFormatter {
  final int max;

  const _MaxPointsInputFormatter(this.max);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    if (max <= 0) return oldValue;

    final value = int.tryParse(newValue.text);
    if (value == null) return oldValue;
    if (value <= max) return newValue;

    final capped = max.toString();
    return TextEditingValue(
      text: capped,
      selection: TextSelection.collapsed(offset: capped.length),
    );
  }
}
