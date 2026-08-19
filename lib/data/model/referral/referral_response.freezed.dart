// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReferralResponse _$ReferralResponseFromJson(Map<String, dynamic> json) {
  return _ReferralResponse.fromJson(json);
}

/// @nodoc
mixin _$ReferralResponse {
  @JsonKey(name: 'referral_code')
  String? get referralCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_history_count')
  int? get referralHistoryCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_pending_count')
  int? get referralPendingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_completed_count')
  int? get referralCompletedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_history')
  List<ReferralHistoryItem>? get referralHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;

  /// Serializes this ReferralResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralResponseCopyWith<ReferralResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralResponseCopyWith<$Res> {
  factory $ReferralResponseCopyWith(
    ReferralResponse value,
    $Res Function(ReferralResponse) then,
  ) = _$ReferralResponseCopyWithImpl<$Res, ReferralResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'referral_history_count') int? referralHistoryCount,
    @JsonKey(name: 'referral_pending_count') int? referralPendingCount,
    @JsonKey(name: 'referral_completed_count') int? referralCompletedCount,
    @JsonKey(name: 'referral_history')
    List<ReferralHistoryItem>? referralHistory,
    @JsonKey(name: 'total_count') int? totalCount,
  });
}

/// @nodoc
class _$ReferralResponseCopyWithImpl<$Res, $Val extends ReferralResponse>
    implements $ReferralResponseCopyWith<$Res> {
  _$ReferralResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = freezed,
    Object? referralHistoryCount = freezed,
    Object? referralPendingCount = freezed,
    Object? referralCompletedCount = freezed,
    Object? referralHistory = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            referralCode:
                freezed == referralCode
                    ? _value.referralCode
                    : referralCode // ignore: cast_nullable_to_non_nullable
                        as String?,
            referralHistoryCount:
                freezed == referralHistoryCount
                    ? _value.referralHistoryCount
                    : referralHistoryCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            referralPendingCount:
                freezed == referralPendingCount
                    ? _value.referralPendingCount
                    : referralPendingCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            referralCompletedCount:
                freezed == referralCompletedCount
                    ? _value.referralCompletedCount
                    : referralCompletedCount // ignore: cast_nullable_to_non_nullable
                        as int?,
            referralHistory:
                freezed == referralHistory
                    ? _value.referralHistory
                    : referralHistory // ignore: cast_nullable_to_non_nullable
                        as List<ReferralHistoryItem>?,
            totalCount:
                freezed == totalCount
                    ? _value.totalCount
                    : totalCount // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReferralResponseImplCopyWith<$Res>
    implements $ReferralResponseCopyWith<$Res> {
  factory _$$ReferralResponseImplCopyWith(
    _$ReferralResponseImpl value,
    $Res Function(_$ReferralResponseImpl) then,
  ) = __$$ReferralResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'referral_history_count') int? referralHistoryCount,
    @JsonKey(name: 'referral_pending_count') int? referralPendingCount,
    @JsonKey(name: 'referral_completed_count') int? referralCompletedCount,
    @JsonKey(name: 'referral_history')
    List<ReferralHistoryItem>? referralHistory,
    @JsonKey(name: 'total_count') int? totalCount,
  });
}

/// @nodoc
class __$$ReferralResponseImplCopyWithImpl<$Res>
    extends _$ReferralResponseCopyWithImpl<$Res, _$ReferralResponseImpl>
    implements _$$ReferralResponseImplCopyWith<$Res> {
  __$$ReferralResponseImplCopyWithImpl(
    _$ReferralResponseImpl _value,
    $Res Function(_$ReferralResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = freezed,
    Object? referralHistoryCount = freezed,
    Object? referralPendingCount = freezed,
    Object? referralCompletedCount = freezed,
    Object? referralHistory = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(
      _$ReferralResponseImpl(
        referralCode:
            freezed == referralCode
                ? _value.referralCode
                : referralCode // ignore: cast_nullable_to_non_nullable
                    as String?,
        referralHistoryCount:
            freezed == referralHistoryCount
                ? _value.referralHistoryCount
                : referralHistoryCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        referralPendingCount:
            freezed == referralPendingCount
                ? _value.referralPendingCount
                : referralPendingCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        referralCompletedCount:
            freezed == referralCompletedCount
                ? _value.referralCompletedCount
                : referralCompletedCount // ignore: cast_nullable_to_non_nullable
                    as int?,
        referralHistory:
            freezed == referralHistory
                ? _value._referralHistory
                : referralHistory // ignore: cast_nullable_to_non_nullable
                    as List<ReferralHistoryItem>?,
        totalCount:
            freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralResponseImpl implements _ReferralResponse {
  const _$ReferralResponseImpl({
    @JsonKey(name: 'referral_code') this.referralCode,
    @JsonKey(name: 'referral_history_count') this.referralHistoryCount,
    @JsonKey(name: 'referral_pending_count') this.referralPendingCount,
    @JsonKey(name: 'referral_completed_count') this.referralCompletedCount,
    @JsonKey(name: 'referral_history')
    final List<ReferralHistoryItem>? referralHistory,
    @JsonKey(name: 'total_count') this.totalCount,
  }) : _referralHistory = referralHistory;

  factory _$ReferralResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralResponseImplFromJson(json);

  @override
  @JsonKey(name: 'referral_code')
  final String? referralCode;
  @override
  @JsonKey(name: 'referral_history_count')
  final int? referralHistoryCount;
  @override
  @JsonKey(name: 'referral_pending_count')
  final int? referralPendingCount;
  @override
  @JsonKey(name: 'referral_completed_count')
  final int? referralCompletedCount;
  final List<ReferralHistoryItem>? _referralHistory;
  @override
  @JsonKey(name: 'referral_history')
  List<ReferralHistoryItem>? get referralHistory {
    final value = _referralHistory;
    if (value == null) return null;
    if (_referralHistory is EqualUnmodifiableListView) return _referralHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;

  @override
  String toString() {
    return 'ReferralResponse(referralCode: $referralCode, referralHistoryCount: $referralHistoryCount, referralPendingCount: $referralPendingCount, referralCompletedCount: $referralCompletedCount, referralHistory: $referralHistory, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralResponseImpl &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralHistoryCount, referralHistoryCount) ||
                other.referralHistoryCount == referralHistoryCount) &&
            (identical(other.referralPendingCount, referralPendingCount) ||
                other.referralPendingCount == referralPendingCount) &&
            (identical(other.referralCompletedCount, referralCompletedCount) ||
                other.referralCompletedCount == referralCompletedCount) &&
            const DeepCollectionEquality().equals(
              other._referralHistory,
              _referralHistory,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    referralCode,
    referralHistoryCount,
    referralPendingCount,
    referralCompletedCount,
    const DeepCollectionEquality().hash(_referralHistory),
    totalCount,
  );

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralResponseImplCopyWith<_$ReferralResponseImpl> get copyWith =>
      __$$ReferralResponseImplCopyWithImpl<_$ReferralResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralResponseImplToJson(this);
  }
}

abstract class _ReferralResponse implements ReferralResponse {
  const factory _ReferralResponse({
    @JsonKey(name: 'referral_code') final String? referralCode,
    @JsonKey(name: 'referral_history_count') final int? referralHistoryCount,
    @JsonKey(name: 'referral_pending_count') final int? referralPendingCount,
    @JsonKey(name: 'referral_completed_count')
    final int? referralCompletedCount,
    @JsonKey(name: 'referral_history')
    final List<ReferralHistoryItem>? referralHistory,
    @JsonKey(name: 'total_count') final int? totalCount,
  }) = _$ReferralResponseImpl;

  factory _ReferralResponse.fromJson(Map<String, dynamic> json) =
      _$ReferralResponseImpl.fromJson;

  @override
  @JsonKey(name: 'referral_code')
  String? get referralCode;
  @override
  @JsonKey(name: 'referral_history_count')
  int? get referralHistoryCount;
  @override
  @JsonKey(name: 'referral_pending_count')
  int? get referralPendingCount;
  @override
  @JsonKey(name: 'referral_completed_count')
  int? get referralCompletedCount;
  @override
  @JsonKey(name: 'referral_history')
  List<ReferralHistoryItem>? get referralHistory;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;

  /// Create a copy of ReferralResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralResponseImplCopyWith<_$ReferralResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferralHistoryItem _$ReferralHistoryItemFromJson(Map<String, dynamic> json) {
  return _ReferralHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$ReferralHistoryItem {
  @JsonKey(name: 'auto_id')
  String? get autoId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_amount')
  String? get pointsAmount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this ReferralHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralHistoryItemCopyWith<ReferralHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralHistoryItemCopyWith<$Res> {
  factory $ReferralHistoryItemCopyWith(
    ReferralHistoryItem value,
    $Res Function(ReferralHistoryItem) then,
  ) = _$ReferralHistoryItemCopyWithImpl<$Res, ReferralHistoryItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'auto_id') String? autoId,
    String? name,
    String? email,
    String? phone,
    @JsonKey(name: 'points_amount') String? pointsAmount,
    String? status,
  });
}

/// @nodoc
class _$ReferralHistoryItemCopyWithImpl<$Res, $Val extends ReferralHistoryItem>
    implements $ReferralHistoryItemCopyWith<$Res> {
  _$ReferralHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoId = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? pointsAmount = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            autoId:
                freezed == autoId
                    ? _value.autoId
                    : autoId // ignore: cast_nullable_to_non_nullable
                        as String?,
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            email:
                freezed == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String?,
            phone:
                freezed == phone
                    ? _value.phone
                    : phone // ignore: cast_nullable_to_non_nullable
                        as String?,
            pointsAmount:
                freezed == pointsAmount
                    ? _value.pointsAmount
                    : pointsAmount // ignore: cast_nullable_to_non_nullable
                        as String?,
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReferralHistoryItemImplCopyWith<$Res>
    implements $ReferralHistoryItemCopyWith<$Res> {
  factory _$$ReferralHistoryItemImplCopyWith(
    _$ReferralHistoryItemImpl value,
    $Res Function(_$ReferralHistoryItemImpl) then,
  ) = __$$ReferralHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'auto_id') String? autoId,
    String? name,
    String? email,
    String? phone,
    @JsonKey(name: 'points_amount') String? pointsAmount,
    String? status,
  });
}

/// @nodoc
class __$$ReferralHistoryItemImplCopyWithImpl<$Res>
    extends _$ReferralHistoryItemCopyWithImpl<$Res, _$ReferralHistoryItemImpl>
    implements _$$ReferralHistoryItemImplCopyWith<$Res> {
  __$$ReferralHistoryItemImplCopyWithImpl(
    _$ReferralHistoryItemImpl _value,
    $Res Function(_$ReferralHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? autoId = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? pointsAmount = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$ReferralHistoryItemImpl(
        autoId:
            freezed == autoId
                ? _value.autoId
                : autoId // ignore: cast_nullable_to_non_nullable
                    as String?,
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        email:
            freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String?,
        phone:
            freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                    as String?,
        pointsAmount:
            freezed == pointsAmount
                ? _value.pointsAmount
                : pointsAmount // ignore: cast_nullable_to_non_nullable
                    as String?,
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralHistoryItemImpl implements _ReferralHistoryItem {
  const _$ReferralHistoryItemImpl({
    @JsonKey(name: 'auto_id') this.autoId,
    this.name,
    this.email,
    this.phone,
    @JsonKey(name: 'points_amount') this.pointsAmount,
    this.status,
  });

  factory _$ReferralHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralHistoryItemImplFromJson(json);

  @override
  @JsonKey(name: 'auto_id')
  final String? autoId;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'points_amount')
  final String? pointsAmount;
  @override
  final String? status;

  @override
  String toString() {
    return 'ReferralHistoryItem(autoId: $autoId, name: $name, email: $email, phone: $phone, pointsAmount: $pointsAmount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralHistoryItemImpl &&
            (identical(other.autoId, autoId) || other.autoId == autoId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.pointsAmount, pointsAmount) ||
                other.pointsAmount == pointsAmount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    autoId,
    name,
    email,
    phone,
    pointsAmount,
    status,
  );

  /// Create a copy of ReferralHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralHistoryItemImplCopyWith<_$ReferralHistoryItemImpl> get copyWith =>
      __$$ReferralHistoryItemImplCopyWithImpl<_$ReferralHistoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralHistoryItemImplToJson(this);
  }
}

abstract class _ReferralHistoryItem implements ReferralHistoryItem {
  const factory _ReferralHistoryItem({
    @JsonKey(name: 'auto_id') final String? autoId,
    final String? name,
    final String? email,
    final String? phone,
    @JsonKey(name: 'points_amount') final String? pointsAmount,
    final String? status,
  }) = _$ReferralHistoryItemImpl;

  factory _ReferralHistoryItem.fromJson(Map<String, dynamic> json) =
      _$ReferralHistoryItemImpl.fromJson;

  @override
  @JsonKey(name: 'auto_id')
  String? get autoId;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'points_amount')
  String? get pointsAmount;
  @override
  String? get status;

  /// Create a copy of ReferralHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralHistoryItemImplCopyWith<_$ReferralHistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
