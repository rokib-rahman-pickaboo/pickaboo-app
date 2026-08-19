// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String division) loadCities,
    required TResult Function(String city) loadAreas,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String division)? loadCities,
    TResult? Function(String city)? loadAreas,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String division)? loadCities,
    TResult Function(String city)? loadAreas,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCities value) loadCities,
    required TResult Function(_LoadAreas value) loadAreas,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCities value)? loadCities,
    TResult? Function(_LoadAreas value)? loadAreas,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCities value)? loadCities,
    TResult Function(_LoadAreas value)? loadAreas,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressEventCopyWith<$Res> {
  factory $AddressEventCopyWith(
    AddressEvent value,
    $Res Function(AddressEvent) then,
  ) = _$AddressEventCopyWithImpl<$Res, AddressEvent>;
}

/// @nodoc
class _$AddressEventCopyWithImpl<$Res, $Val extends AddressEvent>
    implements $AddressEventCopyWith<$Res> {
  _$AddressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadCitiesImplCopyWith<$Res> {
  factory _$$LoadCitiesImplCopyWith(
    _$LoadCitiesImpl value,
    $Res Function(_$LoadCitiesImpl) then,
  ) = __$$LoadCitiesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String division});
}

/// @nodoc
class __$$LoadCitiesImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$LoadCitiesImpl>
    implements _$$LoadCitiesImplCopyWith<$Res> {
  __$$LoadCitiesImplCopyWithImpl(
    _$LoadCitiesImpl _value,
    $Res Function(_$LoadCitiesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? division = null}) {
    return _then(
      _$LoadCitiesImpl(
        division:
            null == division
                ? _value.division
                : division // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadCitiesImpl with DiagnosticableTreeMixin implements _LoadCities {
  const _$LoadCitiesImpl({required this.division});

  @override
  final String division;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddressEvent.loadCities(division: $division)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddressEvent.loadCities'))
      ..add(DiagnosticsProperty('division', division));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCitiesImpl &&
            (identical(other.division, division) ||
                other.division == division));
  }

  @override
  int get hashCode => Object.hash(runtimeType, division);

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCitiesImplCopyWith<_$LoadCitiesImpl> get copyWith =>
      __$$LoadCitiesImplCopyWithImpl<_$LoadCitiesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String division) loadCities,
    required TResult Function(String city) loadAreas,
  }) {
    return loadCities(division);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String division)? loadCities,
    TResult? Function(String city)? loadAreas,
  }) {
    return loadCities?.call(division);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String division)? loadCities,
    TResult Function(String city)? loadAreas,
    required TResult orElse(),
  }) {
    if (loadCities != null) {
      return loadCities(division);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCities value) loadCities,
    required TResult Function(_LoadAreas value) loadAreas,
  }) {
    return loadCities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCities value)? loadCities,
    TResult? Function(_LoadAreas value)? loadAreas,
  }) {
    return loadCities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCities value)? loadCities,
    TResult Function(_LoadAreas value)? loadAreas,
    required TResult orElse(),
  }) {
    if (loadCities != null) {
      return loadCities(this);
    }
    return orElse();
  }
}

abstract class _LoadCities implements AddressEvent {
  const factory _LoadCities({required final String division}) =
      _$LoadCitiesImpl;

  String get division;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadCitiesImplCopyWith<_$LoadCitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAreasImplCopyWith<$Res> {
  factory _$$LoadAreasImplCopyWith(
    _$LoadAreasImpl value,
    $Res Function(_$LoadAreasImpl) then,
  ) = __$$LoadAreasImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String city});
}

/// @nodoc
class __$$LoadAreasImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$LoadAreasImpl>
    implements _$$LoadAreasImplCopyWith<$Res> {
  __$$LoadAreasImplCopyWithImpl(
    _$LoadAreasImpl _value,
    $Res Function(_$LoadAreasImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? city = null}) {
    return _then(
      _$LoadAreasImpl(
        city:
            null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadAreasImpl with DiagnosticableTreeMixin implements _LoadAreas {
  const _$LoadAreasImpl({required this.city});

  @override
  final String city;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddressEvent.loadAreas(city: $city)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddressEvent.loadAreas'))
      ..add(DiagnosticsProperty('city', city));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAreasImpl &&
            (identical(other.city, city) || other.city == city));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city);

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAreasImplCopyWith<_$LoadAreasImpl> get copyWith =>
      __$$LoadAreasImplCopyWithImpl<_$LoadAreasImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String division) loadCities,
    required TResult Function(String city) loadAreas,
  }) {
    return loadAreas(city);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String division)? loadCities,
    TResult? Function(String city)? loadAreas,
  }) {
    return loadAreas?.call(city);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String division)? loadCities,
    TResult Function(String city)? loadAreas,
    required TResult orElse(),
  }) {
    if (loadAreas != null) {
      return loadAreas(city);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadCities value) loadCities,
    required TResult Function(_LoadAreas value) loadAreas,
  }) {
    return loadAreas(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadCities value)? loadCities,
    TResult? Function(_LoadAreas value)? loadAreas,
  }) {
    return loadAreas?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadCities value)? loadCities,
    TResult Function(_LoadAreas value)? loadAreas,
    required TResult orElse(),
  }) {
    if (loadAreas != null) {
      return loadAreas(this);
    }
    return orElse();
  }
}

abstract class _LoadAreas implements AddressEvent {
  const factory _LoadAreas({required final String city}) = _$LoadAreasImpl;

  String get city;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadAreasImplCopyWith<_$LoadAreasImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddressState {
  bool get isLoadingCities => throw _privateConstructorUsedError;
  bool get isLoadingAreas => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get cities => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get areas => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
    AddressState value,
    $Res Function(AddressState) then,
  ) = _$AddressStateCopyWithImpl<$Res, AddressState>;
  @useResult
  $Res call({
    bool isLoadingCities,
    bool isLoadingAreas,
    List<Map<String, dynamic>> cities,
    List<Map<String, dynamic>> areas,
    String? error,
  });
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingCities = null,
    Object? isLoadingAreas = null,
    Object? cities = null,
    Object? areas = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoadingCities:
                null == isLoadingCities
                    ? _value.isLoadingCities
                    : isLoadingCities // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoadingAreas:
                null == isLoadingAreas
                    ? _value.isLoadingAreas
                    : isLoadingAreas // ignore: cast_nullable_to_non_nullable
                        as bool,
            cities:
                null == cities
                    ? _value.cities
                    : cities // ignore: cast_nullable_to_non_nullable
                        as List<Map<String, dynamic>>,
            areas:
                null == areas
                    ? _value.areas
                    : areas // ignore: cast_nullable_to_non_nullable
                        as List<Map<String, dynamic>>,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddressStateImplCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$$AddressStateImplCopyWith(
    _$AddressStateImpl value,
    $Res Function(_$AddressStateImpl) then,
  ) = __$$AddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoadingCities,
    bool isLoadingAreas,
    List<Map<String, dynamic>> cities,
    List<Map<String, dynamic>> areas,
    String? error,
  });
}

/// @nodoc
class __$$AddressStateImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateImpl>
    implements _$$AddressStateImplCopyWith<$Res> {
  __$$AddressStateImplCopyWithImpl(
    _$AddressStateImpl _value,
    $Res Function(_$AddressStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingCities = null,
    Object? isLoadingAreas = null,
    Object? cities = null,
    Object? areas = null,
    Object? error = freezed,
  }) {
    return _then(
      _$AddressStateImpl(
        isLoadingCities:
            null == isLoadingCities
                ? _value.isLoadingCities
                : isLoadingCities // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoadingAreas:
            null == isLoadingAreas
                ? _value.isLoadingAreas
                : isLoadingAreas // ignore: cast_nullable_to_non_nullable
                    as bool,
        cities:
            null == cities
                ? _value._cities
                : cities // ignore: cast_nullable_to_non_nullable
                    as List<Map<String, dynamic>>,
        areas:
            null == areas
                ? _value._areas
                : areas // ignore: cast_nullable_to_non_nullable
                    as List<Map<String, dynamic>>,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$AddressStateImpl with DiagnosticableTreeMixin implements _AddressState {
  const _$AddressStateImpl({
    this.isLoadingCities = false,
    this.isLoadingAreas = false,
    final List<Map<String, dynamic>> cities = const [],
    final List<Map<String, dynamic>> areas = const [],
    this.error,
  }) : _cities = cities,
       _areas = areas;

  @override
  @JsonKey()
  final bool isLoadingCities;
  @override
  @JsonKey()
  final bool isLoadingAreas;
  final List<Map<String, dynamic>> _cities;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  final List<Map<String, dynamic>> _areas;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get areas {
    if (_areas is EqualUnmodifiableListView) return _areas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areas);
  }

  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddressState(isLoadingCities: $isLoadingCities, isLoadingAreas: $isLoadingAreas, cities: $cities, areas: $areas, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddressState'))
      ..add(DiagnosticsProperty('isLoadingCities', isLoadingCities))
      ..add(DiagnosticsProperty('isLoadingAreas', isLoadingAreas))
      ..add(DiagnosticsProperty('cities', cities))
      ..add(DiagnosticsProperty('areas', areas))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateImpl &&
            (identical(other.isLoadingCities, isLoadingCities) ||
                other.isLoadingCities == isLoadingCities) &&
            (identical(other.isLoadingAreas, isLoadingAreas) ||
                other.isLoadingAreas == isLoadingAreas) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality().equals(other._areas, _areas) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoadingCities,
    isLoadingAreas,
    const DeepCollectionEquality().hash(_cities),
    const DeepCollectionEquality().hash(_areas),
    error,
  );

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      __$$AddressStateImplCopyWithImpl<_$AddressStateImpl>(this, _$identity);
}

abstract class _AddressState implements AddressState {
  const factory _AddressState({
    final bool isLoadingCities,
    final bool isLoadingAreas,
    final List<Map<String, dynamic>> cities,
    final List<Map<String, dynamic>> areas,
    final String? error,
  }) = _$AddressStateImpl;

  @override
  bool get isLoadingCities;
  @override
  bool get isLoadingAreas;
  @override
  List<Map<String, dynamic>> get cities;
  @override
  List<Map<String, dynamic>> get areas;
  @override
  String? get error;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
