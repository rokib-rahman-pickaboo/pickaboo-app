// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/checkout/checkout_emi_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
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
      backgroundColor: AppColors.transparent,
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
    SnackBarUtils.showRegular(context, message);
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
      _showMessage(AppStrings.pleaseSelectBank);
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
      _showMessage(AppStrings.pleaseSelectBank);
      return;
    }
    if (_localTenure == null) {
      _showMessage(AppStrings.pleaseSelectTenure);
      return;
    }
    Navigator.pop(context);
    widget.onConfirm(_localBank!, _localTenure!, _localMode);
  }

  @override
  Widget build(BuildContext context) {
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
          color: AppColors.white,
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
                    style: AppTypography.bodyMedium.bold().copyWith(
                      color: AppColors.text,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: AppColors.pageBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: AppColors.text, size: 20.sp),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),

            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Mode',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.mutedLight,
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
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.mutedLight,
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
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.mutedLight,
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
                              color: AppColors.pageBg,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EMI Summary',
                                  style: AppTypography.bodyMedium.bold().copyWith(
                                    color: AppColors.text,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                _summaryRow(
                                  'Price',
                                  productPrice.toStringAsFixed(2),
                                ),
                                _summaryRow(
                                  'Convenience Fee',
                                  fee.toStringAsFixed(2),
                                ),
                                _summaryRow(
                                  'Shipping',
                                  shipping.toStringAsFixed(2),
                                ),
                                _summaryRow(
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
              child: AppButton.primary(
                text: widget.isCheckoutFlow
                    ? 'Save Selection'
                    : (_localMode == 'Card On Delivery'
                          ? 'Confirm'
                          : 'Confirm & Pay'),
                isFullWidth: true,
                height: 48.h,
                onPressed: _handleApply,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
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
              style: AppTypography.bodySmall.copyWith(color: AppColors.text),
            ),
          ),
          Text(
            '৳ $value',
            style: AppTypography.bodySmall.bold().copyWith(color: AppColors.text),
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
                ? AppColors.pickabooBlue.withValues(alpha: 0.05)
                : AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isSelected ? AppColors.pickabooBlue : AppColors.border,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                size: 20.r,
                color: isSelected ? AppColors.pickabooBlue : AppColors.mutedLight,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.text,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.bodySmall.copyWith(color: AppColors.text),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20.r,
              color: AppColors.mutedLight,
            ),
          ],
        ),
      ),
    );
  }
}
