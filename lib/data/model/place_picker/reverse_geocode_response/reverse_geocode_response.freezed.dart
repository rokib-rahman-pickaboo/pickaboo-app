// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reverse_geocode_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReverseGeocodeResponse _$ReverseGeocodeResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ReverseGeocodeResponse.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocodeResponse {
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_address')
  String? get companyAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  @FlexibleAddressConverter()
  FlexibleAddress? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_address')
  @FlexibleAddressConverter()
  FlexibleAddress? get fullAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'place')
  ReverseGeocodePlace? get place => throw _privateConstructorUsedError;

  /// Serializes this ReverseGeocodeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReverseGeocodeResponseCopyWith<ReverseGeocodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodeResponseCopyWith<$Res> {
  factory $ReverseGeocodeResponseCopyWith(
    ReverseGeocodeResponse value,
    $Res Function(ReverseGeocodeResponse) then,
  ) = _$ReverseGeocodeResponseCopyWithImpl<$Res, ReverseGeocodeResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'source') String? source,
    @JsonKey(name: 'company_address') String? companyAddress,
    @JsonKey(name: 'address')
    @FlexibleAddressConverter()
    FlexibleAddress? address,
    @JsonKey(name: 'full_address')
    @FlexibleAddressConverter()
    FlexibleAddress? fullAddress,
    @JsonKey(name: 'place') ReverseGeocodePlace? place,
  });

  $FlexibleAddressCopyWith<$Res>? get address;
  $FlexibleAddressCopyWith<$Res>? get fullAddress;
  $ReverseGeocodePlaceCopyWith<$Res>? get place;
}

/// @nodoc
class _$ReverseGeocodeResponseCopyWithImpl<
  $Res,
  $Val extends ReverseGeocodeResponse
>
    implements $ReverseGeocodeResponseCopyWith<$Res> {
  _$ReverseGeocodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? source = freezed,
    Object? companyAddress = freezed,
    Object? address = freezed,
    Object? fullAddress = freezed,
    Object? place = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int?,
            source:
                freezed == source
                    ? _value.source
                    : source // ignore: cast_nullable_to_non_nullable
                        as String?,
            companyAddress:
                freezed == companyAddress
                    ? _value.companyAddress
                    : companyAddress // ignore: cast_nullable_to_non_nullable
                        as String?,
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as FlexibleAddress?,
            fullAddress:
                freezed == fullAddress
                    ? _value.fullAddress
                    : fullAddress // ignore: cast_nullable_to_non_nullable
                        as FlexibleAddress?,
            place:
                freezed == place
                    ? _value.place
                    : place // ignore: cast_nullable_to_non_nullable
                        as ReverseGeocodePlace?,
          )
          as $Val,
    );
  }

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlexibleAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $FlexibleAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlexibleAddressCopyWith<$Res>? get fullAddress {
    if (_value.fullAddress == null) {
      return null;
    }

    return $FlexibleAddressCopyWith<$Res>(_value.fullAddress!, (value) {
      return _then(_value.copyWith(fullAddress: value) as $Val);
    });
  }

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReverseGeocodePlaceCopyWith<$Res>? get place {
    if (_value.place == null) {
      return null;
    }

    return $ReverseGeocodePlaceCopyWith<$Res>(_value.place!, (value) {
      return _then(_value.copyWith(place: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReverseGeocodeResponseImplCopyWith<$Res>
    implements $ReverseGeocodeResponseCopyWith<$Res> {
  factory _$$ReverseGeocodeResponseImplCopyWith(
    _$ReverseGeocodeResponseImpl value,
    $Res Function(_$ReverseGeocodeResponseImpl) then,
  ) = __$$ReverseGeocodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'source') String? source,
    @JsonKey(name: 'company_address') String? companyAddress,
    @JsonKey(name: 'address')
    @FlexibleAddressConverter()
    FlexibleAddress? address,
    @JsonKey(name: 'full_address')
    @FlexibleAddressConverter()
    FlexibleAddress? fullAddress,
    @JsonKey(name: 'place') ReverseGeocodePlace? place,
  });

  @override
  $FlexibleAddressCopyWith<$Res>? get address;
  @override
  $FlexibleAddressCopyWith<$Res>? get fullAddress;
  @override
  $ReverseGeocodePlaceCopyWith<$Res>? get place;
}

/// @nodoc
class __$$ReverseGeocodeResponseImplCopyWithImpl<$Res>
    extends
        _$ReverseGeocodeResponseCopyWithImpl<$Res, _$ReverseGeocodeResponseImpl>
    implements _$$ReverseGeocodeResponseImplCopyWith<$Res> {
  __$$ReverseGeocodeResponseImplCopyWithImpl(
    _$ReverseGeocodeResponseImpl _value,
    $Res Function(_$ReverseGeocodeResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? source = freezed,
    Object? companyAddress = freezed,
    Object? address = freezed,
    Object? fullAddress = freezed,
    Object? place = freezed,
  }) {
    return _then(
      _$ReverseGeocodeResponseImpl(
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as int?,
        source:
            freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                    as String?,
        companyAddress:
            freezed == companyAddress
                ? _value.companyAddress
                : companyAddress // ignore: cast_nullable_to_non_nullable
                    as String?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as FlexibleAddress?,
        fullAddress:
            freezed == fullAddress
                ? _value.fullAddress
                : fullAddress // ignore: cast_nullable_to_non_nullable
                    as FlexibleAddress?,
        place:
            freezed == place
                ? _value.place
                : place // ignore: cast_nullable_to_non_nullable
                    as ReverseGeocodePlace?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseGeocodeResponseImpl implements _ReverseGeocodeResponse {
  const _$ReverseGeocodeResponseImpl({
    @JsonKey(name: 'status') this.status,
    @JsonKey(name: 'source') this.source,
    @JsonKey(name: 'company_address') this.companyAddress,
    @JsonKey(name: 'address') @FlexibleAddressConverter() this.address,
    @JsonKey(name: 'full_address') @FlexibleAddressConverter() this.fullAddress,
    @JsonKey(name: 'place') this.place,
  });

  factory _$ReverseGeocodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReverseGeocodeResponseImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'source')
  final String? source;
  @override
  @JsonKey(name: 'company_address')
  final String? companyAddress;
  @override
  @JsonKey(name: 'address')
  @FlexibleAddressConverter()
  final FlexibleAddress? address;
  @override
  @JsonKey(name: 'full_address')
  @FlexibleAddressConverter()
  final FlexibleAddress? fullAddress;
  @override
  @JsonKey(name: 'place')
  final ReverseGeocodePlace? place;

  @override
  String toString() {
    return 'ReverseGeocodeResponse(status: $status, source: $source, companyAddress: $companyAddress, address: $address, fullAddress: $fullAddress, place: $place)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeocodeResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.companyAddress, companyAddress) ||
                other.companyAddress == companyAddress) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.place, place) || other.place == place));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    source,
    companyAddress,
    address,
    fullAddress,
    place,
  );

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeocodeResponseImplCopyWith<_$ReverseGeocodeResponseImpl>
  get copyWith =>
      __$$ReverseGeocodeResponseImplCopyWithImpl<_$ReverseGeocodeResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseGeocodeResponseImplToJson(this);
  }
}

abstract class _ReverseGeocodeResponse implements ReverseGeocodeResponse {
  const factory _ReverseGeocodeResponse({
    @JsonKey(name: 'status') final int? status,
    @JsonKey(name: 'source') final String? source,
    @JsonKey(name: 'company_address') final String? companyAddress,
    @JsonKey(name: 'address')
    @FlexibleAddressConverter()
    final FlexibleAddress? address,
    @JsonKey(name: 'full_address')
    @FlexibleAddressConverter()
    final FlexibleAddress? fullAddress,
    @JsonKey(name: 'place') final ReverseGeocodePlace? place,
  }) = _$ReverseGeocodeResponseImpl;

  factory _ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =
      _$ReverseGeocodeResponseImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get status;
  @override
  @JsonKey(name: 'source')
  String? get source;
  @override
  @JsonKey(name: 'company_address')
  String? get companyAddress;
  @override
  @JsonKey(name: 'address')
  @FlexibleAddressConverter()
  FlexibleAddress? get address;
  @override
  @JsonKey(name: 'full_address')
  @FlexibleAddressConverter()
  FlexibleAddress? get fullAddress;
  @override
  @JsonKey(name: 'place')
  ReverseGeocodePlace? get place;

  /// Create a copy of ReverseGeocodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseGeocodeResponseImplCopyWith<_$ReverseGeocodeResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ReverseGeoAddressObject _$ReverseGeoAddressObjectFromJson(
  Map<String, dynamic> json,
) {
  return _ReverseGeoAddressObject.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeoAddressObject {
  @JsonKey(name: 'place')
  ReverseGeocodePlace? get place => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this ReverseGeoAddressObject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReverseGeoAddressObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReverseGeoAddressObjectCopyWith<ReverseGeoAddressObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeoAddressObjectCopyWith<$Res> {
  factory $ReverseGeoAddressObjectCopyWith(
    ReverseGeoAddressObject value,
    $Res Function(ReverseGeoAddressObject) then,
  ) = _$ReverseGeoAddressObjectCopyWithImpl<$Res, ReverseGeoAddressObject>;
  @useResult
  $Res call({
    @JsonKey(name: 'place') ReverseGeocodePlace? place,
    @JsonKey(name: 'status') int? status,
  });

  $ReverseGeocodePlaceCopyWith<$Res>? get place;
}

/// @nodoc
class _$ReverseGeoAddressObjectCopyWithImpl<
  $Res,
  $Val extends ReverseGeoAddressObject
>
    implements $ReverseGeoAddressObjectCopyWith<$Res> {
  _$ReverseGeoAddressObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReverseGeoAddressObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? place = freezed, Object? status = freezed}) {
    return _then(
      _value.copyWith(
            place:
                freezed == place
                    ? _value.place
                    : place // ignore: cast_nullable_to_non_nullable
                        as ReverseGeocodePlace?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of ReverseGeoAddressObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReverseGeocodePlaceCopyWith<$Res>? get place {
    if (_value.place == null) {
      return null;
    }

    return $ReverseGeocodePlaceCopyWith<$Res>(_value.place!, (value) {
      return _then(_value.copyWith(place: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReverseGeoAddressObjectImplCopyWith<$Res>
    implements $ReverseGeoAddressObjectCopyWith<$Res> {
  factory _$$ReverseGeoAddressObjectImplCopyWith(
    _$ReverseGeoAddressObjectImpl value,
    $Res Function(_$ReverseGeoAddressObjectImpl) then,
  ) = __$$ReverseGeoAddressObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'place') ReverseGeocodePlace? place,
    @JsonKey(name: 'status') int? status,
  });

  @override
  $ReverseGeocodePlaceCopyWith<$Res>? get place;
}

/// @nodoc
class __$$ReverseGeoAddressObjectImplCopyWithImpl<$Res>
    extends
        _$ReverseGeoAddressObjectCopyWithImpl<
          $Res,
          _$ReverseGeoAddressObjectImpl
        >
    implements _$$ReverseGeoAddressObjectImplCopyWith<$Res> {
  __$$ReverseGeoAddressObjectImplCopyWithImpl(
    _$ReverseGeoAddressObjectImpl _value,
    $Res Function(_$ReverseGeoAddressObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReverseGeoAddressObject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? place = freezed, Object? status = freezed}) {
    return _then(
      _$ReverseGeoAddressObjectImpl(
        place:
            freezed == place
                ? _value.place
                : place // ignore: cast_nullable_to_non_nullable
                    as ReverseGeocodePlace?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseGeoAddressObjectImpl implements _ReverseGeoAddressObject {
  const _$ReverseGeoAddressObjectImpl({
    @JsonKey(name: 'place') this.place,
    @JsonKey(name: 'status') this.status,
  });

  factory _$ReverseGeoAddressObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReverseGeoAddressObjectImplFromJson(json);

  @override
  @JsonKey(name: 'place')
  final ReverseGeocodePlace? place;
  @override
  @JsonKey(name: 'status')
  final int? status;

  @override
  String toString() {
    return 'ReverseGeoAddressObject(place: $place, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeoAddressObjectImpl &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, place, status);

  /// Create a copy of ReverseGeoAddressObject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeoAddressObjectImplCopyWith<_$ReverseGeoAddressObjectImpl>
  get copyWith => __$$ReverseGeoAddressObjectImplCopyWithImpl<
    _$ReverseGeoAddressObjectImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseGeoAddressObjectImplToJson(this);
  }
}

abstract class _ReverseGeoAddressObject implements ReverseGeoAddressObject {
  const factory _ReverseGeoAddressObject({
    @JsonKey(name: 'place') final ReverseGeocodePlace? place,
    @JsonKey(name: 'status') final int? status,
  }) = _$ReverseGeoAddressObjectImpl;

  factory _ReverseGeoAddressObject.fromJson(Map<String, dynamic> json) =
      _$ReverseGeoAddressObjectImpl.fromJson;

  @override
  @JsonKey(name: 'place')
  ReverseGeocodePlace? get place;
  @override
  @JsonKey(name: 'status')
  int? get status;

  /// Create a copy of ReverseGeoAddressObject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseGeoAddressObjectImplCopyWith<_$ReverseGeoAddressObjectImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ReverseGeocodePlace _$ReverseGeocodePlaceFromJson(Map<String, dynamic> json) {
  return _ReverseGeocodePlace.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocodePlace {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'distance_within_meters')
  int? get distanceWithinMeters => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'area')
  String? get area => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  String? get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district')
  String? get subDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'division')
  String? get division => throw _privateConstructorUsedError;
  @JsonKey(name: 'postCode')
  Object? get postCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_code')
  Object? get postCodeSnake => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_components')
  ReverseGeocodeAddressComponents? get addressComponents =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'area_components')
  ReverseGeocodeAreaComponents? get areaComponents =>
      throw _privateConstructorUsedError;

  /// Serializes this ReverseGeocodePlace to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReverseGeocodePlace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReverseGeocodePlaceCopyWith<ReverseGeocodePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodePlaceCopyWith<$Res> {
  factory $ReverseGeocodePlaceCopyWith(
    ReverseGeocodePlace value,
    $Res Function(ReverseGeocodePlace) then,
  ) = _$ReverseGeocodePlaceCopyWithImpl<$Res, ReverseGeocodePlace>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'distance_within_meters') int? distanceWithinMeters,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'district') String? district,
    @JsonKey(name: 'sub_district') String? subDistrict,
    @JsonKey(name: 'division') String? division,
    @JsonKey(name: 'postCode') Object? postCode,
    @JsonKey(name: 'post_code') Object? postCodeSnake,
    @JsonKey(name: 'address_components')
    ReverseGeocodeAddressComponents? addressComponents,
    @JsonKey(name: 'area_components')
    ReverseGeocodeAreaComponents? areaComponents,
  });

  $ReverseGeocodeAddressComponentsCopyWith<$Res>? get addressComponents;
  $ReverseGeocodeAreaComponentsCopyWith<$Res>? get areaComponents;
}

/// @nodoc
class _$ReverseGeocodePlaceCopyWithImpl<$Res, $Val extends ReverseGeocodePlace>
    implements $ReverseGeocodePlaceCopyWith<$Res> {
  _$ReverseGeocodePlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReverseGeocodePlace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? distanceWithinMeters = freezed,
    Object? address = freezed,
    Object? area = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? district = freezed,
    Object? subDistrict = freezed,
    Object? division = freezed,
    Object? postCode = freezed,
    Object? postCodeSnake = freezed,
    Object? addressComponents = freezed,
    Object? areaComponents = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            distanceWithinMeters:
                freezed == distanceWithinMeters
                    ? _value.distanceWithinMeters
                    : distanceWithinMeters // ignore: cast_nullable_to_non_nullable
                        as int?,
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String?,
            area:
                freezed == area
                    ? _value.area
                    : area // ignore: cast_nullable_to_non_nullable
                        as String?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
            country:
                freezed == country
                    ? _value.country
                    : country // ignore: cast_nullable_to_non_nullable
                        as String?,
            district:
                freezed == district
                    ? _value.district
                    : district // ignore: cast_nullable_to_non_nullable
                        as String?,
            subDistrict:
                freezed == subDistrict
                    ? _value.subDistrict
                    : subDistrict // ignore: cast_nullable_to_non_nullable
                        as String?,
            division:
                freezed == division
                    ? _value.division
                    : division // ignore: cast_nullable_to_non_nullable
                        as String?,
            postCode: freezed == postCode ? _value.postCode : postCode,
            postCodeSnake:
                freezed == postCodeSnake ? _value.postCodeSnake : postCodeSnake,
            addressComponents:
                freezed == addressComponents
                    ? _value.addressComponents
                    : addressComponents // ignore: cast_nullable_to_non_nullable
                        as ReverseGeocodeAddressComponents?,
            areaComponents:
                freezed == areaComponents
                    ? _value.areaComponents
                    : areaComponents // ignore: cast_nullable_to_non_nullable
                        as ReverseGeocodeAreaComponents?,
          )
          as $Val,
    );
  }

  /// Create a copy of ReverseGeocodePlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReverseGeocodeAddressComponentsCopyWith<$Res>? get addressComponents {
    if (_value.addressComponents == null) {
      return null;
    }

    return $ReverseGeocodeAddressComponentsCopyWith<$Res>(
      _value.addressComponents!,
      (value) {
        return _then(_value.copyWith(addressComponents: value) as $Val);
      },
    );
  }

  /// Create a copy of ReverseGeocodePlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReverseGeocodeAreaComponentsCopyWith<$Res>? get areaComponents {
    if (_value.areaComponents == null) {
      return null;
    }

    return $ReverseGeocodeAreaComponentsCopyWith<$Res>(_value.areaComponents!, (
      value,
    ) {
      return _then(_value.copyWith(areaComponents: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReverseGeocodePlaceImplCopyWith<$Res>
    implements $ReverseGeocodePlaceCopyWith<$Res> {
  factory _$$ReverseGeocodePlaceImplCopyWith(
    _$ReverseGeocodePlaceImpl value,
    $Res Function(_$ReverseGeocodePlaceImpl) then,
  ) = __$$ReverseGeocodePlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'distance_within_meters') int? distanceWithinMeters,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'district') String? district,
    @JsonKey(name: 'sub_district') String? subDistrict,
    @JsonKey(name: 'division') String? division,
    @JsonKey(name: 'postCode') Object? postCode,
    @JsonKey(name: 'post_code') Object? postCodeSnake,
    @JsonKey(name: 'address_components')
    ReverseGeocodeAddressComponents? addressComponents,
    @JsonKey(name: 'area_components')
    ReverseGeocodeAreaComponents? areaComponents,
  });

  @override
  $ReverseGeocodeAddressComponentsCopyWith<$Res>? get addressComponents;
  @override
  $ReverseGeocodeAreaComponentsCopyWith<$Res>? get areaComponents;
}

/// @nodoc
class __$$ReverseGeocodePlaceImplCopyWithImpl<$Res>
    extends _$ReverseGeocodePlaceCopyWithImpl<$Res, _$ReverseGeocodePlaceImpl>
    implements _$$ReverseGeocodePlaceImplCopyWith<$Res> {
  __$$ReverseGeocodePlaceImplCopyWithImpl(
    _$ReverseGeocodePlaceImpl _value,
    $Res Function(_$ReverseGeocodePlaceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReverseGeocodePlace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? distanceWithinMeters = freezed,
    Object? address = freezed,
    Object? area = freezed,
    Object? city = freezed,
    Object? country = freezed,
    Object? district = freezed,
    Object? subDistrict = freezed,
    Object? division = freezed,
    Object? postCode = freezed,
    Object? postCodeSnake = freezed,
    Object? addressComponents = freezed,
    Object? areaComponents = freezed,
  }) {
    return _then(
      _$ReverseGeocodePlaceImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        distanceWithinMeters:
            freezed == distanceWithinMeters
                ? _value.distanceWithinMeters
                : distanceWithinMeters // ignore: cast_nullable_to_non_nullable
                    as int?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
        area:
            freezed == area
                ? _value.area
                : area // ignore: cast_nullable_to_non_nullable
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        country:
            freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                    as String?,
        district:
            freezed == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                    as String?,
        subDistrict:
            freezed == subDistrict
                ? _value.subDistrict
                : subDistrict // ignore: cast_nullable_to_non_nullable
                    as String?,
        division:
            freezed == division
                ? _value.division
                : division // ignore: cast_nullable_to_non_nullable
                    as String?,
        postCode: freezed == postCode ? _value.postCode : postCode,
        postCodeSnake:
            freezed == postCodeSnake ? _value.postCodeSnake : postCodeSnake,
        addressComponents:
            freezed == addressComponents
                ? _value.addressComponents
                : addressComponents // ignore: cast_nullable_to_non_nullable
                    as ReverseGeocodeAddressComponents?,
        areaComponents:
            freezed == areaComponents
                ? _value.areaComponents
                : areaComponents // ignore: cast_nullable_to_non_nullable
                    as ReverseGeocodeAreaComponents?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseGeocodePlaceImpl implements _ReverseGeocodePlace {
  const _$ReverseGeocodePlaceImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'distance_within_meters') this.distanceWithinMeters,
    @JsonKey(name: 'address') this.address,
    @JsonKey(name: 'area') this.area,
    @JsonKey(name: 'city') this.city,
    @JsonKey(name: 'country') this.country,
    @JsonKey(name: 'district') this.district,
    @JsonKey(name: 'sub_district') this.subDistrict,
    @JsonKey(name: 'division') this.division,
    @JsonKey(name: 'postCode') this.postCode,
    @JsonKey(name: 'post_code') this.postCodeSnake,
    @JsonKey(name: 'address_components') this.addressComponents,
    @JsonKey(name: 'area_components') this.areaComponents,
  });

  factory _$ReverseGeocodePlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReverseGeocodePlaceImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'distance_within_meters')
  final int? distanceWithinMeters;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'area')
  final String? area;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'country')
  final String? country;
  @override
  @JsonKey(name: 'district')
  final String? district;
  @override
  @JsonKey(name: 'sub_district')
  final String? subDistrict;
  @override
  @JsonKey(name: 'division')
  final String? division;
  @override
  @JsonKey(name: 'postCode')
  final Object? postCode;
  @override
  @JsonKey(name: 'post_code')
  final Object? postCodeSnake;
  @override
  @JsonKey(name: 'address_components')
  final ReverseGeocodeAddressComponents? addressComponents;
  @override
  @JsonKey(name: 'area_components')
  final ReverseGeocodeAreaComponents? areaComponents;

  @override
  String toString() {
    return 'ReverseGeocodePlace(id: $id, distanceWithinMeters: $distanceWithinMeters, address: $address, area: $area, city: $city, country: $country, district: $district, subDistrict: $subDistrict, division: $division, postCode: $postCode, postCodeSnake: $postCodeSnake, addressComponents: $addressComponents, areaComponents: $areaComponents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeocodePlaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.distanceWithinMeters, distanceWithinMeters) ||
                other.distanceWithinMeters == distanceWithinMeters) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.subDistrict, subDistrict) ||
                other.subDistrict == subDistrict) &&
            (identical(other.division, division) ||
                other.division == division) &&
            const DeepCollectionEquality().equals(other.postCode, postCode) &&
            const DeepCollectionEquality().equals(
              other.postCodeSnake,
              postCodeSnake,
            ) &&
            (identical(other.addressComponents, addressComponents) ||
                other.addressComponents == addressComponents) &&
            (identical(other.areaComponents, areaComponents) ||
                other.areaComponents == areaComponents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    distanceWithinMeters,
    address,
    area,
    city,
    country,
    district,
    subDistrict,
    division,
    const DeepCollectionEquality().hash(postCode),
    const DeepCollectionEquality().hash(postCodeSnake),
    addressComponents,
    areaComponents,
  );

  /// Create a copy of ReverseGeocodePlace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeocodePlaceImplCopyWith<_$ReverseGeocodePlaceImpl> get copyWith =>
      __$$ReverseGeocodePlaceImplCopyWithImpl<_$ReverseGeocodePlaceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseGeocodePlaceImplToJson(this);
  }
}

abstract class _ReverseGeocodePlace implements ReverseGeocodePlace {
  const factory _ReverseGeocodePlace({
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'distance_within_meters') final int? distanceWithinMeters,
    @JsonKey(name: 'address') final String? address,
    @JsonKey(name: 'area') final String? area,
    @JsonKey(name: 'city') final String? city,
    @JsonKey(name: 'country') final String? country,
    @JsonKey(name: 'district') final String? district,
    @JsonKey(name: 'sub_district') final String? subDistrict,
    @JsonKey(name: 'division') final String? division,
    @JsonKey(name: 'postCode') final Object? postCode,
    @JsonKey(name: 'post_code') final Object? postCodeSnake,
    @JsonKey(name: 'address_components')
    final ReverseGeocodeAddressComponents? addressComponents,
    @JsonKey(name: 'area_components')
    final ReverseGeocodeAreaComponents? areaComponents,
  }) = _$ReverseGeocodePlaceImpl;

  factory _ReverseGeocodePlace.fromJson(Map<String, dynamic> json) =
      _$ReverseGeocodePlaceImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'distance_within_meters')
  int? get distanceWithinMeters;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'area')
  String? get area;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'country')
  String? get country;
  @override
  @JsonKey(name: 'district')
  String? get district;
  @override
  @JsonKey(name: 'sub_district')
  String? get subDistrict;
  @override
  @JsonKey(name: 'division')
  String? get division;
  @override
  @JsonKey(name: 'postCode')
  Object? get postCode;
  @override
  @JsonKey(name: 'post_code')
  Object? get postCodeSnake;
  @override
  @JsonKey(name: 'address_components')
  ReverseGeocodeAddressComponents? get addressComponents;
  @override
  @JsonKey(name: 'area_components')
  ReverseGeocodeAreaComponents? get areaComponents;

  /// Create a copy of ReverseGeocodePlace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseGeocodePlaceImplCopyWith<_$ReverseGeocodePlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReverseGeocodeAddressComponents _$ReverseGeocodeAddressComponentsFromJson(
  Map<String, dynamic> json,
) {
  return _ReverseGeocodeAddressComponents.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocodeAddressComponents {
  @JsonKey(name: 'place_name')
  String? get placeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'house')
  String? get house => throw _privateConstructorUsedError;
  @JsonKey(name: 'road')
  String? get road => throw _privateConstructorUsedError;

  /// Serializes this ReverseGeocodeAddressComponents to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReverseGeocodeAddressComponents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReverseGeocodeAddressComponentsCopyWith<ReverseGeocodeAddressComponents>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodeAddressComponentsCopyWith<$Res> {
  factory $ReverseGeocodeAddressComponentsCopyWith(
    ReverseGeocodeAddressComponents value,
    $Res Function(ReverseGeocodeAddressComponents) then,
  ) =
      _$ReverseGeocodeAddressComponentsCopyWithImpl<
        $Res,
        ReverseGeocodeAddressComponents
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'place_name') String? placeName,
    @JsonKey(name: 'house') String? house,
    @JsonKey(name: 'road') String? road,
  });
}

/// @nodoc
class _$ReverseGeocodeAddressComponentsCopyWithImpl<
  $Res,
  $Val extends ReverseGeocodeAddressComponents
>
    implements $ReverseGeocodeAddressComponentsCopyWith<$Res> {
  _$ReverseGeocodeAddressComponentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReverseGeocodeAddressComponents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeName = freezed,
    Object? house = freezed,
    Object? road = freezed,
  }) {
    return _then(
      _value.copyWith(
            placeName:
                freezed == placeName
                    ? _value.placeName
                    : placeName // ignore: cast_nullable_to_non_nullable
                        as String?,
            house:
                freezed == house
                    ? _value.house
                    : house // ignore: cast_nullable_to_non_nullable
                        as String?,
            road:
                freezed == road
                    ? _value.road
                    : road // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReverseGeocodeAddressComponentsImplCopyWith<$Res>
    implements $ReverseGeocodeAddressComponentsCopyWith<$Res> {
  factory _$$ReverseGeocodeAddressComponentsImplCopyWith(
    _$ReverseGeocodeAddressComponentsImpl value,
    $Res Function(_$ReverseGeocodeAddressComponentsImpl) then,
  ) = __$$ReverseGeocodeAddressComponentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'place_name') String? placeName,
    @JsonKey(name: 'house') String? house,
    @JsonKey(name: 'road') String? road,
  });
}

/// @nodoc
class __$$ReverseGeocodeAddressComponentsImplCopyWithImpl<$Res>
    extends
        _$ReverseGeocodeAddressComponentsCopyWithImpl<
          $Res,
          _$ReverseGeocodeAddressComponentsImpl
        >
    implements _$$ReverseGeocodeAddressComponentsImplCopyWith<$Res> {
  __$$ReverseGeocodeAddressComponentsImplCopyWithImpl(
    _$ReverseGeocodeAddressComponentsImpl _value,
    $Res Function(_$ReverseGeocodeAddressComponentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReverseGeocodeAddressComponents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeName = freezed,
    Object? house = freezed,
    Object? road = freezed,
  }) {
    return _then(
      _$ReverseGeocodeAddressComponentsImpl(
        placeName:
            freezed == placeName
                ? _value.placeName
                : placeName // ignore: cast_nullable_to_non_nullable
                    as String?,
        house:
            freezed == house
                ? _value.house
                : house // ignore: cast_nullable_to_non_nullable
                    as String?,
        road:
            freezed == road
                ? _value.road
                : road // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseGeocodeAddressComponentsImpl
    implements _ReverseGeocodeAddressComponents {
  const _$ReverseGeocodeAddressComponentsImpl({
    @JsonKey(name: 'place_name') this.placeName,
    @JsonKey(name: 'house') this.house,
    @JsonKey(name: 'road') this.road,
  });

  factory _$ReverseGeocodeAddressComponentsImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ReverseGeocodeAddressComponentsImplFromJson(json);

  @override
  @JsonKey(name: 'place_name')
  final String? placeName;
  @override
  @JsonKey(name: 'house')
  final String? house;
  @override
  @JsonKey(name: 'road')
  final String? road;

  @override
  String toString() {
    return 'ReverseGeocodeAddressComponents(placeName: $placeName, house: $house, road: $road)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeocodeAddressComponentsImpl &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.house, house) || other.house == house) &&
            (identical(other.road, road) || other.road == road));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeName, house, road);

  /// Create a copy of ReverseGeocodeAddressComponents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeocodeAddressComponentsImplCopyWith<
    _$ReverseGeocodeAddressComponentsImpl
  >
  get copyWith => __$$ReverseGeocodeAddressComponentsImplCopyWithImpl<
    _$ReverseGeocodeAddressComponentsImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseGeocodeAddressComponentsImplToJson(this);
  }
}

abstract class _ReverseGeocodeAddressComponents
    implements ReverseGeocodeAddressComponents {
  const factory _ReverseGeocodeAddressComponents({
    @JsonKey(name: 'place_name') final String? placeName,
    @JsonKey(name: 'house') final String? house,
    @JsonKey(name: 'road') final String? road,
  }) = _$ReverseGeocodeAddressComponentsImpl;

  factory _ReverseGeocodeAddressComponents.fromJson(Map<String, dynamic> json) =
      _$ReverseGeocodeAddressComponentsImpl.fromJson;

  @override
  @JsonKey(name: 'place_name')
  String? get placeName;
  @override
  @JsonKey(name: 'house')
  String? get house;
  @override
  @JsonKey(name: 'road')
  String? get road;

  /// Create a copy of ReverseGeocodeAddressComponents
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseGeocodeAddressComponentsImplCopyWith<
    _$ReverseGeocodeAddressComponentsImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

ReverseGeocodeAreaComponents _$ReverseGeocodeAreaComponentsFromJson(
  Map<String, dynamic> json,
) {
  return _ReverseGeocodeAreaComponents.fromJson(json);
}

/// @nodoc
mixin _$ReverseGeocodeAreaComponents {
  @JsonKey(name: 'area')
  String? get area => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_area')
  String? get subArea => throw _privateConstructorUsedError;

  /// Serializes this ReverseGeocodeAreaComponents to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReverseGeocodeAreaComponents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReverseGeocodeAreaComponentsCopyWith<ReverseGeocodeAreaComponents>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseGeocodeAreaComponentsCopyWith<$Res> {
  factory $ReverseGeocodeAreaComponentsCopyWith(
    ReverseGeocodeAreaComponents value,
    $Res Function(ReverseGeocodeAreaComponents) then,
  ) =
      _$ReverseGeocodeAreaComponentsCopyWithImpl<
        $Res,
        ReverseGeocodeAreaComponents
      >;
  @useResult
  $Res call({
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'sub_area') String? subArea,
  });
}

/// @nodoc
class _$ReverseGeocodeAreaComponentsCopyWithImpl<
  $Res,
  $Val extends ReverseGeocodeAreaComponents
>
    implements $ReverseGeocodeAreaComponentsCopyWith<$Res> {
  _$ReverseGeocodeAreaComponentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReverseGeocodeAreaComponents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? area = freezed, Object? subArea = freezed}) {
    return _then(
      _value.copyWith(
            area:
                freezed == area
                    ? _value.area
                    : area // ignore: cast_nullable_to_non_nullable
                        as String?,
            subArea:
                freezed == subArea
                    ? _value.subArea
                    : subArea // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReverseGeocodeAreaComponentsImplCopyWith<$Res>
    implements $ReverseGeocodeAreaComponentsCopyWith<$Res> {
  factory _$$ReverseGeocodeAreaComponentsImplCopyWith(
    _$ReverseGeocodeAreaComponentsImpl value,
    $Res Function(_$ReverseGeocodeAreaComponentsImpl) then,
  ) = __$$ReverseGeocodeAreaComponentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'sub_area') String? subArea,
  });
}

/// @nodoc
class __$$ReverseGeocodeAreaComponentsImplCopyWithImpl<$Res>
    extends
        _$ReverseGeocodeAreaComponentsCopyWithImpl<
          $Res,
          _$ReverseGeocodeAreaComponentsImpl
        >
    implements _$$ReverseGeocodeAreaComponentsImplCopyWith<$Res> {
  __$$ReverseGeocodeAreaComponentsImplCopyWithImpl(
    _$ReverseGeocodeAreaComponentsImpl _value,
    $Res Function(_$ReverseGeocodeAreaComponentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReverseGeocodeAreaComponents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? area = freezed, Object? subArea = freezed}) {
    return _then(
      _$ReverseGeocodeAreaComponentsImpl(
        area:
            freezed == area
                ? _value.area
                : area // ignore: cast_nullable_to_non_nullable
                    as String?,
        subArea:
            freezed == subArea
                ? _value.subArea
                : subArea // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReverseGeocodeAreaComponentsImpl
    implements _ReverseGeocodeAreaComponents {
  const _$ReverseGeocodeAreaComponentsImpl({
    @JsonKey(name: 'area') this.area,
    @JsonKey(name: 'sub_area') this.subArea,
  });

  factory _$ReverseGeocodeAreaComponentsImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$ReverseGeocodeAreaComponentsImplFromJson(json);

  @override
  @JsonKey(name: 'area')
  final String? area;
  @override
  @JsonKey(name: 'sub_area')
  final String? subArea;

  @override
  String toString() {
    return 'ReverseGeocodeAreaComponents(area: $area, subArea: $subArea)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReverseGeocodeAreaComponentsImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.subArea, subArea) || other.subArea == subArea));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, area, subArea);

  /// Create a copy of ReverseGeocodeAreaComponents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReverseGeocodeAreaComponentsImplCopyWith<
    _$ReverseGeocodeAreaComponentsImpl
  >
  get copyWith => __$$ReverseGeocodeAreaComponentsImplCopyWithImpl<
    _$ReverseGeocodeAreaComponentsImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReverseGeocodeAreaComponentsImplToJson(this);
  }
}

abstract class _ReverseGeocodeAreaComponents
    implements ReverseGeocodeAreaComponents {
  const factory _ReverseGeocodeAreaComponents({
    @JsonKey(name: 'area') final String? area,
    @JsonKey(name: 'sub_area') final String? subArea,
  }) = _$ReverseGeocodeAreaComponentsImpl;

  factory _ReverseGeocodeAreaComponents.fromJson(Map<String, dynamic> json) =
      _$ReverseGeocodeAreaComponentsImpl.fromJson;

  @override
  @JsonKey(name: 'area')
  String? get area;
  @override
  @JsonKey(name: 'sub_area')
  String? get subArea;

  /// Create a copy of ReverseGeocodeAreaComponents
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReverseGeocodeAreaComponentsImplCopyWith<
    _$ReverseGeocodeAreaComponentsImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FlexibleAddress {
  Object get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReverseGeoAddressObject value) object,
    required TResult Function(String value) string,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReverseGeoAddressObject value)? object,
    TResult? Function(String value)? string,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReverseGeoAddressObject value)? object,
    TResult Function(String value)? string,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlexibleAddressObject value) object,
    required TResult Function(FlexibleAddressString value) string,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FlexibleAddressObject value)? object,
    TResult? Function(FlexibleAddressString value)? string,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlexibleAddressObject value)? object,
    TResult Function(FlexibleAddressString value)? string,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlexibleAddressCopyWith<$Res> {
  factory $FlexibleAddressCopyWith(
    FlexibleAddress value,
    $Res Function(FlexibleAddress) then,
  ) = _$FlexibleAddressCopyWithImpl<$Res, FlexibleAddress>;
}

/// @nodoc
class _$FlexibleAddressCopyWithImpl<$Res, $Val extends FlexibleAddress>
    implements $FlexibleAddressCopyWith<$Res> {
  _$FlexibleAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FlexibleAddressObjectImplCopyWith<$Res> {
  factory _$$FlexibleAddressObjectImplCopyWith(
    _$FlexibleAddressObjectImpl value,
    $Res Function(_$FlexibleAddressObjectImpl) then,
  ) = __$$FlexibleAddressObjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReverseGeoAddressObject value});

  $ReverseGeoAddressObjectCopyWith<$Res> get value;
}

/// @nodoc
class __$$FlexibleAddressObjectImplCopyWithImpl<$Res>
    extends _$FlexibleAddressCopyWithImpl<$Res, _$FlexibleAddressObjectImpl>
    implements _$$FlexibleAddressObjectImplCopyWith<$Res> {
  __$$FlexibleAddressObjectImplCopyWithImpl(
    _$FlexibleAddressObjectImpl _value,
    $Res Function(_$FlexibleAddressObjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$FlexibleAddressObjectImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as ReverseGeoAddressObject,
      ),
    );
  }

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReverseGeoAddressObjectCopyWith<$Res> get value {
    return $ReverseGeoAddressObjectCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc

class _$FlexibleAddressObjectImpl extends FlexibleAddressObject {
  const _$FlexibleAddressObjectImpl(this.value) : super._();

  @override
  final ReverseGeoAddressObject value;

  @override
  String toString() {
    return 'FlexibleAddress.object(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlexibleAddressObjectImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlexibleAddressObjectImplCopyWith<_$FlexibleAddressObjectImpl>
  get copyWith =>
      __$$FlexibleAddressObjectImplCopyWithImpl<_$FlexibleAddressObjectImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReverseGeoAddressObject value) object,
    required TResult Function(String value) string,
  }) {
    return object(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReverseGeoAddressObject value)? object,
    TResult? Function(String value)? string,
  }) {
    return object?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReverseGeoAddressObject value)? object,
    TResult Function(String value)? string,
    required TResult orElse(),
  }) {
    if (object != null) {
      return object(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlexibleAddressObject value) object,
    required TResult Function(FlexibleAddressString value) string,
  }) {
    return object(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FlexibleAddressObject value)? object,
    TResult? Function(FlexibleAddressString value)? string,
  }) {
    return object?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlexibleAddressObject value)? object,
    TResult Function(FlexibleAddressString value)? string,
    required TResult orElse(),
  }) {
    if (object != null) {
      return object(this);
    }
    return orElse();
  }
}

abstract class FlexibleAddressObject extends FlexibleAddress {
  const factory FlexibleAddressObject(final ReverseGeoAddressObject value) =
      _$FlexibleAddressObjectImpl;
  const FlexibleAddressObject._() : super._();

  @override
  ReverseGeoAddressObject get value;

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlexibleAddressObjectImplCopyWith<_$FlexibleAddressObjectImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FlexibleAddressStringImplCopyWith<$Res> {
  factory _$$FlexibleAddressStringImplCopyWith(
    _$FlexibleAddressStringImpl value,
    $Res Function(_$FlexibleAddressStringImpl) then,
  ) = __$$FlexibleAddressStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$FlexibleAddressStringImplCopyWithImpl<$Res>
    extends _$FlexibleAddressCopyWithImpl<$Res, _$FlexibleAddressStringImpl>
    implements _$$FlexibleAddressStringImplCopyWith<$Res> {
  __$$FlexibleAddressStringImplCopyWithImpl(
    _$FlexibleAddressStringImpl _value,
    $Res Function(_$FlexibleAddressStringImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? value = null}) {
    return _then(
      _$FlexibleAddressStringImpl(
        null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$FlexibleAddressStringImpl extends FlexibleAddressString {
  const _$FlexibleAddressStringImpl(this.value) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'FlexibleAddress.string(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlexibleAddressStringImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlexibleAddressStringImplCopyWith<_$FlexibleAddressStringImpl>
  get copyWith =>
      __$$FlexibleAddressStringImplCopyWithImpl<_$FlexibleAddressStringImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReverseGeoAddressObject value) object,
    required TResult Function(String value) string,
  }) {
    return string(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReverseGeoAddressObject value)? object,
    TResult? Function(String value)? string,
  }) {
    return string?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReverseGeoAddressObject value)? object,
    TResult Function(String value)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FlexibleAddressObject value) object,
    required TResult Function(FlexibleAddressString value) string,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FlexibleAddressObject value)? object,
    TResult? Function(FlexibleAddressString value)? string,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FlexibleAddressObject value)? object,
    TResult Function(FlexibleAddressString value)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }
}

abstract class FlexibleAddressString extends FlexibleAddress {
  const factory FlexibleAddressString(final String value) =
      _$FlexibleAddressStringImpl;
  const FlexibleAddressString._() : super._();

  @override
  String get value;

  /// Create a copy of FlexibleAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlexibleAddressStringImplCopyWith<_$FlexibleAddressStringImpl>
  get copyWith => throw _privateConstructorUsedError;
}
