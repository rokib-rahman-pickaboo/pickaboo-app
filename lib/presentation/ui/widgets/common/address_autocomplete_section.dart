import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/bloc/autocomplete_bloc/autocomplete_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';
import 'package:pickaboo/presentation/ui/widgets/place_picker/place_suggestion_tile.dart';

/// Centralized widget for address search Autocomplete with map-picker launcher and selected-place chip.
class AddressAutocompleteSection extends StatelessWidget {
  final TextEditingController addressController;
  final ValueChanged<TextEditingController>? onCapturedController;
  final PlacePickResultEntity? selectedPlace;
  final ValueChanged<PlacePickResultEntity> onPlaceSelected;
  final VoidCallback onPlaceCleared;
  final VoidCallback onOpenMapPicker;

  const AddressAutocompleteSection({
    super.key,
    required this.addressController,
    this.onCapturedController,
    required this.selectedPlace,
    required this.onPlaceSelected,
    required this.onPlaceCleared,
    required this.onOpenMapPicker,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address*',
          style: AppTypography.bodyLarge.copyWith(color: AppColors.text),
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
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.muted,
                fontSize: 11.sp,
              ),
            ),
            Icon(
              Icons.location_on_rounded,
              size: 12.sp,
              color: AppColors.pickabooBlue,
            ),
            Text(
              ' to pick from map',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.muted,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Autocomplete<PlacePickResultEntity>(
          initialValue: TextEditingValue(text: addressController.text),
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
            addressController.text = place.address ?? '';
            onPlaceSelected(place);
          },
          fieldViewBuilder: (_, controller, focusNode, onFieldSubmitted) {
            onCapturedController?.call(controller);
            if (controller.text.isEmpty && addressController.text.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (controller.text.isEmpty) {
                  controller.text = addressController.text;
                }
              });
            }

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
                  onChanged: (val) {
                    addressController.text = val;
                  },
                  validator: (v) =>
                      (v?.trim().isEmpty ?? true) ? 'Required' : null,
                  style: AppTypography.bodyLarge.regular().copyWith(color: AppColors.text),
                  decoration: InputDecoration(
                    hintText: 'e.g. House 5, Road 12, Mirpur...',
                    hintStyle: AppTypography.inputHint.copyWith(
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
                        color: isLoading
                            ? AppColors.pickabooBlue
                            : AppColors.muted,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isLoading)
                            const AppLoader.inline(
                              size: 14,
                              padding: EdgeInsets.zero,
                            ),
                          if (isLoading) SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: onOpenMapPicker,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.pickabooBlue
                                    .withValues(alpha: 0.1),
                                borderRadius: AppRadius.pillRadius,
                                border: Border.all(
                                  color: AppColors.pickabooBlue
                                      .withValues(alpha: 0.35),
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
                      borderRadius: AppRadius.inputRadius,
                      borderSide: BorderSide(
                        color: AppColors.muted.withValues(alpha: 0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: AppRadius.inputRadius,
                      borderSide: BorderSide(
                        color: AppColors.muted.withValues(alpha: 0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: AppRadius.inputRadius,
                      borderSide: BorderSide(
                        color: AppColors.pickabooBlue,
                        width: 1.5.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: AppRadius.inputRadius,
                      borderSide: BorderSide(
                        color: AppColors.red,
                        width: 1.w,
                      ),
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
                borderRadius: AppRadius.chipRadius,
                child: ClipRRect(
                  borderRadius: AppRadius.chipRadius,
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
                            style: AppTypography.bodySmall.copyWith(
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
        if (selectedPlace != null) ...[
          SizedBox(height: 8.h),
          _buildSelectedPlaceChip(context, selectedPlace!),
        ],
      ],
    );
  }

  Widget _buildSelectedPlaceChip(
    BuildContext context,
    PlacePickResultEntity place,
  ) {
    final subtitle = [place.area, place.city, place.division]
        .where((s) => s != null && s.isNotEmpty)
        .join('  ·  ');

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.pickabooBlue.withValues(alpha: 0.06),
        borderRadius: AppRadius.buttonRadius,
        border: Border.all(
          color: AppColors.pickabooBlue.withValues(alpha: 0.25),
        ),
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
                  style: AppTypography.bodySmall.bold().copyWith(
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
                    style: AppTypography.bodySmall.copyWith(
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
            onTap: onPlaceCleared,
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Icon(
                Icons.close_rounded,
                size: 16.sp,
                color: AppColors.muted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
