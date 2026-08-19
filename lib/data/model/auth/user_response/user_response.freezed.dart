// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  @HiveField(0)
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "group_id")
  int? get groupId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "default_shipping")
  String? get defaultShipping => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "created_in")
  String? get createdIn => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "dob")
  DateTime? get dob => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: "firstname")
  String? get firstname => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: "lastname")
  String? get lastname => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: "gender")
  int? get gender => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: "website_id")
  int? get websiteId => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: "addresses")
  List<Address>? get addresses => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: "disable_auto_group_change")
  int? get disableAutoGroupChange => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: "extension_attributes")
  ExtensionAttributes? get extensionAttributes =>
      throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey(name: "custom_attributes")
  List<CustomAttribute>? get customAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this UserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
    UserResponse value,
    $Res Function(UserResponse) then,
  ) = _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "group_id") int? groupId,
    @HiveField(2) @JsonKey(name: "default_shipping") String? defaultShipping,
    @HiveField(3) @JsonKey(name: "created_at") DateTime? createdAt,
    @HiveField(4) @JsonKey(name: "updated_at") DateTime? updatedAt,
    @HiveField(5) @JsonKey(name: "created_in") String? createdIn,
    @HiveField(6) @JsonKey(name: "dob") DateTime? dob,
    @HiveField(7) @JsonKey(name: "email") String? email,
    @HiveField(8) @JsonKey(name: "firstname") String? firstname,
    @HiveField(9) @JsonKey(name: "lastname") String? lastname,
    @HiveField(10) @JsonKey(name: "gender") int? gender,
    @HiveField(11) @JsonKey(name: "store_id") int? storeId,
    @HiveField(12) @JsonKey(name: "website_id") int? websiteId,
    @HiveField(13) @JsonKey(name: "addresses") List<Address>? addresses,
    @HiveField(14)
    @JsonKey(name: "disable_auto_group_change")
    int? disableAutoGroupChange,
    @HiveField(15)
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
    @HiveField(16)
    @JsonKey(name: "custom_attributes")
    List<CustomAttribute>? customAttributes,
  });

  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdIn = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? storeId = freezed,
    Object? websiteId = freezed,
    Object? addresses = freezed,
    Object? disableAutoGroupChange = freezed,
    Object? extensionAttributes = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            groupId:
                freezed == groupId
                    ? _value.groupId
                    : groupId // ignore: cast_nullable_to_non_nullable
                        as int?,
            defaultShipping:
                freezed == defaultShipping
                    ? _value.defaultShipping
                    : defaultShipping // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            createdIn:
                freezed == createdIn
                    ? _value.createdIn
                    : createdIn // ignore: cast_nullable_to_non_nullable
                        as String?,
            dob:
                freezed == dob
                    ? _value.dob
                    : dob // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            firstname:
                freezed == firstname
                    ? _value.firstname
                    : firstname // ignore: cast_nullable_to_non_nullable
                        as String?,
            lastname:
                freezed == lastname
                    ? _value.lastname
                    : lastname // ignore: cast_nullable_to_non_nullable
                        as String?,
            gender:
                freezed == gender
                    ? _value.gender
                    : gender // ignore: cast_nullable_to_non_nullable
                        as int?,
            storeId:
                freezed == storeId
                    ? _value.storeId
                    : storeId // ignore: cast_nullable_to_non_nullable
                        as int?,
            websiteId:
                freezed == websiteId
                    ? _value.websiteId
                    : websiteId // ignore: cast_nullable_to_non_nullable
                        as int?,
            addresses:
                freezed == addresses
                    ? _value.addresses
                    : addresses // ignore: cast_nullable_to_non_nullable
                        as List<Address>?,
            disableAutoGroupChange:
                freezed == disableAutoGroupChange
                    ? _value.disableAutoGroupChange
                    : disableAutoGroupChange // ignore: cast_nullable_to_non_nullable
                        as int?,
            extensionAttributes:
                freezed == extensionAttributes
                    ? _value.extensionAttributes
                    : extensionAttributes // ignore: cast_nullable_to_non_nullable
                        as ExtensionAttributes?,
            customAttributes:
                freezed == customAttributes
                    ? _value.customAttributes
                    : customAttributes // ignore: cast_nullable_to_non_nullable
                        as List<CustomAttribute>?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes {
    if (_value.extensionAttributes == null) {
      return null;
    }

    return $ExtensionAttributesCopyWith<$Res>(_value.extensionAttributes!, (
      value,
    ) {
      return _then(_value.copyWith(extensionAttributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResponseImplCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$UserResponseImplCopyWith(
    _$UserResponseImpl value,
    $Res Function(_$UserResponseImpl) then,
  ) = __$$UserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "group_id") int? groupId,
    @HiveField(2) @JsonKey(name: "default_shipping") String? defaultShipping,
    @HiveField(3) @JsonKey(name: "created_at") DateTime? createdAt,
    @HiveField(4) @JsonKey(name: "updated_at") DateTime? updatedAt,
    @HiveField(5) @JsonKey(name: "created_in") String? createdIn,
    @HiveField(6) @JsonKey(name: "dob") DateTime? dob,
    @HiveField(7) @JsonKey(name: "email") String? email,
    @HiveField(8) @JsonKey(name: "firstname") String? firstname,
    @HiveField(9) @JsonKey(name: "lastname") String? lastname,
    @HiveField(10) @JsonKey(name: "gender") int? gender,
    @HiveField(11) @JsonKey(name: "store_id") int? storeId,
    @HiveField(12) @JsonKey(name: "website_id") int? websiteId,
    @HiveField(13) @JsonKey(name: "addresses") List<Address>? addresses,
    @HiveField(14)
    @JsonKey(name: "disable_auto_group_change")
    int? disableAutoGroupChange,
    @HiveField(15)
    @JsonKey(name: "extension_attributes")
    ExtensionAttributes? extensionAttributes,
    @HiveField(16)
    @JsonKey(name: "custom_attributes")
    List<CustomAttribute>? customAttributes,
  });

  @override
  $ExtensionAttributesCopyWith<$Res>? get extensionAttributes;
}

/// @nodoc
class __$$UserResponseImplCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$UserResponseImpl>
    implements _$$UserResponseImplCopyWith<$Res> {
  __$$UserResponseImplCopyWithImpl(
    _$UserResponseImpl _value,
    $Res Function(_$UserResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? groupId = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdIn = freezed,
    Object? dob = freezed,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? gender = freezed,
    Object? storeId = freezed,
    Object? websiteId = freezed,
    Object? addresses = freezed,
    Object? disableAutoGroupChange = freezed,
    Object? extensionAttributes = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _$UserResponseImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        groupId:
            freezed == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                    as int?,
        defaultShipping:
            freezed == defaultShipping
                ? _value.defaultShipping
                : defaultShipping // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        createdIn:
            freezed == createdIn
                ? _value.createdIn
                : createdIn // ignore: cast_nullable_to_non_nullable
                    as String?,
        dob:
            freezed == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        firstname:
            freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                    as String?,
        lastname:
            freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                    as String?,
        gender:
            freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                    as int?,
        storeId:
            freezed == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                    as int?,
        websiteId:
            freezed == websiteId
                ? _value.websiteId
                : websiteId // ignore: cast_nullable_to_non_nullable
                    as int?,
        addresses:
            freezed == addresses
                ? _value._addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                    as List<Address>?,
        disableAutoGroupChange:
            freezed == disableAutoGroupChange
                ? _value.disableAutoGroupChange
                : disableAutoGroupChange // ignore: cast_nullable_to_non_nullable
                    as int?,
        extensionAttributes:
            freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                    as ExtensionAttributes?,
        customAttributes:
            freezed == customAttributes
                ? _value._customAttributes
                : customAttributes // ignore: cast_nullable_to_non_nullable
                    as List<CustomAttribute>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseImpl implements _UserResponse {
  const _$UserResponseImpl({
    @HiveField(0) @JsonKey(name: "id") this.id,
    @HiveField(1) @JsonKey(name: "group_id") this.groupId,
    @HiveField(2) @JsonKey(name: "default_shipping") this.defaultShipping,
    @HiveField(3) @JsonKey(name: "created_at") this.createdAt,
    @HiveField(4) @JsonKey(name: "updated_at") this.updatedAt,
    @HiveField(5) @JsonKey(name: "created_in") this.createdIn,
    @HiveField(6) @JsonKey(name: "dob") this.dob,
    @HiveField(7) @JsonKey(name: "email") this.email,
    @HiveField(8) @JsonKey(name: "firstname") this.firstname,
    @HiveField(9) @JsonKey(name: "lastname") this.lastname,
    @HiveField(10) @JsonKey(name: "gender") this.gender,
    @HiveField(11) @JsonKey(name: "store_id") this.storeId,
    @HiveField(12) @JsonKey(name: "website_id") this.websiteId,
    @HiveField(13) @JsonKey(name: "addresses") final List<Address>? addresses,
    @HiveField(14)
    @JsonKey(name: "disable_auto_group_change")
    this.disableAutoGroupChange,
    @HiveField(15)
    @JsonKey(name: "extension_attributes")
    this.extensionAttributes,
    @HiveField(16)
    @JsonKey(name: "custom_attributes")
    final List<CustomAttribute>? customAttributes,
  }) : _addresses = addresses,
       _customAttributes = customAttributes;

  factory _$UserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;
  @override
  @HiveField(1)
  @JsonKey(name: "group_id")
  final int? groupId;
  @override
  @HiveField(2)
  @JsonKey(name: "default_shipping")
  final String? defaultShipping;
  @override
  @HiveField(3)
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @HiveField(4)
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @HiveField(5)
  @JsonKey(name: "created_in")
  final String? createdIn;
  @override
  @HiveField(6)
  @JsonKey(name: "dob")
  final DateTime? dob;
  @override
  @HiveField(7)
  @JsonKey(name: "email")
  final String? email;
  @override
  @HiveField(8)
  @JsonKey(name: "firstname")
  final String? firstname;
  @override
  @HiveField(9)
  @JsonKey(name: "lastname")
  final String? lastname;
  @override
  @HiveField(10)
  @JsonKey(name: "gender")
  final int? gender;
  @override
  @HiveField(11)
  @JsonKey(name: "store_id")
  final int? storeId;
  @override
  @HiveField(12)
  @JsonKey(name: "website_id")
  final int? websiteId;
  final List<Address>? _addresses;
  @override
  @HiveField(13)
  @JsonKey(name: "addresses")
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(14)
  @JsonKey(name: "disable_auto_group_change")
  final int? disableAutoGroupChange;
  @override
  @HiveField(15)
  @JsonKey(name: "extension_attributes")
  final ExtensionAttributes? extensionAttributes;
  final List<CustomAttribute>? _customAttributes;
  @override
  @HiveField(16)
  @JsonKey(name: "custom_attributes")
  List<CustomAttribute>? get customAttributes {
    final value = _customAttributes;
    if (value == null) return null;
    if (_customAttributes is EqualUnmodifiableListView)
      return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserResponse(id: $id, groupId: $groupId, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, createdIn: $createdIn, dob: $dob, email: $email, firstname: $firstname, lastname: $lastname, gender: $gender, storeId: $storeId, websiteId: $websiteId, addresses: $addresses, disableAutoGroupChange: $disableAutoGroupChange, extensionAttributes: $extensionAttributes, customAttributes: $customAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdIn, createdIn) ||
                other.createdIn == createdIn) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.websiteId, websiteId) ||
                other.websiteId == websiteId) &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ) &&
            (identical(other.disableAutoGroupChange, disableAutoGroupChange) ||
                other.disableAutoGroupChange == disableAutoGroupChange) &&
            (identical(other.extensionAttributes, extensionAttributes) ||
                other.extensionAttributes == extensionAttributes) &&
            const DeepCollectionEquality().equals(
              other._customAttributes,
              _customAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    groupId,
    defaultShipping,
    createdAt,
    updatedAt,
    createdIn,
    dob,
    email,
    firstname,
    lastname,
    gender,
    storeId,
    websiteId,
    const DeepCollectionEquality().hash(_addresses),
    disableAutoGroupChange,
    extensionAttributes,
    const DeepCollectionEquality().hash(_customAttributes),
  );

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      __$$UserResponseImplCopyWithImpl<_$UserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseImplToJson(this);
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse({
    @HiveField(0) @JsonKey(name: "id") final int? id,
    @HiveField(1) @JsonKey(name: "group_id") final int? groupId,
    @HiveField(2)
    @JsonKey(name: "default_shipping")
    final String? defaultShipping,
    @HiveField(3) @JsonKey(name: "created_at") final DateTime? createdAt,
    @HiveField(4) @JsonKey(name: "updated_at") final DateTime? updatedAt,
    @HiveField(5) @JsonKey(name: "created_in") final String? createdIn,
    @HiveField(6) @JsonKey(name: "dob") final DateTime? dob,
    @HiveField(7) @JsonKey(name: "email") final String? email,
    @HiveField(8) @JsonKey(name: "firstname") final String? firstname,
    @HiveField(9) @JsonKey(name: "lastname") final String? lastname,
    @HiveField(10) @JsonKey(name: "gender") final int? gender,
    @HiveField(11) @JsonKey(name: "store_id") final int? storeId,
    @HiveField(12) @JsonKey(name: "website_id") final int? websiteId,
    @HiveField(13) @JsonKey(name: "addresses") final List<Address>? addresses,
    @HiveField(14)
    @JsonKey(name: "disable_auto_group_change")
    final int? disableAutoGroupChange,
    @HiveField(15)
    @JsonKey(name: "extension_attributes")
    final ExtensionAttributes? extensionAttributes,
    @HiveField(16)
    @JsonKey(name: "custom_attributes")
    final List<CustomAttribute>? customAttributes,
  }) = _$UserResponseImpl;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$UserResponseImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  int? get id;
  @override
  @HiveField(1)
  @JsonKey(name: "group_id")
  int? get groupId;
  @override
  @HiveField(2)
  @JsonKey(name: "default_shipping")
  String? get defaultShipping;
  @override
  @HiveField(3)
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @HiveField(4)
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @HiveField(5)
  @JsonKey(name: "created_in")
  String? get createdIn;
  @override
  @HiveField(6)
  @JsonKey(name: "dob")
  DateTime? get dob;
  @override
  @HiveField(7)
  @JsonKey(name: "email")
  String? get email;
  @override
  @HiveField(8)
  @JsonKey(name: "firstname")
  String? get firstname;
  @override
  @HiveField(9)
  @JsonKey(name: "lastname")
  String? get lastname;
  @override
  @HiveField(10)
  @JsonKey(name: "gender")
  int? get gender;
  @override
  @HiveField(11)
  @JsonKey(name: "store_id")
  int? get storeId;
  @override
  @HiveField(12)
  @JsonKey(name: "website_id")
  int? get websiteId;
  @override
  @HiveField(13)
  @JsonKey(name: "addresses")
  List<Address>? get addresses;
  @override
  @HiveField(14)
  @JsonKey(name: "disable_auto_group_change")
  int? get disableAutoGroupChange;
  @override
  @HiveField(15)
  @JsonKey(name: "extension_attributes")
  ExtensionAttributes? get extensionAttributes;
  @override
  @HiveField(16)
  @JsonKey(name: "custom_attributes")
  List<CustomAttribute>? get customAttributes;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @HiveField(0)
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "customer_id")
  int? get customerId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "region")
  Region? get region => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: "region_id")
  int? get regionId => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: "country_id")
  String? get countryId => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: "street")
  List<String>? get street => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: "telephone")
  String? get telephone => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: "postcode")
  String? get postcode => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: "firstname")
  String? get firstname => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: "lastname")
  String? get lastname => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: "default_shipping")
  bool? get defaultShipping => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: "default_billing")
  bool? get defaultBilling => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "customer_id") int? customerId,
    @HiveField(2) @JsonKey(name: "region") Region? region,
    @HiveField(3) @JsonKey(name: "region_id") int? regionId,
    @HiveField(4) @JsonKey(name: "country_id") String? countryId,
    @HiveField(5) @JsonKey(name: "street") List<String>? street,
    @HiveField(6) @JsonKey(name: "telephone") String? telephone,
    @HiveField(7) @JsonKey(name: "postcode") String? postcode,
    @HiveField(8) @JsonKey(name: "city") String? city,
    @HiveField(9) @JsonKey(name: "firstname") String? firstname,
    @HiveField(10) @JsonKey(name: "lastname") String? lastname,
    @HiveField(11) @JsonKey(name: "default_shipping") bool? defaultShipping,
    @HiveField(12) @JsonKey(name: "default_billing") bool? defaultBilling,
  });

  $RegionCopyWith<$Res>? get region;
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? defaultShipping = freezed,
    Object? defaultBilling = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as int?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as Region?,
            regionId:
                freezed == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as int?,
            countryId:
                freezed == countryId
                    ? _value.countryId
                    : countryId // ignore: cast_nullable_to_non_nullable
                        as String?,
            street:
                freezed == street
                    ? _value.street
                    : street // ignore: cast_nullable_to_non_nullable
                        as List<String>?,
            telephone:
                freezed == telephone
                    ? _value.telephone
                    : telephone // ignore: cast_nullable_to_non_nullable
                        as String?,
            postcode:
                freezed == postcode
                    ? _value.postcode
                    : postcode // ignore: cast_nullable_to_non_nullable
                        as String?,
            city:
                freezed == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String?,
            firstname:
                freezed == firstname
                    ? _value.firstname
                    : firstname // ignore: cast_nullable_to_non_nullable
                        as String?,
            lastname:
                freezed == lastname
                    ? _value.lastname
                    : lastname // ignore: cast_nullable_to_non_nullable
                        as String?,
            defaultShipping:
                freezed == defaultShipping
                    ? _value.defaultShipping
                    : defaultShipping // ignore: cast_nullable_to_non_nullable
                        as bool?,
            defaultBilling:
                freezed == defaultBilling
                    ? _value.defaultBilling
                    : defaultBilling // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegionCopyWith<$Res>? get region {
    if (_value.region == null) {
      return null;
    }

    return $RegionCopyWith<$Res>(_value.region!, (value) {
      return _then(_value.copyWith(region: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
    _$AddressImpl value,
    $Res Function(_$AddressImpl) then,
  ) = __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "id") int? id,
    @HiveField(1) @JsonKey(name: "customer_id") int? customerId,
    @HiveField(2) @JsonKey(name: "region") Region? region,
    @HiveField(3) @JsonKey(name: "region_id") int? regionId,
    @HiveField(4) @JsonKey(name: "country_id") String? countryId,
    @HiveField(5) @JsonKey(name: "street") List<String>? street,
    @HiveField(6) @JsonKey(name: "telephone") String? telephone,
    @HiveField(7) @JsonKey(name: "postcode") String? postcode,
    @HiveField(8) @JsonKey(name: "city") String? city,
    @HiveField(9) @JsonKey(name: "firstname") String? firstname,
    @HiveField(10) @JsonKey(name: "lastname") String? lastname,
    @HiveField(11) @JsonKey(name: "default_shipping") bool? defaultShipping,
    @HiveField(12) @JsonKey(name: "default_billing") bool? defaultBilling,
  });

  @override
  $RegionCopyWith<$Res>? get region;
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
    _$AddressImpl _value,
    $Res Function(_$AddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? telephone = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? defaultShipping = freezed,
    Object? defaultBilling = freezed,
  }) {
    return _then(
      _$AddressImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as Region?,
        regionId:
            freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as int?,
        countryId:
            freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                    as String?,
        street:
            freezed == street
                ? _value._street
                : street // ignore: cast_nullable_to_non_nullable
                    as List<String>?,
        telephone:
            freezed == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                    as String?,
        postcode:
            freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                    as String?,
        city:
            freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String?,
        firstname:
            freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                    as String?,
        lastname:
            freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                    as String?,
        defaultShipping:
            freezed == defaultShipping
                ? _value.defaultShipping
                : defaultShipping // ignore: cast_nullable_to_non_nullable
                    as bool?,
        defaultBilling:
            freezed == defaultBilling
                ? _value.defaultBilling
                : defaultBilling // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl({
    @HiveField(0) @JsonKey(name: "id") this.id,
    @HiveField(1) @JsonKey(name: "customer_id") this.customerId,
    @HiveField(2) @JsonKey(name: "region") this.region,
    @HiveField(3) @JsonKey(name: "region_id") this.regionId,
    @HiveField(4) @JsonKey(name: "country_id") this.countryId,
    @HiveField(5) @JsonKey(name: "street") final List<String>? street,
    @HiveField(6) @JsonKey(name: "telephone") this.telephone,
    @HiveField(7) @JsonKey(name: "postcode") this.postcode,
    @HiveField(8) @JsonKey(name: "city") this.city,
    @HiveField(9) @JsonKey(name: "firstname") this.firstname,
    @HiveField(10) @JsonKey(name: "lastname") this.lastname,
    @HiveField(11) @JsonKey(name: "default_shipping") this.defaultShipping,
    @HiveField(12) @JsonKey(name: "default_billing") this.defaultBilling,
  }) : _street = street;

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  final int? id;
  @override
  @HiveField(1)
  @JsonKey(name: "customer_id")
  final int? customerId;
  @override
  @HiveField(2)
  @JsonKey(name: "region")
  final Region? region;
  @override
  @HiveField(3)
  @JsonKey(name: "region_id")
  final int? regionId;
  @override
  @HiveField(4)
  @JsonKey(name: "country_id")
  final String? countryId;
  final List<String>? _street;
  @override
  @HiveField(5)
  @JsonKey(name: "street")
  List<String>? get street {
    final value = _street;
    if (value == null) return null;
    if (_street is EqualUnmodifiableListView) return _street;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(6)
  @JsonKey(name: "telephone")
  final String? telephone;
  @override
  @HiveField(7)
  @JsonKey(name: "postcode")
  final String? postcode;
  @override
  @HiveField(8)
  @JsonKey(name: "city")
  final String? city;
  @override
  @HiveField(9)
  @JsonKey(name: "firstname")
  final String? firstname;
  @override
  @HiveField(10)
  @JsonKey(name: "lastname")
  final String? lastname;
  @override
  @HiveField(11)
  @JsonKey(name: "default_shipping")
  final bool? defaultShipping;
  @override
  @HiveField(12)
  @JsonKey(name: "default_billing")
  final bool? defaultBilling;

  @override
  String toString() {
    return 'Address(id: $id, customerId: $customerId, region: $region, regionId: $regionId, countryId: $countryId, street: $street, telephone: $telephone, postcode: $postcode, city: $city, firstname: $firstname, lastname: $lastname, defaultShipping: $defaultShipping, defaultBilling: $defaultBilling)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            const DeepCollectionEquality().equals(other._street, _street) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.defaultBilling, defaultBilling) ||
                other.defaultBilling == defaultBilling));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    customerId,
    region,
    regionId,
    countryId,
    const DeepCollectionEquality().hash(_street),
    telephone,
    postcode,
    city,
    firstname,
    lastname,
    defaultShipping,
    defaultBilling,
  );

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(this);
  }
}

abstract class _Address implements Address {
  const factory _Address({
    @HiveField(0) @JsonKey(name: "id") final int? id,
    @HiveField(1) @JsonKey(name: "customer_id") final int? customerId,
    @HiveField(2) @JsonKey(name: "region") final Region? region,
    @HiveField(3) @JsonKey(name: "region_id") final int? regionId,
    @HiveField(4) @JsonKey(name: "country_id") final String? countryId,
    @HiveField(5) @JsonKey(name: "street") final List<String>? street,
    @HiveField(6) @JsonKey(name: "telephone") final String? telephone,
    @HiveField(7) @JsonKey(name: "postcode") final String? postcode,
    @HiveField(8) @JsonKey(name: "city") final String? city,
    @HiveField(9) @JsonKey(name: "firstname") final String? firstname,
    @HiveField(10) @JsonKey(name: "lastname") final String? lastname,
    @HiveField(11)
    @JsonKey(name: "default_shipping")
    final bool? defaultShipping,
    @HiveField(12) @JsonKey(name: "default_billing") final bool? defaultBilling,
  }) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "id")
  int? get id;
  @override
  @HiveField(1)
  @JsonKey(name: "customer_id")
  int? get customerId;
  @override
  @HiveField(2)
  @JsonKey(name: "region")
  Region? get region;
  @override
  @HiveField(3)
  @JsonKey(name: "region_id")
  int? get regionId;
  @override
  @HiveField(4)
  @JsonKey(name: "country_id")
  String? get countryId;
  @override
  @HiveField(5)
  @JsonKey(name: "street")
  List<String>? get street;
  @override
  @HiveField(6)
  @JsonKey(name: "telephone")
  String? get telephone;
  @override
  @HiveField(7)
  @JsonKey(name: "postcode")
  String? get postcode;
  @override
  @HiveField(8)
  @JsonKey(name: "city")
  String? get city;
  @override
  @HiveField(9)
  @JsonKey(name: "firstname")
  String? get firstname;
  @override
  @HiveField(10)
  @JsonKey(name: "lastname")
  String? get lastname;
  @override
  @HiveField(11)
  @JsonKey(name: "default_shipping")
  bool? get defaultShipping;
  @override
  @HiveField(12)
  @JsonKey(name: "default_billing")
  bool? get defaultBilling;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
mixin _$Region {
  @HiveField(0)
  @JsonKey(name: "region_code")
  String? get regionCode => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "region")
  String? get region => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: "region_id")
  int? get regionId => throw _privateConstructorUsedError;

  /// Serializes this Region to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "region_code") String? regionCode,
    @HiveField(1) @JsonKey(name: "region") String? region,
    @HiveField(2) @JsonKey(name: "region_id") int? regionId,
  });
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionCode = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
  }) {
    return _then(
      _value.copyWith(
            regionCode:
                freezed == regionCode
                    ? _value.regionCode
                    : regionCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            region:
                freezed == region
                    ? _value.region
                    : region // ignore: cast_nullable_to_non_nullable
                        as String?,
            regionId:
                freezed == regionId
                    ? _value.regionId
                    : regionId // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegionImplCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$RegionImplCopyWith(
    _$RegionImpl value,
    $Res Function(_$RegionImpl) then,
  ) = __$$RegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "region_code") String? regionCode,
    @HiveField(1) @JsonKey(name: "region") String? region,
    @HiveField(2) @JsonKey(name: "region_id") int? regionId,
  });
}

/// @nodoc
class __$$RegionImplCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$RegionImpl>
    implements _$$RegionImplCopyWith<$Res> {
  __$$RegionImplCopyWithImpl(
    _$RegionImpl _value,
    $Res Function(_$RegionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regionCode = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
  }) {
    return _then(
      _$RegionImpl(
        regionCode:
            freezed == regionCode
                ? _value.regionCode
                : regionCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        region:
            freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                    as String?,
        regionId:
            freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionImpl implements _Region {
  const _$RegionImpl({
    @HiveField(0) @JsonKey(name: "region_code") this.regionCode,
    @HiveField(1) @JsonKey(name: "region") this.region,
    @HiveField(2) @JsonKey(name: "region_id") this.regionId,
  });

  factory _$RegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "region_code")
  final String? regionCode;
  @override
  @HiveField(1)
  @JsonKey(name: "region")
  final String? region;
  @override
  @HiveField(2)
  @JsonKey(name: "region_id")
  final int? regionId;

  @override
  String toString() {
    return 'Region(regionCode: $regionCode, region: $region, regionId: $regionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionImpl &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, regionCode, region, regionId);

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      __$$RegionImplCopyWithImpl<_$RegionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionImplToJson(this);
  }
}

abstract class _Region implements Region {
  const factory _Region({
    @HiveField(0) @JsonKey(name: "region_code") final String? regionCode,
    @HiveField(1) @JsonKey(name: "region") final String? region,
    @HiveField(2) @JsonKey(name: "region_id") final int? regionId,
  }) = _$RegionImpl;

  factory _Region.fromJson(Map<String, dynamic> json) = _$RegionImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "region_code")
  String? get regionCode;
  @override
  @HiveField(1)
  @JsonKey(name: "region")
  String? get region;
  @override
  @HiveField(2)
  @JsonKey(name: "region_id")
  int? get regionId;

  /// Create a copy of Region
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomAttribute _$CustomAttributeFromJson(Map<String, dynamic> json) {
  return _CustomAttribute.fromJson(json);
}

/// @nodoc
mixin _$CustomAttribute {
  @HiveField(0)
  @JsonKey(name: "attribute_code")
  String? get attributeCode => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;

  /// Serializes this CustomAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomAttributeCopyWith<CustomAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomAttributeCopyWith<$Res> {
  factory $CustomAttributeCopyWith(
    CustomAttribute value,
    $Res Function(CustomAttribute) then,
  ) = _$CustomAttributeCopyWithImpl<$Res, CustomAttribute>;
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "attribute_code") String? attributeCode,
    @HiveField(1) @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class _$CustomAttributeCopyWithImpl<$Res, $Val extends CustomAttribute>
    implements $CustomAttributeCopyWith<$Res> {
  _$CustomAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? attributeCode = freezed, Object? value = freezed}) {
    return _then(
      _value.copyWith(
            attributeCode:
                freezed == attributeCode
                    ? _value.attributeCode
                    : attributeCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            value:
                freezed == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomAttributeImplCopyWith<$Res>
    implements $CustomAttributeCopyWith<$Res> {
  factory _$$CustomAttributeImplCopyWith(
    _$CustomAttributeImpl value,
    $Res Function(_$CustomAttributeImpl) then,
  ) = __$$CustomAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) @JsonKey(name: "attribute_code") String? attributeCode,
    @HiveField(1) @JsonKey(name: "value") String? value,
  });
}

/// @nodoc
class __$$CustomAttributeImplCopyWithImpl<$Res>
    extends _$CustomAttributeCopyWithImpl<$Res, _$CustomAttributeImpl>
    implements _$$CustomAttributeImplCopyWith<$Res> {
  __$$CustomAttributeImplCopyWithImpl(
    _$CustomAttributeImpl _value,
    $Res Function(_$CustomAttributeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? attributeCode = freezed, Object? value = freezed}) {
    return _then(
      _$CustomAttributeImpl(
        attributeCode:
            freezed == attributeCode
                ? _value.attributeCode
                : attributeCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        value:
            freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomAttributeImpl implements _CustomAttribute {
  const _$CustomAttributeImpl({
    @HiveField(0) @JsonKey(name: "attribute_code") this.attributeCode,
    @HiveField(1) @JsonKey(name: "value") this.value,
  });

  factory _$CustomAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomAttributeImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "attribute_code")
  final String? attributeCode;
  @override
  @HiveField(1)
  @JsonKey(name: "value")
  final String? value;

  @override
  String toString() {
    return 'CustomAttribute(attributeCode: $attributeCode, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomAttributeImpl &&
            (identical(other.attributeCode, attributeCode) ||
                other.attributeCode == attributeCode) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attributeCode, value);

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomAttributeImplCopyWith<_$CustomAttributeImpl> get copyWith =>
      __$$CustomAttributeImplCopyWithImpl<_$CustomAttributeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomAttributeImplToJson(this);
  }
}

abstract class _CustomAttribute implements CustomAttribute {
  const factory _CustomAttribute({
    @HiveField(0) @JsonKey(name: "attribute_code") final String? attributeCode,
    @HiveField(1) @JsonKey(name: "value") final String? value,
  }) = _$CustomAttributeImpl;

  factory _CustomAttribute.fromJson(Map<String, dynamic> json) =
      _$CustomAttributeImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "attribute_code")
  String? get attributeCode;
  @override
  @HiveField(1)
  @JsonKey(name: "value")
  String? get value;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomAttributeImplCopyWith<_$CustomAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtensionAttributes _$ExtensionAttributesFromJson(Map<String, dynamic> json) {
  return _ExtensionAttributes.fromJson(json);
}

/// @nodoc
mixin _$ExtensionAttributes {
  @HiveField(0)
  @JsonKey(name: "is_subscribed")
  bool? get isSubscribed => throw _privateConstructorUsedError;

  /// Serializes this ExtensionAttributes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionAttributesCopyWith<ExtensionAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionAttributesCopyWith<$Res> {
  factory $ExtensionAttributesCopyWith(
    ExtensionAttributes value,
    $Res Function(ExtensionAttributes) then,
  ) = _$ExtensionAttributesCopyWithImpl<$Res, ExtensionAttributes>;
  @useResult
  $Res call({@HiveField(0) @JsonKey(name: "is_subscribed") bool? isSubscribed});
}

/// @nodoc
class _$ExtensionAttributesCopyWithImpl<$Res, $Val extends ExtensionAttributes>
    implements $ExtensionAttributesCopyWith<$Res> {
  _$ExtensionAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isSubscribed = freezed}) {
    return _then(
      _value.copyWith(
            isSubscribed:
                freezed == isSubscribed
                    ? _value.isSubscribed
                    : isSubscribed // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtensionAttributesImplCopyWith<$Res>
    implements $ExtensionAttributesCopyWith<$Res> {
  factory _$$ExtensionAttributesImplCopyWith(
    _$ExtensionAttributesImpl value,
    $Res Function(_$ExtensionAttributesImpl) then,
  ) = __$$ExtensionAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) @JsonKey(name: "is_subscribed") bool? isSubscribed});
}

/// @nodoc
class __$$ExtensionAttributesImplCopyWithImpl<$Res>
    extends _$ExtensionAttributesCopyWithImpl<$Res, _$ExtensionAttributesImpl>
    implements _$$ExtensionAttributesImplCopyWith<$Res> {
  __$$ExtensionAttributesImplCopyWithImpl(
    _$ExtensionAttributesImpl _value,
    $Res Function(_$ExtensionAttributesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isSubscribed = freezed}) {
    return _then(
      _$ExtensionAttributesImpl(
        isSubscribed:
            freezed == isSubscribed
                ? _value.isSubscribed
                : isSubscribed // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionAttributesImpl implements _ExtensionAttributes {
  const _$ExtensionAttributesImpl({
    @HiveField(0) @JsonKey(name: "is_subscribed") this.isSubscribed,
  });

  factory _$ExtensionAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionAttributesImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: "is_subscribed")
  final bool? isSubscribed;

  @override
  String toString() {
    return 'ExtensionAttributes(isSubscribed: $isSubscribed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionAttributesImpl &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isSubscribed);

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionAttributesImplCopyWith<_$ExtensionAttributesImpl> get copyWith =>
      __$$ExtensionAttributesImplCopyWithImpl<_$ExtensionAttributesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionAttributesImplToJson(this);
  }
}

abstract class _ExtensionAttributes implements ExtensionAttributes {
  const factory _ExtensionAttributes({
    @HiveField(0) @JsonKey(name: "is_subscribed") final bool? isSubscribed,
  }) = _$ExtensionAttributesImpl;

  factory _ExtensionAttributes.fromJson(Map<String, dynamic> json) =
      _$ExtensionAttributesImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: "is_subscribed")
  bool? get isSubscribed;

  /// Create a copy of ExtensionAttributes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionAttributesImplCopyWith<_$ExtensionAttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
