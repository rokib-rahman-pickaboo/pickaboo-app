import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class RewardPointsWidget extends StatefulWidget {
  final Function(int) onApply;
  final VoidCallback? onCancel;

  final int maxPoints;
  final int minPoints;

  final int appliedPoints;

  final int pointsToEarn;

  const RewardPointsWidget({
    super.key,
    required this.onApply,
    this.onCancel,
    this.maxPoints = 0,
    this.minPoints = 0,
    this.appliedPoints = 0,
    this.pointsToEarn = 0,
  });

  @override
  State<RewardPointsWidget> createState() => _RewardPointsWidgetState();
}

class _RewardPointsWidgetState extends State<RewardPointsWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _useMaxPoints = false;

  bool get _isPointsApplied => widget.appliedPoints > 0;

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
    }
  }

  bool get _canRedeem => widget.maxPoints > 0;

  void _onApplyPressed() {
    if (!_canRedeem) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No club points can be redeemed on this order'),
        ),
      );
      return;
    }

    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter amount of points to spend'),
        ),
      );
      return;
    }

    final points = int.tryParse(_controller.text);
    if (points == null || points <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid point amount')),
      );
      return;
    }

    if (widget.minPoints > 0 && points < widget.minPoints) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Use minimum ${widget.minPoints} points'),
        ),
      );
      return;
    }

    if (widget.maxPoints > 0 && points > widget.maxPoints) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Use maximum ${widget.maxPoints} points'),
        ),
      );
      return;
    }

    widget.onApply(points);
  }

  void _onCancelPressed() {
    setState(() {
      _useMaxPoints = false;
      _controller.clear();
    });
    widget.onCancel?.call();
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
            'Use Club Points',
            style: context.textStyle.cardTitle.copyWith(
              fontWeight: FontWeight.bold,
              color: colors.text,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            _canRedeem
                ? 'You can use up to ${widget.maxPoints} Club Points on this order'
                : 'No Club Points can be used on this order',
            style: context.textStyle.bodySmall.withColor(colors.text),
          ),
          if (widget.pointsToEarn > 0) ...[
            SizedBox(height: 4.h),
            Text(
              "You'll earn ${widget.pointsToEarn} Club Points from this order",
              style: context.textStyle.bodySmall.withColor(colors.green),
            ),
          ],

          SizedBox(height: 16.h),

          TextField(
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
            decoration: InputDecoration(
              hintText: 'Enter Amount of Points to Spend',
              hintStyle: context.textStyle.inputPlaceholder.withColor(
                colors.silverChalice,
              ),
              filled: true,
              fillColor:
                  _isPointsApplied ? colors.whiteSmoke : colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
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

          SizedBox(height: 12.h),

          if (!_isPointsApplied && _canRedeem) ...[
            InkWell(
              onTap: () {
                setState(() {
                  _useMaxPoints = true;
                  _controller.text = widget.maxPoints.toString();
                });
              },
              child: Row(
                children: [
                  Icon(
                    _useMaxPoints
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 20.sp,
                    color: _useMaxPoints
                        ? const Color(0xFF1B5DD5)
                        : colors.gray,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'Use maximum ${widget.maxPoints} Club Points',
                      style: context.textStyle.bodyMediumMedium.withColor(
                        colors.gray,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],

          InkWell(
            onTap: _isPointsApplied
                ? _onCancelPressed
                : (_canRedeem ? _onApplyPressed : null),
            borderRadius: BorderRadius.circular(12.r),
            child: Opacity(
              opacity: _isPointsApplied || _canRedeem ? 1 : 0.5,
              child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: _isPointsApplied
                    ? const Color(0xFFEFEFEF)
                    : null,
                gradient: _isPointsApplied
                    ? null
                    : LinearGradient(
                        colors: [
                          colors.button,
                          colors.button.withValues(alpha: 0.85),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                borderRadius: BorderRadius.circular(12.r),
                border: _isPointsApplied
                    ? Border.all(color: const Color(0xFFD9D9D9))
                    : null,
                boxShadow: _isPointsApplied
                    ? null
                    : [
                        BoxShadow(
                          color: colors.button.withValues(alpha: 0.3),
                          blurRadius: 12.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
              ),
              child: Center(
                child: Text(
                  _isPointsApplied ? 'Cancel Points' : 'Apply Points',
                  style: context.textStyle.buttonMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _isPointsApplied ? colors.text : colors.white,
                  ),
                ),
              ),
              ),
            ),
          ),
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
