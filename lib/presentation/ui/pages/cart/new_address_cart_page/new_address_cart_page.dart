import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/utils/address/place_area_matcher.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/constants/address_constants.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/bloc/address/address_bloc.dart';
import 'package:pickaboo/presentation/bloc/autocomplete_bloc/autocomplete_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:pickaboo/presentation/ui/common/bottom_sheet/delivery_location_sheet.dart';
import 'package:pickaboo/presentation/ui/pages/cart/address_added_result.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/new_address_cart_page/address_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/phone_text_field.dart';
import 'package:pickaboo/presentation/ui/widgets/common/searchable_picker_sheet.dart';
import 'package:pickaboo/presentation/ui/widgets/cart/new_address_cart_page/address_dropdown_field.dart';
import 'package:pickaboo/presentation/ui/widgets/place_picker/place_suggestion_tile.dart';

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
      SnackBarUtils.showError(context, 'Please select division, city and area');
      return;
    }

    setState(() => _isSaving = true);

    try {
      final addressMap = {
        'customer_id': 0,
        'firstname': _firstNameController.text.trim(),
        'lastname': _lastNameController.text.trim(),
        'telephone': _contactNumberController.text.trim(),
        'street': [
          (_capturedAddressController?.text ?? _addressController.text).trim()
        ],
        'city': _selectedCity!['cities_name'] ?? '',
        'region': {
          'region_id': int.tryParse(_selectedDivision!['id']!) ?? 0,
          'region': _selectedDivision!['title'],
          'region_code': _selectedDivision!['region_code'],
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
        SnackBarUtils.showError(context, 'Failed to save address');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return MultiBlocListener(
      listeners: [
        BlocListener<UserProfileBloc, UserProfileState>(
          listener: (context, state) {
            state.maybeWhen(
              basicInfoUpdateSuccess: (message, _, _, _) {
                if (mounted) {
                  setState(() => _isSaving = false);
                  SnackBarUtils.showSuccess(context, message);
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
                '📋 [NewAddressCart] Cities loaded (${state.cities.length}): '
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
                    '✅ [NewAddressCart] City matched in list: ${match['cities_name']}');
                setState(() => _selectedCity = match);
              } else {
                debugPrint(
                    '❌ [NewAddressCart] City "${place.city}" NOT found in loaded list');
              }
            }

            if (!state.isLoadingAreas && state.areas.isNotEmpty) {
              debugPrint(
                '📋 [NewAddressCart] Areas loaded (${state.areas.length})\n'
                '   Candidates: ${areaCandidates(place)}',
              );
              final match = matchArea(state.areas, place);
              if (match.isNotEmpty) {
                debugPrint(
                  '✅ [NewAddressCart] Area refined from API list: '
                  'name="${match['cities_name']}"  zip="${match['zip_code']}"',
                );
              } else {
                debugPrint(
                  '⚠️ [NewAddressCart] No area matched ${areaCandidates(place)} '
                  '— keeping immediate value from place response',
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
        backgroundColor: colors.background,
        appBar: AppBar(
          leading: AppBarButton(
            iconPath: 'assets/new/svg/back_nav_icon.svg',
            width: 7.w,
            height: 14.h,
            onPressed: () => Navigator.of(context).pop(),
            iconColor: colors.text,
          ),
          title: Text(
            widget.pageTitle,
            style: context.textStyle.appBarTitle,
          ),
          elevation: 0,
          backgroundColor: colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.h),
            child: Container(color: colors.borderColor, height: 1.h),
          ),
          actions: [
            if (_isSaving)
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.primary,
                    ),
                  ),
                ),
              ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.w),
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
                      SizedBox(height: 16.h),
                      AddressTextField(
                        controller: _lastNameController,
                        label: 'Last Name*',
                        hint: 'Enter last name',
                        validator: (v) =>
                            v?.isEmpty ?? true ? 'Required' : null,
                      ),
                      SizedBox(height: 16.h),
                      PhoneTextField(
                        controller: _contactNumberController,
                        label: 'Contact Number*',
                        hint: 'Enter contact number',
                      ),
                      SizedBox(height: 16.h),
                      _buildAddressAutocompleteField(),
                      SizedBox(height: 16.h),
                      AddressDropdownField(
                        label: 'Division*',
                        value: _selectedDivision?['title'] ?? 'Select Your Division',
                        onTap: _selectDivision,
                      ),
                      SizedBox(height: 16.h),
                      AddressDropdownField(
                        label: 'City*',
                        value: _selectedCity?['cities_name'] ?? 'Select Your City',
                        onTap: _selectCity,
                        enabled: _selectedDivision != null,
                      ),
                      SizedBox(height: 16.h),
                      AddressDropdownField(
                        label: 'Area*',
                        value: _selectedArea?['zip_code']?.toString() ?? 'Select Your Area',
                        onTap: _selectArea,
                        enabled: _selectedCity != null,
                      ),
                      SizedBox(height: 24.h),
                      _buildDefaultSwitch(
                        label: 'Set as default shipping',
                        value: _isDefaultShipping,
                        onChanged: (v) =>
                            setState(() => _isDefaultShipping = v),
                      ),
                      SizedBox(height: 12.h),
                      _buildDefaultSwitch(
                        label: 'Set as default billing',
                        value: _isDefaultBilling,
                        onChanged: (v) => setState(() => _isDefaultBilling = v),
                      ),
                      SizedBox(height: 12.h),
                      if (!_isDefaultShipping && !_isDefaultBilling)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 14.sp,
                              color: colors.gray,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                'This address will be used for this order only '
                                'and will not become your default.',
                                style: textStyle.bodySmall.copyWith(
                                  color: colors.gray,
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 32.h),
                      SafeArea(
                        top: false,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48.h,
                            child: ElevatedButton(
                              onPressed: _isSaving ? null : _saveAddress,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colors.button,
                                foregroundColor: colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                              child: Text(
                                'Save Address',
                                style: textStyle.buttonLarge.copyWith(
                                  color: colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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

  Widget _buildDefaultSwitch({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.white,
        border: Border.all(color: colors.borderColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: textStyle.bodyMediumMedium.copyWith(color: colors.text),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: colors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressAutocompleteField() {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address*',
          style: textStyle.inputLabel.copyWith(color: colors.text),
        ),
        SizedBox(height: 4.h),

        Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: 11.sp,
              color: colors.textMedium,
            ),
            SizedBox(width: 4.w),
            Text(
              'Type to search or tap ',
              style: textStyle.bodySmall.copyWith(
                color: colors.textMedium,
                fontSize: 11.sp,
              ),
            ),
            Icon(
              Icons.location_on_rounded,
              size: 12.sp,
              color: colors.primary,
            ),
            Text(
              ' to pick from map',
              style: textStyle.bodySmall.copyWith(
                color: colors.textMedium,
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
              context
                  .read<AutocompleteBloc>()
                  .add(const AutocompleteEvent.clear());
              return const Iterable<PlacePickResultEntity>.empty();
            }
            context
                .read<AutocompleteBloc>()
                .add(AutocompleteEvent.fetch(q: query));
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

            return BlocBuilder<AutocompleteBloc, AutocompleteState>(
              buildWhen: (p, c) => p.status != c.status,
              builder: (_, acState) {
                final isLoading =
                    acState.status == AutocompleteStatus.loading;

                return TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  minLines: 1,
                  maxLines: 2,
                  validator: (v) =>
                      (v?.trim().isEmpty ?? true) ? 'Required' : null,
                  style: textStyle.inputText.copyWith(color: colors.text),
                  decoration: InputDecoration(
                    hintText: 'e.g. House 5, Road 12, Mirpur...',
                    hintStyle: textStyle.inputPlaceholder.copyWith(
                      color: colors.gray.withValues(alpha: 0.5),
                    ),
                    filled: true,
                    fillColor: colors.white,
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
                        color: isLoading ? colors.primary : colors.gray,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isLoading)
                            SizedBox(
                              width: 14.w,
                              height: 14.h,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colors.primary,
                              ),
                            ),
                          if (isLoading) SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: _openDeliveryLocationSheet,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    colors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: colors.primary
                                      .withValues(alpha: 0.35),
                                ),
                              ),
                              child: Icon(
                                Icons.location_on_rounded,
                                color: colors.primary,
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
                          color: colors.gray.withValues(alpha: 0.2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                          color: colors.gray.withValues(alpha: 0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: colors.primary, width: 1.5.w),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: colors.red, width: 1.w),
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
                shadowColor: colors.black.withValues(alpha: 0.12),
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
                              horizontal: 14.w, vertical: 8.h),
                          color: colors.backgroundGray,
                          child: Text(
                            'Suggestions',
                            style: textStyle.bodySmall.copyWith(
                              color: colors.textMedium,
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
                              color: colors.borderColor,
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
          _buildSelectedPlaceChip(colors, textStyle),
        ],
      ],
    );
  }

  Widget _buildSelectedPlaceChip(AppColors colors, AppTextStyles textStyle) {
    final place = _selectedPlace!;
    final subtitle = [place.area, place.city, place.division]
        .where((s) => s != null && s.isNotEmpty)
        .join('  ·  ');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colors.primary.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 1.h),
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on_rounded,
              color: colors.primary,
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
                    color: colors.text,
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
                      color: colors.textMedium,
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
              child:
                  Icon(Icons.close_rounded, size: 16.sp, color: colors.gray),
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
    debugPrint('📌 [NewAddressCart] _applyPlaceToFields called');
    debugPrint('   address   : ${place.address}');
    debugPrint('   placeName : ${place.placeName}');
    debugPrint('   area      : ${place.area}');
    debugPrint('   subArea   : ${place.subArea}');
    debugPrint('   city      : ${place.city}');
    debugPrint('   district  : ${place.district}');
    debugPrint('   division  : ${place.division}   ← key field for dropdown');
    debugPrint('   postCode  : ${place.postCode}   ← used to match area zip_code');
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
            '✅ [NewAddressCart] Division matched via candidate "$candidate" → ${matchedDivision['title']}');
        break;
      }
      debugPrint(
          '🔎 [NewAddressCart] Division candidate "$candidate" — no match');
    }
    if (matchedDivision.isEmpty) {
      debugPrint(
        '❌ [NewAddressCart] Division: no match from candidates $divisionCandidates\n'
        '   Available: ${AddressConstants.divisions.map((d) => d['title']).toList()}',
      );
    }

    Map<String, dynamic>? immediateCity;
    if (place.city?.isNotEmpty == true) {
      immediateCity = {'cities_name': place.city};
      debugPrint('✅ [NewAddressCart] immediateCity → "${place.city}"');
    } else {
      debugPrint(
          '⚠️ [NewAddressCart] place.city is null — city dropdown will NOT auto-fill');
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
          '✅ [NewAddressCart] immediateArea → "$label" (candidates: ${areaCandidates(place)}, postCode: $zipCode)');
    } else {
      debugPrint(
          '⚠️ [NewAddressCart] no area/sub-district/postcode on place — area will NOT auto-fill');
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
          '📡 [NewAddressCart] Loading cities for division: "${matchedDivision['title']}"');
      context.read<AddressBloc>().add(
            AddressEvent.loadCities(division: matchedDivision['title']!),
          );
    }
    if (place.city?.isNotEmpty == true) {
      debugPrint(
          '📡 [NewAddressCart] Loading areas for city: "${place.city}"');
      context
          .read<AddressBloc>()
          .add(AddressEvent.loadAreas(city: place.city!));
    }
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
      builder: (context) => BlocProvider.value(
        value: addressBloc,
        child: _buildCitySheet(),
      ),
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
      builder: (context) => BlocProvider.value(
        value: addressBloc,
        child: _buildAreaSheet(),
      ),
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
    final colors = context.colors;
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state.isLoadingCities) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.h),
              child: CircularProgressIndicator(color: colors.primary),
            ),
          );
        }

        if (state.error != null && state.cities.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.h),
              child: Text(state.error!),
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
    final colors = context.colors;
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state.isLoadingAreas) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.h),
              child: CircularProgressIndicator(color: colors.primary),
            ),
          );
        }

        if (state.error != null && state.areas.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.h),
              child: Text(state.error!),
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
