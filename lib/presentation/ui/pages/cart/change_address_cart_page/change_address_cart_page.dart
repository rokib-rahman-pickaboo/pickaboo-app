import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/cart/cart_entity.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/change_address_cart_page/address_item.dart';
import 'package:pickaboo/presentation/ui/pages/cart/address_added_result.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';

class ChangeAddressCartPage extends StatelessWidget {
  final List<AddressEntity> addresses;
  final AddressEntity? selectedAddress;
  final String pageTitle;

  const ChangeAddressCartPage({
    super.key,
    required this.addresses,
    this.selectedAddress,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: PickabooAppBar(
        title: pageTitle,
      ),
      body: addresses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_off_outlined,
                    size: 64.sp,
                    color: AppColors.mutedLight,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "No addresses found",
                    style: AppTypography.bodyLarge.copyWith(color: AppColors.text),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Add a new address to continue",
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.muted),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.sameGroupItemSpacing.w,
                0,
                AppSpacing.sameGroupItemSpacing.w,
                AppSpacing.groupToGroupSpacing.h,
              ),
              itemCount: addresses.length,
              separatorBuilder: (_, _) => SizedBox(
                height: AppSpacing.groupToGroupSpacing.h,
              ),
              itemBuilder: (context, index) {
                final address = addresses[index];

                bool isMatching(AddressEntity a, AddressEntity? b) {
                  if (b == null) return false;
                  if (a.id == b.id) return true;

                  final streetA = a.street
                      .join('')
                      .replaceAll(' ', '')
                      .toLowerCase();
                  final streetB = b.street
                      .join('')
                      .replaceAll(' ', '')
                      .toLowerCase();

                  return streetA == streetB &&
                      (a.city?.toLowerCase() == b.city?.toLowerCase()) &&
                      (a.postcode == b.postcode) &&
                      (a.telephone == b.telephone) &&
                      (a.firstname?.toLowerCase() ==
                          b.firstname?.toLowerCase()) &&
                      (a.lastname?.toLowerCase() == b.lastname?.toLowerCase());
                }

                final matchFound = addresses.any(
                  (a) => isMatching(a, selectedAddress),
                );

                final isSelected =
                    isMatching(address, selectedAddress) ||
                    (!matchFound && address.defaultShipping);

                return AddressItem(
                  address: address,
                  isSelected: isSelected,
                  onTap: () {
                    context.pop(address);
                  },
                );
              },
            ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              offset: const Offset(0, -4),
              blurRadius: 16.r,
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: AppButton.primary(
            text: "Add New Address",
            icon: Icon(Icons.add, color: AppColors.white, size: 20.sp),
            isFullWidth: true,
            height: 54.h,
            borderRadius: BorderRadius.circular(12.r),
            onPressed: () async {
              final added = await context.push<Object?>(
                Routes.newAddressCart,
                extra: pageTitle,
              );
              if (added is AddressAddedResult && context.mounted) {
                context.pop(added);
              }
            },
          ),
        ),
      ),
    );
  }
}
