// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SavedPaymentModel _$SavedPaymentModelFromJson(Map<String, dynamic> json) {
  return _SavedPaymentModel.fromJson(json);
}

/// @nodoc
mixin _$SavedPaymentModel {
  String get network => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_url')
  String get iconUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'agreement_id')
  String get agreementId => throw _privateConstructorUsedError;

  /// Serializes this SavedPaymentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPaymentModelCopyWith<SavedPaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPaymentModelCopyWith<$Res> {
  factory $SavedPaymentModelCopyWith(
    SavedPaymentModel value,
    $Res Function(SavedPaymentModel) then,
  ) = _$SavedPaymentModelCopyWithImpl<$Res, SavedPaymentModel>;
  @useResult
  $Res call({
    String network,
    @JsonKey(name: 'phone_number') String phoneNumber,
    @JsonKey(name: 'icon_url') String iconUrl,
    @JsonKey(name: 'agreement_id') String agreementId,
  });
}

/// @nodoc
class _$SavedPaymentModelCopyWithImpl<$Res, $Val extends SavedPaymentModel>
    implements $SavedPaymentModelCopyWith<$Res> {
  _$SavedPaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? network = null,
    Object? phoneNumber = null,
    Object? iconUrl = null,
    Object? agreementId = null,
  }) {
    return _then(
      _value.copyWith(
            network:
                null == network
                    ? _value.network
                    : network // ignore: cast_nullable_to_non_nullable
                        as String,
            phoneNumber:
                null == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String,
            iconUrl:
                null == iconUrl
                    ? _value.iconUrl
                    : iconUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            agreementId:
                null == agreementId
                    ? _value.agreementId
                    : agreementId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SavedPaymentModelImplCopyWith<$Res>
    implements $SavedPaymentModelCopyWith<$Res> {
  factory _$$SavedPaymentModelImplCopyWith(
    _$SavedPaymentModelImpl value,
    $Res Function(_$SavedPaymentModelImpl) then,
  ) = __$$SavedPaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String network,
    @JsonKey(name: 'phone_number') String phoneNumber,
    @JsonKey(name: 'icon_url') String iconUrl,
    @JsonKey(name: 'agreement_id') String agreementId,
  });
}

/// @nodoc
class __$$SavedPaymentModelImplCopyWithImpl<$Res>
    extends _$SavedPaymentModelCopyWithImpl<$Res, _$SavedPaymentModelImpl>
    implements _$$SavedPaymentModelImplCopyWith<$Res> {
  __$$SavedPaymentModelImplCopyWithImpl(
    _$SavedPaymentModelImpl _value,
    $Res Function(_$SavedPaymentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? network = null,
    Object? phoneNumber = null,
    Object? iconUrl = null,
    Object? agreementId = null,
  }) {
    return _then(
      _$SavedPaymentModelImpl(
        network:
            null == network
                ? _value.network
                : network // ignore: cast_nullable_to_non_nullable
                    as String,
        phoneNumber:
            null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String,
        iconUrl:
            null == iconUrl
                ? _value.iconUrl
                : iconUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        agreementId:
            null == agreementId
                ? _value.agreementId
                : agreementId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedPaymentModelImpl implements _SavedPaymentModel {
  const _$SavedPaymentModelImpl({
    this.network = '',
    @JsonKey(name: 'phone_number') this.phoneNumber = '',
    @JsonKey(name: 'icon_url') this.iconUrl = '',
    @JsonKey(name: 'agreement_id') this.agreementId = '',
  });

  factory _$SavedPaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedPaymentModelImplFromJson(json);

  @override
  @JsonKey()
  final String network;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @override
  @JsonKey(name: 'agreement_id')
  final String agreementId;

  @override
  String toString() {
    return 'SavedPaymentModel(network: $network, phoneNumber: $phoneNumber, iconUrl: $iconUrl, agreementId: $agreementId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPaymentModelImpl &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.agreementId, agreementId) ||
                other.agreementId == agreementId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, network, phoneNumber, iconUrl, agreementId);

  /// Create a copy of SavedPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPaymentModelImplCopyWith<_$SavedPaymentModelImpl> get copyWith =>
      __$$SavedPaymentModelImplCopyWithImpl<_$SavedPaymentModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedPaymentModelImplToJson(this);
  }
}

abstract class _SavedPaymentModel implements SavedPaymentModel {
  const factory _SavedPaymentModel({
    final String network,
    @JsonKey(name: 'phone_number') final String phoneNumber,
    @JsonKey(name: 'icon_url') final String iconUrl,
    @JsonKey(name: 'agreement_id') final String agreementId,
  }) = _$SavedPaymentModelImpl;

  factory _SavedPaymentModel.fromJson(Map<String, dynamic> json) =
      _$SavedPaymentModelImpl.fromJson;

  @override
  String get network;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  @JsonKey(name: 'icon_url')
  String get iconUrl;
  @override
  @JsonKey(name: 'agreement_id')
  String get agreementId;

  /// Create a copy of SavedPaymentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedPaymentModelImplCopyWith<_$SavedPaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
