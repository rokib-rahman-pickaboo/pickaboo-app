import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';

Future<BankEmiDataEntity?> showEmiBankPickerSheet(
  BuildContext context, {
  required List<BankEmiDataEntity> banks,
  BankEmiDataEntity? selected,
}) {
  return showModalBottomSheet<BankEmiDataEntity>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _EmiPickerSheet<BankEmiDataEntity>(
      title: 'Select Bank',
      items: banks,
      initialSelected: selected,
      isSelected: (a, b) => a.name == b.name,
      labelBuilder: (bank) => bank.name,
    ),
  );
}

Future<EmiTenureDetailEntity?> showEmiTenurePickerSheet(
  BuildContext context, {
  required List<EmiTenureDetailEntity> tenures,
  EmiTenureDetailEntity? selected,
}) {
  return showModalBottomSheet<EmiTenureDetailEntity>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _EmiPickerSheet<EmiTenureDetailEntity>(
      title: 'Select Tenure',
      items: tenures,
      initialSelected: selected,
      isSelected: (a, b) => a.tenure == b.tenure,
      labelBuilder: (t) => t.tenureLabel,
    ),
  );
}

class _EmiPickerSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final T? initialSelected;
  final bool Function(T a, T b) isSelected;
  final String Function(T item) labelBuilder;

  const _EmiPickerSheet({
    super.key,
    required this.title,
    required this.items,
    required this.initialSelected,
    required this.isSelected,
    required this.labelBuilder,
  });

  @override
  State<_EmiPickerSheet<T>> createState() => _EmiPickerSheetState<T>();
}

class _EmiPickerSheetState<T> extends State<_EmiPickerSheet<T>> {
  T? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: textStyle.bodyMediumBold.copyWith(color: colors.text),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: colors.backgroundGray,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, color: colors.text, size: 20.sp),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: colors.borderColor),

          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(16.w),
              itemCount: widget.items.length,
              separatorBuilder: (_, _) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected =
                    _selected != null && widget.isSelected(_selected as T, item);
                return _SelectableRow(
                  label: widget.labelBuilder(item),
                  isSelected: isSelected,
                  onTap: () => setState(() => _selected = item),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              16.w,
              4.h,
              16.w,
              MediaQuery.of(context).padding.bottom + 16.h,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selected == null
                    ? null
                    : () => Navigator.pop(context, _selected),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.white,
                  disabledBackgroundColor: colors.primary.withValues(alpha: 0.4),
                  minimumSize: Size(0, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Apply',
                  style: textStyle.buttonMedium.copyWith(color: colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectableRow extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SelectableRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected ? colors.primary.withValues(alpha: 0.05) : colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? colors.primary : colors.borderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? colors.primary : colors.silverChalice,
                  width: 2.w,
                ),
                color: isSelected ? colors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 12.sp, color: colors.white)
                  : null,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: textStyle.bodySmall.copyWith(color: colors.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
