// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_autocomplete_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlaceAutocompleteResponse _$PlaceAutocompleteResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PlaceAutocompleteResponse.fromJson(json);
}

/// @nodoc
mixin _$PlaceAutocompleteResponse {
  @JsonKey(name: 'places')
  List<AutocompletePlaceModel>? get places =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int? get status => throw _privateConstructorUsedError;

  /// Serializes this PlaceAutocompleteResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceAutocompleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceAutocompleteResponseCopyWith<PlaceAutocompleteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceAutocompleteResponseCopyWith<$Res> {
  factory $PlaceAutocompleteResponseCopyWith(
    PlaceAutocompleteResponse value,
    $Res Function(PlaceAutocompleteResponse) then,
  ) = _$PlaceAutocompleteResponseCopyWithImpl<$Res, PlaceAutocompleteResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'places') List<AutocompletePlaceModel>? places,
    @JsonKey(name: 'status') int? status,
  });
}

/// @nodoc
class _$PlaceAutocompleteResponseCopyWithImpl<
  $Res,
  $Val extends PlaceAutocompleteResponse
>
    implements $PlaceAutocompleteResponseCopyWith<$Res> {
  _$PlaceAutocompleteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceAutocompleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? places = freezed, Object? status = freezed}) {
    return _then(
      _value.copyWith(
            places:
                freezed == places
                    ? _value.places
                    : places // ignore: cast_nullable_to_non_nullable
                        as List<AutocompletePlaceModel>?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaceAutocompleteResponseImplCopyWith<$Res>
    implements $PlaceAutocompleteResponseCopyWith<$Res> {
  factory _$$PlaceAutocompleteResponseImplCopyWith(
    _$PlaceAutocompleteResponseImpl value,
    $Res Function(_$PlaceAutocompleteResponseImpl) then,
  ) = __$$PlaceAutocompleteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'places') List<AutocompletePlaceModel>? places,
    @JsonKey(name: 'status') int? status,
  });
}

/// @nodoc
class __$$PlaceAutocompleteResponseImplCopyWithImpl<$Res>
    extends
        _$PlaceAutocompleteResponseCopyWithImpl<
          $Res,
          _$PlaceAutocompleteResponseImpl
        >
    implements _$$PlaceAutocompleteResponseImplCopyWith<$Res> {
  __$$PlaceAutocompleteResponseImplCopyWithImpl(
    _$PlaceAutocompleteResponseImpl _value,
    $Res Function(_$PlaceAutocompleteResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaceAutocompleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? places = freezed, Object? status = freezed}) {
    return _then(
      _$PlaceAutocompleteResponseImpl(
        places:
            freezed == places
                ? _value._places
                : places // ignore: cast_nullable_to_non_nullable
                    as List<AutocompletePlaceModel>?,
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
class _$PlaceAutocompleteResponseImpl implements _PlaceAutocompleteResponse {
  const _$PlaceAutocompleteResponseImpl({
    @JsonKey(name: 'places') final List<AutocompletePlaceModel>? places,
    @JsonKey(name: 'status') this.status,
  }) : _places = places;

  factory _$PlaceAutocompleteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceAutocompleteResponseImplFromJson(json);

  final List<AutocompletePlaceModel>? _places;
  @override
  @JsonKey(name: 'places')
  List<AutocompletePlaceModel>? get places {
    final value = _places;
    if (value == null) return null;
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'status')
  final int? status;

  @override
  String toString() {
    return 'PlaceAutocompleteResponse(places: $places, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceAutocompleteResponseImpl &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_places),
    status,
  );

  /// Create a copy of PlaceAutocompleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceAutocompleteResponseImplCopyWith<_$PlaceAutocompleteResponseImpl>
  get copyWith => __$$PlaceAutocompleteResponseImplCopyWithImpl<
    _$PlaceAutocompleteResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceAutocompleteResponseImplToJson(this);
  }
}

abstract class _PlaceAutocompleteResponse implements PlaceAutocompleteResponse {
  const factory _PlaceAutocompleteResponse({
    @JsonKey(name: 'places') final List<AutocompletePlaceModel>? places,
    @JsonKey(name: 'status') final int? status,
  }) = _$PlaceAutocompleteResponseImpl;

  factory _PlaceAutocompleteResponse.fromJson(Map<String, dynamic> json) =
      _$PlaceAutocompleteResponseImpl.fromJson;

  @override
  @JsonKey(name: 'places')
  List<AutocompletePlaceModel>? get places;
  @override
  @JsonKey(name: 'status')
  int? get status;

  /// Create a copy of PlaceAutocompleteResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceAutocompleteResponseImplCopyWith<_$PlaceAutocompleteResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AutocompletePlaceModel _$AutocompletePlaceModelFromJson(
  Map<String, dynamic> json,
) {
  return _AutocompletePlaceModel.fromJson(json);
}

/// @nodoc
mixin _$AutocompletePlaceModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  String? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  String? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'area')
  String? get area => throw _privateConstructorUsedError;
  @JsonKey(name: 'postCode')
  int? get postCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'pType')
  String? get pType => throw _privateConstructorUsedError;
  @JsonKey(name: 'subType')
  String? get subType => throw _privateConstructorUsedError;
  @JsonKey(name: 'district')
  String? get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'uCode')
  String? get uCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_area')
  String? get subArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district')
  String? get subDistrict => throw _privateConstructorUsedError;

  /// Serializes this AutocompletePlaceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AutocompletePlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutocompletePlaceModelCopyWith<AutocompletePlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompletePlaceModelCopyWith<$Res> {
  factory $AutocompletePlaceModelCopyWith(
    AutocompletePlaceModel value,
    $Res Function(AutocompletePlaceModel) then,
  ) = _$AutocompletePlaceModelCopyWithImpl<$Res, AutocompletePlaceModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'longitude') String? longitude,
    @JsonKey(name: 'latitude') String? latitude,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'postCode') int? postCode,
    @JsonKey(name: 'pType') String? pType,
    @JsonKey(name: 'subType') String? subType,
    @JsonKey(name: 'district') String? district,
    @JsonKey(name: 'uCode') String? uCode,
    @JsonKey(name: 'sub_area') String? subArea,
    @JsonKey(name: 'sub_district') String? subDistrict,
  });
}

/// @nodoc
class _$AutocompletePlaceModelCopyWithImpl<
  $Res,
  $Val extends AutocompletePlaceModel
>
    implements $AutocompletePlaceModelCopyWith<$Res> {
  _$AutocompletePlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutocompletePlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? area = freezed,
    Object? postCode = freezed,
    Object? pType = freezed,
    Object? subType = freezed,
    Object? district = freezed,
    Object? uCode = freezed,
    Object? subArea = freezed,
    Object? subDistrict = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            longitude:
                freezed == longitude
                    ? _value.longitude
                    : longitude // ignore: cast_nullable_to_non_nullable
                        as String?,
            latitude:
                freezed == latitude
                    ? _value.latitude
                    : latitude // ignore: cast_nullable_to_non_nullable
                        as String?,
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
            area:
                freezed == area
                    ? _value.area
                    : area // ignore: cast_nullable_to_non_nullable
                        as String?,
            postCode:
                freezed == postCode
                    ? _value.postCode
                    : postCode // ignore: cast_nullable_to_non_nullable
                        as int?,
            pType:
                freezed == pType
                    ? _value.pType
                    : pType // ignore: cast_nullable_to_non_nullable
                        as String?,
            subType:
                freezed == subType
                    ? _value.subType
                    : subType // ignore: cast_nullable_to_non_nullable
                        as String?,
            district:
                freezed == district
                    ? _value.district
                    : district // ignore: cast_nullable_to_non_nullable
                        as String?,
            uCode:
                freezed == uCode
                    ? _value.uCode
                    : uCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            subArea:
                freezed == subArea
                    ? _value.subArea
                    : subArea // ignore: cast_nullable_to_non_nullable
                        as String?,
            subDistrict:
                freezed == subDistrict
                    ? _value.subDistrict
                    : subDistrict // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AutocompletePlaceModelImplCopyWith<$Res>
    implements $AutocompletePlaceModelCopyWith<$Res> {
  factory _$$AutocompletePlaceModelImplCopyWith(
    _$AutocompletePlaceModelImpl value,
    $Res Function(_$AutocompletePlaceModelImpl) then,
  ) = __$$AutocompletePlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'longitude') String? longitude,
    @JsonKey(name: 'latitude') String? latitude,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'area') String? area,
    @JsonKey(name: 'postCode') int? postCode,
    @JsonKey(name: 'pType') String? pType,
    @JsonKey(name: 'subType') String? subType,
    @JsonKey(name: 'district') String? district,
    @JsonKey(name: 'uCode') String? uCode,
    @JsonKey(name: 'sub_area') String? subArea,
    @JsonKey(name: 'sub_district') String? subDistrict,
  });
}

/// @nodoc
class __$$AutocompletePlaceModelImplCopyWithImpl<$Res>
    extends
        _$AutocompletePlaceModelCopyWithImpl<$Res, _$AutocompletePlaceModelImpl>
    implements _$$AutocompletePlaceModelImplCopyWith<$Res> {
  __$$AutocompletePlaceModelImplCopyWithImpl(
    _$AutocompletePlaceModelImpl _value,
    $Res Function(_$AutocompletePlaceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompletePlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? area = freezed,
    Object? postCode = freezed,
    Object? pType = freezed,
    Object? subType = freezed,
    Object? district = freezed,
    Object? uCode = freezed,
    Object? subArea = freezed,
    Object? subDistrict = freezed,
  }) {
    return _then(
      _$AutocompletePlaceModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        longitude:
            freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                    as String?,
        latitude:
            freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                    as String?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        area:
            freezed == area
                ? _value.area
                : area // ignore: cast_nullable_to_non_nullable
                    as String?,
        postCode:
            freezed == postCode
                ? _value.postCode
                : postCode // ignore: cast_nullable_to_non_nullable
                    as int?,
        pType:
            freezed == pType
                ? _value.pType
                : pType // ignore: cast_nullable_to_non_nullable
                    as String?,
        subType:
            freezed == subType
                ? _value.subType
                : subType // ignore: cast_nullable_to_non_nullable
                    as String?,
        district:
            freezed == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                    as String?,
        uCode:
            freezed == uCode
                ? _value.uCode
                : uCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        subArea:
            freezed == subArea
                ? _value.subArea
                : subArea // ignore: cast_nullable_to_non_nullable
                    as String?,
        subDistrict:
            freezed == subDistrict
                ? _value.subDistrict
                : subDistrict // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompletePlaceModelImpl implements _AutocompletePlaceModel {
  const _$AutocompletePlaceModelImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'longitude') this.longitude,
    @JsonKey(name: 'latitude') this.latitude,
    @JsonKey(name: 'address') this.address,
    @JsonKey(name: 'city') this.city,
    @JsonKey(name: 'area') this.area,
    @JsonKey(name: 'postCode') this.postCode,
    @JsonKey(name: 'pType') this.pType,
    @JsonKey(name: 'subType') this.subType,
    @JsonKey(name: 'district') this.district,
    @JsonKey(name: 'uCode') this.uCode,
    @JsonKey(name: 'sub_area') this.subArea,
    @JsonKey(name: 'sub_district') this.subDistrict,
  });

  factory _$AutocompletePlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutocompletePlaceModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'longitude')
  final String? longitude;
  @override
  @JsonKey(name: 'latitude')
  final String? latitude;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'area')
  final String? area;
  @override
  @JsonKey(name: 'postCode')
  final int? postCode;
  @override
  @JsonKey(name: 'pType')
  final String? pType;
  @override
  @JsonKey(name: 'subType')
  final String? subType;
  @override
  @JsonKey(name: 'district')
  final String? district;
  @override
  @JsonKey(name: 'uCode')
  final String? uCode;
  @override
  @JsonKey(name: 'sub_area')
  final String? subArea;
  @override
  @JsonKey(name: 'sub_district')
  final String? subDistrict;

  @override
  String toString() {
    return 'AutocompletePlaceModel(id: $id, longitude: $longitude, latitude: $latitude, address: $address, city: $city, area: $area, postCode: $postCode, pType: $pType, subType: $subType, district: $district, uCode: $uCode, subArea: $subArea, subDistrict: $subDistrict)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompletePlaceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.postCode, postCode) ||
                other.postCode == postCode) &&
            (identical(other.pType, pType) || other.pType == pType) &&
            (identical(other.subType, subType) || other.subType == subType) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.uCode, uCode) || other.uCode == uCode) &&
            (identical(other.subArea, subArea) || other.subArea == subArea) &&
            (identical(other.subDistrict, subDistrict) ||
                other.subDistrict == subDistrict));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    longitude,
    latitude,
    address,
    city,
    area,
    postCode,
    pType,
    subType,
    district,
    uCode,
    subArea,
    subDistrict,
  );

  /// Create a copy of AutocompletePlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompletePlaceModelImplCopyWith<_$AutocompletePlaceModelImpl>
  get copyWith =>
      __$$AutocompletePlaceModelImplCopyWithImpl<_$AutocompletePlaceModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompletePlaceModelImplToJson(this);
  }
}

abstract class _AutocompletePlaceModel implements AutocompletePlaceModel {
  const factory _AutocompletePlaceModel({
    @JsonKey(name: 'id') final int? id,
    @JsonKey(name: 'longitude') final String? longitude,
    @JsonKey(name: 'latitude') final String? latitude,
    @JsonKey(name: 'address') final String? address,
    @JsonKey(name: 'city') final String? city,
    @JsonKey(name: 'area') final String? area,
    @JsonKey(name: 'postCode') final int? postCode,
    @JsonKey(name: 'pType') final String? pType,
    @JsonKey(name: 'subType') final String? subType,
    @JsonKey(name: 'district') final String? district,
    @JsonKey(name: 'uCode') final String? uCode,
    @JsonKey(name: 'sub_area') final String? subArea,
    @JsonKey(name: 'sub_district') final String? subDistrict,
  }) = _$AutocompletePlaceModelImpl;

  factory _AutocompletePlaceModel.fromJson(Map<String, dynamic> json) =
      _$AutocompletePlaceModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'longitude')
  String? get longitude;
  @override
  @JsonKey(name: 'latitude')
  String? get latitude;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'area')
  String? get area;
  @override
  @JsonKey(name: 'postCode')
  int? get postCode;
  @override
  @JsonKey(name: 'pType')
  String? get pType;
  @override
  @JsonKey(name: 'subType')
  String? get subType;
  @override
  @JsonKey(name: 'district')
  String? get district;
  @override
  @JsonKey(name: 'uCode')
  String? get uCode;
  @override
  @JsonKey(name: 'sub_area')
  String? get subArea;
  @override
  @JsonKey(name: 'sub_district')
  String? get subDistrict;

  /// Create a copy of AutocompletePlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutocompletePlaceModelImplCopyWith<_$AutocompletePlaceModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
