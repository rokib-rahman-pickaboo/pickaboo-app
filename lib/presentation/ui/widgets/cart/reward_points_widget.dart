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
  final FocusNode _focusNode = FocusNode();
  bool _useMaxPoints = false;

  bool get _isPointsApplied => widget.appliedPoints > 0;
  bool get _canRedeem => widget.maxPoints > 0;

  @override
  void initState() {
    super.initState();
    if (_isPointsApplied) {
      _controller.text = widget.appliedPoints.toString();
    }
    _focusNode.addListener(() {
      if (mounted) setState(() {});
    });
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
    _focusNode.dispose();
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
      decoration: AppDecorations.cardBoxDecoration(
        borderColor: _isPointsApplied
            ? AppColors.amber.withValues(alpha: 0.4)
            : AppColors.border,
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
          if (_isPointsApplied)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.amberBg,
                borderRadius: AppRadius.k8,
                border: Border.all(
                  color: AppColors.amber.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.stars_rounded,
                    size: 20.sp,
                    color: AppColors.amber,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.appliedPoints} Club Points applied',
                          style: AppTypography.titleSmall.copyWith(
                            color: AppColors.navy,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Saved on this order',
                          style: AppTypography.bodySmall,
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
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else ...[
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: !_canRedeem
                          ? AppColors.itemBackground
                          : AppColors.white,
                      borderRadius: AppRadius.k8,
                      border: Border.all(
                        color: _focusNode.hasFocus && _canRedeem
                            ? AppColors.pickabooBlue
                            : AppColors.border,
                        width: _focusNode.hasFocus && _canRedeem ? 1.2 : 1.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      enabled: _canRedeem,
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
                        hintText: 'Enter Points to Spend',
                        hintStyle: AppTypography.inputHint,
                        filled: false,
                        fillColor: AppColors.transparent,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
                      ),
                    ),
                  ),
                ),
                AppSpacing.gapH8,
                AppButton.primary(
                  text: 'Apply',
                  height: 40.h,
                  size: AppButtonSize.sm,
                  isFullWidth: false,
                  isDisabled: !_canRedeem,
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  onPressed: _canRedeem ? _handleApply : null,
                ),
              ],
            ),
            if (_canRedeem) ...[
              SizedBox(height: 8.h),
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
                      size: 16.sp,
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
          ],
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
