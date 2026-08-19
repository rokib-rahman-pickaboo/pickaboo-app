// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_point_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClubPointResponse _$ClubPointResponseFromJson(Map<String, dynamic> json) {
  return _ClubPointResponse.fromJson(json);
}

/// @nodoc
mixin _$ClubPointResponse {
  @JsonKey(name: "customer_id")
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: "my_points")
  int? get myPoints => throw _privateConstructorUsedError;
  @JsonKey(name: "my_life_time_points")
  int? get myLifeTimePoints => throw _privateConstructorUsedError;
  @JsonKey(name: "tiers")
  List<Tier>? get tiers => throw _privateConstructorUsedError;
  @JsonKey(name: "point_history_count")
  String? get pointHistoryCount => throw _privateConstructorUsedError;
  @JsonKey(name: "point_history")
  List<PointHistory>? get pointHistory => throw _privateConstructorUsedError;
  @JsonKey(name: "member_level_info")
  MemberLevelInfo? get memberLevelInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "general_earning_rules")
  List<GeneralEarningRule>? get generalEarningRules =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "refer_link")
  String? get referLink => throw _privateConstructorUsedError;
  @JsonKey(name: "spending_rules")
  List<SpendingRule>? get spendingRules => throw _privateConstructorUsedError;

  /// Serializes this ClubPointResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClubPointResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubPointResponseCopyWith<ClubPointResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubPointResponseCopyWith<$Res> {
  factory $ClubPointResponseCopyWith(
    ClubPointResponse value,
    $Res Function(ClubPointResponse) then,
  ) = _$ClubPointResponseCopyWithImpl<$Res, ClubPointResponse>;
  @useResult
  $Res call({
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "my_points") int? myPoints,
    @JsonKey(name: "my_life_time_points") int? myLifeTimePoints,
    @JsonKey(name: "tiers") List<Tier>? tiers,
    @JsonKey(name: "point_history_count") String? pointHistoryCount,
    @JsonKey(name: "point_history") List<PointHistory>? pointHistory,
    @JsonKey(name: "member_level_info") MemberLevelInfo? memberLevelInfo,
    @JsonKey(name: "general_earning_rules")
    List<GeneralEarningRule>? generalEarningRules,
    @JsonKey(name: "refer_link") String? referLink,
    @JsonKey(name: "spending_rules") List<SpendingRule>? spendingRules,
  });

  $MemberLevelInfoCopyWith<$Res>? get memberLevelInfo;
}

/// @nodoc
class _$ClubPointResponseCopyWithImpl<$Res, $Val extends ClubPointResponse>
    implements $ClubPointResponseCopyWith<$Res> {
  _$ClubPointResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClubPointResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? myPoints = freezed,
    Object? myLifeTimePoints = freezed,
    Object? tiers = freezed,
    Object? pointHistoryCount = freezed,
    Object? pointHistory = freezed,
    Object? memberLevelInfo = freezed,
    Object? generalEarningRules = freezed,
    Object? referLink = freezed,
    Object? spendingRules = freezed,
  }) {
    return _then(
      _value.copyWith(
            customerId:
                freezed == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as int?,
            myPoints:
                freezed == myPoints
                    ? _value.myPoints
                    : myPoints // ignore: cast_nullable_to_non_nullable
                        as int?,
            myLifeTimePoints:
                freezed == myLifeTimePoints
                    ? _value.myLifeTimePoints
                    : myLifeTimePoints // ignore: cast_nullable_to_non_nullable
                        as int?,
            tiers:
                freezed == tiers
                    ? _value.tiers
                    : tiers // ignore: cast_nullable_to_non_nullable
                        as List<Tier>?,
            pointHistoryCount:
                freezed == pointHistoryCount
                    ? _value.pointHistoryCount
                    : pointHistoryCount // ignore: cast_nullable_to_non_nullable
                        as String?,
            pointHistory:
                freezed == pointHistory
                    ? _value.pointHistory
                    : pointHistory // ignore: cast_nullable_to_non_nullable
                        as List<PointHistory>?,
            memberLevelInfo:
                freezed == memberLevelInfo
                    ? _value.memberLevelInfo
                    : memberLevelInfo // ignore: cast_nullable_to_non_nullable
                        as MemberLevelInfo?,
            generalEarningRules:
                freezed == generalEarningRules
                    ? _value.generalEarningRules
                    : generalEarningRules // ignore: cast_nullable_to_non_nullable
                        as List<GeneralEarningRule>?,
            referLink:
                freezed == referLink
                    ? _value.referLink
                    : referLink // ignore: cast_nullable_to_non_nullable
                        as String?,
            spendingRules:
                freezed == spendingRules
                    ? _value.spendingRules
                    : spendingRules // ignore: cast_nullable_to_non_nullable
                        as List<SpendingRule>?,
          )
          as $Val,
    );
  }

  /// Create a copy of ClubPointResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberLevelInfoCopyWith<$Res>? get memberLevelInfo {
    if (_value.memberLevelInfo == null) {
      return null;
    }

    return $MemberLevelInfoCopyWith<$Res>(_value.memberLevelInfo!, (value) {
      return _then(_value.copyWith(memberLevelInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClubPointResponseImplCopyWith<$Res>
    implements $ClubPointResponseCopyWith<$Res> {
  factory _$$ClubPointResponseImplCopyWith(
    _$ClubPointResponseImpl value,
    $Res Function(_$ClubPointResponseImpl) then,
  ) = __$$ClubPointResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "customer_id") int? customerId,
    @JsonKey(name: "my_points") int? myPoints,
    @JsonKey(name: "my_life_time_points") int? myLifeTimePoints,
    @JsonKey(name: "tiers") List<Tier>? tiers,
    @JsonKey(name: "point_history_count") String? pointHistoryCount,
    @JsonKey(name: "point_history") List<PointHistory>? pointHistory,
    @JsonKey(name: "member_level_info") MemberLevelInfo? memberLevelInfo,
    @JsonKey(name: "general_earning_rules")
    List<GeneralEarningRule>? generalEarningRules,
    @JsonKey(name: "refer_link") String? referLink,
    @JsonKey(name: "spending_rules") List<SpendingRule>? spendingRules,
  });

  @override
  $MemberLevelInfoCopyWith<$Res>? get memberLevelInfo;
}

/// @nodoc
class __$$ClubPointResponseImplCopyWithImpl<$Res>
    extends _$ClubPointResponseCopyWithImpl<$Res, _$ClubPointResponseImpl>
    implements _$$ClubPointResponseImplCopyWith<$Res> {
  __$$ClubPointResponseImplCopyWithImpl(
    _$ClubPointResponseImpl _value,
    $Res Function(_$ClubPointResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClubPointResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? myPoints = freezed,
    Object? myLifeTimePoints = freezed,
    Object? tiers = freezed,
    Object? pointHistoryCount = freezed,
    Object? pointHistory = freezed,
    Object? memberLevelInfo = freezed,
    Object? generalEarningRules = freezed,
    Object? referLink = freezed,
    Object? spendingRules = freezed,
  }) {
    return _then(
      _$ClubPointResponseImpl(
        customerId:
            freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int?,
        myPoints:
            freezed == myPoints
                ? _value.myPoints
                : myPoints // ignore: cast_nullable_to_non_nullable
                    as int?,
        myLifeTimePoints:
            freezed == myLifeTimePoints
                ? _value.myLifeTimePoints
                : myLifeTimePoints // ignore: cast_nullable_to_non_nullable
                    as int?,
        tiers:
            freezed == tiers
                ? _value._tiers
                : tiers // ignore: cast_nullable_to_non_nullable
                    as List<Tier>?,
        pointHistoryCount:
            freezed == pointHistoryCount
                ? _value.pointHistoryCount
                : pointHistoryCount // ignore: cast_nullable_to_non_nullable
                    as String?,
        pointHistory:
            freezed == pointHistory
                ? _value._pointHistory
                : pointHistory // ignore: cast_nullable_to_non_nullable
                    as List<PointHistory>?,
        memberLevelInfo:
            freezed == memberLevelInfo
                ? _value.memberLevelInfo
                : memberLevelInfo // ignore: cast_nullable_to_non_nullable
                    as MemberLevelInfo?,
        generalEarningRules:
            freezed == generalEarningRules
                ? _value._generalEarningRules
                : generalEarningRules // ignore: cast_nullable_to_non_nullable
                    as List<GeneralEarningRule>?,
        referLink:
            freezed == referLink
                ? _value.referLink
                : referLink // ignore: cast_nullable_to_non_nullable
                    as String?,
        spendingRules:
            freezed == spendingRules
                ? _value._spendingRules
                : spendingRules // ignore: cast_nullable_to_non_nullable
                    as List<SpendingRule>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubPointResponseImpl implements _ClubPointResponse {
  const _$ClubPointResponseImpl({
    @JsonKey(name: "customer_id") this.customerId,
    @JsonKey(name: "my_points") this.myPoints,
    @JsonKey(name: "my_life_time_points") this.myLifeTimePoints,
    @JsonKey(name: "tiers") final List<Tier>? tiers,
    @JsonKey(name: "point_history_count") this.pointHistoryCount,
    @JsonKey(name: "point_history") final List<PointHistory>? pointHistory,
    @JsonKey(name: "member_level_info") this.memberLevelInfo,
    @JsonKey(name: "general_earning_rules")
    final List<GeneralEarningRule>? generalEarningRules,
    @JsonKey(name: "refer_link") this.referLink,
    @JsonKey(name: "spending_rules") final List<SpendingRule>? spendingRules,
  }) : _tiers = tiers,
       _pointHistory = pointHistory,
       _generalEarningRules = generalEarningRules,
       _spendingRules = spendingRules;

  factory _$ClubPointResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubPointResponseImplFromJson(json);

  @override
  @JsonKey(name: "customer_id")
  final int? customerId;
  @override
  @JsonKey(name: "my_points")
  final int? myPoints;
  @override
  @JsonKey(name: "my_life_time_points")
  final int? myLifeTimePoints;
  final List<Tier>? _tiers;
  @override
  @JsonKey(name: "tiers")
  List<Tier>? get tiers {
    final value = _tiers;
    if (value == null) return null;
    if (_tiers is EqualUnmodifiableListView) return _tiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "point_history_count")
  final String? pointHistoryCount;
  final List<PointHistory>? _pointHistory;
  @override
  @JsonKey(name: "point_history")
  List<PointHistory>? get pointHistory {
    final value = _pointHistory;
    if (value == null) return null;
    if (_pointHistory is EqualUnmodifiableListView) return _pointHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "member_level_info")
  final MemberLevelInfo? memberLevelInfo;
  final List<GeneralEarningRule>? _generalEarningRules;
  @override
  @JsonKey(name: "general_earning_rules")
  List<GeneralEarningRule>? get generalEarningRules {
    final value = _generalEarningRules;
    if (value == null) return null;
    if (_generalEarningRules is EqualUnmodifiableListView)
      return _generalEarningRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "refer_link")
  final String? referLink;
  final List<SpendingRule>? _spendingRules;
  @override
  @JsonKey(name: "spending_rules")
  List<SpendingRule>? get spendingRules {
    final value = _spendingRules;
    if (value == null) return null;
    if (_spendingRules is EqualUnmodifiableListView) return _spendingRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClubPointResponse(customerId: $customerId, myPoints: $myPoints, myLifeTimePoints: $myLifeTimePoints, tiers: $tiers, pointHistoryCount: $pointHistoryCount, pointHistory: $pointHistory, memberLevelInfo: $memberLevelInfo, generalEarningRules: $generalEarningRules, referLink: $referLink, spendingRules: $spendingRules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubPointResponseImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.myPoints, myPoints) ||
                other.myPoints == myPoints) &&
            (identical(other.myLifeTimePoints, myLifeTimePoints) ||
                other.myLifeTimePoints == myLifeTimePoints) &&
            const DeepCollectionEquality().equals(other._tiers, _tiers) &&
            (identical(other.pointHistoryCount, pointHistoryCount) ||
                other.pointHistoryCount == pointHistoryCount) &&
            const DeepCollectionEquality().equals(
              other._pointHistory,
              _pointHistory,
            ) &&
            (identical(other.memberLevelInfo, memberLevelInfo) ||
                other.memberLevelInfo == memberLevelInfo) &&
            const DeepCollectionEquality().equals(
              other._generalEarningRules,
              _generalEarningRules,
            ) &&
            (identical(other.referLink, referLink) ||
                other.referLink == referLink) &&
            const DeepCollectionEquality().equals(
              other._spendingRules,
              _spendingRules,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    customerId,
    myPoints,
    myLifeTimePoints,
    const DeepCollectionEquality().hash(_tiers),
    pointHistoryCount,
    const DeepCollectionEquality().hash(_pointHistory),
    memberLevelInfo,
    const DeepCollectionEquality().hash(_generalEarningRules),
    referLink,
    const DeepCollectionEquality().hash(_spendingRules),
  );

  /// Create a copy of ClubPointResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubPointResponseImplCopyWith<_$ClubPointResponseImpl> get copyWith =>
      __$$ClubPointResponseImplCopyWithImpl<_$ClubPointResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubPointResponseImplToJson(this);
  }
}

abstract class _ClubPointResponse implements ClubPointResponse {
  const factory _ClubPointResponse({
    @JsonKey(name: "customer_id") final int? customerId,
    @JsonKey(name: "my_points") final int? myPoints,
    @JsonKey(name: "my_life_time_points") final int? myLifeTimePoints,
    @JsonKey(name: "tiers") final List<Tier>? tiers,
    @JsonKey(name: "point_history_count") final String? pointHistoryCount,
    @JsonKey(name: "point_history") final List<PointHistory>? pointHistory,
    @JsonKey(name: "member_level_info") final MemberLevelInfo? memberLevelInfo,
    @JsonKey(name: "general_earning_rules")
    final List<GeneralEarningRule>? generalEarningRules,
    @JsonKey(name: "refer_link") final String? referLink,
    @JsonKey(name: "spending_rules") final List<SpendingRule>? spendingRules,
  }) = _$ClubPointResponseImpl;

  factory _ClubPointResponse.fromJson(Map<String, dynamic> json) =
      _$ClubPointResponseImpl.fromJson;

  @override
  @JsonKey(name: "customer_id")
  int? get customerId;
  @override
  @JsonKey(name: "my_points")
  int? get myPoints;
  @override
  @JsonKey(name: "my_life_time_points")
  int? get myLifeTimePoints;
  @override
  @JsonKey(name: "tiers")
  List<Tier>? get tiers;
  @override
  @JsonKey(name: "point_history_count")
  String? get pointHistoryCount;
  @override
  @JsonKey(name: "point_history")
  List<PointHistory>? get pointHistory;
  @override
  @JsonKey(name: "member_level_info")
  MemberLevelInfo? get memberLevelInfo;
  @override
  @JsonKey(name: "general_earning_rules")
  List<GeneralEarningRule>? get generalEarningRules;
  @override
  @JsonKey(name: "refer_link")
  String? get referLink;
  @override
  @JsonKey(name: "spending_rules")
  List<SpendingRule>? get spendingRules;

  /// Create a copy of ClubPointResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubPointResponseImplCopyWith<_$ClubPointResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeneralEarningRule _$GeneralEarningRuleFromJson(Map<String, dynamic> json) {
  return _GeneralEarningRule.fromJson(json);
}

/// @nodoc
mixin _$GeneralEarningRule {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this GeneralEarningRule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeneralEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeneralEarningRuleCopyWith<GeneralEarningRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralEarningRuleCopyWith<$Res> {
  factory $GeneralEarningRuleCopyWith(
    GeneralEarningRule value,
    $Res Function(GeneralEarningRule) then,
  ) = _$GeneralEarningRuleCopyWithImpl<$Res, GeneralEarningRule>;
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "message") String? message,
  });
}

/// @nodoc
class _$GeneralEarningRuleCopyWithImpl<$Res, $Val extends GeneralEarningRule>
    implements $GeneralEarningRuleCopyWith<$Res> {
  _$GeneralEarningRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = freezed, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeneralEarningRuleImplCopyWith<$Res>
    implements $GeneralEarningRuleCopyWith<$Res> {
  factory _$$GeneralEarningRuleImplCopyWith(
    _$GeneralEarningRuleImpl value,
    $Res Function(_$GeneralEarningRuleImpl) then,
  ) = __$$GeneralEarningRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "message") String? message,
  });
}

/// @nodoc
class __$$GeneralEarningRuleImplCopyWithImpl<$Res>
    extends _$GeneralEarningRuleCopyWithImpl<$Res, _$GeneralEarningRuleImpl>
    implements _$$GeneralEarningRuleImplCopyWith<$Res> {
  __$$GeneralEarningRuleImplCopyWithImpl(
    _$GeneralEarningRuleImpl _value,
    $Res Function(_$GeneralEarningRuleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeneralEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = freezed, Object? message = freezed}) {
    return _then(
      _$GeneralEarningRuleImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralEarningRuleImpl implements _GeneralEarningRule {
  const _$GeneralEarningRuleImpl({
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "message") this.message,
  });

  factory _$GeneralEarningRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralEarningRuleImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'GeneralEarningRule(title: $title, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralEarningRuleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, message);

  /// Create a copy of GeneralEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralEarningRuleImplCopyWith<_$GeneralEarningRuleImpl> get copyWith =>
      __$$GeneralEarningRuleImplCopyWithImpl<_$GeneralEarningRuleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralEarningRuleImplToJson(this);
  }
}

abstract class _GeneralEarningRule implements GeneralEarningRule {
  const factory _GeneralEarningRule({
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "message") final String? message,
  }) = _$GeneralEarningRuleImpl;

  factory _GeneralEarningRule.fromJson(Map<String, dynamic> json) =
      _$GeneralEarningRuleImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "message")
  String? get message;

  /// Create a copy of GeneralEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralEarningRuleImplCopyWith<_$GeneralEarningRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MemberLevelInfo _$MemberLevelInfoFromJson(Map<String, dynamic> json) {
  return _MemberLevelInfo.fromJson(json);
}

/// @nodoc
mixin _$MemberLevelInfo {
  @JsonKey(name: "tier_name")
  String? get tierName => throw _privateConstructorUsedError;
  @JsonKey(name: "tier_description")
  String? get tierDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_earning_rules")
  List<CustomerEarningRule>? get customerEarningRules =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "customer_spending_rule")
  List<SpendingRule>? get customerSpendingRule =>
      throw _privateConstructorUsedError;

  /// Serializes this MemberLevelInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberLevelInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberLevelInfoCopyWith<MemberLevelInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberLevelInfoCopyWith<$Res> {
  factory $MemberLevelInfoCopyWith(
    MemberLevelInfo value,
    $Res Function(MemberLevelInfo) then,
  ) = _$MemberLevelInfoCopyWithImpl<$Res, MemberLevelInfo>;
  @useResult
  $Res call({
    @JsonKey(name: "tier_name") String? tierName,
    @JsonKey(name: "tier_description") String? tierDescription,
    @JsonKey(name: "customer_earning_rules")
    List<CustomerEarningRule>? customerEarningRules,
    @JsonKey(name: "customer_spending_rule")
    List<SpendingRule>? customerSpendingRule,
  });
}

/// @nodoc
class _$MemberLevelInfoCopyWithImpl<$Res, $Val extends MemberLevelInfo>
    implements $MemberLevelInfoCopyWith<$Res> {
  _$MemberLevelInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberLevelInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tierName = freezed,
    Object? tierDescription = freezed,
    Object? customerEarningRules = freezed,
    Object? customerSpendingRule = freezed,
  }) {
    return _then(
      _value.copyWith(
            tierName:
                freezed == tierName
                    ? _value.tierName
                    : tierName // ignore: cast_nullable_to_non_nullable
                        as String?,
            tierDescription:
                freezed == tierDescription
                    ? _value.tierDescription
                    : tierDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            customerEarningRules:
                freezed == customerEarningRules
                    ? _value.customerEarningRules
                    : customerEarningRules // ignore: cast_nullable_to_non_nullable
                        as List<CustomerEarningRule>?,
            customerSpendingRule:
                freezed == customerSpendingRule
                    ? _value.customerSpendingRule
                    : customerSpendingRule // ignore: cast_nullable_to_non_nullable
                        as List<SpendingRule>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MemberLevelInfoImplCopyWith<$Res>
    implements $MemberLevelInfoCopyWith<$Res> {
  factory _$$MemberLevelInfoImplCopyWith(
    _$MemberLevelInfoImpl value,
    $Res Function(_$MemberLevelInfoImpl) then,
  ) = __$$MemberLevelInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "tier_name") String? tierName,
    @JsonKey(name: "tier_description") String? tierDescription,
    @JsonKey(name: "customer_earning_rules")
    List<CustomerEarningRule>? customerEarningRules,
    @JsonKey(name: "customer_spending_rule")
    List<SpendingRule>? customerSpendingRule,
  });
}

/// @nodoc
class __$$MemberLevelInfoImplCopyWithImpl<$Res>
    extends _$MemberLevelInfoCopyWithImpl<$Res, _$MemberLevelInfoImpl>
    implements _$$MemberLevelInfoImplCopyWith<$Res> {
  __$$MemberLevelInfoImplCopyWithImpl(
    _$MemberLevelInfoImpl _value,
    $Res Function(_$MemberLevelInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MemberLevelInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tierName = freezed,
    Object? tierDescription = freezed,
    Object? customerEarningRules = freezed,
    Object? customerSpendingRule = freezed,
  }) {
    return _then(
      _$MemberLevelInfoImpl(
        tierName:
            freezed == tierName
                ? _value.tierName
                : tierName // ignore: cast_nullable_to_non_nullable
                    as String?,
        tierDescription:
            freezed == tierDescription
                ? _value.tierDescription
                : tierDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        customerEarningRules:
            freezed == customerEarningRules
                ? _value._customerEarningRules
                : customerEarningRules // ignore: cast_nullable_to_non_nullable
                    as List<CustomerEarningRule>?,
        customerSpendingRule:
            freezed == customerSpendingRule
                ? _value._customerSpendingRule
                : customerSpendingRule // ignore: cast_nullable_to_non_nullable
                    as List<SpendingRule>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberLevelInfoImpl implements _MemberLevelInfo {
  const _$MemberLevelInfoImpl({
    @JsonKey(name: "tier_name") this.tierName,
    @JsonKey(name: "tier_description") this.tierDescription,
    @JsonKey(name: "customer_earning_rules")
    final List<CustomerEarningRule>? customerEarningRules,
    @JsonKey(name: "customer_spending_rule")
    final List<SpendingRule>? customerSpendingRule,
  }) : _customerEarningRules = customerEarningRules,
       _customerSpendingRule = customerSpendingRule;

  factory _$MemberLevelInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberLevelInfoImplFromJson(json);

  @override
  @JsonKey(name: "tier_name")
  final String? tierName;
  @override
  @JsonKey(name: "tier_description")
  final String? tierDescription;
  final List<CustomerEarningRule>? _customerEarningRules;
  @override
  @JsonKey(name: "customer_earning_rules")
  List<CustomerEarningRule>? get customerEarningRules {
    final value = _customerEarningRules;
    if (value == null) return null;
    if (_customerEarningRules is EqualUnmodifiableListView)
      return _customerEarningRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SpendingRule>? _customerSpendingRule;
  @override
  @JsonKey(name: "customer_spending_rule")
  List<SpendingRule>? get customerSpendingRule {
    final value = _customerSpendingRule;
    if (value == null) return null;
    if (_customerSpendingRule is EqualUnmodifiableListView)
      return _customerSpendingRule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MemberLevelInfo(tierName: $tierName, tierDescription: $tierDescription, customerEarningRules: $customerEarningRules, customerSpendingRule: $customerSpendingRule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberLevelInfoImpl &&
            (identical(other.tierName, tierName) ||
                other.tierName == tierName) &&
            (identical(other.tierDescription, tierDescription) ||
                other.tierDescription == tierDescription) &&
            const DeepCollectionEquality().equals(
              other._customerEarningRules,
              _customerEarningRules,
            ) &&
            const DeepCollectionEquality().equals(
              other._customerSpendingRule,
              _customerSpendingRule,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tierName,
    tierDescription,
    const DeepCollectionEquality().hash(_customerEarningRules),
    const DeepCollectionEquality().hash(_customerSpendingRule),
  );

  /// Create a copy of MemberLevelInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberLevelInfoImplCopyWith<_$MemberLevelInfoImpl> get copyWith =>
      __$$MemberLevelInfoImplCopyWithImpl<_$MemberLevelInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberLevelInfoImplToJson(this);
  }
}

abstract class _MemberLevelInfo implements MemberLevelInfo {
  const factory _MemberLevelInfo({
    @JsonKey(name: "tier_name") final String? tierName,
    @JsonKey(name: "tier_description") final String? tierDescription,
    @JsonKey(name: "customer_earning_rules")
    final List<CustomerEarningRule>? customerEarningRules,
    @JsonKey(name: "customer_spending_rule")
    final List<SpendingRule>? customerSpendingRule,
  }) = _$MemberLevelInfoImpl;

  factory _MemberLevelInfo.fromJson(Map<String, dynamic> json) =
      _$MemberLevelInfoImpl.fromJson;

  @override
  @JsonKey(name: "tier_name")
  String? get tierName;
  @override
  @JsonKey(name: "tier_description")
  String? get tierDescription;
  @override
  @JsonKey(name: "customer_earning_rules")
  List<CustomerEarningRule>? get customerEarningRules;
  @override
  @JsonKey(name: "customer_spending_rule")
  List<SpendingRule>? get customerSpendingRule;

  /// Create a copy of MemberLevelInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberLevelInfoImplCopyWith<_$MemberLevelInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerEarningRule _$CustomerEarningRuleFromJson(Map<String, dynamic> json) {
  return _CustomerEarningRule.fromJson(json);
}

/// @nodoc
mixin _$CustomerEarningRule {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "earn_point")
  double? get earnPoint => throw _privateConstructorUsedError;
  @JsonKey(name: "spend_amount")
  int? get spendAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "point_limit")
  int? get pointLimit => throw _privateConstructorUsedError;

  /// Serializes this CustomerEarningRule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerEarningRuleCopyWith<CustomerEarningRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerEarningRuleCopyWith<$Res> {
  factory $CustomerEarningRuleCopyWith(
    CustomerEarningRule value,
    $Res Function(CustomerEarningRule) then,
  ) = _$CustomerEarningRuleCopyWithImpl<$Res, CustomerEarningRule>;
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "earn_point") double? earnPoint,
    @JsonKey(name: "spend_amount") int? spendAmount,
    @JsonKey(name: "point_limit") int? pointLimit,
  });
}

/// @nodoc
class _$CustomerEarningRuleCopyWithImpl<$Res, $Val extends CustomerEarningRule>
    implements $CustomerEarningRuleCopyWith<$Res> {
  _$CustomerEarningRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? earnPoint = freezed,
    Object? spendAmount = freezed,
    Object? pointLimit = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            earnPoint:
                freezed == earnPoint
                    ? _value.earnPoint
                    : earnPoint // ignore: cast_nullable_to_non_nullable
                        as double?,
            spendAmount:
                freezed == spendAmount
                    ? _value.spendAmount
                    : spendAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
            pointLimit:
                freezed == pointLimit
                    ? _value.pointLimit
                    : pointLimit // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerEarningRuleImplCopyWith<$Res>
    implements $CustomerEarningRuleCopyWith<$Res> {
  factory _$$CustomerEarningRuleImplCopyWith(
    _$CustomerEarningRuleImpl value,
    $Res Function(_$CustomerEarningRuleImpl) then,
  ) = __$$CustomerEarningRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "earn_point") double? earnPoint,
    @JsonKey(name: "spend_amount") int? spendAmount,
    @JsonKey(name: "point_limit") int? pointLimit,
  });
}

/// @nodoc
class __$$CustomerEarningRuleImplCopyWithImpl<$Res>
    extends _$CustomerEarningRuleCopyWithImpl<$Res, _$CustomerEarningRuleImpl>
    implements _$$CustomerEarningRuleImplCopyWith<$Res> {
  __$$CustomerEarningRuleImplCopyWithImpl(
    _$CustomerEarningRuleImpl _value,
    $Res Function(_$CustomerEarningRuleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? earnPoint = freezed,
    Object? spendAmount = freezed,
    Object? pointLimit = freezed,
  }) {
    return _then(
      _$CustomerEarningRuleImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        earnPoint:
            freezed == earnPoint
                ? _value.earnPoint
                : earnPoint // ignore: cast_nullable_to_non_nullable
                    as double?,
        spendAmount:
            freezed == spendAmount
                ? _value.spendAmount
                : spendAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
        pointLimit:
            freezed == pointLimit
                ? _value.pointLimit
                : pointLimit // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerEarningRuleImpl implements _CustomerEarningRule {
  const _$CustomerEarningRuleImpl({
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "earn_point") this.earnPoint,
    @JsonKey(name: "spend_amount") this.spendAmount,
    @JsonKey(name: "point_limit") this.pointLimit,
  });

  factory _$CustomerEarningRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerEarningRuleImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "earn_point")
  final double? earnPoint;
  @override
  @JsonKey(name: "spend_amount")
  final int? spendAmount;
  @override
  @JsonKey(name: "point_limit")
  final int? pointLimit;

  @override
  String toString() {
    return 'CustomerEarningRule(title: $title, earnPoint: $earnPoint, spendAmount: $spendAmount, pointLimit: $pointLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerEarningRuleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.earnPoint, earnPoint) ||
                other.earnPoint == earnPoint) &&
            (identical(other.spendAmount, spendAmount) ||
                other.spendAmount == spendAmount) &&
            (identical(other.pointLimit, pointLimit) ||
                other.pointLimit == pointLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, earnPoint, spendAmount, pointLimit);

  /// Create a copy of CustomerEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerEarningRuleImplCopyWith<_$CustomerEarningRuleImpl> get copyWith =>
      __$$CustomerEarningRuleImplCopyWithImpl<_$CustomerEarningRuleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerEarningRuleImplToJson(this);
  }
}

abstract class _CustomerEarningRule implements CustomerEarningRule {
  const factory _CustomerEarningRule({
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "earn_point") final double? earnPoint,
    @JsonKey(name: "spend_amount") final int? spendAmount,
    @JsonKey(name: "point_limit") final int? pointLimit,
  }) = _$CustomerEarningRuleImpl;

  factory _CustomerEarningRule.fromJson(Map<String, dynamic> json) =
      _$CustomerEarningRuleImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "earn_point")
  double? get earnPoint;
  @override
  @JsonKey(name: "spend_amount")
  int? get spendAmount;
  @override
  @JsonKey(name: "point_limit")
  int? get pointLimit;

  /// Create a copy of CustomerEarningRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerEarningRuleImplCopyWith<_$CustomerEarningRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpendingRule _$SpendingRuleFromJson(Map<String, dynamic> json) {
  return _SpendingRule.fromJson(json);
}

/// @nodoc
mixin _$SpendingRule {
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "spent_point")
  int? get spentPoint => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_amount")
  int? get discountAmount => throw _privateConstructorUsedError;

  /// Serializes this SpendingRule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpendingRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpendingRuleCopyWith<SpendingRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingRuleCopyWith<$Res> {
  factory $SpendingRuleCopyWith(
    SpendingRule value,
    $Res Function(SpendingRule) then,
  ) = _$SpendingRuleCopyWithImpl<$Res, SpendingRule>;
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "spent_point") int? spentPoint,
    @JsonKey(name: "discount_amount") int? discountAmount,
  });
}

/// @nodoc
class _$SpendingRuleCopyWithImpl<$Res, $Val extends SpendingRule>
    implements $SpendingRuleCopyWith<$Res> {
  _$SpendingRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpendingRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? spentPoint = freezed,
    Object? discountAmount = freezed,
  }) {
    return _then(
      _value.copyWith(
            title:
                freezed == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String?,
            spentPoint:
                freezed == spentPoint
                    ? _value.spentPoint
                    : spentPoint // ignore: cast_nullable_to_non_nullable
                        as int?,
            discountAmount:
                freezed == discountAmount
                    ? _value.discountAmount
                    : discountAmount // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpendingRuleImplCopyWith<$Res>
    implements $SpendingRuleCopyWith<$Res> {
  factory _$$SpendingRuleImplCopyWith(
    _$SpendingRuleImpl value,
    $Res Function(_$SpendingRuleImpl) then,
  ) = __$$SpendingRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "spent_point") int? spentPoint,
    @JsonKey(name: "discount_amount") int? discountAmount,
  });
}

/// @nodoc
class __$$SpendingRuleImplCopyWithImpl<$Res>
    extends _$SpendingRuleCopyWithImpl<$Res, _$SpendingRuleImpl>
    implements _$$SpendingRuleImplCopyWith<$Res> {
  __$$SpendingRuleImplCopyWithImpl(
    _$SpendingRuleImpl _value,
    $Res Function(_$SpendingRuleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpendingRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? spentPoint = freezed,
    Object? discountAmount = freezed,
  }) {
    return _then(
      _$SpendingRuleImpl(
        title:
            freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String?,
        spentPoint:
            freezed == spentPoint
                ? _value.spentPoint
                : spentPoint // ignore: cast_nullable_to_non_nullable
                    as int?,
        discountAmount:
            freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingRuleImpl implements _SpendingRule {
  const _$SpendingRuleImpl({
    @JsonKey(name: "title") this.title,
    @JsonKey(name: "spent_point") this.spentPoint,
    @JsonKey(name: "discount_amount") this.discountAmount,
  });

  factory _$SpendingRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingRuleImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "spent_point")
  final int? spentPoint;
  @override
  @JsonKey(name: "discount_amount")
  final int? discountAmount;

  @override
  String toString() {
    return 'SpendingRule(title: $title, spentPoint: $spentPoint, discountAmount: $discountAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingRuleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.spentPoint, spentPoint) ||
                other.spentPoint == spentPoint) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, spentPoint, discountAmount);

  /// Create a copy of SpendingRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingRuleImplCopyWith<_$SpendingRuleImpl> get copyWith =>
      __$$SpendingRuleImplCopyWithImpl<_$SpendingRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingRuleImplToJson(this);
  }
}

abstract class _SpendingRule implements SpendingRule {
  const factory _SpendingRule({
    @JsonKey(name: "title") final String? title,
    @JsonKey(name: "spent_point") final int? spentPoint,
    @JsonKey(name: "discount_amount") final int? discountAmount,
  }) = _$SpendingRuleImpl;

  factory _SpendingRule.fromJson(Map<String, dynamic> json) =
      _$SpendingRuleImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "spent_point")
  int? get spentPoint;
  @override
  @JsonKey(name: "discount_amount")
  int? get discountAmount;

  /// Create a copy of SpendingRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpendingRuleImplCopyWith<_$SpendingRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PointHistory _$PointHistoryFromJson(Map<String, dynamic> json) {
  return _PointHistory.fromJson(json);
}

/// @nodoc
mixin _$PointHistory {
  @JsonKey(name: "transaction_id")
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "comment")
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "expires_at")
  dynamic get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: "status_description")
  String? get statusDescription => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at_formatted")
  String? get createdAtFormatted => throw _privateConstructorUsedError;

  /// Serializes this PointHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PointHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointHistoryCopyWith<PointHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointHistoryCopyWith<$Res> {
  factory $PointHistoryCopyWith(
    PointHistory value,
    $Res Function(PointHistory) then,
  ) = _$PointHistoryCopyWithImpl<$Res, PointHistory>;
  @useResult
  $Res call({
    @JsonKey(name: "transaction_id") String? transactionId,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "expires_at") dynamic expiresAt,
    @JsonKey(name: "status_description") String? statusDescription,
    @JsonKey(name: "created_at_formatted") String? createdAtFormatted,
  });
}

/// @nodoc
class _$PointHistoryCopyWithImpl<$Res, $Val extends PointHistory>
    implements $PointHistoryCopyWith<$Res> {
  _$PointHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? amount = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? statusDescription = freezed,
    Object? createdAtFormatted = freezed,
  }) {
    return _then(
      _value.copyWith(
            transactionId:
                freezed == transactionId
                    ? _value.transactionId
                    : transactionId // ignore: cast_nullable_to_non_nullable
                        as String?,
            amount:
                freezed == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as String?,
            comment:
                freezed == comment
                    ? _value.comment
                    : comment // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            expiresAt:
                freezed == expiresAt
                    ? _value.expiresAt
                    : expiresAt // ignore: cast_nullable_to_non_nullable
                        as dynamic,
            statusDescription:
                freezed == statusDescription
                    ? _value.statusDescription
                    : statusDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAtFormatted:
                freezed == createdAtFormatted
                    ? _value.createdAtFormatted
                    : createdAtFormatted // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PointHistoryImplCopyWith<$Res>
    implements $PointHistoryCopyWith<$Res> {
  factory _$$PointHistoryImplCopyWith(
    _$PointHistoryImpl value,
    $Res Function(_$PointHistoryImpl) then,
  ) = __$$PointHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "transaction_id") String? transactionId,
    @JsonKey(name: "amount") String? amount,
    @JsonKey(name: "comment") String? comment,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "expires_at") dynamic expiresAt,
    @JsonKey(name: "status_description") String? statusDescription,
    @JsonKey(name: "created_at_formatted") String? createdAtFormatted,
  });
}

/// @nodoc
class __$$PointHistoryImplCopyWithImpl<$Res>
    extends _$PointHistoryCopyWithImpl<$Res, _$PointHistoryImpl>
    implements _$$PointHistoryImplCopyWith<$Res> {
  __$$PointHistoryImplCopyWithImpl(
    _$PointHistoryImpl _value,
    $Res Function(_$PointHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PointHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? amount = freezed,
    Object? comment = freezed,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? statusDescription = freezed,
    Object? createdAtFormatted = freezed,
  }) {
    return _then(
      _$PointHistoryImpl(
        transactionId:
            freezed == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                    as String?,
        amount:
            freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as String?,
        comment:
            freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        expiresAt:
            freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                    as dynamic,
        statusDescription:
            freezed == statusDescription
                ? _value.statusDescription
                : statusDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAtFormatted:
            freezed == createdAtFormatted
                ? _value.createdAtFormatted
                : createdAtFormatted // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PointHistoryImpl implements _PointHistory {
  const _$PointHistoryImpl({
    @JsonKey(name: "transaction_id") this.transactionId,
    @JsonKey(name: "amount") this.amount,
    @JsonKey(name: "comment") this.comment,
    @JsonKey(name: "created_at") this.createdAt,
    @JsonKey(name: "expires_at") this.expiresAt,
    @JsonKey(name: "status_description") this.statusDescription,
    @JsonKey(name: "created_at_formatted") this.createdAtFormatted,
  });

  factory _$PointHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PointHistoryImplFromJson(json);

  @override
  @JsonKey(name: "transaction_id")
  final String? transactionId;
  @override
  @JsonKey(name: "amount")
  final String? amount;
  @override
  @JsonKey(name: "comment")
  final String? comment;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "expires_at")
  final dynamic expiresAt;
  @override
  @JsonKey(name: "status_description")
  final String? statusDescription;
  @override
  @JsonKey(name: "created_at_formatted")
  final String? createdAtFormatted;

  @override
  String toString() {
    return 'PointHistory(transactionId: $transactionId, amount: $amount, comment: $comment, createdAt: $createdAt, expiresAt: $expiresAt, statusDescription: $statusDescription, createdAtFormatted: $createdAtFormatted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointHistoryImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.expiresAt, expiresAt) &&
            (identical(other.statusDescription, statusDescription) ||
                other.statusDescription == statusDescription) &&
            (identical(other.createdAtFormatted, createdAtFormatted) ||
                other.createdAtFormatted == createdAtFormatted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    transactionId,
    amount,
    comment,
    createdAt,
    const DeepCollectionEquality().hash(expiresAt),
    statusDescription,
    createdAtFormatted,
  );

  /// Create a copy of PointHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointHistoryImplCopyWith<_$PointHistoryImpl> get copyWith =>
      __$$PointHistoryImplCopyWithImpl<_$PointHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PointHistoryImplToJson(this);
  }
}

abstract class _PointHistory implements PointHistory {
  const factory _PointHistory({
    @JsonKey(name: "transaction_id") final String? transactionId,
    @JsonKey(name: "amount") final String? amount,
    @JsonKey(name: "comment") final String? comment,
    @JsonKey(name: "created_at") final DateTime? createdAt,
    @JsonKey(name: "expires_at") final dynamic expiresAt,
    @JsonKey(name: "status_description") final String? statusDescription,
    @JsonKey(name: "created_at_formatted") final String? createdAtFormatted,
  }) = _$PointHistoryImpl;

  factory _PointHistory.fromJson(Map<String, dynamic> json) =
      _$PointHistoryImpl.fromJson;

  @override
  @JsonKey(name: "transaction_id")
  String? get transactionId;
  @override
  @JsonKey(name: "amount")
  String? get amount;
  @override
  @JsonKey(name: "comment")
  String? get comment;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "expires_at")
  dynamic get expiresAt;
  @override
  @JsonKey(name: "status_description")
  String? get statusDescription;
  @override
  @JsonKey(name: "created_at_formatted")
  String? get createdAtFormatted;

  /// Create a copy of PointHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointHistoryImplCopyWith<_$PointHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tier _$TierFromJson(Map<String, dynamic> json) {
  return _Tier.fromJson(json);
}

/// @nodoc
mixin _$Tier {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "min_points")
  String? get minPoints => throw _privateConstructorUsedError;

  /// Serializes this Tier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TierCopyWith<Tier> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TierCopyWith<$Res> {
  factory $TierCopyWith(Tier value, $Res Function(Tier) then) =
      _$TierCopyWithImpl<$Res, Tier>;
  @useResult
  $Res call({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "min_points") String? minPoints,
  });
}

/// @nodoc
class _$TierCopyWithImpl<$Res, $Val extends Tier>
    implements $TierCopyWith<$Res> {
  _$TierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? minPoints = freezed}) {
    return _then(
      _value.copyWith(
            name:
                freezed == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String?,
            minPoints:
                freezed == minPoints
                    ? _value.minPoints
                    : minPoints // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TierImplCopyWith<$Res> implements $TierCopyWith<$Res> {
  factory _$$TierImplCopyWith(
    _$TierImpl value,
    $Res Function(_$TierImpl) then,
  ) = __$$TierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "min_points") String? minPoints,
  });
}

/// @nodoc
class __$$TierImplCopyWithImpl<$Res>
    extends _$TierCopyWithImpl<$Res, _$TierImpl>
    implements _$$TierImplCopyWith<$Res> {
  __$$TierImplCopyWithImpl(_$TierImpl _value, $Res Function(_$TierImpl) _then)
    : super(_value, _then);

  /// Create a copy of Tier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = freezed, Object? minPoints = freezed}) {
    return _then(
      _$TierImpl(
        name:
            freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String?,
        minPoints:
            freezed == minPoints
                ? _value.minPoints
                : minPoints // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TierImpl implements _Tier {
  const _$TierImpl({
    @JsonKey(name: "name") this.name,
    @JsonKey(name: "min_points") this.minPoints,
  });

  factory _$TierImpl.fromJson(Map<String, dynamic> json) =>
      _$$TierImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "min_points")
  final String? minPoints;

  @override
  String toString() {
    return 'Tier(name: $name, minPoints: $minPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TierImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.minPoints, minPoints) ||
                other.minPoints == minPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, minPoints);

  /// Create a copy of Tier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TierImplCopyWith<_$TierImpl> get copyWith =>
      __$$TierImplCopyWithImpl<_$TierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TierImplToJson(this);
  }
}

abstract class _Tier implements Tier {
  const factory _Tier({
    @JsonKey(name: "name") final String? name,
    @JsonKey(name: "min_points") final String? minPoints,
  }) = _$TierImpl;

  factory _Tier.fromJson(Map<String, dynamic> json) = _$TierImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "min_points")
  String? get minPoints;

  /// Create a copy of Tier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TierImplCopyWith<_$TierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
