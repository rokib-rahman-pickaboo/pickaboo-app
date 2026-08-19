import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/emi/emi_entity.dart';

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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Material(
      color: colors.white,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
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
                  'EMI Details',
                  style: textStyle.bodyMediumBold.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.text,
                    fontSize: 16.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
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
          Divider(height: 1.w, color: colors.borderColor),

          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 0.7.sh),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 16.h,
              ),
              itemCount: emiOptions.length,
              separatorBuilder: (context, index) =>
                  Divider(height: 1.w, color: colors.borderColor),
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
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: context.colors.black.withValues(alpha: 0.0)),
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
                  Icons.account_balance,
                  size: 24.w,
                  color: colors.textMedium,
                ),
              )
            else
              Icon(Icons.account_balance, size: 24.w, color: colors.textMedium),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                emi.bankName,
                style: textStyle.bodyMediumBold.copyWith(color: colors.text),
              ),
            ),
          ],
        ),
        iconColor: colors.textMedium,
        collapsedIconColor: colors.textMedium,
        children: emi.tenureOptions.map((option) {
          return _buildTenureItem(context, option);
        }).toList(),
      ),
    );
  }

  Widget _buildTenureItem(BuildContext context, EmiTenureEntity option) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return CustomExpansionTile(
      title: Text(
        '${option.tenure} EMIs | Convenience Fee (${option.convenienceFee}%) ${option.monthlyPayable}/m',
        style: textStyle.bodySmall.copyWith(
          color: colors.text,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
          child: Column(
            children: [
              _buildDetailRow(context, "Price", option.price),
              SizedBox(height: 8.h),
              _buildDetailRow(
                context,
                "Convenience Fee",
                option.conveniencePrice,
              ),
              SizedBox(height: 8.h),
              _buildDetailRow(
                context,
                "Total Amount Payable",
                option.total,
                isBold: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
  }) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textStyle.bodySmall.copyWith(
            color: colors.text,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: textStyle.bodySmall.copyWith(
            color: colors.text,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: widget.title),
                SizedBox(width: 8.w),
                Icon(
                  _isExpanded ? Icons.remove : Icons.add,
                  color: context.colors.orange,
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
