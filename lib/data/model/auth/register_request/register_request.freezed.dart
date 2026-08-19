// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) {
  return _CustomerData.fromJson(json);
}

/// @nodoc
mixin _$CustomerData {
  String get email => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_id')
  int get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'website_id')
  int get websiteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'disable_auto_group_change')
  int get disableAutoGroupChange => throw _privateConstructorUsedError;

  /// Serializes this CustomerData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerDataCopyWith<CustomerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDataCopyWith<$Res> {
  factory $CustomerDataCopyWith(
    CustomerData value,
    $Res Function(CustomerData) then,
  ) = _$CustomerDataCopyWithImpl<$Res, CustomerData>;
  @useResult
  $Res call({
    String email,
    String firstname,
    String lastname,
    @JsonKey(name: 'store_id') int storeId,
    @JsonKey(name: 'website_id') int websiteId,
    @JsonKey(name: 'disable_auto_group_change') int disableAutoGroupChange,
  });
}

/// @nodoc
class _$CustomerDataCopyWithImpl<$Res, $Val extends CustomerData>
    implements $CustomerDataCopyWith<$Res> {
  _$CustomerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? storeId = null,
    Object? websiteId = null,
    Object? disableAutoGroupChange = null,
  }) {
    return _then(
      _value.copyWith(
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            firstname:
                null == firstname
                    ? _value.firstname
                    : firstname // ignore: cast_nullable_to_non_nullable
                        as String,
            lastname:
                null == lastname
                    ? _value.lastname
                    : lastname // ignore: cast_nullable_to_non_nullable
                        as String,
            storeId:
                null == storeId
                    ? _value.storeId
                    : storeId // ignore: cast_nullable_to_non_nullable
                        as int,
            websiteId:
                null == websiteId
                    ? _value.websiteId
                    : websiteId // ignore: cast_nullable_to_non_nullable
                        as int,
            disableAutoGroupChange:
                null == disableAutoGroupChange
                    ? _value.disableAutoGroupChange
                    : disableAutoGroupChange // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerDataImplCopyWith<$Res>
    implements $CustomerDataCopyWith<$Res> {
  factory _$$CustomerDataImplCopyWith(
    _$CustomerDataImpl value,
    $Res Function(_$CustomerDataImpl) then,
  ) = __$$CustomerDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String firstname,
    String lastname,
    @JsonKey(name: 'store_id') int storeId,
    @JsonKey(name: 'website_id') int websiteId,
    @JsonKey(name: 'disable_auto_group_change') int disableAutoGroupChange,
  });
}

/// @nodoc
class __$$CustomerDataImplCopyWithImpl<$Res>
    extends _$CustomerDataCopyWithImpl<$Res, _$CustomerDataImpl>
    implements _$$CustomerDataImplCopyWith<$Res> {
  __$$CustomerDataImplCopyWithImpl(
    _$CustomerDataImpl _value,
    $Res Function(_$CustomerDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? storeId = null,
    Object? websiteId = null,
    Object? disableAutoGroupChange = null,
  }) {
    return _then(
      _$CustomerDataImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        firstname:
            null == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                    as String,
        lastname:
            null == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                    as String,
        storeId:
            null == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                    as int,
        websiteId:
            null == websiteId
                ? _value.websiteId
                : websiteId // ignore: cast_nullable_to_non_nullable
                    as int,
        disableAutoGroupChange:
            null == disableAutoGroupChange
                ? _value.disableAutoGroupChange
                : disableAutoGroupChange // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerDataImpl implements _CustomerData {
  const _$CustomerDataImpl({
    required this.email,
    required this.firstname,
    required this.lastname,
    @JsonKey(name: 'store_id') this.storeId = 0,
    @JsonKey(name: 'website_id') this.websiteId = 0,
    @JsonKey(name: 'disable_auto_group_change') this.disableAutoGroupChange = 0,
  });

  factory _$CustomerDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDataImplFromJson(json);

  @override
  final String email;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  @JsonKey(name: 'store_id')
  final int storeId;
  @override
  @JsonKey(name: 'website_id')
  final int websiteId;
  @override
  @JsonKey(name: 'disable_auto_group_change')
  final int disableAutoGroupChange;

  @override
  String toString() {
    return 'CustomerData(email: $email, firstname: $firstname, lastname: $lastname, storeId: $storeId, websiteId: $websiteId, disableAutoGroupChange: $disableAutoGroupChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDataImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.websiteId, websiteId) ||
                other.websiteId == websiteId) &&
            (identical(other.disableAutoGroupChange, disableAutoGroupChange) ||
                other.disableAutoGroupChange == disableAutoGroupChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    firstname,
    lastname,
    storeId,
    websiteId,
    disableAutoGroupChange,
  );

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDataImplCopyWith<_$CustomerDataImpl> get copyWith =>
      __$$CustomerDataImplCopyWithImpl<_$CustomerDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDataImplToJson(this);
  }
}

abstract class _CustomerData implements CustomerData {
  const factory _CustomerData({
    required final String email,
    required final String firstname,
    required final String lastname,
    @JsonKey(name: 'store_id') final int storeId,
    @JsonKey(name: 'website_id') final int websiteId,
    @JsonKey(name: 'disable_auto_group_change')
    final int disableAutoGroupChange,
  }) = _$CustomerDataImpl;

  factory _CustomerData.fromJson(Map<String, dynamic> json) =
      _$CustomerDataImpl.fromJson;

  @override
  String get email;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  @JsonKey(name: 'store_id')
  int get storeId;
  @override
  @JsonKey(name: 'website_id')
  int get websiteId;
  @override
  @JsonKey(name: 'disable_auto_group_change')
  int get disableAutoGroupChange;

  /// Create a copy of CustomerData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerDataImplCopyWith<_$CustomerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return _RegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterRequest {
  CustomerData get customer => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_code')
  String get referralCode => throw _privateConstructorUsedError;

  /// Serializes this RegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterRequestCopyWith<RegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterRequestCopyWith<$Res> {
  factory $RegisterRequestCopyWith(
    RegisterRequest value,
    $Res Function(RegisterRequest) then,
  ) = _$RegisterRequestCopyWithImpl<$Res, RegisterRequest>;
  @useResult
  $Res call({
    CustomerData customer,
    String password,
    String mobile,
    String otp,
    @JsonKey(name: 'referral_code') String referralCode,
  });

  $CustomerDataCopyWith<$Res> get customer;
}

/// @nodoc
class _$RegisterRequestCopyWithImpl<$Res, $Val extends RegisterRequest>
    implements $RegisterRequestCopyWith<$Res> {
  _$RegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? password = null,
    Object? mobile = null,
    Object? otp = null,
    Object? referralCode = null,
  }) {
    return _then(
      _value.copyWith(
            customer:
                null == customer
                    ? _value.customer
                    : customer // ignore: cast_nullable_to_non_nullable
                        as CustomerData,
            password:
                null == password
                    ? _value.password
                    : password // ignore: cast_nullable_to_non_nullable
                        as String,
            mobile:
                null == mobile
                    ? _value.mobile
                    : mobile // ignore: cast_nullable_to_non_nullable
                        as String,
            otp:
                null == otp
                    ? _value.otp
                    : otp // ignore: cast_nullable_to_non_nullable
                        as String,
            referralCode:
                null == referralCode
                    ? _value.referralCode
                    : referralCode // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerDataCopyWith<$Res> get customer {
    return $CustomerDataCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterRequestImplCopyWith<$Res>
    implements $RegisterRequestCopyWith<$Res> {
  factory _$$RegisterRequestImplCopyWith(
    _$RegisterRequestImpl value,
    $Res Function(_$RegisterRequestImpl) then,
  ) = __$$RegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CustomerData customer,
    String password,
    String mobile,
    String otp,
    @JsonKey(name: 'referral_code') String referralCode,
  });

  @override
  $CustomerDataCopyWith<$Res> get customer;
}

/// @nodoc
class __$$RegisterRequestImplCopyWithImpl<$Res>
    extends _$RegisterRequestCopyWithImpl<$Res, _$RegisterRequestImpl>
    implements _$$RegisterRequestImplCopyWith<$Res> {
  __$$RegisterRequestImplCopyWithImpl(
    _$RegisterRequestImpl _value,
    $Res Function(_$RegisterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? password = null,
    Object? mobile = null,
    Object? otp = null,
    Object? referralCode = null,
  }) {
    return _then(
      _$RegisterRequestImpl(
        customer:
            null == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                    as CustomerData,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as String,
        mobile:
            null == mobile
                ? _value.mobile
                : mobile // ignore: cast_nullable_to_non_nullable
                    as String,
        otp:
            null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                    as String,
        referralCode:
            null == referralCode
                ? _value.referralCode
                : referralCode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterRequestImpl implements _RegisterRequest {
  const _$RegisterRequestImpl({
    required this.customer,
    required this.password,
    required this.mobile,
    required this.otp,
    @JsonKey(name: 'referral_code') this.referralCode = '',
  });

  factory _$RegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterRequestImplFromJson(json);

  @override
  final CustomerData customer;
  @override
  final String password;
  @override
  final String mobile;
  @override
  final String otp;
  @override
  @JsonKey(name: 'referral_code')
  final String referralCode;

  @override
  String toString() {
    return 'RegisterRequest(customer: $customer, password: $password, mobile: $mobile, otp: $otp, referralCode: $referralCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterRequestImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, customer, password, mobile, otp, referralCode);

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      __$$RegisterRequestImplCopyWithImpl<_$RegisterRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterRequestImplToJson(this);
  }
}

abstract class _RegisterRequest implements RegisterRequest {
  const factory _RegisterRequest({
    required final CustomerData customer,
    required final String password,
    required final String mobile,
    required final String otp,
    @JsonKey(name: 'referral_code') final String referralCode,
  }) = _$RegisterRequestImpl;

  factory _RegisterRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterRequestImpl.fromJson;

  @override
  CustomerData get customer;
  @override
  String get password;
  @override
  String get mobile;
  @override
  String get otp;
  @override
  @JsonKey(name: 'referral_code')
  String get referralCode;

  /// Create a copy of RegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterRequestImplCopyWith<_$RegisterRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
