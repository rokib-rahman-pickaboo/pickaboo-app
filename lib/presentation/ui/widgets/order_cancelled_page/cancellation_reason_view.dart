import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';

class CancellationReasonView extends StatefulWidget {
  final OrderDetailEntity order;
  final Function(String, String) onSubmit;

  const CancellationReasonView({
    super.key,
    required this.order,
    required this.onSubmit,
  });

  @override
  State<CancellationReasonView> createState() => _CancellationReasonViewState();
}

class _CancellationReasonViewState extends State<CancellationReasonView> {
  String? _selectedReason;
  final TextEditingController _additionalInfoController =
      TextEditingController();
  bool _policyAccepted = false;
  bool _triedSubmit = false;

  final List<String> _reasons = [
    'Want to place a new order with more difference',
    'Delivery time is too long',
    'Duplicate order',
    'Shipping cost is too high',
    'Change of Delivery Address',
    'Forgot to use voucher/voucher issue',
    "Don't want this order/item anymore",
  ];

  @override
  void dispose() {
    _additionalInfoController.dispose();
    super.dispose();
  }

  void _submit(AppColors colors) {
    setState(() => _triedSubmit = true);

    final additionalInfo = _additionalInfoController.text.trim();

    if (_selectedReason == null ||
        additionalInfo.isEmpty ||
        !_policyAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _selectedReason == null
                ? "Please select a reason for cancellation"
                : additionalInfo.isEmpty
                ? "Please provide additional information"
                : "Please accept the cancellation policy to proceed",
            style: context.textStyle.bodyMedium.withColor(colors.white),
          ),
          backgroundColor: colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      );
      return;
    }

    final note = additionalInfo;
    widget.onSubmit(_selectedReason!, note);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyle;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Information",
                  style: textStyles.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: colors.borderColor),
                    boxShadow: [
                      BoxShadow(
                        color: colors.black.withValues(alpha: 0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order #${widget.order.orderNumber}",
                            style: textStyles.orderNumber.copyWith(
                              color: colors.primary,
                            ),
                          ),
                          Text(
                            "৳${widget.order.orderSummary.grandTotal.toStringAsFixed(0)}",
                            style: textStyles.bodyLargeBold.copyWith(
                              color: colors.text,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "${widget.order.items.length} Items • Placed on ${widget.order.createdAt}",
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),
                Text(
                  "Request Cancellation",
                  style: textStyles.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(height: 12.h),
                ...widget.order.items.map(
                  (item) => _buildItemRow(item, colors, textStyles),
                ),

                SizedBox(height: 16.h),
                Text(
                  "Reason for cancellation",
                  style: textStyles.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(height: 8.h),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Select a Reason',
                      style: textStyles.bodyMedium.copyWith(
                        color: colors.graySmallLight,
                      ),
                    ),
                    items: _reasons.map((String item) {
                      final isSelected = _selectedReason == item;
                      final Map<String, IconData> reasonIcons = {
                        'Want to place a new order with more difference':
                            Icons.add_shopping_cart,
                        'Delivery time is too long': Icons.timer_outlined,
                        'Duplicate order': Icons.copy_rounded,
                        'Shipping cost is too high':
                            Icons.local_shipping_outlined,
                        'Change of Delivery Address':
                            Icons.location_on_outlined,
                        'Forgot to use voucher/voucher issue':
                            Icons.confirmation_number_outlined,
                        "Don't want this order/item anymore":
                            Icons.cancel_outlined,
                      };
                      final icon = reasonIcons[item] ?? Icons.info_outline;

                      return DropdownMenuItem<String>(
                        value: item,
                        child: Row(
                          children: [
                            Icon(
                              icon,
                              color: isSelected
                                  ? colors.primary
                                  : colors.textLight,
                              size: 20.r,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                item,
                                style: textStyles.bodyMedium.copyWith(
                                  color: isSelected
                                      ? colors.primary
                                      : colors.text,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle_rounded,
                                color: colors.primary,
                                size: 20.r,
                              ),
                          ],
                        ),
                      );
                    }).toList(),
                    value: _selectedReason,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedReason = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 54.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: (_triedSubmit && _selectedReason == null)
                              ? colors.red.withValues(alpha: 0.8)
                              : colors.borderColor,
                          width: (_triedSubmit && _selectedReason == null)
                              ? 1.5
                              : 1,
                        ),
                        color: colors.white,
                      ),
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: colors.primary,
                      ),
                      iconSize: 24.r,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 350.h,
                      width: 0.9.sw,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: colors.black.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      offset: const Offset(0, -4),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: Radius.circular(40.r),
                        thickness: WidgetStateProperty.all(6),
                        thumbVisibility: WidgetStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 52.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
                Text(
                  "Additional Information *",
                  style: textStyles.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: _additionalInfoController,
                  maxLines: 4,
                  maxLength: 250,
                  style: textStyles.bodyMedium.copyWith(color: colors.text),
                  decoration: InputDecoration(
                    hintText: "e.g. My phone has missing headphones",
                    hintStyle: textStyles.bodyMedium.copyWith(
                      color: colors.graySmallLight,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color:
                            (_triedSubmit &&
                                _additionalInfoController.text.trim().isEmpty)
                            ? colors.red.withValues(alpha: 0.8)
                            : colors.borderColor,
                        width:
                            (_triedSubmit &&
                                _additionalInfoController.text.trim().isEmpty)
                            ? 1.5
                            : 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color:
                            (_triedSubmit &&
                                _additionalInfoController.text.trim().isEmpty)
                            ? colors.red.withValues(alpha: 0.8)
                            : colors.borderColor,
                        width:
                            (_triedSubmit &&
                                _additionalInfoController.text.trim().isEmpty)
                            ? 1.5
                            : 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: colors.primary, width: 2),
                    ),
                    filled: true,
                    fillColor: colors.white,
                  ),
                  onChanged: (_) {
                    if (_triedSubmit) setState(() {});
                  },
                ),
                if (_triedSubmit &&
                    _additionalInfoController.text.trim().isEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      "Additional information is required",
                      style: textStyles.bodySmall.copyWith(
                        color: colors.red,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),

                SizedBox(height: 16.h),
                Text(
                  "Cancellation Policy",
                  style: textStyles.bodyMediumBold.copyWith(color: colors.text),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: colors.titanWhite.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: colors.pattensBlue),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Before cancelling the order, kindly read and accept the following terms & conditions:",
                        style: textStyles.bodySmallMedium.copyWith(
                          color: colors.text,
                          height: 1.4.h,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      _buildPolicyItem(
                        "1. Once you submit this form you agree to cancel the selected item in your order. We will be unable to retrieve your order once it is cancelled.",
                      ),
                      _buildPolicyItem(
                        "2. Once you confirm your item cancellation, we will process your refund within 24 hours and the amount will be reflected in your account as per the refund timeline only if the item has not been handed over to the delivery partner yet. Please note, if your item has already been handed over to the delivery partner we will be unable to proceed with your cancellation request and will inform you accordingly.",
                      ),
                      _buildPolicyItem(
                        "3. Only full order cancellations are allowed, meaning you won't be able to cancel specific items within an order.",
                      ),
                      _buildPolicyItem(
                        "4. Once your item has been successfully cancelled you will receive a notification from us with the summary of your refund. If your cancelled order was prepaid, you will be refunded as per the refund timelines.",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.r,
                      width: 24.r,
                      child: Checkbox(
                        value: _policyAccepted,
                        activeColor: colors.primary,
                        side: BorderSide(
                          color: (_triedSubmit && !_policyAccepted)
                              ? colors.red
                              : colors.graySmallLight,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        onChanged: (val) =>
                            setState(() => _policyAccepted = val!),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => _policyAccepted = !_policyAccepted),
                        child: Text(
                          "Please accept the cancellation policy.",
                          style: textStyles.bodyMedium.copyWith(
                            color: (_triedSubmit && !_policyAccepted)
                                ? colors.red
                                : colors.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_triedSubmit && !_policyAccepted)
                  Padding(
                    padding: EdgeInsets.only(left: 36.w, top: 4.h),
                    child: Text(
                      "You must accept the policy to continue",
                      style: textStyles.bodySmall.copyWith(
                        color: colors.red,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),

                SizedBox(height: 32.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: colors.white,
                    minimumSize: Size(double.maxFinite, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () => _submit(colors),
                  child: Text(
                    "Submit",
                    style: textStyles.buttonMedium.copyWith(
                      color: colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(
    OrderItemDetailEntity item,
    AppColors colors,
    AppTextStyles textStyles,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 50.r,
            height: 50.r,
            decoration: BoxDecoration(
              color: colors.backgroundGray,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: item.image != null
                ? AppImage(
                    imageUrl: item.image!,
                    placeholder: Center(
                      child: CircularProgressIndicator(
                        color: colors.primary,
                        strokeWidth: 2,
                      ),
                    ),
                    errorWidget: Icon(
                      Icons.image,
                      color: colors.graySmallLight,
                    ),
                  )
                : Icon(Icons.image, color: colors.graySmallLight),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyles.bodySmallMedium.copyWith(
                    color: colors.text,
                  ),
                ),
                Text(
                  "Qty: ${item.qty} • ৳${item.finalPrice.toStringAsFixed(0)}",
                  style: textStyles.bodySmall.copyWith(color: colors.textLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyItem(String text) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: context.textStyle.bodyLarge.withColor(colors.grayDark),
          ),
          Expanded(
            child: Text(
              text,
              style: context.textStyle.bodyMedium.withColor(colors.gray),
            ),
          ),
        ],
      ),
    );
  }
}
