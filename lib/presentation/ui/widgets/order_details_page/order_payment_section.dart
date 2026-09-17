// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/order/order_detail_entity.dart';
import 'package:pickaboo/presentation/ui/widgets/order_details_page/order_info_section.dart';

/// Modern OrderPaymentSection matching Pickaboo-App-UI design language.
class OrderPaymentSection extends StatelessWidget {
  final String paymentMethod;
  final String Function(String) formatPaymentMethod;
  final List<PaymentInfoEntity> paymentInformation;

  const OrderPaymentSection({
    super.key,
    required this.paymentMethod,
    required this.formatPaymentMethod,
    this.paymentInformation = const [],
  });

  @override
  Widget build(BuildContext context) {
    final displayItems = _extractCustomerFacingItems();

    return OrderInfoSection(
      title: 'Payment Information',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.payment_outlined,
                size: 18.sp,
                color: AppColors.pickabooBlue,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  formatPaymentMethod(paymentMethod),
                  style: AppTypography.titleSmall,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            'The order was placed using BDT.',
            style: AppTypography.bodySmall,
          ),
          if (displayItems.isNotEmpty) ...[
            const Divider(height: 20, color: AppColors.border),
            ...displayItems.map(
              (item) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: AppTypography.bodySmall.navy,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        item.value,
                        textAlign: TextAlign.end,
                        style: AppTypography.bodyMedium.blue.semiBold(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<_PaymentDisplayRow> _extractCustomerFacingItems() {
    final rows = <_PaymentDisplayRow>[];

    // 1. Payment Mode (e.g. Card on delivery, Pay online)
    final paymentModeItem = _findItem(
      (k, t) => k == 'payment_mode' || t == 'payment mode',
    );
    if (paymentModeItem != null && paymentModeItem.value.trim().isNotEmpty) {
      rows.add(_PaymentDisplayRow(
        title: 'Payment Mode',
        value: _formatValue(paymentModeItem.value),
        order: 1,
      ));
    }

    // 2. EMI Tenure (e.g. 12)
    final tenureItem = _findItem(
      (k, t) =>
          k == 'emi_tenure' ||
          k == 'emi_tenure_months' ||
          k == 'tenure' ||
          t == 'emi tenure' ||
          t == 'emi tenure months' ||
          t == 'tenure',
    );
    if (tenureItem != null && tenureItem.value.trim().isNotEmpty) {
      rows.add(_PaymentDisplayRow(
        title: 'EMI Tenure',
        value: _formatValue(tenureItem.value),
        order: 2,
      ));
    }

    // 3. EMI Bank (e.g. United Commercial Bank)
    final bankItem = _findItem(
      (k, t) =>
          k == 'emi_bank' ||
          k == 'bank_name' ||
          k == 'bank' ||
          t == 'emi bank' ||
          t == 'bank name' ||
          t == 'bank',
    );
    if (bankItem != null && bankItem.value.trim().isNotEmpty) {
      rows.add(_PaymentDisplayRow(
        title: 'EMI Bank',
        value: _formatValue(bankItem.value),
        order: 3,
      ));
    }

    // 4. Transaction ID (if present in online payments)
    final trxItem = _findItem(
      (k, t) =>
          k == 'transaction_id' ||
          k == 'trx_id' ||
          t == 'transaction id' ||
          t == 'trx id',
    );
    if (trxItem != null && trxItem.value.trim().isNotEmpty) {
      rows.add(_PaymentDisplayRow(
        title: 'Transaction ID',
        value: _formatValue(trxItem.value),
        order: 4,
      ));
    }

    // 5. Card Number / Masked Card (if present in online payments)
    final cardItem = _findItem(
      (k, t) =>
          k == 'card_number' ||
          k == 'masked_card' ||
          k == 'last4' ||
          t == 'card number' ||
          t == 'masked card',
    );
    if (cardItem != null && cardItem.value.trim().isNotEmpty) {
      rows.add(_PaymentDisplayRow(
        title: 'Card Number',
        value: _formatValue(cardItem.value),
        order: 5,
      ));
    }

    rows.sort((a, b) => a.order.compareTo(b.order));
    return rows;
  }

  PaymentInfoEntity? _findItem(bool Function(String code, String title) test) {
    for (final info in paymentInformation) {
      final code = info.code.toLowerCase().trim();
      final title = info.title.toLowerCase().trim();
      if (test(code, title)) {
        return info;
      }
    }
    return null;
  }

  String _formatValue(String value) {
    final trimmed = value.trim();
    if (trimmed.toLowerCase() == 'card on delivery') {
      return 'Card on delivery';
    }
    return trimmed;
  }
}

class _PaymentDisplayRow {
  final String title;
  final String value;
  final int order;

  const _PaymentDisplayRow({
    required this.title,
    required this.value,
    required this.order,
  });
}


