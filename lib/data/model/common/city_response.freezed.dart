// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) {
  return _CityResponse.fromJson(json);
}

/// @nodoc
mixin _$CityResponse {
  @JsonKey(name: "entity_id")
  String? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "states_name")
  String? get statesName => throw _privateConstructorUsedError;
  @JsonKey(name: "cities_name")
  String? get citiesName => throw _privateConstructorUsedError;

  /// Serializes this CityResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityResponseCopyWith<CityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityResponseCopyWith<$Res> {
  factory $CityResponseCopyWith(
    CityResponse value,
    $Res Function(CityResponse) then,
  ) = _$CityResponseCopyWithImpl<$Res, CityResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "states_name") String? statesName,
    @JsonKey(name: "cities_name") String? citiesName,
  });
}

/// @nodoc
class _$CityResponseCopyWithImpl<$Res, $Val extends CityResponse>
    implements $CityResponseCopyWith<$Res> {
  _$CityResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? statesName = freezed,
    Object? citiesName = freezed,
  }) {
    return _then(
      _value.copyWith(
            entityId:
                freezed == entityId
                    ? _value.entityId
                    : entityId // ignore: cast_nullable_to_non_nullable
                        as String?,
            statesName:
                freezed == statesName
                    ? _value.statesName
                    : statesName // ignore: cast_nullable_to_non_nullable
                        as String?,
            citiesName:
                freezed == citiesName
                    ? _value.citiesName
                    : citiesName // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CityResponseImplCopyWith<$Res>
    implements $CityResponseCopyWith<$Res> {
  factory _$$CityResponseImplCopyWith(
    _$CityResponseImpl value,
    $Res Function(_$CityResponseImpl) then,
  ) = __$$CityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "states_name") String? statesName,
    @JsonKey(name: "cities_name") String? citiesName,
  });
}

/// @nodoc
class __$$CityResponseImplCopyWithImpl<$Res>
    extends _$CityResponseCopyWithImpl<$Res, _$CityResponseImpl>
    implements _$$CityResponseImplCopyWith<$Res> {
  __$$CityResponseImplCopyWithImpl(
    _$CityResponseImpl _value,
    $Res Function(_$CityResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? statesName = freezed,
    Object? citiesName = freezed,
  }) {
    return _then(
      _$CityResponseImpl(
        entityId:
            freezed == entityId
                ? _value.entityId
                : entityId // ignore: cast_nullable_to_non_nullable
                    as String?,
        statesName:
            freezed == statesName
                ? _value.statesName
                : statesName // ignore: cast_nullable_to_non_nullable
                    as String?,
        citiesName:
            freezed == citiesName
                ? _value.citiesName
                : citiesName // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CityResponseImpl implements _CityResponse {
  const _$CityResponseImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "states_name") this.statesName,
    @JsonKey(name: "cities_name") this.citiesName,
  });

  factory _$CityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityResponseImplFromJson(json);

  @override
  @JsonKey(name: "entity_id")
  final String? entityId;
  @override
  @JsonKey(name: "states_name")
  final String? statesName;
  @override
  @JsonKey(name: "cities_name")
  final String? citiesName;

  @override
  String toString() {
    return 'CityResponse(entityId: $entityId, statesName: $statesName, citiesName: $citiesName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityResponseImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.statesName, statesName) ||
                other.statesName == statesName) &&
            (identical(other.citiesName, citiesName) ||
                other.citiesName == citiesName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, entityId, statesName, citiesName);

  /// Create a copy of CityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityResponseImplCopyWith<_$CityResponseImpl> get copyWith =>
      __$$CityResponseImplCopyWithImpl<_$CityResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityResponseImplToJson(this);
  }
}

abstract class _CityResponse implements CityResponse {
  const factory _CityResponse({
    @JsonKey(name: "entity_id") final String? entityId,
    @JsonKey(name: "states_name") final String? statesName,
    @JsonKey(name: "cities_name") final String? citiesName,
  }) = _$CityResponseImpl;

  factory _CityResponse.fromJson(Map<String, dynamic> json) =
      _$CityResponseImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  String? get entityId;
  @override
  @JsonKey(name: "states_name")
  String? get statesName;
  @override
  @JsonKey(name: "cities_name")
  String? get citiesName;

  /// Create a copy of CityResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityResponseImplCopyWith<_$CityResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
