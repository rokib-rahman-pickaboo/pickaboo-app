import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/presentation/bloc/place_picker_bloc/place_picker_bloc.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/permission_prompt.dart';
import 'package:pickaboo/presentation/ui/widgets/place_picker/place_suggestion_tile.dart';
import 'package:get_it/get_it.dart';

const _kDefaultLatLng = LatLng(23.7641649,90.4029368);
const _kPinImageId = 'delivery-location-pin';

class DeliveryLocationSheet extends StatelessWidget {
  const DeliveryLocationSheet({super.key});

  static Future<PlacePickResultEntity?> show(BuildContext context) async {
    return showModalBottomSheet<PlacePickResultEntity>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: context.colors.black.withValues(alpha: 0.0),
      isDismissible: false,
      enableDrag: false,
      builder: (_) => BlocProvider(
        create: (_) => GetIt.instance<PlacePickerBloc>(),
        child: const DeliveryLocationSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _DeliveryLocationSheetView();
  }
}

class _DeliveryLocationSheetView extends StatefulWidget {
  const _DeliveryLocationSheetView();

  @override
  State<_DeliveryLocationSheetView> createState() =>
      _DeliveryLocationSheetViewState();
}

class _DeliveryLocationSheetViewState extends State<_DeliveryLocationSheetView>
    with WidgetsBindingObserver {
  FocusNode? _autocompleteFocusNode;

  MapLibreMapController? _mapController;

  Symbol? _marker;
  bool _pinImageRegistered = false;

  bool _locating = false;

  /// True while the user is away in the OS settings screen after being
  /// prompted from the my-location button.
  bool _sentToSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _mapController = null;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed || !_sentToSettings) return;
    // Back from Settings — retry the action the user originally tapped.
    _sentToSettings = false;
    _goToCurrentLocation();
  }

  Future<Uint8List> _buildPinImage(Color color) async {
    const double w = 96;
    const double h = 120;
    const double radius = 40;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, w, h));
    final body = Paint()
      ..color = color
      ..isAntiAlias = true;

    const head = Offset(w / 2, radius + 4);

    canvas.drawCircle(head, radius, body);
    canvas.drawPath(
      Path()
        ..moveTo(w / 2 - 22, head.dy + 30)
        ..lineTo(w / 2, h - 4)
        ..lineTo(w / 2 + 22, head.dy + 30)
        ..close(),
      body,
    );
    canvas.drawCircle(head, 15, Paint()..color = const Color(0xFFFFFFFF));

    final image = await recorder.endRecording().toImage(w.toInt(), h.toInt());
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  Future<void> _onStyleLoaded() async {
    final controller = _mapController;
    if (controller == null || !mounted) return;

    if (!_pinImageRegistered) {
      await controller.addImage(
        _kPinImageId,
        await _buildPinImage(context.colors.primary),
      );
      _pinImageRegistered = true;
    }

    await _resolveInitialLocation();
  }

  Future<void> _showMarker(LatLng latLng) async {
    final controller = _mapController;
    if (controller == null || !_pinImageRegistered) return;

    if (_marker == null) {
      _marker = await controller.addSymbol(
        SymbolOptions(
          geometry: latLng,
          iconImage: _kPinImageId,
          iconSize: 0.5,
          iconAnchor: 'bottom',
        ),
      );
    } else {
      await controller.updateSymbol(
        _marker!,
        SymbolOptions(geometry: latLng),
      );
    }
  }

  Future<void> _applyLocation(LatLng latLng, {bool animate = true}) async {
    if (!mounted) return;

    if (animate) {
      await _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 16),
        ),
      );
    }

    await _showMarker(latLng);

    if (!mounted) return;
    context.read<PlacePickerBloc>().add(
          PlacePickerEvent.reverseGeocode(
            latitude: latLng.latitude,
            longitude: latLng.longitude,
          ),
        );
  }

  Future<void> _resolveInitialLocation() async {
    setState(() => _locating = true);
    final position = await _currentPosition();
    if (!mounted) return;
    setState(() => _locating = false);

    if (position == null) return;
    await _applyLocation(LatLng(position.latitude, position.longitude));
  }

  Future<Position?> _currentPosition({bool promptIfBlocked = false}) async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.unableToDetermine) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        // Jumping straight into Settings with no explanation is jarring; only
        // the explicit my-location tap prompts, the silent open-sheet path
        // just falls back to search.
        if (promptIfBlocked && mounted) {
          _sentToSettings = await PermissionPrompt.location(context);
        }
        return null;
      }

      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return null;
      }

      // Permission is fine but the device's location services may be off —
      // getCurrentPosition would just throw and the button would do nothing.
      if (!await Geolocator.isLocationServiceEnabled()) {
        if (promptIfBlocked && mounted) {
          SnackBarUtils.showWarning(
            context,
            'Turn on location services to use your current location.',
          );
          await Geolocator.openLocationSettings();
        }
        return null;
      }

      return await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high),
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> _goToCurrentLocation() async {
    if (_locating) return;
    setState(() => _locating = true);
    final position = await _currentPosition(promptIfBlocked: true);
    if (!mounted) return;
    setState(() => _locating = false);

    if (position == null) return;
    await _applyLocation(LatLng(position.latitude, position.longitude));
  }

  void _pickSuggestion(PlacePickResultEntity place) {
    _autocompleteFocusNode?.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();

    context
        .read<PlacePickerBloc>()
        .add(const PlacePickerEvent.clearSuggestions());

    _applyLocation(LatLng(place.latitude, place.longitude));
  }

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final bottomPad = MediaQuery.of(context).padding.bottom;
    final sheetHeight = 0.85.sh;

    return Container(
      height: sheetHeight,
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 6.h),
            child: Container(
              width: 36.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: colors.borderColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 2.h, 12.w, 10.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Select Delivery Location',
                    style: textStyle.bodyMediumBold.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: colors.text,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: colors.backgroundGray,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: colors.textMedium,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 10.h),
            child: _buildSearchBar(colors),
          ),

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: MapLibreMap(
                      styleString:
                          'https://map.barikoi.com/styles/osm-liberty/style.json'
                          '?key=${ApiEndpoints.barikoiApiKey}',
                      initialCameraPosition: const CameraPosition(
                        target: _kDefaultLatLng,
                        zoom: 12,
                      ),
                      trackCameraPosition: true,
                      compassEnabled: false,
                      onMapCreated: _onMapCreated,
                      onStyleLoadedCallback: _onStyleLoaded,
                    ),
                  ),

                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: _buildMyLocationButton(colors),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: _buildBottomPanel(
                      colors,
                      textStyle,
                      bottomInset > 0 ? bottomInset : bottomPad,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(AppColors colors) {
    return Autocomplete<PlacePickResultEntity>(
      displayStringForOption: (place) => place.address ?? '',
      optionsBuilder: (TextEditingValue value) async {
        if (value.text.isEmpty) {
          context
              .read<PlacePickerBloc>()
              .add(const PlacePickerEvent.clearSuggestions());
          return const Iterable<PlacePickResultEntity>.empty();
        }
        context
            .read<PlacePickerBloc>()
            .add(PlacePickerEvent.search(query: value.text));
        final next = await context
            .read<PlacePickerBloc>()
            .stream
            .firstWhere((s) => s.status != PlacePickerStatus.searching);
        return next.suggestions;
      },
      onSelected: _pickSuggestion,
      fieldViewBuilder: (_, controller, focusNode, onFieldSubmitted) {
        _autocompleteFocusNode = focusNode;
        return _buildSearchField(colors, controller, focusNode, onFieldSubmitted);
      },
      optionsViewBuilder: (_, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8.r),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 240.h,
                  maxWidth: MediaQuery.of(context).size.width - 32.w,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  separatorBuilder: (_, __) =>
                      Divider(height: 1, indent: 48.w),
                  itemBuilder: (_, i) {
                    final place = options.elementAt(i);
                    return PlaceSuggestionTile(
                      place: place,
                      onTap: () => onSelected(place),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchField(
    AppColors colors,
    TextEditingController controller,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  ) {
    return BlocBuilder<PlacePickerBloc, PlacePickerState>(
      buildWhen: (p, c) => c.status != p.status,
      builder: (_, state) {
        final isSearching = state.status == PlacePickerStatus.searching;

        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (_) => onFieldSubmitted(),
          style: context.textStyle.productDescription.withColor(colors.text),
          decoration: InputDecoration(
            hintText: 'Search for an area or address...',
            hintStyle: context.textStyle.productDescription.withColor(colors.textMedium),
            filled: true,
            fillColor: colors.whiteSmoke,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Icon(
                Icons.search_rounded,
                color: colors.textMedium,
                size: 20.sp,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: isSearching
                  ? SizedBox(
                      width: 18.w,
                      height: 18.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.primary,
                      ),
                    )
                  : controller.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            controller.clear();
                            focusNode.unfocus();
                            context.read<PlacePickerBloc>().add(
                                  const PlacePickerEvent.clearSuggestions(),
                                );
                          },
                          child: Icon(
                            Icons.cancel_rounded,
                            size: 18.sp,
                            color: colors.textMedium,
                          ),
                        )
                      : SizedBox(width: 18.w),
            ),
            suffixIconConstraints: const BoxConstraints(),
            contentPadding: EdgeInsets.symmetric(vertical: 13.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23.r),
              borderSide: BorderSide(color: colors.borderColor, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23.r),
              borderSide: BorderSide(color: colors.primary, width: 1.5.w),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMyLocationButton(AppColors colors) {
    return GestureDetector(
      onTap: _goToCurrentLocation,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _locating
            ? Padding(
                padding: EdgeInsets.all(11.w),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colors.primary,
                ),
              )
            : Icon(Icons.my_location, size: 20.sp, color: colors.primary),
      ),
    );
  }

  Widget _buildBottomPanel(
    AppColors colors,
    AppTextStyles textStyle,
    double bottomPad,
  ) {
    return BlocBuilder<PlacePickerBloc, PlacePickerState>(
      buildWhen: (prev, curr) =>
          curr.selectedPlace != prev.selectedPlace ||
          curr.status != prev.status,
      builder: (context, state) {
        final place = state.selectedPlace;
        final isLoading = state.status == PlacePickerStatus.reverseGeocoding;
        final canConfirm = !isLoading && place != null;

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colors.white.withAlpha(0),
                colors.white.withAlpha(200),
                colors.white,
              ],
              stops: const [0.0, 0.22, 0.45],
            ),
          ),
          padding: EdgeInsets.fromLTRB(16.w, 28.h, 16.w, bottomPad + 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (place != null || isLoading) ...[
                _buildAddressCard(colors, textStyle, place, isLoading),
                SizedBox(height: 10.h),
              ],

              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: canConfirm
                      ? () => Navigator.of(context).pop(place)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    disabledBackgroundColor: colors.primary.withAlpha(100),
                    foregroundColor: colors.white,
                    elevation: canConfirm ? 4 : 0,
                    shadowColor: colors.primary.withAlpha(80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: colors.white.withAlpha(180),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              canConfirm
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              size: 18.sp,
                              color: canConfirm
                                  ? colors.green
                                  : colors.white.withAlpha(140),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Confirm Location',
                              style: textStyle.bodyMediumBold.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressCard(
    AppColors colors,
    AppTextStyles textStyle,
    PlacePickResultEntity? place,
    bool isLoading,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: colors.black.withValues(alpha: 0.07),
            blurRadius: 14,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: colors.primary.withAlpha(20),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.location_on_rounded,
                color: colors.primary, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: isLoading
                ? _buildLoadingSkeleton(colors)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        place?.address ?? 'Selected location',
                        style: textStyle.bodyMediumBold.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colors.text,
                          fontSize: 13.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if ((place?.area ?? '').isNotEmpty ||
                          (place?.city ?? '').isNotEmpty) ...[
                        SizedBox(height: 2.h),
                        Text(
                          [place?.area, place?.city]
                              .where((s) => s != null && s.isNotEmpty)
                              .join(', '),
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
        ],
      ),
    );
  }

  Widget _buildLoadingSkeleton(AppColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 14.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.borderColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          height: 12.h,
          width: 120.w,
          decoration: BoxDecoration(
            color: colors.backgroundGray,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }
}
