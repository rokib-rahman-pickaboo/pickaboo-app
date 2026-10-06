// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/common/address_entity.dart';
import 'package:pickaboo/domain/entity/common/region_entity.dart';
import 'package:pickaboo/presentation/bloc/checkout_bloc/checkout_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/address_page/address_list_skeleton.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserProfileBloc>().refreshProfile();
    context.read<CheckoutBloc>().add(const CheckoutEvent.loadCheckout());
  }

  Future<void> _onRefresh() async {
    context.read<UserProfileBloc>().refreshProfile();
    context.read<CheckoutBloc>().add(const CheckoutEvent.loadCheckout());
  }

  List<AddressEntity> _resolveAllAddresses({
    required UserProfileState profileState,
    required CheckoutState checkoutState,
  }) {
    final List<AddressEntity> result = [];
    final Set<int> seenIds = {};

    final profileAddresses = profileState.maybeWhen(
      loaded: (user, _, __) => user.addresses,
      basicInfoUpdateSuccess: (_, user, __, ___) => user.addresses,
      mobileUpdateSuccess: (_, user, __, ___) => user.addresses,
      imageUploadSuccess: (_, user, __, ___) => user.addresses,
      updating: (currentUser, _, __) => currentUser.addresses,
      orElse: () => null,
    );

    if (profileAddresses != null) {
      for (final a in profileAddresses) {
        if (a.id != 0) {
          seenIds.add(a.id);
        }
        result.add(a);
      }
    }

    final checkout = checkoutState.maybeWhen(
      checkoutLoaded: (checkout, _, _, _, _, _, _) => checkout,
      loading: (lastCheckout) => lastCheckout,
      orElse: () => null,
    );

    for (final a in checkout?.cart.customer?.addresses ?? const []) {
      if (a.id != null && !seenIds.contains(a.id)) {
        seenIds.add(a.id!);
        result.add(
          AddressEntity(
            id: a.id ?? 0,
            customerId: a.customerId ?? 0,
            region: RegionEntity(
              regionCode: a.region?.regionCode ?? a.regionCode ?? '',
              region: a.region?.region ?? '',
              regionId: a.region?.regionId ?? a.regionId ?? 0,
            ),
            regionId: a.regionId ?? a.region?.regionId ?? 0,
            countryId: a.countryId ?? 'BD',
            street: a.street,
            telephone: a.telephone ?? '',
            postcode: a.postcode ?? '',
            city: a.city ?? '',
            firstname: a.firstname ?? '',
            lastname: a.lastname ?? '',
            defaultShipping: a.defaultShipping,
            defaultBilling: a.defaultBilling,
          ),
        );
      } else if (a.id == null) {
        final matchesAny = result.any(
          (r) =>
              r.telephone == (a.telephone ?? '') &&
              r.city.toLowerCase() == (a.city ?? '').toLowerCase() &&
              r.street.join('') == a.street.join(''),
        );
        if (!matchesAny) {
          result.add(
            AddressEntity(
              id: 0,
              customerId: a.customerId ?? 0,
              region: RegionEntity(
                regionCode: a.region?.regionCode ?? a.regionCode ?? '',
                region: a.region?.region ?? '',
                regionId: a.region?.regionId ?? a.regionId ?? 0,
              ),
              regionId: a.regionId ?? a.region?.regionId ?? 0,
              countryId: a.countryId ?? 'BD',
              street: a.street,
              telephone: a.telephone ?? '',
              postcode: a.postcode ?? '',
              city: a.city ?? '',
              firstname: a.firstname ?? '',
              lastname: a.lastname ?? '',
              defaultShipping: a.defaultShipping,
              defaultBilling: a.defaultBilling,
            ),
          );
        }
      }
    }

    return result;
  }

  void _removeAddress(AddressEntity address) {
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.k16,
        ),
        title: Text(
          AppStrings.removeAddress,
          style: AppTypography.titleLarge,
        ),
        content: Text(
          AppStrings.removeAddressConfirm,
          style: AppTypography.bodySmall,
        ),
        actions: [
          AppButton.ghost(
            text: AppStrings.cancel,
            textColor: AppColors.muted,
            isFullWidth: false,
            size: AppButtonSize.sm,
            onPressed: () => context.pop(false),
          ),
          AppButton.danger(
            text: AppStrings.remove,
            isFullWidth: false,
            size: AppButtonSize.sm,
            borderRadius: AppRadius.k8,
            onPressed: () => context.pop(true),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true && mounted) {
        context.read<UserProfileBloc>().add(
          UserProfileEvent.deleteAddress(addressId: address.id),
        );
      }
    });
  }

  Future<void> _navigateToAddAddress() async {
    await context.push(Routes.newAddress);
    if (mounted) {
      context.read<UserProfileBloc>().refreshProfile();
      context.read<CheckoutBloc>().add(const CheckoutEvent.loadCheckout());
    }
  }

  Future<void> _navigateToEditAddress(AddressEntity address) async {
    await context.push(Routes.newAddress, extra: {'address': address});
    if (mounted) {
      context.read<UserProfileBloc>().refreshProfile();
      context.read<CheckoutBloc>().add(const CheckoutEvent.loadCheckout());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        state.whenOrNull(
          basicInfoUpdateSuccess: (message, _, _, _) {
            SnackBarUtils.showSuccess(context, message);
            context.read<CheckoutBloc>().add(
              const CheckoutEvent.loadCheckout(),
            );
          },
          error: (message) {
            SnackBarUtils.showError(context, message);
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const PickabooAppBar(
          title: 'Address Book',
        ),
        bottomNavigationBar: Container(
          color: AppColors.white,
          padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          child: SafeArea(
            top: false,
            child: AppButton.primary(
              text: AppStrings.addNewAddress,
              icon: Icon(
                Icons.add_location_alt_outlined,
                color: AppColors.white,
                size: 18.sp,
              ),
              isFullWidth: true,
              height: 48.h,
              borderRadius: AppRadius.k8,
              onPressed: _navigateToAddAddress,
            ),
          ),
        ),
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, profileState) {
            final checkoutState = context.watch<CheckoutBloc>().state;
            final addressList = _resolveAllAddresses(
              profileState: profileState,
              checkoutState: checkoutState,
            );

            final isLoading = profileState.maybeWhen(
              loading: (_, _, _) => true,
              orElse: () => false,
            );

            if (isLoading && addressList.isEmpty) {
              return const AddressListSkeleton();
            }

            if (addressList.isEmpty) {
              return RefreshIndicator(
                onRefresh: _onRefresh,
                color: AppColors.pickabooBlue,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: SizedBox(
                        height: constraints.maxHeight,
                        child: _buildEmptyState(),
                      ),
                    );
                  },
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              color: AppColors.pickabooBlue,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sameGroupItemSpacing.w,
                  vertical: AppSpacing.sameGroupItemSpacing.h,
                ),
                itemCount: addressList.length,
                itemBuilder: (context, index) {
                  final address = addressList[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: AppSpacing.groupToGroupSpacing.h,
                    ),
                    child: _AddressCard(
                      address: address,
                      onEdit: () => _navigateToEditAddress(address),
                      onRemove: () => _removeAddress(address),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return AppEmptyView.addresses(
      useCard: true,
    );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressEntity address;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  const _AddressCard({
    required this.address,
    required this.onEdit,
    required this.onRemove,
  });

  bool _canRemove() {
    return (address.defaultShipping != true) &&
        (address.defaultBilling != true);
  }

  String _getFormattedAddress() {
    final parts = <String>[];
    for (final s in address.street) {
      final trimmed = s.trim();
      if (trimmed.isNotEmpty && !parts.contains(trimmed)) {
        parts.add(trimmed);
      }
    }
    final city = address.city.trim();
    final postcode = address.postcode.trim();
    final cityPostcode = [city, postcode].where((e) => e.isNotEmpty).join(' - ');
    if (cityPostcode.isNotEmpty && !parts.contains(cityPostcode) && !parts.contains(city)) {
      parts.add(cityPostcode);
    }
    final region = address.region.region.trim();
    if (region.isNotEmpty && !parts.contains(region) && !parts.any((p) => p.contains(region))) {
      parts.add(region);
    }
    return parts.isNotEmpty ? parts.join(', ') : 'No address details';
  }

  Widget _buildStatusBadge({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceBlue,
        borderRadius: AppRadius.k4,
        border: Border.all(
          color: AppColors.pickabooBlue.withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 11.sp,
            color: AppColors.pickabooBlue,
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: AppTypography.brandTag.copyWith(
              fontSize: 10.5.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.pickabooBlue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDefaultShipping = address.defaultShipping == true;
    final isDefaultBilling = address.defaultBilling == true;
    final isDefault = isDefaultShipping || isDefaultBilling;
    final fullName = '${address.firstname} ${address.lastname}'.trim();
    final formattedAddress = _getFormattedAddress();
    final phone = address.telephone.trim();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.k8,
        border: isDefault
            ? Border.all(
                color: AppColors.pickabooBlue.withValues(alpha: 0.35),
                width: 1.2.w,
              )
            : null,
        boxShadow: AppDecorations.cardShadow,
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: AppRadius.k8,
        child: InkWell(
          onTap: onEdit,
          borderRadius: AppRadius.k8,
          child: Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Top Header Row: Badges & Action Buttons ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 6.w,
                        runSpacing: 4.h,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          if (isDefaultShipping && isDefaultBilling)
                            _buildStatusBadge(
                              icon: Icons.star_rounded,
                              label: 'Default Shipping & Billing',
                            )
                          else ...[
                            if (isDefaultShipping)
                              _buildStatusBadge(
                                icon: Icons.local_shipping_outlined,
                                label: 'Default Shipping',
                              ),
                            if (isDefaultBilling)
                              _buildStatusBadge(
                                icon: Icons.receipt_long_outlined,
                                label: 'Default Billing',
                              ),
                          ],
                          if (!isDefault)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.itemBackground,
                                borderRadius: AppRadius.k4,
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.bookmark_outline_rounded,
                                    size: 11.sp,
                                    color: AppColors.muted,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Saved Address',
                                    style: AppTypography.brandTag.copyWith(
                                      fontSize: 10.5.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.muted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    // Action Buttons (Edit & Remove)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit Action
                        InkWell(
                          onTap: onEdit,
                          borderRadius: AppRadius.k8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 9.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceBlue,
                              borderRadius: AppRadius.k8,
                              border: Border.all(
                                color: AppColors.pickabooBlue.withValues(alpha: 0.15),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.edit_outlined,
                                  size: 13.sp,
                                  color: AppColors.pickabooBlue,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Edit',
                                  style: AppTypography.brandAction.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.pickabooBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_canRemove()) ...[
                          SizedBox(width: 6.w),
                          // Remove Action
                          InkWell(
                            onTap: onRemove,
                            borderRadius: AppRadius.k8,
                            child: Container(
                              padding: EdgeInsets.all(5.5.w),
                              decoration: BoxDecoration(
                                color: AppColors.redBg,
                                borderRadius: AppRadius.k8,
                                border: Border.all(
                                  color: AppColors.red.withValues(alpha: 0.15),
                                ),
                              ),
                              child: Icon(
                                Icons.delete_outline_rounded,
                                size: 15.sp,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                // ── Recipient Name & Phone Row ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person_rounded,
                          size: 15.sp,
                          color: AppColors.pickabooBlue,
                        ),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Expanded(
                      child: Text(
                        fullName.isNotEmpty ? fullName : 'Recipient',
                        style: AppTypography.titleSmall.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.navy,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (phone.isNotEmpty) ...[
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.itemBackground,
                          borderRadius: AppRadius.k4,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 12.sp,
                              color: AppColors.muted,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              phone,
                              style: AppTypography.titleSmall.copyWith(
                                fontSize: 11.5.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.navy,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),

                SizedBox(height: 10.h),

                // ── Address Details Container ──
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.itemBackground,
                    borderRadius: AppRadius.k8,
                    border: Border.all(
                      color: AppColors.border.withValues(alpha: 0.6),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 15.sp,
                          color: AppColors.pickabooBlue,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          formattedAddress,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.navy,
                            fontSize: 12.5.sp,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
