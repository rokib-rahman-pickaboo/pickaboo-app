// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_picker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PlacePickerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(double latitude, double longitude) reverseGeocode,
    required TResult Function() clearSuggestions,
    required TResult Function() clearSelectedPlace,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(double latitude, double longitude)? reverseGeocode,
    TResult? Function()? clearSuggestions,
    TResult? Function()? clearSelectedPlace,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(double latitude, double longitude)? reverseGeocode,
    TResult Function()? clearSuggestions,
    TResult Function()? clearSelectedPlace,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ReverseGeocode value) reverseGeocode,
    required TResult Function(_ClearSuggestions value) clearSuggestions,
    required TResult Function(_ClearSelectedPlace value) clearSelectedPlace,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ReverseGeocode value)? reverseGeocode,
    TResult? Function(_ClearSuggestions value)? clearSuggestions,
    TResult? Function(_ClearSelectedPlace value)? clearSelectedPlace,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ReverseGeocode value)? reverseGeocode,
    TResult Function(_ClearSuggestions value)? clearSuggestions,
    TResult Function(_ClearSelectedPlace value)? clearSelectedPlace,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePickerEventCopyWith<$Res> {
  factory $PlacePickerEventCopyWith(
    PlacePickerEvent value,
    $Res Function(PlacePickerEvent) then,
  ) = _$PlacePickerEventCopyWithImpl<$Res, PlacePickerEvent>;
}

/// @nodoc
class _$PlacePickerEventCopyWithImpl<$Res, $Val extends PlacePickerEvent>
    implements $PlacePickerEventCopyWith<$Res> {
  _$PlacePickerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
    _$SearchImpl value,
    $Res Function(_$SearchImpl) then,
  ) = __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$PlacePickerEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
    _$SearchImpl _value,
    $Res Function(_$SearchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$SearchImpl(
        query:
            null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchImpl with DiagnosticableTreeMixin implements _Search {
  const _$SearchImpl({required this.query});

  @override
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlacePickerEvent.search(query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlacePickerEvent.search'))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(double latitude, double longitude) reverseGeocode,
    required TResult Function() clearSuggestions,
    required TResult Function() clearSelectedPlace,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(double latitude, double longitude)? reverseGeocode,
    TResult? Function()? clearSuggestions,
    TResult? Function()? clearSelectedPlace,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(double latitude, double longitude)? reverseGeocode,
    TResult Function()? clearSuggestions,
    TResult Function()? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ReverseGeocode value) reverseGeocode,
    required TResult Function(_ClearSuggestions value) clearSuggestions,
    required TResult Function(_ClearSelectedPlace value) clearSelectedPlace,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ReverseGeocode value)? reverseGeocode,
    TResult? Function(_ClearSuggestions value)? clearSuggestions,
    TResult? Function(_ClearSelectedPlace value)? clearSelectedPlace,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ReverseGeocode value)? reverseGeocode,
    TResult Function(_ClearSuggestions value)? clearSuggestions,
    TResult Function(_ClearSelectedPlace value)? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements PlacePickerEvent {
  const factory _Search({required final String query}) = _$SearchImpl;

  String get query;

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReverseGeocodeImplCopyWith<$Res> {
  factory _$$ReverseGeocodeImplCopyWith(
    _$ReverseGeocodeImpl value,
    $Res Function(_$ReverseGeocodeImpl) then,
  ) = __$$ReverseGeocodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$ReverseGeocodeImplCopyWithImpl<$Res>
    extends _$PlacePickerEventCopyWithImpl<$Res, _$ReverseGeocodeImpl>
    implements _$$ReverseGeocodeImplCopyWith<$Res> {
  __$$ReverseGeocodeImplCopyWithImpl(
    _$ReverseGeocodeImpl _value,
    $Res Function(_$ReverseGeocodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = null, Object? longitude = null}) {
    return _then(
      _$ReverseGeocodeImpl(
        latitude:
            null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as double,
        longitude:
            null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc

class _$ReverseGeocodeImpl
    with DiagnosticableTreeMixin
    implements _ReverseGeocode {
  const _$ReverseGeocodeImpl({required this.latitude, required this.longitude});

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlacePickerEvent.reverseGeocode(latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlacePickerEvent.reverseGeocode'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeocodeImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeocodeImplCopyWith<_$ReverseGeocodeImpl> get copyWith =>
      __$$ReverseGeocodeImplCopyWithImpl<_$ReverseGeocodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(double latitude, double longitude) reverseGeocode,
    required TResult Function() clearSuggestions,
    required TResult Function() clearSelectedPlace,
  }) {
    return reverseGeocode(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(double latitude, double longitude)? reverseGeocode,
    TResult? Function()? clearSuggestions,
    TResult? Function()? clearSelectedPlace,
  }) {
    return reverseGeocode?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(double latitude, double longitude)? reverseGeocode,
    TResult Function()? clearSuggestions,
    TResult Function()? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (reverseGeocode != null) {
      return reverseGeocode(latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ReverseGeocode value) reverseGeocode,
    required TResult Function(_ClearSuggestions value) clearSuggestions,
    required TResult Function(_ClearSelectedPlace value) clearSelectedPlace,
  }) {
    return reverseGeocode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ReverseGeocode value)? reverseGeocode,
    TResult? Function(_ClearSuggestions value)? clearSuggestions,
    TResult? Function(_ClearSelectedPlace value)? clearSelectedPlace,
  }) {
    return reverseGeocode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ReverseGeocode value)? reverseGeocode,
    TResult Function(_ClearSuggestions value)? clearSuggestions,
    TResult Function(_ClearSelectedPlace value)? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (reverseGeocode != null) {
      return reverseGeocode(this);
    }
    return orElse();
  }
}

abstract class _ReverseGeocode implements PlacePickerEvent {
  const factory _ReverseGeocode({
    required final double latitude,
    required final double longitude,
  }) = _$ReverseGeocodeImpl;

  double get latitude;
  double get longitude;

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseGeocodeImplCopyWith<_$ReverseGeocodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSuggestionsImplCopyWith<$Res> {
  factory _$$ClearSuggestionsImplCopyWith(
    _$ClearSuggestionsImpl value,
    $Res Function(_$ClearSuggestionsImpl) then,
  ) = __$$ClearSuggestionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSuggestionsImplCopyWithImpl<$Res>
    extends _$PlacePickerEventCopyWithImpl<$Res, _$ClearSuggestionsImpl>
    implements _$$ClearSuggestionsImplCopyWith<$Res> {
  __$$ClearSuggestionsImplCopyWithImpl(
    _$ClearSuggestionsImpl _value,
    $Res Function(_$ClearSuggestionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSuggestionsImpl
    with DiagnosticableTreeMixin
    implements _ClearSuggestions {
  const _$ClearSuggestionsImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlacePickerEvent.clearSuggestions()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlacePickerEvent.clearSuggestions'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSuggestionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(double latitude, double longitude) reverseGeocode,
    required TResult Function() clearSuggestions,
    required TResult Function() clearSelectedPlace,
  }) {
    return clearSuggestions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(double latitude, double longitude)? reverseGeocode,
    TResult? Function()? clearSuggestions,
    TResult? Function()? clearSelectedPlace,
  }) {
    return clearSuggestions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(double latitude, double longitude)? reverseGeocode,
    TResult Function()? clearSuggestions,
    TResult Function()? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (clearSuggestions != null) {
      return clearSuggestions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ReverseGeocode value) reverseGeocode,
    required TResult Function(_ClearSuggestions value) clearSuggestions,
    required TResult Function(_ClearSelectedPlace value) clearSelectedPlace,
  }) {
    return clearSuggestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ReverseGeocode value)? reverseGeocode,
    TResult? Function(_ClearSuggestions value)? clearSuggestions,
    TResult? Function(_ClearSelectedPlace value)? clearSelectedPlace,
  }) {
    return clearSuggestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ReverseGeocode value)? reverseGeocode,
    TResult Function(_ClearSuggestions value)? clearSuggestions,
    TResult Function(_ClearSelectedPlace value)? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (clearSuggestions != null) {
      return clearSuggestions(this);
    }
    return orElse();
  }
}

abstract class _ClearSuggestions implements PlacePickerEvent {
  const factory _ClearSuggestions() = _$ClearSuggestionsImpl;
}

/// @nodoc
abstract class _$$ClearSelectedPlaceImplCopyWith<$Res> {
  factory _$$ClearSelectedPlaceImplCopyWith(
    _$ClearSelectedPlaceImpl value,
    $Res Function(_$ClearSelectedPlaceImpl) then,
  ) = __$$ClearSelectedPlaceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectedPlaceImplCopyWithImpl<$Res>
    extends _$PlacePickerEventCopyWithImpl<$Res, _$ClearSelectedPlaceImpl>
    implements _$$ClearSelectedPlaceImplCopyWith<$Res> {
  __$$ClearSelectedPlaceImplCopyWithImpl(
    _$ClearSelectedPlaceImpl _value,
    $Res Function(_$ClearSelectedPlaceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacePickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSelectedPlaceImpl
    with DiagnosticableTreeMixin
    implements _ClearSelectedPlace {
  const _$ClearSelectedPlaceImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlacePickerEvent.clearSelectedPlace()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlacePickerEvent.clearSelectedPlace'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectedPlaceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) search,
    required TResult Function(double latitude, double longitude) reverseGeocode,
    required TResult Function() clearSuggestions,
    required TResult Function() clearSelectedPlace,
  }) {
    return clearSelectedPlace();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? search,
    TResult? Function(double latitude, double longitude)? reverseGeocode,
    TResult? Function()? clearSuggestions,
    TResult? Function()? clearSelectedPlace,
  }) {
    return clearSelectedPlace?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? search,
    TResult Function(double latitude, double longitude)? reverseGeocode,
    TResult Function()? clearSuggestions,
    TResult Function()? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (clearSelectedPlace != null) {
      return clearSelectedPlace();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Search value) search,
    required TResult Function(_ReverseGeocode value) reverseGeocode,
    required TResult Function(_ClearSuggestions value) clearSuggestions,
    required TResult Function(_ClearSelectedPlace value) clearSelectedPlace,
  }) {
    return clearSelectedPlace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Search value)? search,
    TResult? Function(_ReverseGeocode value)? reverseGeocode,
    TResult? Function(_ClearSuggestions value)? clearSuggestions,
    TResult? Function(_ClearSelectedPlace value)? clearSelectedPlace,
  }) {
    return clearSelectedPlace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Search value)? search,
    TResult Function(_ReverseGeocode value)? reverseGeocode,
    TResult Function(_ClearSuggestions value)? clearSuggestions,
    TResult Function(_ClearSelectedPlace value)? clearSelectedPlace,
    required TResult orElse(),
  }) {
    if (clearSelectedPlace != null) {
      return clearSelectedPlace(this);
    }
    return orElse();
  }
}

abstract class _ClearSelectedPlace implements PlacePickerEvent {
  const factory _ClearSelectedPlace() = _$ClearSelectedPlaceImpl;
}

/// @nodoc
mixin _$PlacePickerState {
  PlacePickerStatus get status => throw _privateConstructorUsedError;
  List<PlacePickResultEntity> get suggestions =>
      throw _privateConstructorUsedError;
  PlacePickResultEntity? get selectedPlace =>
      throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;

  /// Create a copy of PlacePickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacePickerStateCopyWith<PlacePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePickerStateCopyWith<$Res> {
  factory $PlacePickerStateCopyWith(
    PlacePickerState value,
    $Res Function(PlacePickerState) then,
  ) = _$PlacePickerStateCopyWithImpl<$Res, PlacePickerState>;
  @useResult
  $Res call({
    PlacePickerStatus status,
    List<PlacePickResultEntity> suggestions,
    PlacePickResultEntity? selectedPlace,
    AppErrorEntity? error,
  });
}

/// @nodoc
class _$PlacePickerStateCopyWithImpl<$Res, $Val extends PlacePickerState>
    implements $PlacePickerStateCopyWith<$Res> {
  _$PlacePickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacePickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? suggestions = null,
    Object? selectedPlace = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as PlacePickerStatus,
            suggestions:
                null == suggestions
                    ? _value.suggestions
                    : suggestions // ignore: cast_nullable_to_non_nullable
                        as List<PlacePickResultEntity>,
            selectedPlace:
                freezed == selectedPlace
                    ? _value.selectedPlace
                    : selectedPlace // ignore: cast_nullable_to_non_nullable
                        as PlacePickResultEntity?,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlacePickerStateImplCopyWith<$Res>
    implements $PlacePickerStateCopyWith<$Res> {
  factory _$$PlacePickerStateImplCopyWith(
    _$PlacePickerStateImpl value,
    $Res Function(_$PlacePickerStateImpl) then,
  ) = __$$PlacePickerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PlacePickerStatus status,
    List<PlacePickResultEntity> suggestions,
    PlacePickResultEntity? selectedPlace,
    AppErrorEntity? error,
  });
}

/// @nodoc
class __$$PlacePickerStateImplCopyWithImpl<$Res>
    extends _$PlacePickerStateCopyWithImpl<$Res, _$PlacePickerStateImpl>
    implements _$$PlacePickerStateImplCopyWith<$Res> {
  __$$PlacePickerStateImplCopyWithImpl(
    _$PlacePickerStateImpl _value,
    $Res Function(_$PlacePickerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacePickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? suggestions = null,
    Object? selectedPlace = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$PlacePickerStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as PlacePickerStatus,
        suggestions:
            null == suggestions
                ? _value._suggestions
                : suggestions // ignore: cast_nullable_to_non_nullable
                    as List<PlacePickResultEntity>,
        selectedPlace:
            freezed == selectedPlace
                ? _value.selectedPlace
                : selectedPlace // ignore: cast_nullable_to_non_nullable
                    as PlacePickResultEntity?,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
      ),
    );
  }
}

/// @nodoc

class _$PlacePickerStateImpl
    with DiagnosticableTreeMixin
    implements _PlacePickerState {
  const _$PlacePickerStateImpl({
    this.status = PlacePickerStatus.initial,
    final List<PlacePickResultEntity> suggestions = const [],
    this.selectedPlace,
    this.error,
  }) : _suggestions = suggestions;

  @override
  @JsonKey()
  final PlacePickerStatus status;
  final List<PlacePickResultEntity> _suggestions;
  @override
  @JsonKey()
  List<PlacePickResultEntity> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  final PlacePickResultEntity? selectedPlace;
  @override
  final AppErrorEntity? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlacePickerState(status: $status, suggestions: $suggestions, selectedPlace: $selectedPlace, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlacePickerState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('suggestions', suggestions))
      ..add(DiagnosticsProperty('selectedPlace', selectedPlace))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacePickerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._suggestions,
              _suggestions,
            ) &&
            (identical(other.selectedPlace, selectedPlace) ||
                other.selectedPlace == selectedPlace) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_suggestions),
    selectedPlace,
    error,
  );

  /// Create a copy of PlacePickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacePickerStateImplCopyWith<_$PlacePickerStateImpl> get copyWith =>
      __$$PlacePickerStateImplCopyWithImpl<_$PlacePickerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PlacePickerState implements PlacePickerState {
  const factory _PlacePickerState({
    final PlacePickerStatus status,
    final List<PlacePickResultEntity> suggestions,
    final PlacePickResultEntity? selectedPlace,
    final AppErrorEntity? error,
  }) = _$PlacePickerStateImpl;

  @override
  PlacePickerStatus get status;
  @override
  List<PlacePickResultEntity> get suggestions;
  @override
  PlacePickResultEntity? get selectedPlace;
  @override
  AppErrorEntity? get error;

  /// Create a copy of PlacePickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacePickerStateImplCopyWith<_$PlacePickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
