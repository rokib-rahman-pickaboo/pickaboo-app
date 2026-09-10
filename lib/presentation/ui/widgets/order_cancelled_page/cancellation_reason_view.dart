// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

/// Modernized CancellationReasonView matching Pickaboo-App-UI design language.
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
  final TextEditingController _additionalInfoController = TextEditingController();
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

  void _submit() {
    setState(() => _triedSubmit = true);

    final additionalInfo = _additionalInfoController.text.trim();

    if (_selectedReason == null ||
        additionalInfo.isEmpty ||
        !_policyAccepted) {
      final message = _selectedReason == null
          ? "Please select a reason for cancellation"
          : additionalInfo.isEmpty
              ? "Please provide additional information"
              : "Please accept the cancellation policy to proceed";
      SnackBarUtils.showWarning(context, message);
      return;
    }

    widget.onSubmit(_selectedReason!, additionalInfo);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sameGroupItemSpacing.w,
        vertical: AppSpacing.groupToGroupSpacing.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 1. ORDER INFORMATION CARD ──
          Text(
            "Order Information",
            style: AppTypography.sectionTitle,
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.cardRadius,
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.navy.withValues(alpha: 0.03),
                  blurRadius: 8.r,
                  offset: Offset(0, 2.h),
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
                      style: AppTypography.brandActionText,
                    ),
                    Text(
                      "৳${widget.order.orderSummary.grandTotal.toStringAsFixed(0)}",
                      style: AppTypography.priceLarge,
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  "${widget.order.items.length} Items • Placed on ${widget.order.createdAt}",
                  style: AppTypography.bodyMutedLight,
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.groupToGroupSpacing.h),

          // ── 2. ITEMS LIST ──
          ...widget.order.items.map((item) => _buildItemRow(item)),

          SizedBox(height: 8.h),

          // ── 3. REASON SELECTION ──
          Text(
            "Reason for Cancellation *",
            style: AppTypography.sectionTitle,
          ),
          SizedBox(height: 8.h),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select a Reason',
                style: AppTypography.inputHint,
              ),
              items: _reasons.map((String item) {
                final isSelected = _selectedReason == item;
                final Map<String, IconData> reasonIcons = {
                  'Want to place a new order with more difference': Icons.add_shopping_cart_rounded,
                  'Delivery time is too long': Icons.timer_outlined,
                  'Duplicate order': Icons.copy_rounded,
                  'Shipping cost is too high': Icons.local_shipping_outlined,
                  'Change of Delivery Address': Icons.location_on_outlined,
                  'Forgot to use voucher/voucher issue': Icons.confirmation_number_outlined,
                  "Don't want this order/item anymore": Icons.cancel_outlined,
                };
                final icon = reasonIcons[item] ?? Icons.info_outline_rounded;

                return DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: isSelected ? AppColors.pickabooBlue : AppColors.mutedLight,
                        size: 18.sp,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          item,
                          style: isSelected ? AppTypography.brandActionText : AppTypography.bodyRegular,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.pickabooBlue,
                          size: 18.sp,
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
                height: 48.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.cardRadius,
                  border: Border.all(
                    color: (_triedSubmit && _selectedReason == null)
                        ? AppColors.red
                        : AppColors.border,
                    width: (_triedSubmit && _selectedReason == null) ? 1.5 : 1,
                  ),
                  color: AppColors.white,
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.navy,
                  size: 22.sp,
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 340.h,
                width: 0.92.sw,
                padding: EdgeInsets.symmetric(vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.cardRadius,
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.navy.withValues(alpha: 0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                offset: const Offset(0, -4),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 46.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w),
              ),
            ),
          ),

          SizedBox(height: AppSpacing.groupToGroupSpacing.h),

          // ── 4. ADDITIONAL INFORMATION ──
          Text(
            "Additional Information *",
            style: AppTypography.sectionTitle,
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: _additionalInfoController,
            maxLines: 3,
            maxLength: 250,
            style: AppTypography.inputText,
            decoration: InputDecoration(
              hintText: "e.g. Need to change item color or delivery time",
              hintStyle: AppTypography.inputHint,
              border: OutlineInputBorder(
                borderRadius: AppRadius.cardRadius,
                borderSide: BorderSide(
                  color: (_triedSubmit && _additionalInfoController.text.trim().isEmpty)
                      ? AppColors.red
                      : AppColors.border,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppRadius.cardRadius,
                borderSide: BorderSide(
                  color: (_triedSubmit && _additionalInfoController.text.trim().isEmpty)
                      ? AppColors.red
                      : AppColors.border,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: AppRadius.cardRadius,
                borderSide: BorderSide(color: AppColors.pickabooBlue, width: 1.5),
              ),
              filled: true,
              fillColor: AppColors.white,
            ),
            onChanged: (_) {
              if (_triedSubmit) setState(() {});
            },
          ),

          // ── 5. CANCELLATION POLICY ──
          Text(
            "Cancellation Policy",
            style: AppTypography.sectionTitle,
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceBlue,
              borderRadius: AppRadius.cardRadius,
              border: Border.all(
                color: AppColors.pickabooBlue.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Before cancelling the order, kindly read and accept the following terms & conditions:",
                  style: AppTypography.bodyRegular.bold(),
                ),
                SizedBox(height: 10.h),
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

          SizedBox(height: 12.h),

          // ── 6. POLICY ACCEPTANCE CHECKBOX ──
          InkWell(
            onTap: () => setState(() => _policyAccepted = !_policyAccepted),
            borderRadius: AppRadius.cardRadius,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    _policyAccepted
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    size: 20.sp,
                    color: _policyAccepted
                        ? AppColors.pickabooBlue
                        : (_triedSubmit ? AppColors.red : AppColors.mutedLight),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "Please accept the cancellation policy.",
                      style: (_triedSubmit && !_policyAccepted) ? AppTypography.bodyMuted.withColor(AppColors.red) : AppTypography.bodyMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (_triedSubmit && !_policyAccepted)
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 4.h),
              child: Text(
                "You must accept the policy to continue",
                style: AppTypography.inputError,
              ),
            ),

          SizedBox(height: 24.h),

          // ── 7. SUBMIT BUTTON ──
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pickabooBlue,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadius.cardRadius,
                ),
              ),
              onPressed: _submit,
              child: Text(
                "Submit",
                style: AppTypography.buttonPrimary,
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildItemRow(OrderItemDetailEntity item) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 1.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: AppColors.pageBg,
              borderRadius: AppRadius.cardRadius,
              border: Border.all(color: AppColors.border),
            ),
            child: ClipRRect(
              borderRadius: AppRadius.cardRadius,
              child: item.image != null
                  ? AppImage(
                      imageUrl: item.image!,
                      placeholder: const AppLoader.inline(),
                      errorWidget: const Icon(
                        Icons.image_outlined,
                        color: AppColors.mutedLight,
                      ),
                    )
                  : const Icon(Icons.image_outlined, color: AppColors.mutedLight),
            ),
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
                  style: AppTypography.cardTitle,
                ),
                SizedBox(height: 3.h),
                Text(
                  "Qty: ${item.qty} • ৳${item.finalPrice.toStringAsFixed(0)}",
                  style: AppTypography.bodyMutedLight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: AppTypography.brandActionText,
          ),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyMuted.withColor(AppColors.navy.withValues(alpha: 0.85)),
            ),
          ),
        ],
      ),
    );
  }
}
