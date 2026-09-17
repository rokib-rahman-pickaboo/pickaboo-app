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
import 'package:pickaboo/core/constants/address_constants.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/address/address_place_helper.dart';
import 'package:pickaboo/core/utils/address/place_area_matcher.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/common/address_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/bloc/address/address_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/ui/common/bottom_sheet/delivery_location_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/new_address_cart_page/address_dropdown_field.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/new_address_cart_page/address_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/address_autocomplete_section.dart';
import 'package:pickaboo/presentation/ui/widgets/common/address_picker_sheets.dart';
import 'package:pickaboo/presentation/ui/widgets/common/address_switch_tile.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/phone_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';

class NewAddressPage extends StatefulWidget {
  final dynamic existingAddress;

  const NewAddressPage({super.key, this.existingAddress});

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> {
  // Hold a reference to the existing address entity for later use in listeners
  AddressEntity? _existingAddressEntity;
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

  bool _isDefaultBilling = false;
  bool _isDefaultShipping = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.existingAddress != null) {
      _existingAddressEntity = widget.existingAddress as AddressEntity;
      _populateExistingAddress();
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _populateExistingAddress() {
    final address = _existingAddressEntity!;
    setState(() {
      _firstNameController.text = address.firstname;
      _lastNameController.text = address.lastname;
      _contactNumberController.text = address.telephone;

      final streetText = address.street.isNotEmpty ? address.street[0] : '';
      _addressController.text = streetText;
      _capturedAddressController?.text = streetText;

      _isDefaultBilling = address.defaultBilling;
      _isDefaultShipping = address.defaultShipping;

      _selectedDivision = AddressConstants.divisions.firstWhere(
        (div) => div['region_code'] == address.region.regionCode,
        orElse: () => AddressConstants.divisions.firstWhere(
          (div) =>
              div['title']?.toLowerCase() ==
              address.region.region.toLowerCase(),
          orElse: () => AddressConstants.divisions.first,
        ),
      );

      _selectedCity = {'cities_name': address.city};
      _selectedArea = {
        'zip_code': address.postcode,
        'states_name': _selectedDivision?['title'] ?? '',
        'cities_name': address.city,
      };

      _selectedPlace = PlacePickResultEntity(
        latitude: 0.0,
        longitude: 0.0,
        address: streetText,
        city: address.city,
        division: address.region.region,
        postCode: int.tryParse(address.postcode),
      );
    });

    if (_selectedDivision != null) {
      final regionValue = address.region.region;
      String divisionParam;

      if (int.tryParse(regionValue) != null) {
        divisionParam = _selectedDivision!['title']!;
      } else {
        divisionParam =
            regionValue.isNotEmpty ? regionValue : _selectedDivision!['title']!;
      }

      context.read<AddressBloc>().add(
            AddressEvent.loadCities(division: divisionParam),
          );

      context.read<AddressBloc>().add(
            AddressEvent.loadAreas(city: address.city),
          );
    }
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDivision == null ||
        _selectedCity == null ||
        _selectedArea == null) {
      SnackBarUtils.showError(context, 'Please select division, city and area');
      return;
    }

    setState(() => _isSaving = true);

    try {
      final String streetAddress = _addressController.text.trim().isNotEmpty
          ? _addressController.text.trim()
          : (_capturedAddressController?.text.trim() ?? '');

      final existingEntity = widget.existingAddress as AddressEntity?;
      final addressMap = {
        if (existingEntity != null) 'id': existingEntity.id,
        'customer_id': existingEntity?.customerId ?? 0,
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

      if (existingEntity != null) {
        context.read<UserProfileBloc>().add(
              UserProfileEvent.updateAddress(address: addressMap),
            );
      } else {
        context.read<UserProfileBloc>().add(
              UserProfileEvent.addAddress(address: addressMap),
            );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSaving = false);
        SnackBarUtils.showError(context, 'Failed to save address');
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
                  SnackBarUtils.showSuccess(context, message);
                  context.pop();
                }
              },
              error: (message) {
                if (mounted) {
                  SnackBarUtils.showError(context, message);
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
            // ── Existing-address editing: populate city/area once data loads ──
            if (_pendingPlace == null) {
              if (_existingAddressEntity != null && _selectedDivision != null) {
                // Match city when the cities list finishes loading
                if (!state.isLoadingCities && state.cities.isNotEmpty) {
                  final cityMatch = state.cities.firstWhere(
                    (c) =>
                        (c['cities_name'] as String?)?.toLowerCase() ==
                        _existingAddressEntity!.city.toLowerCase(),
                    orElse: () => <String, dynamic>{},
                  );
                  if (cityMatch.isNotEmpty) {
                    setState(() => _selectedCity = cityMatch);
                  }
                }
                // Match area when the areas list finishes loading
                if (!state.isLoadingAreas && state.areas.isNotEmpty) {
                  final targetPostcode =
                      _existingAddressEntity!.postcode.trim().toLowerCase();
                  final areaMatch = state.areas.firstWhere(
                    (a) =>
                        a['zip_code']?.toString().trim().toLowerCase() ==
                        targetPostcode,
                    orElse: () => matchArea(
                      state.areas,
                      PlacePickResultEntity(
                        latitude: 0.0,
                        longitude: 0.0,
                        city: _existingAddressEntity!.city,
                        postCode: int.tryParse(_existingAddressEntity!.postcode),
                      ),
                    ),
                  );
                  if (areaMatch.isNotEmpty) {
                    setState(() => _selectedArea = areaMatch);
                  }
                }
              }
              return;
            }
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
          title: widget.existingAddress != null
              ? 'Edit Address'
              : 'Add New Address',
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
              text: widget.existingAddress != null
                  ? 'Update Address'
                  : 'Save Address',
              isLoading: _isSaving,
              isFullWidth: true,
              height: 48.h,
              borderRadius: BorderRadius.circular(12.r),
              onPressed: _isSaving ? null : _saveAddress,
            ),
          ),
        ),
        body: ResponsiveContainer(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.sameGroupItemSpacing.w,
                vertical: AppSpacing.sameGroupItemSpacing.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressTextField(
                    controller: _firstNameController,
                    label: 'First Name',
                    hint: 'Enter first name',
                    validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                  ),
                  AppSpacing.groupToGroupGap,
                  AddressTextField(
                    controller: _lastNameController,
                    label: 'Last Name',
                    hint: 'Enter last name',
                    validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                  ),
                  AppSpacing.groupToGroupGap,
                  PhoneTextField(
                    controller: _contactNumberController,
                    label: 'Contact Number',
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
                    label: 'Division',
                    value: _selectedDivision?['title'] ??
                        'Select Your Division',
                    onTap: _selectDivision,
                  ),
                  AppSpacing.groupToGroupGap,
                  AddressDropdownField(
                    label: 'City',
                    value: _selectedCity?['cities_name'] ??
                        'Select Your City',
                    onTap: _selectCity,
                    enabled: _selectedDivision != null,
                  ),
                  AppSpacing.groupToGroupGap,
                  AddressDropdownField(
                    label: 'Area',
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
                  AddressTextField(
                    controller: _addressController,
                    label: 'Street Address',
                    hint: 'Enter flat, house, road no.',
                    validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                  ),
                  AppSpacing.groupToGroupGap,
                  AddressSwitchTile(
                    label: 'Default Billing Address',
                    value: _isDefaultBilling,
                    onChanged: (v) => setState(() => _isDefaultBilling = v),
                  ),
                  SizedBox(height: 12.h),
                  AddressSwitchTile(
                    label: 'Default Shipping Address',
                    value: _isDefaultShipping,
                    onChanged: (v) => setState(() => _isDefaultShipping = v),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
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
