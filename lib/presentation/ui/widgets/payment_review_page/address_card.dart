import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';

class AddressCard extends StatelessWidget {
  final AddressEntity? address;
  final VoidCallback onChange;
  final VoidCallback onAddNew;

  const AddressCard({
    super.key,
    this.address,
    required this.onChange,
    required this.onAddNew,
  });

  bool get _hasValidAddress {
    if (address == null) return false;
    final name = '${address!.firstname ?? ''} ${address!.lastname ?? ''}'.trim();
    final street = address!.street.where((s) => s.isNotEmpty).join(', ');
    return name.isNotEmpty || street.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (!_hasValidAddress) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: const Color(0xFFFFB74D)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_off_outlined,
                  color: const Color(0xFFE65100),
                  size: 24.sp,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    'Please add a shipping address to continue with your order.',
                    style: context.textStyle.bodyMedium.copyWith(
                      color: const Color(0xFFE65100),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onAddNew,
              icon: const Icon(Icons.add_location_alt_outlined, size: 18),
              label: Text(
                "Add new address",
                style: context.textStyle.buttonSmall.withColor(colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.black,
                foregroundColor: colors.white,
                minimumSize: Size(double.infinity, 44.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
          ),
        ],
      );
    }

    final name = '${address!.firstname ?? ''} ${address!.lastname ?? ''}'.trim();
    final street = address!.street.where((s) => s.isNotEmpty).join(', ');
    final city = address!.city ?? '';
    final fullAddress = [street, city].where((s) => s.isNotEmpty).join(', ');
    final phone = address!.telephone ?? '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              style: context.textStyle.bodyMedium.copyWith(
                color: colors.text,
                height: 1.5.h,
              ),
              children: [
                const TextSpan(text: "Deliver to: "),
                TextSpan(
                  text: name,
                  style: context.textStyle.bodyMediumBold,
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
        ],
        if (fullAddress.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              style: context.textStyle.bodyMedium.copyWith(
                color: colors.text,
                height: 1.5.h,
              ),
              children: [
                const TextSpan(text: "Address: "),
                TextSpan(
                  text: fullAddress,
                  style: context.textStyle.bodyMediumBold,
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
        ],
        if (phone.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              style: context.textStyle.bodyMedium.copyWith(
                color: colors.text,
                height: 1.5.h,
              ),
              children: [
                const TextSpan(text: "Phone Number: "),
                TextSpan(
                  text: phone,
                  style: context.textStyle.bodyMediumBold,
                ),
              ],
            ),
          ),
        ],
        SizedBox(height: 16.h),

        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onChange,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.button,
                  foregroundColor: colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                child: Text(
                  "Change Address",
                  style: context.textStyle.buttonSmall.withColor(colors.white),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                onPressed: onAddNew,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.black,
                  foregroundColor: colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
                child: Text(
                  "Add new address",
                  style: context.textStyle.buttonSmall.withColor(colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
