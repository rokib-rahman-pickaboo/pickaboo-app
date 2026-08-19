// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'area_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AreaResponse _$AreaResponseFromJson(Map<String, dynamic> json) {
  return _AreaResponse.fromJson(json);
}

/// @nodoc
mixin _$AreaResponse {
  @JsonKey(name: "entity_id")
  String? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: "states_name")
  String? get statesName => throw _privateConstructorUsedError;
  @JsonKey(name: "cities_name")
  String? get citiesName => throw _privateConstructorUsedError;
  @JsonKey(name: "zip_code")
  String? get zipCode => throw _privateConstructorUsedError;

  /// Serializes this AreaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AreaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AreaResponseCopyWith<AreaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaResponseCopyWith<$Res> {
  factory $AreaResponseCopyWith(
    AreaResponse value,
    $Res Function(AreaResponse) then,
  ) = _$AreaResponseCopyWithImpl<$Res, AreaResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "states_name") String? statesName,
    @JsonKey(name: "cities_name") String? citiesName,
    @JsonKey(name: "zip_code") String? zipCode,
  });
}

/// @nodoc
class _$AreaResponseCopyWithImpl<$Res, $Val extends AreaResponse>
    implements $AreaResponseCopyWith<$Res> {
  _$AreaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AreaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? statesName = freezed,
    Object? citiesName = freezed,
    Object? zipCode = freezed,
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
            zipCode:
                freezed == zipCode
                    ? _value.zipCode
                    : zipCode // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AreaResponseImplCopyWith<$Res>
    implements $AreaResponseCopyWith<$Res> {
  factory _$$AreaResponseImplCopyWith(
    _$AreaResponseImpl value,
    $Res Function(_$AreaResponseImpl) then,
  ) = __$$AreaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "entity_id") String? entityId,
    @JsonKey(name: "states_name") String? statesName,
    @JsonKey(name: "cities_name") String? citiesName,
    @JsonKey(name: "zip_code") String? zipCode,
  });
}

/// @nodoc
class __$$AreaResponseImplCopyWithImpl<$Res>
    extends _$AreaResponseCopyWithImpl<$Res, _$AreaResponseImpl>
    implements _$$AreaResponseImplCopyWith<$Res> {
  __$$AreaResponseImplCopyWithImpl(
    _$AreaResponseImpl _value,
    $Res Function(_$AreaResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AreaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? statesName = freezed,
    Object? citiesName = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(
      _$AreaResponseImpl(
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
        zipCode:
            freezed == zipCode
                ? _value.zipCode
                : zipCode // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AreaResponseImpl implements _AreaResponse {
  const _$AreaResponseImpl({
    @JsonKey(name: "entity_id") this.entityId,
    @JsonKey(name: "states_name") this.statesName,
    @JsonKey(name: "cities_name") this.citiesName,
    @JsonKey(name: "zip_code") this.zipCode,
  });

  factory _$AreaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AreaResponseImplFromJson(json);

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
  @JsonKey(name: "zip_code")
  final String? zipCode;

  @override
  String toString() {
    return 'AreaResponse(entityId: $entityId, statesName: $statesName, citiesName: $citiesName, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AreaResponseImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.statesName, statesName) ||
                other.statesName == statesName) &&
            (identical(other.citiesName, citiesName) ||
                other.citiesName == citiesName) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, entityId, statesName, citiesName, zipCode);

  /// Create a copy of AreaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AreaResponseImplCopyWith<_$AreaResponseImpl> get copyWith =>
      __$$AreaResponseImplCopyWithImpl<_$AreaResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AreaResponseImplToJson(this);
  }
}

abstract class _AreaResponse implements AreaResponse {
  const factory _AreaResponse({
    @JsonKey(name: "entity_id") final String? entityId,
    @JsonKey(name: "states_name") final String? statesName,
    @JsonKey(name: "cities_name") final String? citiesName,
    @JsonKey(name: "zip_code") final String? zipCode,
  }) = _$AreaResponseImpl;

  factory _AreaResponse.fromJson(Map<String, dynamic> json) =
      _$AreaResponseImpl.fromJson;

  @override
  @JsonKey(name: "entity_id")
  String? get entityId;
  @override
  @JsonKey(name: "states_name")
  String? get statesName;
  @override
  @JsonKey(name: "cities_name")
  String? get citiesName;
  @override
  @JsonKey(name: "zip_code")
  String? get zipCode;

  /// Create a copy of AreaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AreaResponseImplCopyWith<_$AreaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
