// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/emi/emi_entity.dart';

/// Modern EmiBottomSheet matching Pickaboo-App-UI design language.
class EmiBottomSheet extends StatelessWidget {
  final List<EmiEntity> emiOptions;
  final String productPrice;

  const EmiBottomSheet({
    super.key,
    required this.emiOptions,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EMI Details',
                  style: AppTypography.pageTitle,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.navy,
                      size: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),

          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 0.7.sh),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16.h,
              ),
              itemCount: emiOptions.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, color: AppColors.border),
              itemBuilder: (context, index) {
                return _buildBankItem(context, emiOptions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankItem(BuildContext context, EmiEntity emi) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        title: Row(
          children: [
            if (emi.bankIcon.isNotEmpty)
              CachedNetworkImage(
                imageUrl: emi.bankIcon,
                width: 24.w,
                height: 24.w,
                fit: BoxFit.contain,
                errorWidget: (_, _, _) => Icon(
                  Icons.account_balance_outlined,
                  size: 24.w,
                  color: AppColors.pickabooBlue,
                ),
              )
            else
              Icon(
                Icons.account_balance_outlined,
                size: 24.w,
                color: AppColors.pickabooBlue,
              ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                emi.bankName,
                style: AppTypography.sectionTitle,
              ),
            ),
          ],
        ),
        iconColor: AppColors.pickabooBlue,
        collapsedIconColor: AppColors.mutedLight,
        children: emi.tenureOptions.map((option) {
          return _buildTenureItem(context, option);
        }).toList(),
      ),
    );
  }

  Widget _buildTenureItem(BuildContext context, EmiTenureEntity option) {
    return CustomExpansionTile(
      title: Text(
        '${option.tenure} EMIs | Convenience Fee (${option.convenienceFee}%) ${option.monthlyPayable}/m',
        style: AppTypography.bodyRegular,
      ),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 14.h),
          child: Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceBlue,
              borderRadius: AppRadius.cardRadius,
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                _buildDetailRow("Price", option.price),
                SizedBox(height: 6.h),
                _buildDetailRow("Convenience Fee", option.conveniencePrice),
                SizedBox(height: 6.h),
                const Divider(height: 12, color: AppColors.border),
                _buildDetailRow(
                  "Total Amount Payable",
                  option.total,
                  isBold: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyMuted,
        ),
        Text(
          value,
          style: AppTypography.brandActionText,
        ),
      ],
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: widget.title),
                SizedBox(width: 8.w),
                Icon(
                  _isExpanded ? Icons.remove_circle_outline : Icons.add_circle_outline,
                  color: AppColors.pickabooBlue,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded) ...widget.children,
      ],
    );
  }
}
