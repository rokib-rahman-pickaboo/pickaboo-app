// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/emi/emi_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';

/// Modern interactive EmiBottomSheet matching Pickaboo Web & App UI design language.
class EmiBottomSheet extends StatefulWidget {
  final List<EmiEntity> emiOptions;
  final String productPrice;

  const EmiBottomSheet({
    super.key,
    required this.emiOptions,
    required this.productPrice,
  });

  @override
  State<EmiBottomSheet> createState() => _EmiBottomSheetState();
}

class _EmiBottomSheetState extends State<EmiBottomSheet> {
  int _selectedBankIndex = 0;
  int _selectedTenureIndex = 0;
  bool _isBankDropdownOpen = false;

  static final RegExp _thousandsSeparator = RegExp(
    r'(\d{1,3})(?=(\d{3})+(?!\d))',
  );

  String _formatCurrency(String value) {
    if (value.trim().isEmpty) return '৳0';
    final clean = value.replaceAll('৳', '').replaceAll(',', '').trim();
    final numVal = double.tryParse(clean);
    if (numVal == null) return value.startsWith('৳') ? value : '৳$value';
    final isWhole = numVal % 1 == 0;
    final formatted = isWhole
        ? numVal.toInt().toString().replaceAllMapped(_thousandsSeparator, (Match m) => '${m[1]},')
        : numVal.toStringAsFixed(2).replaceAllMapped(_thousandsSeparator, (Match m) => '${m[1]},');
    return '৳$formatted';
  }

  void _openTerms() {
    context.push(Routes.terms);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 0.85.sh),
      child: Material(
        color: AppColors.white,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Blue Header Bar ──
              _buildHeader(context),

              // ── Modal Body Content ──
              if (widget.emiOptions.isEmpty)
                _buildEmptyState(context)
              else
                _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.pickabooBlue,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.credit_card_outlined,
            color: AppColors.white,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            'EMI Plans',
            style: AppTypography.titleMedium.bold().white,
          ),
          const Spacer(),
          GestureDetector(
            onTap: _openTerms,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'T&C',
                  style: AppTypography.bodySmall.bold().white,
                ),
                SizedBox(width: 3.w),
                Icon(
                  Icons.open_in_new_rounded,
                  color: AppColors.white,
                  size: 14.sp,
                ),
              ],
            ),
          ),
          SizedBox(width: 14.w),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.close_rounded,
              color: AppColors.white,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.credit_card_off_outlined,
              size: 48.sp,
              color: AppColors.muted,
            ),
            SizedBox(height: 12.h),
            Text(
              'No EMI plans available for this product',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.withColor(AppColors.muted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final validBankIndex = _selectedBankIndex.clamp(0, widget.emiOptions.length - 1);
    final selectedBank = widget.emiOptions[validBankIndex];
    final tenureList = selectedBank.tenureOptions;
    final validTenureIndex = _selectedTenureIndex.clamp(0, tenureList.isEmpty ? 0 : tenureList.length - 1);
    final currentTenure = tenureList.isNotEmpty ? tenureList[validTenureIndex] : null;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ── Main Content (Base Layer, dictates natural sheet height) ──
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Section 1: Select Bank ──
              Text(
                'Select Bank',
                style: AppTypography.titleSmall.bold().withColor(AppColors.navy),
              ),
              SizedBox(height: 8.h),
              _buildBankSelector(selectedBank),

              SizedBox(height: 18.h),

              // ── Section 2: Select Tenure ──
              if (tenureList.isNotEmpty) ...[
                Text(
                  'Select Tenure',
                  style: AppTypography.titleSmall.bold().withColor(AppColors.navy),
                ),
                SizedBox(height: 10.h),
                _buildTenureChips(tenureList, validTenureIndex),
                SizedBox(height: 18.h),
              ],

              // ── Section 3: Calculation Card ──
              if (currentTenure != null) ...[
                _buildCalculationCard(selectedBank, currentTenure),
                SizedBox(height: 14.h),
              ],

              // ── Section 4: Indicative Disclaimer Footer ──
              _buildFooterDisclaimer(),
            ],
          ),
        ),

        // ── Overlapping Floating Dropdown List (Overlay Layer) ──
        if (_isBankDropdownOpen) ...[
          // Backdrop: tap outside dropdown to dismiss
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _isBankDropdownOpen = false;
                });
              },
            ),
          ),
          // Floating dropdown container positioned directly below the bank selector
          Positioned(
            top: 96.h,
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: _buildBankDropdownList(),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBankSelector(EmiEntity selectedBank) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isBankDropdownOpen = !_isBankDropdownOpen;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: _isBankDropdownOpen ? AppColors.pickabooBlue : AppColors.border,
            width: 1.2.w,
          ),
        ),
        child: Row(
          children: [
            _buildBankLogo(selectedBank.bankIcon),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedBank.bankName,
                    style: AppTypography.titleSmall.bold().withColor(AppColors.navy),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${selectedBank.tenureOptions.length} tenure options available',
                    style: AppTypography.bodyTiny.withColor(AppColors.muted),
                  ),
                ],
              ),
            ),
            Icon(
              _isBankDropdownOpen
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: AppColors.navy,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankDropdownList() {
    return Container(
      constraints: BoxConstraints(maxHeight: 280.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 4.h),
          itemCount: widget.emiOptions.length,
          separatorBuilder: (_, __) => Divider(height: 1.h, color: AppColors.border),
          itemBuilder: (context, index) {
            final bank = widget.emiOptions[index];
            final isSelected = index == _selectedBankIndex;

            return InkWell(
              onTap: () {
                setState(() {
                  _selectedBankIndex = index;
                  _selectedTenureIndex = 0;
                  _isBankDropdownOpen = false;
                });
              },
              child: Container(
                color: isSelected ? AppColors.surfaceBlue : AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Row(
                  children: [
                    _buildBankLogo(bank.bankIcon),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            bank.bankName,
                            style: AppTypography.titleSmall
                                .bold()
                                .withColor(isSelected ? AppColors.pickabooBlue : AppColors.navy),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            '${bank.tenureOptions.length} tenure plans available',
                            style: AppTypography.bodyTiny.withColor(AppColors.muted),
                          ),
                        ],
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
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBankLogo(String iconUrl) {
    if (iconUrl.isNotEmpty) {
      return AppImage(
        imageUrl: iconUrl,
        width: 30.w,
        height: 30.w,
        fit: BoxFit.contain,
        errorWidget: Icon(
          Icons.account_balance_outlined,
          size: 26.w,
          color: AppColors.pickabooBlue,
        ),
      );
    }
    return Icon(
      Icons.account_balance_outlined,
      size: 26.w,
      color: AppColors.pickabooBlue,
    );
  }

  Widget _buildTenureChips(List<EmiTenureEntity> tenureList, int activeIndex) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(tenureList.length, (index) {
        final tenure = tenureList[index];
        final isSelected = index == activeIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTenureIndex = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.surfaceBlue : AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? AppColors.pickabooBlue : AppColors.border,
                width: isSelected ? 1.5.w : 1.w,
              ),
            ),
            child: Text(
              '${tenure.tenure} Months',
              style: isSelected
                  ? AppTypography.bodyMedium.bold().withColor(AppColors.pickabooBlue)
                  : AppTypography.bodyMedium.withColor(AppColors.navy),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCalculationCard(EmiEntity bank, EmiTenureEntity tenure) {
    final feeText = tenure.convenienceFee.contains('%')
        ? tenure.convenienceFee
        : '${tenure.convenienceFee}%';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Monthly Rate
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: _formatCurrency(tenure.monthlyPayable),
                  style: AppTypography.priceLarge.withColor(AppColors.navy),
                ),
                TextSpan(
                  text: ' /mo',
                  style: AppTypography.bodySmall.withColor(AppColors.muted),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          // Plan Subtitle
          Text(
            '${bank.bankName} · ${tenure.tenure} months tenure',
            style: AppTypography.bodySmall.bold().withColor(AppColors.navy),
          ),
          SizedBox(height: 4.h),
          // Convenience Fee
          Text(
            'Convenience Fee: $feeText (${_formatCurrency(tenure.conveniencePrice)})',
            style: AppTypography.bodyTiny.withColor(AppColors.muted),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(height: 1.h, thickness: 0.8.h, color: AppColors.border),
          ),
          // Total Payable Amount
          Text(
            'Total Payable Amount: ${_formatCurrency(tenure.total)}',
            style: AppTypography.titleSmall.bold().withColor(AppColors.navy),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterDisclaimer() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                'EMI figures are indicative. Final tenure & fees confirmed by your bank at checkout. ',
            style: AppTypography.bodyTiny.withColor(AppColors.muted),
          ),
          TextSpan(
            text: 'Read EMI T&C',
            style: AppTypography.bodyTiny.bold().withColor(AppColors.pickabooBlue),
            recognizer: TapGestureRecognizer()..onTap = _openTerms,
          ),
        ],
      ),
    );
  }
}
