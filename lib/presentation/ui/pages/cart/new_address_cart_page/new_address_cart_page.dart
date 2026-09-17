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
import 'package:pickaboo/core/utils/address/address_place_helper.dart';
import 'package:pickaboo/core/utils/address/place_area_matcher.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/bloc/address/address_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/ui/common/bottom_sheet/delivery_location_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/cart/address_added_result.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/new_address_cart_page/address_dropdown_field.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/new_address_cart_page/address_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/address_autocomplete_section.dart';
import 'package:pickaboo/presentation/ui/widgets/common/address_picker_sheets.dart';
import 'package:pickaboo/presentation/ui/widgets/common/address_switch_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/phone_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

class NewAddressCartPage extends StatefulWidget {
  final String pageTitle;

  const NewAddressCartPage({super.key, required this.pageTitle});

  @override
  State<NewAddressCartPage> createState() => _NewAddressCartPageState();
}

class _NewAddressCartPageState extends State<NewAddressCartPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _addressController = TextEditingController();

  TextEditingController? _capturedAddressController;
  PlacePickResultEntity? _pendingPlace;
  PlacePickResultEntity? _selectedPlace;

  Map<String, String>? _selectedDivision;
  Map<String, dynamic>? _selectedCity;
  Map<String, dynamic>? _selectedArea;

  bool _isDefaultShipping = false;
  bool _isDefaultBilling = false;
  bool _isSaving = false;

  Map<String, dynamic>? _submittedAddress;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDivision == null ||
        _selectedCity == null ||
        _selectedArea == null) {
      SnackBarUtils.showError(context, AppStrings.selectDivisionCityArea);
      return;
    }

    setState(() => _isSaving = true);

    try {
      final String streetAddress =
          (_capturedAddressController?.text ?? _addressController.text).trim();

      final addressMap = {
        'customer_id': 0,
        'firstname': _firstNameController.text.trim(),
        'lastname': _lastNameController.text.trim(),
        'company': '',
        'telephone': _contactNumberController.text.trim(),
        'street': [
          streetAddress,
        ],
        'city': _selectedCity!['cities_name'] ?? '',
        'region': {
          'region_id': int.tryParse(_selectedDivision!['id']!) ?? 0,
          'region': _selectedDivision!['title'] ?? '',
          'region_code': _selectedDivision!['region_code'] ?? '',
        },
        'region_id': int.tryParse(_selectedDivision!['id']!) ?? 0,
        'postcode': _selectedArea!['zip_code'] ?? '',
        'country_id': 'BD',
        'default_shipping': _isDefaultShipping,
        'default_billing': _isDefaultBilling,
      };

      _submittedAddress = addressMap;

      context.read<UserProfileBloc>().add(
            UserProfileEvent.addAddress(address: addressMap),
          );
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        SnackBarUtils.showError(context, AppStrings.failedToSaveAddress);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocListener(
      listeners: [
        BlocListener<UserProfileBloc, UserProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              basicInfoUpdateSuccess: (message, _, _, _) {
                if (mounted) {
                  setState(() => _isSaving = false);
                  SnackBarUtils.showSuccess(
                    context,
                    message.isNotEmpty
                        ? message
                        : AppStrings.operationSuccessful,
                  );
                  context.pop(
                    AddressAddedResult(
                      address: _submittedAddress ?? const {},
                      isDefaultShipping: _isDefaultShipping,
                      isDefaultBilling: _isDefaultBilling,
                    ),
                  );
                }
              },
              error: (message) {
                if (mounted) {
                  SnackBarUtils.showError(
                    context,
                    message.isNotEmpty
                        ? message
                        : AppStrings.somethingWentWrong,
                  );
                }
              },
              loaded: (_, __, ___) {
                if (mounted && _isSaving) {
                  setState(() => _isSaving = false);
                }
              },
              orElse: () {},
            );
          },
        ),

        BlocListener<AddressBloc, AddressState>(
          listenWhen: (prev, curr) =>
              (prev.isLoadingCities && !curr.isLoadingCities) ||
              (prev.isLoadingAreas && !curr.isLoadingAreas),
          listener: (context, state) {
            if (_pendingPlace == null) return;
            final place = _pendingPlace!;

            if (!state.isLoadingCities && state.cities.isNotEmpty) {
              final match = state.cities.firstWhere(
                (c) =>
                    (c['cities_name'] as String?)?.toLowerCase() ==
                    place.city?.toLowerCase(),
                orElse: () => <String, dynamic>{},
              );
              if (match.isNotEmpty) {
                setState(() => _selectedCity = match);
              }
            }

            if (!state.isLoadingAreas && state.areas.isNotEmpty) {
              final match = matchArea(state.areas, place);
              setState(() {
                if (match.isNotEmpty) _selectedArea = match;
                _pendingPlace = null;
              });
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.pageBg,
        appBar: PickabooAppBar(
          title: widget.pageTitle,
          actions: [
            if (_isSaving)
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: const AppLoader.button(size: 20),
              ),
          ],
        ),
        bottomNavigationBar: Container(
          color: AppColors.pageBg,
          padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
          child: SafeArea(
            top: false,
            child: AppButton.primary(
              text: 'Save Address',
              isLoading: _isSaving,
              isFullWidth: true,
              height: 48.h,
              borderRadius: BorderRadius.circular(12.r),
              onPressed: _isSaving ? null : _saveAddress,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.sameGroupItemSpacing.w,
                  0,
                  AppSpacing.sameGroupItemSpacing.w,
                  AppSpacing.sameGroupItemSpacing.h,
                ),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddressTextField(
                        controller: _firstNameController,
                        label: 'First Name*',
                        hint: 'Enter first name',
                        validator: (v) =>
                            v?.isEmpty ?? true ? 'Required' : null,
                      ),
                      AppSpacing.groupToGroupGap,
                      AddressTextField(
                        controller: _lastNameController,
                        label: 'Last Name*',
                        hint: 'Enter last name',
                        validator: (v) =>
                            v?.isEmpty ?? true ? 'Required' : null,
                      ),
                      AppSpacing.groupToGroupGap,
                      PhoneTextField(
                        controller: _contactNumberController,
                        label: 'Contact Number*',
                        hint: 'Enter contact number',
                      ),
                      AppSpacing.groupToGroupGap,
                      AddressAutocompleteSection(
                        addressController: _addressController,
                        onCapturedController: (c) =>
                            _capturedAddressController = c,
                        selectedPlace: _selectedPlace,
                        onPlaceSelected: _applyPlaceToFields,
                        onPlaceCleared: () => setState(() {
                          _selectedPlace = null;
                          _capturedAddressController?.clear();
                          _addressController.clear();
                        }),
                        onOpenMapPicker: _openDeliveryLocationSheet,
                      ),
                      AppSpacing.groupToGroupGap,
                      AddressDropdownField(
                        label: 'Division*',
                        value: _selectedDivision?['title'] ??
                            'Select Your Division',
                        onTap: _selectDivision,
                      ),
                      AppSpacing.groupToGroupGap,
                      AddressDropdownField(
                        label: 'City*',
                        value: _selectedCity?['cities_name'] ??
                            'Select Your City',
                        onTap: _selectCity,
                        enabled: _selectedDivision != null,
                      ),
                      AppSpacing.groupToGroupGap,
                      AddressDropdownField(
                        label: 'Area*',
                        value: (_selectedArea?['zip_code']
                                        ?.toString()
                                        .trim()
                                        .isNotEmpty ==
                                    true
                                ? _selectedArea!['zip_code']!.toString()
                                : _selectedArea?['states_name']?.toString()) ??
                            'Select Your Area',
                        onTap: _selectArea,
                        enabled: _selectedCity != null,
                      ),
                      AppSpacing.groupToGroupGap,
                      AddressSwitchTile(
                        label: 'Set as default shipping',
                        value: _isDefaultShipping,
                        onChanged: (v) =>
                            setState(() => _isDefaultShipping = v),
                      ),
                      SizedBox(height: 12.h),
                      AddressSwitchTile(
                        label: 'Set as default billing',
                        value: _isDefaultBilling,
                        onChanged: (v) =>
                            setState(() => _isDefaultBilling = v),
                      ),
                      SizedBox(height: 12.h),
                      if (!_isDefaultShipping && !_isDefaultBilling)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 14.sp,
                              color: AppColors.muted,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                'This address will be used for this order only '
                                'and will not become your default.',
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.muted,
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openDeliveryLocationSheet() async {
    final place = await DeliveryLocationSheet.show(context);
    if (place != null && mounted) {
      _applyPlaceToFields(place);
    }
  }

  void _applyPlaceToFields(PlacePickResultEntity place) {
    final addressText = place.address ?? '';
    _addressController.text = addressText;
    _capturedAddressController?.text = addressText;

    final matchedDivision = AddressPlaceHelper.matchDivision(place);
    final immediateCity = AddressPlaceHelper.matchImmediateCity(place);
    final immediateArea = AddressPlaceHelper.matchImmediateArea(place);

    setState(() {
      if (matchedDivision.isNotEmpty) _selectedDivision = matchedDivision;
      _selectedCity = immediateCity;
      _selectedArea = immediateArea;
      _selectedPlace = place;
      _pendingPlace = matchedDivision.isNotEmpty ? place : null;
    });

    if (matchedDivision.isNotEmpty) {
      context.read<AddressBloc>().add(
            AddressEvent.loadCities(division: matchedDivision['title']!),
          );
    }
    if (place.city?.isNotEmpty == true) {
      context
          .read<AddressBloc>()
          .add(AddressEvent.loadAreas(city: place.city!));
    }
  }

  Future<void> _selectDivision() async {
    final selected = await AddressPickerSheets.showDivisionSheet(
      context,
      selectedDivision: _selectedDivision,
    );

    if (selected != null && mounted) {
      setState(() {
        _selectedDivision = selected;
        _selectedCity = null;
        _selectedArea = null;
      });

      context.read<AddressBloc>().add(
            AddressEvent.loadCities(division: selected['title']!),
          );
    }
  }

  Future<void> _selectCity() async {
    if (_selectedDivision == null) {
      SnackBarUtils.showError(context, AppStrings.selectDivisionFirst);
      return;
    }

    final selected = await AddressPickerSheets.showCitySheet(
      context,
      selectedCity: _selectedCity,
      selectedDivision: _selectedDivision,
      addressBloc: context.read<AddressBloc>(),
    );

    if (selected != null && mounted) {
      setState(() {
        _selectedCity = selected;
        _selectedArea = null;
      });

      context.read<AddressBloc>().add(
            AddressEvent.loadAreas(city: selected['cities_name'] ?? ''),
          );
    }
  }

  Future<void> _selectArea() async {
    if (_selectedCity == null) {
      SnackBarUtils.showError(context, AppStrings.selectCityFirst);
      return;
    }

    final selected = await AddressPickerSheets.showAreaSheet(
      context,
      selectedArea: _selectedArea,
      selectedCity: _selectedCity,
      addressBloc: context.read<AddressBloc>(),
    );

    if (selected != null && mounted) {
      setState(() => _selectedArea = selected);
    }
  }
}
