import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/common/address_entity.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  void _removeAddress(AddressEntity address) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Remove Address',
          style: textStyle.dialogTitle.copyWith(
            fontWeight: FontWeight.w600,
            color: colors.text,
          ),
        ),
        content: Text(
          'Are you sure you want to remove this address?',
          style: textStyle.dialogMessage.copyWith(color: colors.gray),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: Text(
              'Cancel',
              style: textStyle.buttonMedium.copyWith(color: colors.gray),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop(true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.salmon,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Remove',
              style: textStyle.buttonMedium.copyWith(
                color: colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
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

  void _navigateToAddAddress() {
    context.push(Routes.newAddress);
  }

  void _navigateToEditAddress(AddressEntity address) {
    context.push(Routes.newAddress, extra: {'address': address});
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return BlocListener<UserProfileBloc, UserProfileState>(
      listener: (context, state) {
        if (ModalRoute.of(context)?.isCurrent != true) return;
        state.whenOrNull(
          basicInfoUpdateSuccess: (message, _, _, _) {
            SnackBarUtils.showSuccess(context, message);
          },
          error: (message) {
            SnackBarUtils.showError(context, message);
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarButton(
            iconPath: 'assets/new/svg/back_nav_icon.svg',
            width: 7.w,
            height: 14.h,
            onPressed: () => Navigator.of(context).pop(),
            iconColor: colors.text,
          ),
          title: Text('Address Book',style: context.textStyle.appBarTitle,),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: colors.white,
            boxShadow: [
              BoxShadow(
                color: colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton.icon(
                onPressed: _navigateToAddAddress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.button,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                icon: Icon(Icons.add, color: colors.white, size: 22.sp),
                label: Text(
                  'Add New Address',
                  style: textStyle.buttonMedium.copyWith(color: colors.white),
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: (_, _, _) => Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                  strokeWidth: 2,
                ),
              ),
              loaded: (user, _, _) {
                final addressList = user.addresses ?? [];
                if (addressList.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: () async => context.read<UserProfileBloc>().add(
                      const UserProfileEvent.loadUserProfile(),
                    ),
                    color: colors.primary,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: SizedBox(
                            height: constraints.maxHeight,
                            child: const _EmptyState(),
                          ),
                        );
                      },
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async => context.read<UserProfileBloc>().add(
                    const UserProfileEvent.loadUserProfile(),
                  ),
                  color: colors.primary,
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 16.w,
                        ),
                        sliver: SliverList.separated(
                          itemCount: addressList.length,
                          separatorBuilder: (_, _) => SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final address = addressList[index];
                            return _AddressCard(
                              address: address,
                              onEdit: () => _navigateToEditAddress(address),
                              onRemove: () => _removeAddress(address),
                            );
                          },
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 80.h)),
                    ],
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

class _AddressCard extends StatefulWidget {
  final AddressEntity address;
  final VoidCallback onEdit;
  final VoidCallback onRemove;

  const _AddressCard({
    required this.address,
    required this.onEdit,
    required this.onRemove,
  });

  @override
  State<_AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<_AddressCard> {
  bool _isExpanded = false;

  String _getHeaderTitle() {
    if ((widget.address.defaultShipping == true) &&
        (widget.address.defaultBilling == true)) {
      return 'Default Shipping & Billing Address';
    } else if (widget.address.defaultShipping == true) {
      return 'Default Shipping Address';
    } else if (widget.address.defaultBilling == true) {
      return 'Default Billing Address';
    }
    return '';
  }

  bool _canRemove() {
    return (widget.address.defaultShipping != true) &&
        (widget.address.defaultBilling != true);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDefault =
        (widget.address.defaultShipping == true) ||
        (widget.address.defaultBilling == true);

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDefault
              ? colors.primary.withAlpha(76)
              : colors.borderColor.withAlpha(76),
          width: isDefault ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDefault
                ? colors.primary.withAlpha(25)
                : colors.black.withValues(alpha: 0.06),
            blurRadius: isDefault ? 12 : 10,
            offset: Offset(0, isDefault ? 4 : 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15.r),
              bottom: _isExpanded ? Radius.zero : Radius.circular(15.r),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                gradient: isDefault
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colors.primary.withAlpha(51),
                          colors.primary.withAlpha(25),
                        ],
                      )
                    : null,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15.r),
                ),
              ),
              child: Row(
                children: [
                  if (isDefault) ...[
                    Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(Icons.star, color: colors.white, size: 16.sp),
                    ),
                    SizedBox(width: 12.w),
                  ],
                  Expanded(
                    child: Text(
                      _getHeaderTitle(),
                      style: context.textStyle.bodyMediumBold.copyWith(
                        color: colors.text,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                      color: colors.background,
                      border: Border.all(width: 1.w, color: colors.primary),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 4.w),
                          child: Text("Edit",style: context.textStyle.buttonMedium,),
                        ),
                        Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: colors.text,
                          size: 24.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: colors.primary.withAlpha(25),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 20.sp,
                        color: colors.primary,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        '${widget.address.firstname} ${widget.address.lastname}',
                        style: context.textStyle.bodyMediumBold.copyWith(
                          color: colors.text,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: colors.shamrock.withAlpha(25),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.location_on,
                        size: 20.sp,
                        color: colors.shamrock,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            if (widget.address.street.isNotEmpty)
                              TextSpan(
                                text: widget.address.street[0],
                                style: context.textStyle.bodyMedium.copyWith(
                                  color: colors.text,
                                  height: 1.4.h,
                                ),
                              ),
                            if (widget.address.street.length > 1)
                              TextSpan(
                                text: '\n${widget.address.street[1]}',
                                style: context.textStyle.bodyMedium.copyWith(
                                  color: colors.text,
                                  height: 1.4.h,
                                ),
                              ),
                            TextSpan(
                              text:
                                  '\n${widget.address.city}, ${widget.address.postcode}',
                              style: context.textStyle.bodyMedium.copyWith(
                                color: colors.gray,
                                fontWeight: FontWeight.w500,
                                height: 1.5.h,
                              ),
                            ),
                            TextSpan(
                              text: '\n${widget.address.region.region}',
                              style: context.textStyle.bodyMedium.copyWith(
                                color: colors.gray,
                                height: 1.4.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: colors.salmon.withAlpha(25),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.phone,
                        size: 20.sp,
                        color: colors.salmon,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      widget.address.telephone,
                      style: context.textStyle.bodyMedium.copyWith(
                        color: colors.text,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: widget.onEdit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.button,
                        foregroundColor: colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      icon: Icon(Icons.edit, size: 18.sp),
                      label: Text(
                        'Edit',
                        style: context.textStyle.buttonMedium.copyWith(
                          color: colors.white,
                        ),
                      ),
                    ),
                  ),
                  if (_canRemove()) ...[
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: widget.onRemove,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.redBright,
                          foregroundColor: colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        icon: Icon(Icons.delete, size: 18.sp),
                        label: Text(
                          'Remove',
                          style: context.textStyle.buttonMedium.copyWith(
                            color: colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: colors.primary.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on_outlined,
              size: 64.sp,
              color: colors.primary,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'No Addresses Added',
            style: textStyle.headingMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.text,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Please add your shipping & billing address',
            style: textStyle.bodyMedium.copyWith(color: colors.gray),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
