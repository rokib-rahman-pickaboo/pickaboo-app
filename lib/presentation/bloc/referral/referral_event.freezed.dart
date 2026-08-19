// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReferralEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit) getReferralHistory,
    required TResult Function(Map<String, dynamic> formData) inviteFriend,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit)? getReferralHistory,
    TResult? Function(Map<String, dynamic> formData)? inviteFriend,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit)? getReferralHistory,
    TResult Function(Map<String, dynamic> formData)? inviteFriend,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetReferralHistory value) getReferralHistory,
    required TResult Function(_InviteFriend value) inviteFriend,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetReferralHistory value)? getReferralHistory,
    TResult? Function(_InviteFriend value)? inviteFriend,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetReferralHistory value)? getReferralHistory,
    TResult Function(_InviteFriend value)? inviteFriend,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralEventCopyWith<$Res> {
  factory $ReferralEventCopyWith(
    ReferralEvent value,
    $Res Function(ReferralEvent) then,
  ) = _$ReferralEventCopyWithImpl<$Res, ReferralEvent>;
}

/// @nodoc
class _$ReferralEventCopyWithImpl<$Res, $Val extends ReferralEvent>
    implements $ReferralEventCopyWith<$Res> {
  _$ReferralEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ReferralEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ReferralEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit) getReferralHistory,
    required TResult Function(Map<String, dynamic> formData) inviteFriend,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit)? getReferralHistory,
    TResult? Function(Map<String, dynamic> formData)? inviteFriend,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit)? getReferralHistory,
    TResult Function(Map<String, dynamic> formData)? inviteFriend,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetReferralHistory value) getReferralHistory,
    required TResult Function(_InviteFriend value) inviteFriend,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetReferralHistory value)? getReferralHistory,
    TResult? Function(_InviteFriend value)? inviteFriend,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetReferralHistory value)? getReferralHistory,
    TResult Function(_InviteFriend value)? inviteFriend,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ReferralEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetReferralHistoryImplCopyWith<$Res> {
  factory _$$GetReferralHistoryImplCopyWith(
    _$GetReferralHistoryImpl value,
    $Res Function(_$GetReferralHistoryImpl) then,
  ) = __$$GetReferralHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int limit});
}

/// @nodoc
class __$$GetReferralHistoryImplCopyWithImpl<$Res>
    extends _$ReferralEventCopyWithImpl<$Res, _$GetReferralHistoryImpl>
    implements _$$GetReferralHistoryImplCopyWith<$Res> {
  __$$GetReferralHistoryImplCopyWithImpl(
    _$GetReferralHistoryImpl _value,
    $Res Function(_$GetReferralHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? page = null, Object? limit = null}) {
    return _then(
      _$GetReferralHistoryImpl(
        page:
            null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                    as int,
        limit:
            null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$GetReferralHistoryImpl implements _GetReferralHistory {
  const _$GetReferralHistoryImpl({this.page = 1, this.limit = 10});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'ReferralEvent.getReferralHistory(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReferralHistoryImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, limit);

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReferralHistoryImplCopyWith<_$GetReferralHistoryImpl> get copyWith =>
      __$$GetReferralHistoryImplCopyWithImpl<_$GetReferralHistoryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit) getReferralHistory,
    required TResult Function(Map<String, dynamic> formData) inviteFriend,
  }) {
    return getReferralHistory(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit)? getReferralHistory,
    TResult? Function(Map<String, dynamic> formData)? inviteFriend,
  }) {
    return getReferralHistory?.call(page, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit)? getReferralHistory,
    TResult Function(Map<String, dynamic> formData)? inviteFriend,
    required TResult orElse(),
  }) {
    if (getReferralHistory != null) {
      return getReferralHistory(page, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetReferralHistory value) getReferralHistory,
    required TResult Function(_InviteFriend value) inviteFriend,
  }) {
    return getReferralHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetReferralHistory value)? getReferralHistory,
    TResult? Function(_InviteFriend value)? inviteFriend,
  }) {
    return getReferralHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetReferralHistory value)? getReferralHistory,
    TResult Function(_InviteFriend value)? inviteFriend,
    required TResult orElse(),
  }) {
    if (getReferralHistory != null) {
      return getReferralHistory(this);
    }
    return orElse();
  }
}

abstract class _GetReferralHistory implements ReferralEvent {
  const factory _GetReferralHistory({final int page, final int limit}) =
      _$GetReferralHistoryImpl;

  int get page;
  int get limit;

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetReferralHistoryImplCopyWith<_$GetReferralHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InviteFriendImplCopyWith<$Res> {
  factory _$$InviteFriendImplCopyWith(
    _$InviteFriendImpl value,
    $Res Function(_$InviteFriendImpl) then,
  ) = __$$InviteFriendImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> formData});
}

/// @nodoc
class __$$InviteFriendImplCopyWithImpl<$Res>
    extends _$ReferralEventCopyWithImpl<$Res, _$InviteFriendImpl>
    implements _$$InviteFriendImplCopyWith<$Res> {
  __$$InviteFriendImplCopyWithImpl(
    _$InviteFriendImpl _value,
    $Res Function(_$InviteFriendImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? formData = null}) {
    return _then(
      _$InviteFriendImpl(
        formData:
            null == formData
                ? _value._formData
                : formData // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$InviteFriendImpl implements _InviteFriend {
  const _$InviteFriendImpl({required final Map<String, dynamic> formData})
    : _formData = formData;

  final Map<String, dynamic> _formData;
  @override
  Map<String, dynamic> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  @override
  String toString() {
    return 'ReferralEvent.inviteFriend(formData: $formData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteFriendImpl &&
            const DeepCollectionEquality().equals(other._formData, _formData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_formData));

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteFriendImplCopyWith<_$InviteFriendImpl> get copyWith =>
      __$$InviteFriendImplCopyWithImpl<_$InviteFriendImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int page, int limit) getReferralHistory,
    required TResult Function(Map<String, dynamic> formData) inviteFriend,
  }) {
    return inviteFriend(formData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int page, int limit)? getReferralHistory,
    TResult? Function(Map<String, dynamic> formData)? inviteFriend,
  }) {
    return inviteFriend?.call(formData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int page, int limit)? getReferralHistory,
    TResult Function(Map<String, dynamic> formData)? inviteFriend,
    required TResult orElse(),
  }) {
    if (inviteFriend != null) {
      return inviteFriend(formData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetReferralHistory value) getReferralHistory,
    required TResult Function(_InviteFriend value) inviteFriend,
  }) {
    return inviteFriend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetReferralHistory value)? getReferralHistory,
    TResult? Function(_InviteFriend value)? inviteFriend,
  }) {
    return inviteFriend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetReferralHistory value)? getReferralHistory,
    TResult Function(_InviteFriend value)? inviteFriend,
    required TResult orElse(),
  }) {
    if (inviteFriend != null) {
      return inviteFriend(this);
    }
    return orElse();
  }
}

abstract class _InviteFriend implements ReferralEvent {
  const factory _InviteFriend({required final Map<String, dynamic> formData}) =
      _$InviteFriendImpl;

  Map<String, dynamic> get formData;

  /// Create a copy of ReferralEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InviteFriendImplCopyWith<_$InviteFriendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
