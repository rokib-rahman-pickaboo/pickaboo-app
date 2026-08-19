import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/constants/app_constants.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class ProductQuantitySelector extends StatefulWidget {
  final int initialQuantity;

  final int maxQuantity;
  final ValueChanged<int>? onChanged;

  const ProductQuantitySelector({
    super.key,
    this.initialQuantity = AppConstants.minCartQuantity,
    this.maxQuantity = AppConstants.maxCartQuantity,
    this.onChanged,
  });

  @override
  State<ProductQuantitySelector> createState() =>
      _ProductQuantitySelectorState();
}

class _ProductQuantitySelectorState extends State<ProductQuantitySelector> {
  late int _quantity;

  int get _min => AppConstants.minCartQuantity;
  int get _max =>
      widget.maxQuantity < _min ? _min : widget.maxQuantity;

  bool get _canDecrease => _quantity > _min;
  bool get _canIncrease => _quantity < _max;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity.clamp(_min, _max);
  }

  @override
  void didUpdateWidget(covariant ProductQuantitySelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialQuantity != widget.initialQuantity ||
        oldWidget.maxQuantity != widget.maxQuantity) {
      final next = (oldWidget.initialQuantity != widget.initialQuantity
              ? widget.initialQuantity
              : _quantity)
          .clamp(_min, _max);
      if (next != _quantity) {
        setState(() {
          _quantity = next;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) widget.onChanged?.call(_quantity);
        });
      }
    }
  }

  void _decreaseQuantity() {
    if (!_canDecrease) return;
    setState(() {
      _quantity--;
    });
    widget.onChanged?.call(_quantity);
  }

  void _increaseQuantity() {
    if (!_canIncrease) return;
    setState(() {
      _quantity++;
    });
    widget.onChanged?.call(_quantity);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                Text(
                  'Quantity',
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(width: 8.w),
                Text(
                  ':',
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
              ],
            ),
          ),

          Row(
            children: [
              _buildControlButton(
                icon: 'assets/new/svg/detail/minus_icon.svg',
                onTap: _decreaseQuantity,
                enabled: _canDecrease,
                colors: colors,
              ),
              SizedBox(width: 12.w),

              Container(
                width: 60.w,
                padding: EdgeInsets.symmetric(vertical: 8.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.white,
                  border: Border.all(color: colors.borderColor, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  _quantity.toString(),
                  style: textStyle.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.text,
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              _buildControlButton(
                icon: 'assets/new/svg/detail/plus_icon.svg',
                onTap: _increaseQuantity,
                enabled: _canIncrease,
                colors: colors,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required String icon,
    required VoidCallback onTap,
    required AppColors colors,
    bool enabled = true,
  }) {
    final tint = enabled ? colors.primary : colors.borderColor;

    return IconButton(
      onPressed: enabled ? onTap : null,
      icon: SvgPicture.asset(
        icon,
        width: 20.w,
        height: 20.w,
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
      ),
      constraints: BoxConstraints(
        maxHeight: 36.w,
        maxWidth: 36.w,
        minHeight: 36.w,
        minWidth: 36.w,
      ),
      style: ButtonStyle(
        side: WidgetStatePropertyAll(
          BorderSide(color: tint, width: 2.w),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
      iconSize: 20.w,
      splashRadius: 20.r,
    );
  }
}
