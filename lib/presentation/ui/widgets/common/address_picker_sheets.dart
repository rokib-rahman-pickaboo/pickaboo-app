import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/constants/address_constants.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/bloc/address/address_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/common/searchable_picker_sheet.dart';

/// Centralized bottom picker sheets for Division, City, and Area selection.
class AddressPickerSheets {
  AddressPickerSheets._();

  /// Displays the searchable bottom sheet for Division selection.
  static Future<Map<String, String>?> showDivisionSheet(
    BuildContext context, {
    Map<String, String>? selectedDivision,
  }) {
    return showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.sheetTop,
      ),
      builder: (context) => SearchablePickerSheet<Map<String, String>>(
        title: 'Select Division',
        searchHint: 'Search division',
        items: AddressConstants.divisions,
        labelBuilder: (div) => div['title'] ?? '',
        isSelected: (div) => selectedDivision?['id'] == div['id'],
      ),
    );
  }

  /// Displays the searchable bottom sheet for City selection with Bloc integration.
  static Future<Map<String, dynamic>?> showCitySheet(
    BuildContext context, {
    Map<String, dynamic>? selectedCity,
    Map<String, String>? selectedDivision,
    required AddressBloc addressBloc,
  }) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.sheetTop,
      ),
      builder: (context) => BlocProvider.value(
        value: addressBloc,
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if (state.isLoadingCities) {
              return const AppLoader.inline(padding: EdgeInsets.all(32));
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
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.navy,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppSpacing.gapV16,
                      AppButton.primary(
                        text: AppStrings.retry,
                        onPressed: () {
                          if (selectedDivision != null) {
                            addressBloc.add(
                              AddressEvent.loadCities(
                                division: selectedDivision['title']!,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return SearchablePickerSheet<Map<String, dynamic>>(
              title: 'Select City',
              searchHint: 'Search city',
              items: state.cities,
              labelBuilder: (c) => c['cities_name'] ?? '',
              isSelected: (c) =>
                  selectedCity?['cities_name'] == c['cities_name'],
            );
          },
        ),
      ),
    );
  }

  /// Displays the searchable bottom sheet for Area selection with Bloc integration.
  static Future<Map<String, dynamic>?> showAreaSheet(
    BuildContext context, {
    Map<String, dynamic>? selectedArea,
    Map<String, dynamic>? selectedCity,
    required AddressBloc addressBloc,
  }) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: AppRadius.sheetTop,
      ),
      builder: (context) => BlocProvider.value(
        value: addressBloc,
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if (state.isLoadingAreas) {
              return const AppLoader.inline(padding: EdgeInsets.all(32));
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
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.navy,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppSpacing.gapV16,
                      AppButton.primary(
                        text: AppStrings.retry,
                        onPressed: () {
                          if (selectedCity != null) {
                            addressBloc.add(
                              AddressEvent.loadAreas(
                                city: selectedCity['cities_name'] ?? '',
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return SearchablePickerSheet<Map<String, dynamic>>(
              title: 'Select Area',
              searchHint: 'Search area or zip code',
              items: state.areas,
              // In Pickaboo's API response:
              // 'zip_code' contains the area/thana name (e.g. 'Adabor', 'Banani')
              // 'states_name' contains the division (e.g. 'Dhaka')
              // 'cities_name' contains the parent city (e.g. 'Dhaka')
              labelBuilder: (a) {
                final areaName = a['zip_code']?.toString().trim() ?? '';
                if (areaName.isNotEmpty) return areaName;
                return a['states_name']?.toString().trim() ?? '';
              },
              isSelected: (a) {
                final areaZip = a['zip_code']?.toString().trim().toLowerCase();
                final selectedZip = selectedArea?['zip_code']?.toString().trim().toLowerCase();
                return areaZip != null && areaZip.isNotEmpty && areaZip == selectedZip;
              },
            );
          },
        ),
      ),
    );
  }
}
