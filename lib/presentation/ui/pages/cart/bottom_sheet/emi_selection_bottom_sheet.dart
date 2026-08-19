import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/emi_picker_sheets.dart';

class EmiSelectionBottomSheet extends StatefulWidget {
  final CheckoutEmiEntity emiData;

  final BankEmiDataEntity? initialBank;

  final EmiTenureDetailEntity? initialTenure;

  final String initialMode;

  final bool isCheckoutFlow;

  final void Function(
    BankEmiDataEntity bank,
    EmiTenureDetailEntity tenure,
    String mode,
  )
  onConfirm;

  const EmiSelectionBottomSheet({
    super.key,
    required this.emiData,
    required this.initialBank,
    required this.initialTenure,
    required this.initialMode,
    required this.isCheckoutFlow,
    required this.onConfirm,
  });

  static void show(
    BuildContext context, {
    required CheckoutEmiEntity emiData,
    BankEmiDataEntity? initialBank,
    EmiTenureDetailEntity? initialTenure,
    String initialMode = 'Pay online',
    bool isCheckoutFlow = false,
    required void Function(
      BankEmiDataEntity bank,
      EmiTenureDetailEntity tenure,
      String mode,
    )
    onConfirm,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => EmiSelectionBottomSheet(
        emiData: emiData,
        initialBank: initialBank,
        initialTenure: initialTenure,
        initialMode: initialMode,
        isCheckoutFlow: isCheckoutFlow,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  State<EmiSelectionBottomSheet> createState() =>
      _EmiSelectionBottomSheetState();
}

class _EmiSelectionBottomSheetState extends State<EmiSelectionBottomSheet> {
  late BankEmiDataEntity? _localBank;
  late EmiTenureDetailEntity? _localTenure;
  late String _localMode;

  @override
  void initState() {
    super.initState();
    _localBank = widget.initialBank;
    _localTenure = widget.initialTenure;
    _localMode = widget.initialMode;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pickBank() async {
    final result = await showEmiBankPickerSheet(
      context,
      banks: widget.emiData.bankEmiData,
      selected: _localBank,
    );
    if (result != null) {
      setState(() {
        _localBank = result;
        _localTenure = null;
      });
    }
  }

  Future<void> _pickTenure() async {
    if (_localBank == null) {
      _showMessage('Please select bank');
      return;
    }
    final result = await showEmiTenurePickerSheet(
      context,
      tenures: _localBank!.emiTenures,
      selected: _localTenure,
    );
    if (result != null) {
      setState(() => _localTenure = result);
    }
  }

  void _handleApply() {
    if (_localBank == null) {
      _showMessage('Please select bank');
      return;
    }
    if (_localTenure == null) {
      _showMessage('Please select tenure');
      return;
    }
    Navigator.pop(context);
    widget.onConfirm(_localBank!, _localTenure!, _localMode);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final isDhaka = widget.emiData.isCardOnDeliveryAvailable;
    final tenure = _localTenure;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EMI Details',
                    style: textStyle.bodyMediumBold.copyWith(
                      color: colors.text,
                    ),
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
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Mode',
                      style: textStyle.bodySmall.copyWith(
                        color: colors.textLight,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _ModeOption(
                          label: 'Pay Online',
                          value: 'Pay online',
                          groupValue: _localMode,
                          onChanged: (v) => setState(() => _localMode = v),
                        ),
                        if (isDhaka) ...[
                          SizedBox(width: 8.h),
                          _ModeOption(
                            label: 'Card On Delivery',
                            value: 'Card On Delivery',
                            groupValue: _localMode,
                            onChanged: (v) => setState(() => _localMode = v),
                          ),
                        ],
                      ],
                    ),

                    SizedBox(height: 20.h),
                    Text(
                      'Select Bank',
                      style: textStyle.bodySmall.copyWith(
                        color: colors.textLight,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _DropdownField(
                      label: _localBank?.name ?? 'Select Bank',
                      onTap: _pickBank,
                    ),

                    SizedBox(height: 20.h),
                    Text(
                      'Select Tenure',
                      style: textStyle.bodySmall.copyWith(
                        color: colors.textLight,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _DropdownField(
                      label: tenure?.tenureLabel ?? 'Select Tenure',
                      onTap: _pickTenure,
                    ),

                    if (tenure != null) ...[
                      SizedBox(height: 20.h),
                      Builder(
                        builder: (context) {
                          final shipping = widget.emiData.shippingCost;
                          final productPrice = tenure.productPrice(shipping);
                          final fee = tenure.convenienceFeeAmount;
                          final total = productPrice + fee + shipping;

                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: colors.backgroundGray,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EMI Summary',
                                  style: textStyle.bodyMediumBold.copyWith(
                                    color: colors.text,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                _summaryRow(
                                  textStyle,
                                  colors,
                                  'Price',
                                  productPrice.toStringAsFixed(2),
                                ),
                                _summaryRow(
                                  textStyle,
                                  colors,
                                  'Convenience Fee',
                                  fee.toStringAsFixed(2),
                                ),
                                _summaryRow(
                                  textStyle,
                                  colors,
                                  'Shipping',
                                  shipping.toStringAsFixed(2),
                                ),
                                _summaryRow(
                                  textStyle,
                                  colors,
                                  'Total Amount Payable',
                                  total.toStringAsFixed(2),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
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
                  onPressed: _handleApply,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.button,
                    foregroundColor: colors.white,
                    minimumSize: Size(0, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    widget.isCheckoutFlow
                        ? 'Save Selection'
                        : (_localMode == 'Card On Delivery'
                              ? 'Confirm'
                              : 'Confirm & Pay'),
                    style: textStyle.buttonMedium.copyWith(color: colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    AppTextStyles textStyle,
    AppColors colors,
    String label,
    String value,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: textStyle.bodySmall.copyWith(color: colors.text),
            ),
          ),
          Text(
            '৳ $value',
            style: textStyle.bodySmallBold.copyWith(color: colors.text),
          ),
        ],
      ),
    );
  }
}

class _ModeOption extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  const _ModeOption({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final isSelected = value == groupValue;

    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () => onChanged(value),
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected
                ? colors.primary.withValues(alpha: 0.05)
                : colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isSelected ? colors.primary : colors.borderColor,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                size: 20.r,
                color: isSelected ? colors.primary : colors.silverChalice,
              ),
              SizedBox(width: 10.w),
              Text(
                label,
                style: textStyle.bodySmall.copyWith(
                  color: colors.text,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DropdownField({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: colors.borderColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.bodySmall.copyWith(color: colors.text),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20.r,
              color: colors.textLight,
            ),
          ],
        ),
      ),
    );
  }
}
