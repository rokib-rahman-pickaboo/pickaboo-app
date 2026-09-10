// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/utils/address/place_area_matcher.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/constants/address_constants.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/common/address_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/bloc/address/address_bloc.dart';
import 'package:pickaboo/presentation/bloc/autocomplete_bloc/autocomplete_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/ui/common/bottom_sheet/delivery_location_sheet.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/phone_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/ui/widgets/common/searchable_picker_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/place_picker/place_suggestion_tile.dart';

class NewAddressPage extends StatefulWidget {
  final dynamic existingAddress;

  const NewAddressPage({super.key, this.existingAddress});

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNumberController = TextEditingController();

  final _addressController = TextEditingController();

  TextEditingController? _capturedAddressController;

  bool _addressSynced = false;

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
    final address = widget.existingAddress as AddressEntity;
    _firstNameController.text = address.firstname;
    _lastNameController.text = address.lastname;
    _contactNumberController.text = address.telephone;
    _addressController.text = address.street.isNotEmpty
        ? address.street[0]
        : '';
    _isDefaultBilling = address.defaultBilling;
    _isDefaultShipping = address.defaultShipping;

    _selectedDivision = AddressConstants.divisions.firstWhere(
      (div) => div['region_code'] == address.region.regionCode,
      orElse: () => AddressConstants.divisions.first,
    );

    _selectedCity = {'cities_name': address.city};
    _selectedArea = {'zip_code': address.postcode};

    if (_selectedDivision != null) {
      final regionValue = address.region.region;
      String divisionParam;

      if (int.tryParse(regionValue) != null) {
        divisionParam = _selectedDivision!['title']!;
      } else {
        divisionParam = regionValue;
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
      final String houseRoad =
          (_capturedAddressController?.text ?? _addressController.text).trim();
      final String areaThana =
          _selectedArea?['cities_name']?.toString() ??
          _selectedArea?['zip_code']?.toString() ??
          '';

      final addressMap = {
        if (widget.existingAddress != null)
          'id': (widget.existingAddress as AddressEntity).id,
        'firstname': _firstNameController.text.trim(),
        'lastname': _lastNameController.text.trim(),
        'company': '',
        'street': [
          houseRoad,
          areaThana,
        ],
        'city': _selectedCity!['cities_name'] ?? '',
        'postcode': _selectedArea!['zip_code'] ?? '',
        'region': _selectedDivision!['title'] ?? '',
        'region_id': int.tryParse(_selectedDivision!['id']!) ?? 0,
        'country_id': 'BD',
        'telephone': _contactNumberController.text.trim(),
        'default_shipping': _isDefaultShipping,
        'default_billing': _isDefaultBilling,
      };

      if (widget.existingAddress != null) {
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
    final textTheme = context.textStyle;

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
            if (_pendingPlace == null) return;
            final place = _pendingPlace!;

            if (!state.isLoadingCities && state.cities.isNotEmpty) {
              final allCityNames = state.cities
                  .map((c) => c['cities_name']?.toString())
                  .toList();
              debugPrint(
                '📋 [NewAddress] Cities loaded (${state.cities.length}): '
                '$allCityNames\n'
                '   Looking for city: "${place.city}"',
              );
              final match = state.cities.firstWhere(
                (c) =>
                    (c['cities_name'] as String?)?.toLowerCase() ==
                    place.city?.toLowerCase(),
                orElse: () => <String, dynamic>{},
              );
              if (match.isNotEmpty) {
                debugPrint(
                  '✅ [NewAddress] City matched in list: ${match['cities_name']}',
                );
                setState(() => _selectedCity = match);
              } else {
                debugPrint(
                  '❌ [NewAddress] City "${place.city}" NOT found in loaded list',
                );
              }
            }

            if (!state.isLoadingAreas && state.areas.isNotEmpty) {
              debugPrint(
                '📋 [NewAddress] Areas loaded (${state.areas.length})\n'
                '   Candidates: ${areaCandidates(place)}  '
                'postCode: "${place.postCode ?? ''}"',
              );
              final match = matchArea(state.areas, place);

              if (match.isNotEmpty) {
                debugPrint(
                  '✅ [NewAddress] Area refined from API list: '
                  'name="${match['cities_name']}"  zip="${match['zip_code']}"',
                );
              } else {
                debugPrint(
                  '❌ [NewAddress] No area matched ${areaCandidates(place)} — '
                  'keeping immediate value from place response',
                );
              }
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
          title: widget.existingAddress != null ? 'Edit Address' : 'Add New Address',
          actions: [
            if (_isSaving)
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: const AppLoader.button(size: 20),
              ),
          ],
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
                  _buildTextField(
                    controller: _firstNameController,
                    label: 'First Name',
                    hint: 'Enter first name',
                    validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                  ),
                  AppSpacing.groupToGroupGap,
                  _buildTextField(
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
                  _buildAddressAutocompleteField(),
                  AppSpacing.groupToGroupGap,
                  _buildDropdownField(
                    label: 'Division',
                    value:
                        _selectedDivision?['title'] ?? 'Select Your Division',
                    onTap: _selectDivision,
                  ),
                  AppSpacing.groupToGroupGap,
                  _buildDropdownField(
                    label: 'City',
                    value: _selectedCity?['cities_name'] ?? 'Select Your City',
                    onTap: _selectCity,
                    enabled: _selectedDivision != null,
                  ),
                  AppSpacing.groupToGroupGap,
                  _buildDropdownField(
                    label: 'Area',
                    value:
                        _selectedArea?['zip_code']?.toString() ??
                        'Select Your Area',
                    onTap: _selectArea,
                    enabled: _selectedCity != null,
                  ),
                  AppSpacing.groupToGroupGap,
                  _buildTextField(
                    controller: _addressController,
                    label: 'Street Address',
                    hint: 'Enter flat, house, road no.',
                    validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
                  ),
                  AppSpacing.groupToGroupGap,
                  _buildSwitch(
                    'Default Billing Address',
                    _isDefaultBilling,
                    (v) => setState(() => _isDefaultBilling = v),
                  ),
                  SizedBox(height: 12.h),
                  _buildSwitch(
                    'Default Shipping Address',
                    _isDefaultShipping,
                    (v) => setState(() => _isDefaultShipping = v),
                  ),
                  SizedBox(height: 32.h),
                  SafeArea(
                    top: false,
                    child: SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: _isSaving ? null : _saveAddress,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.pickabooBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          widget.existingAddress != null
                              ? 'Update Address'
                              : 'Save Address',
                          style: textTheme.buttonMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressAutocompleteField() {
    final textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: textStyle.inputLabel.copyWith(color: AppColors.text),
        ),
        SizedBox(height: 4.h),

        Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: 11.sp,
              color: AppColors.muted,
            ),
            SizedBox(width: 4.w),
            Text(
              'Type to search or tap ',
              style: textStyle.bodySmall.copyWith(
                color: AppColors.muted,
                fontSize: 11.sp,
              ),
            ),
            Icon(Icons.location_on_rounded, size: 12.sp, color: AppColors.pickabooBlue),
            Text(
              ' to pick from map',
              style: textStyle.bodySmall.copyWith(
                color: AppColors.muted,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        Autocomplete<PlacePickResultEntity>(
          displayStringForOption: (place) => place.address ?? '',
          optionsBuilder: (TextEditingValue value) async {
            final query = value.text.trim();
            if (query.isEmpty) {
              context.read<AutocompleteBloc>().add(
                const AutocompleteEvent.clear(),
              );
              return const Iterable<PlacePickResultEntity>.empty();
            }
            context.read<AutocompleteBloc>().add(
              AutocompleteEvent.fetch(q: query),
            );
            final next = await context
                .read<AutocompleteBloc>()
                .stream
                .firstWhere((s) => s.status != AutocompleteStatus.loading);
            return next.suggestions;
          },
          onSelected: (place) {
            FocusManager.instance.primaryFocus?.unfocus();
            _addressController.text = place.address ?? '';
            _applyPlaceToFields(place);
          },
          fieldViewBuilder: (_, controller, focusNode, onFieldSubmitted) {
            _capturedAddressController = controller;
            if (!_addressSynced && _addressController.text.isNotEmpty) {
              _addressSynced = true;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) controller.text = _addressController.text;
              });
            }

            return BlocBuilder<AutocompleteBloc, AutocompleteState>(
              buildWhen: (p, c) => p.status != c.status,
              builder: (_, acState) {
                final isLoading = acState.status == AutocompleteStatus.loading;

                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  minLines: 1,
                  maxLines: 2,
                  validator: (v) =>
                      (v?.trim().isEmpty ?? true) ? 'Required' : null,
                  style: textStyle.inputText.copyWith(color: AppColors.text),
                  decoration: InputDecoration(
                    hintText: 'e.g. House 5, Road 12, Mirpur...',
                    hintStyle: textStyle.inputPlaceholder.copyWith(
                      color: AppColors.muted.withValues(alpha: 0.5),
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    contentPadding: EdgeInsets.only(
                      left: 14.w,
                      right: 8.w,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 8.w),
                      child: Icon(
                        Icons.search_rounded,
                        size: 20.sp,
                        color: isLoading ? AppColors.pickabooBlue : AppColors.muted,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isLoading)
                            const AppLoader.inline(size: 14, padding: EdgeInsets.zero),
                          if (isLoading) SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: _openDeliveryLocationSheet,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: AppColors.pickabooBlue.withValues(alpha: 0.35),
                                ),
                              ),
                              child: Icon(
                                Icons.location_on_rounded,
                                color: AppColors.pickabooBlue,
                                size: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.muted.withValues(alpha: 0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.muted.withValues(alpha: 0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.pickabooBlue,
                        width: 1.5.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: AppColors.red, width: 1.w),
                    ),
                  ),
                );
              },
            );
          },
          optionsViewBuilder: (_, onSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 6,
                shadowColor: AppColors.black.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10.r),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 240.h,
                      maxWidth: MediaQuery.of(context).size.width - 32.w,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 8.h,
                          ),
                          color: AppColors.pageBg,
                          child: Text(
                            'Suggestions',
                            style: textStyle.bodySmall.copyWith(
                              color: AppColors.muted,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Flexible(
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: options.length,
                            separatorBuilder: (_, __) => Divider(
                              height: 1,
                              indent: 44.w,
                              color: AppColors.border,
                            ),
                            itemBuilder: (_, i) {
                              final place = options.elementAt(i);
                              return PlaceSuggestionTile(
                                place: place,
                                onTap: () => onSelected(place),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        if (_selectedPlace != null) ...[
          SizedBox(height: 8.h),
          _buildSelectedPlaceChip(textStyle),
        ],
      ],
    );
  }

  Widget _buildSelectedPlaceChip(AppTextStyles textStyle) {
    final place = _selectedPlace!;
    final subtitle = [
      place.area,
      place.city,
      place.division,
    ].where((s) => s != null && s.isNotEmpty).join('  ·  ');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.pickabooBlue.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.pickabooBlue.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 1.h),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.pickabooBlue.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on_rounded,
              color: AppColors.pickabooBlue,
              size: 13.sp,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.address ?? place.displayAddress,
                  style: textStyle.bodySmallBold.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle.isNotEmpty) ...[
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: textStyle.bodySmall.copyWith(
                      color: AppColors.muted,
                      fontSize: 11.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              _selectedPlace = null;
              _capturedAddressController?.clear();
              _addressController.clear();
            }),
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Icon(Icons.close_rounded, size: 16.sp, color: AppColors.muted),
            ),
          ),
        ],
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
    debugPrint('══════════════════════════════════════════════');
    debugPrint('📌 [NewAddress] _applyPlaceToFields called');
    debugPrint('   address   : ${place.address}');
    debugPrint('   placeName : ${place.placeName}');
    debugPrint('   house     : ${place.house}');
    debugPrint('   road      : ${place.road}');
    debugPrint('   area      : ${place.area}');
    debugPrint('   subArea   : ${place.subArea}');
    debugPrint('   city      : ${place.city}');
    debugPrint('   subDist   : ${place.subDistrict}');
    debugPrint('   district  : ${place.district}');
    debugPrint('   division  : ${place.division}   ← key field for dropdown');
    debugPrint(
      '   postCode  : ${place.postCode}   ← used to match area zip_code',
    );
    debugPrint('   uCode     : ${place.uCode}');
    debugPrint('   pType     : ${place.pType}');
    debugPrint('   lat/lon   : ${place.latitude}, ${place.longitude}');
    debugPrint('══════════════════════════════════════════════');

    final addressText = place.address ?? '';
    _addressController.text = addressText;
    _capturedAddressController?.text = addressText;

    Map<String, String> matchedDivision = {};
    final divisionCandidates = [
      place.division,
      place.district,
      place.city,
    ].whereType<String>().where((s) => s.trim().isNotEmpty).toList();

    for (final candidate in divisionCandidates) {
      matchedDivision = AddressConstants.divisions.firstWhere(
        (d) => d['title']?.toLowerCase() == candidate.toLowerCase(),
        orElse: () => <String, String>{},
      );
      if (matchedDivision.isNotEmpty) {
        debugPrint(
          '✅ [NewAddress] Division matched via candidate "$candidate" → ${matchedDivision['title']}',
        );
        break;
      }
      debugPrint('🔎 [NewAddress] Division candidate "$candidate" — no match');
    }
    if (matchedDivision.isEmpty) {
      debugPrint(
        '❌ [NewAddress] Division: no match from candidates $divisionCandidates\n'
        '   Available: ${AddressConstants.divisions.map((d) => d['title']).toList()}',
      );
    }

    Map<String, dynamic>? immediateCity;
    if (place.city?.isNotEmpty == true) {
      immediateCity = {'cities_name': place.city};
      debugPrint('✅ [NewAddress] immediateCity → "${place.city}"');
    } else {
      debugPrint(
        '⚠️ [NewAddress] place.city is null — city dropdown will NOT auto-fill',
      );
    }

    Map<String, dynamic>? immediateArea;
    final areaName = immediateAreaLabel(place);
    final zipCode = place.postCode?.toString() ?? '';
    final label = areaName.isNotEmpty ? areaName : zipCode;
    if (label.isNotEmpty) {
      immediateArea = {
        'cities_name': label,
        'zip_code': label,
      };
      debugPrint(
        '✅ [NewAddress] immediateArea → "$label" '
        '(candidates: ${areaCandidates(place)}, postCode: $zipCode)',
      );
    } else {
      debugPrint(
        '⚠️ [NewAddress] no area/sub-district/postcode on place — area will NOT auto-fill',
      );
    }

    setState(() {
      if (matchedDivision.isNotEmpty) _selectedDivision = matchedDivision;
      _selectedCity = immediateCity;
      _selectedArea = immediateArea;
      _selectedPlace = place;
      _pendingPlace = matchedDivision.isNotEmpty ? place : null;
    });

    if (matchedDivision.isNotEmpty) {
      debugPrint(
        '📡 [NewAddress] Loading cities for division: "${matchedDivision['title']}"',
      );
      context.read<AddressBloc>().add(
        AddressEvent.loadCities(division: matchedDivision['title']!),
      );
    }
    if (place.city?.isNotEmpty == true) {
      debugPrint('📡 [NewAddress] Loading areas for city: "${place.city}"');
      context.read<AddressBloc>().add(
        AddressEvent.loadAreas(city: place.city!),
      );
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    final textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyle.inputLabel.copyWith(color: AppColors.text)),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: textStyle.inputText.copyWith(color: AppColors.text),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textStyle.inputPlaceholder.copyWith(
              color: AppColors.muted.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.w,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.muted.withValues(alpha: 0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: AppColors.muted.withValues(alpha: 0.2)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    final textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyle.inputLabel.copyWith(color: AppColors.text)),
        SizedBox(height: 8.h),
        InkWell(
          onTap: enabled ? onTap : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
            decoration: BoxDecoration(
              color: enabled
                  ? AppColors.white
                  : AppColors.muted.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.muted.withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: textStyle.inputText.copyWith(
                    color: enabled ? AppColors.text : AppColors.muted,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: AppColors.muted),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSwitch(String label, bool value, ValueChanged<bool> onChanged) {
    final textStyle = context.textStyle;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textStyle.bodyMediumMedium.copyWith(color: AppColors.text),
        ),

        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColors.pickabooBlue,
        ),
      ],
    );
  }

  Future<void> _selectDivision() async {
    final selected = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => _buildDivisionSheet(),
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
      SnackBarUtils.showError(context, 'Please select division first');
      return;
    }

    final addressBloc = context.read<AddressBloc>();
    final selected = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) =>
          BlocProvider.value(value: addressBloc, child: _buildCitySheet()),
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
      SnackBarUtils.showError(context, 'Please select city first');
      return;
    }

    final addressBloc = context.read<AddressBloc>();
    final selected = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) =>
          BlocProvider.value(value: addressBloc, child: _buildAreaSheet()),
    );

    if (selected != null && mounted) {
      setState(() => _selectedArea = selected);
    }
  }

  Widget _buildDivisionSheet() {
    return SearchablePickerSheet<Map<String, String>>(
      title: 'Select Division',
      searchHint: 'Search division',
      items: AddressConstants.divisions,
      labelBuilder: (div) => div['title'] ?? '',
      isSelected: (div) => _selectedDivision?['id'] == div['id'],
    );
  }

  Widget _buildCitySheet() {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state.isLoadingCities) {
          return const AppLoader.inline(
            padding: EdgeInsets.all(32),
          );
        }

        if (state.error != null && state.cities.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: AppColors.muted,
                    size: 36.sp,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    state.error!.contains('Type Error') ||
                            state.error!.contains('AbstractFactory')
                        ? 'Unable to load cities. Please try again.'
                        : state.error!,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMuted.copyWith(
                      color: AppColors.navy,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedDivision != null) {
                        context.read<AddressBloc>().add(
                              AddressEvent.loadCities(
                                division: _selectedDivision!['title']!,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pickabooBlue,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        final cities = state.cities;
        if (cities.isEmpty) return const SizedBox.shrink();

        return SearchablePickerSheet<Map<String, dynamic>>(
          title: 'Select City',
          searchHint: 'Search city',
          items: cities,
          labelBuilder: (city) => city['cities_name']?.toString() ?? '',
          isSelected: (city) =>
              _selectedCity?['cities_name'] == city['cities_name'],
        );
      },
    );
  }

  Widget _buildAreaSheet() {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state.isLoadingAreas) {
          return const AppLoader.inline(
            padding: EdgeInsets.all(32),
          );
        }

        if (state.error != null && state.areas.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: AppColors.muted,
                    size: 36.sp,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    state.error!.contains('Type Error') ||
                            state.error!.contains('AbstractFactory')
                        ? 'Unable to load areas. Please try again.'
                        : state.error!,
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMuted.copyWith(
                      color: AppColors.navy,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedCity != null) {
                        context.read<AddressBloc>().add(
                              AddressEvent.loadAreas(
                                city: _selectedCity!['cities_name'] ?? '',
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pickabooBlue,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        final areas = state.areas;
        if (areas.isEmpty) return const SizedBox.shrink();

        return SearchablePickerSheet<Map<String, dynamic>>(
          title: 'Select Area',
          searchHint: 'Search area or zip code',
          items: areas,
          labelBuilder: (area) => area['zip_code']?.toString() ?? '',
          isSelected: (area) => _selectedArea?['zip_code'] == area['zip_code'],
        );
      },
    );
  }
}
