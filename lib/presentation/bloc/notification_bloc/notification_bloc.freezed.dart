// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) saveFcmToken,
    required TResult Function() loadNotificationList,
    required TResult Function(int notificationId) updateNotificationStatus,
    required TResult Function() markAllAsRead,
    required TResult Function(String token) deleteFcmToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? saveFcmToken,
    TResult? Function()? loadNotificationList,
    TResult? Function(int notificationId)? updateNotificationStatus,
    TResult? Function()? markAllAsRead,
    TResult? Function(String token)? deleteFcmToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? saveFcmToken,
    TResult Function()? loadNotificationList,
    TResult Function(int notificationId)? updateNotificationStatus,
    TResult Function()? markAllAsRead,
    TResult Function(String token)? deleteFcmToken,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveFcmToken value) saveFcmToken,
    required TResult Function(_LoadNotificationList value) loadNotificationList,
    required TResult Function(_UpdateNotificationStatus value)
    updateNotificationStatus,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveFcmToken value)? saveFcmToken,
    TResult? Function(_LoadNotificationList value)? loadNotificationList,
    TResult? Function(_UpdateNotificationStatus value)?
    updateNotificationStatus,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveFcmToken value)? saveFcmToken,
    TResult Function(_LoadNotificationList value)? loadNotificationList,
    TResult Function(_UpdateNotificationStatus value)? updateNotificationStatus,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
    NotificationEvent value,
    $Res Function(NotificationEvent) then,
  ) = _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SaveFcmTokenImplCopyWith<$Res> {
  factory _$$SaveFcmTokenImplCopyWith(
    _$SaveFcmTokenImpl value,
    $Res Function(_$SaveFcmTokenImpl) then,
  ) = __$$SaveFcmTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$SaveFcmTokenImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$SaveFcmTokenImpl>
    implements _$$SaveFcmTokenImplCopyWith<$Res> {
  __$$SaveFcmTokenImplCopyWithImpl(
    _$SaveFcmTokenImpl _value,
    $Res Function(_$SaveFcmTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _$SaveFcmTokenImpl(
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SaveFcmTokenImpl implements _SaveFcmToken {
  const _$SaveFcmTokenImpl({required this.token});

  @override
  final String token;

  @override
  String toString() {
    return 'NotificationEvent.saveFcmToken(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveFcmTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveFcmTokenImplCopyWith<_$SaveFcmTokenImpl> get copyWith =>
      __$$SaveFcmTokenImplCopyWithImpl<_$SaveFcmTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) saveFcmToken,
    required TResult Function() loadNotificationList,
    required TResult Function(int notificationId) updateNotificationStatus,
    required TResult Function() markAllAsRead,
    required TResult Function(String token) deleteFcmToken,
  }) {
    return saveFcmToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? saveFcmToken,
    TResult? Function()? loadNotificationList,
    TResult? Function(int notificationId)? updateNotificationStatus,
    TResult? Function()? markAllAsRead,
    TResult? Function(String token)? deleteFcmToken,
  }) {
    return saveFcmToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? saveFcmToken,
    TResult Function()? loadNotificationList,
    TResult Function(int notificationId)? updateNotificationStatus,
    TResult Function()? markAllAsRead,
    TResult Function(String token)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (saveFcmToken != null) {
      return saveFcmToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveFcmToken value) saveFcmToken,
    required TResult Function(_LoadNotificationList value) loadNotificationList,
    required TResult Function(_UpdateNotificationStatus value)
    updateNotificationStatus,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
  }) {
    return saveFcmToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveFcmToken value)? saveFcmToken,
    TResult? Function(_LoadNotificationList value)? loadNotificationList,
    TResult? Function(_UpdateNotificationStatus value)?
    updateNotificationStatus,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
  }) {
    return saveFcmToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveFcmToken value)? saveFcmToken,
    TResult Function(_LoadNotificationList value)? loadNotificationList,
    TResult Function(_UpdateNotificationStatus value)? updateNotificationStatus,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (saveFcmToken != null) {
      return saveFcmToken(this);
    }
    return orElse();
  }
}

abstract class _SaveFcmToken implements NotificationEvent {
  const factory _SaveFcmToken({required final String token}) =
      _$SaveFcmTokenImpl;

  String get token;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveFcmTokenImplCopyWith<_$SaveFcmTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadNotificationListImplCopyWith<$Res> {
  factory _$$LoadNotificationListImplCopyWith(
    _$LoadNotificationListImpl value,
    $Res Function(_$LoadNotificationListImpl) then,
  ) = __$$LoadNotificationListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadNotificationListImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$LoadNotificationListImpl>
    implements _$$LoadNotificationListImplCopyWith<$Res> {
  __$$LoadNotificationListImplCopyWithImpl(
    _$LoadNotificationListImpl _value,
    $Res Function(_$LoadNotificationListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadNotificationListImpl implements _LoadNotificationList {
  const _$LoadNotificationListImpl();

  @override
  String toString() {
    return 'NotificationEvent.loadNotificationList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadNotificationListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) saveFcmToken,
    required TResult Function() loadNotificationList,
    required TResult Function(int notificationId) updateNotificationStatus,
    required TResult Function() markAllAsRead,
    required TResult Function(String token) deleteFcmToken,
  }) {
    return loadNotificationList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? saveFcmToken,
    TResult? Function()? loadNotificationList,
    TResult? Function(int notificationId)? updateNotificationStatus,
    TResult? Function()? markAllAsRead,
    TResult? Function(String token)? deleteFcmToken,
  }) {
    return loadNotificationList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? saveFcmToken,
    TResult Function()? loadNotificationList,
    TResult Function(int notificationId)? updateNotificationStatus,
    TResult Function()? markAllAsRead,
    TResult Function(String token)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (loadNotificationList != null) {
      return loadNotificationList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveFcmToken value) saveFcmToken,
    required TResult Function(_LoadNotificationList value) loadNotificationList,
    required TResult Function(_UpdateNotificationStatus value)
    updateNotificationStatus,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
  }) {
    return loadNotificationList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveFcmToken value)? saveFcmToken,
    TResult? Function(_LoadNotificationList value)? loadNotificationList,
    TResult? Function(_UpdateNotificationStatus value)?
    updateNotificationStatus,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
  }) {
    return loadNotificationList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveFcmToken value)? saveFcmToken,
    TResult Function(_LoadNotificationList value)? loadNotificationList,
    TResult Function(_UpdateNotificationStatus value)? updateNotificationStatus,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (loadNotificationList != null) {
      return loadNotificationList(this);
    }
    return orElse();
  }
}

abstract class _LoadNotificationList implements NotificationEvent {
  const factory _LoadNotificationList() = _$LoadNotificationListImpl;
}

/// @nodoc
abstract class _$$UpdateNotificationStatusImplCopyWith<$Res> {
  factory _$$UpdateNotificationStatusImplCopyWith(
    _$UpdateNotificationStatusImpl value,
    $Res Function(_$UpdateNotificationStatusImpl) then,
  ) = __$$UpdateNotificationStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int notificationId});
}

/// @nodoc
class __$$UpdateNotificationStatusImplCopyWithImpl<$Res>
    extends
        _$NotificationEventCopyWithImpl<$Res, _$UpdateNotificationStatusImpl>
    implements _$$UpdateNotificationStatusImplCopyWith<$Res> {
  __$$UpdateNotificationStatusImplCopyWithImpl(
    _$UpdateNotificationStatusImpl _value,
    $Res Function(_$UpdateNotificationStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notificationId = null}) {
    return _then(
      _$UpdateNotificationStatusImpl(
        notificationId:
            null == notificationId
                ? _value.notificationId
                : notificationId // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$UpdateNotificationStatusImpl implements _UpdateNotificationStatus {
  const _$UpdateNotificationStatusImpl({required this.notificationId});

  @override
  final int notificationId;

  @override
  String toString() {
    return 'NotificationEvent.updateNotificationStatus(notificationId: $notificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotificationStatusImpl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationId);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNotificationStatusImplCopyWith<_$UpdateNotificationStatusImpl>
  get copyWith => __$$UpdateNotificationStatusImplCopyWithImpl<
    _$UpdateNotificationStatusImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) saveFcmToken,
    required TResult Function() loadNotificationList,
    required TResult Function(int notificationId) updateNotificationStatus,
    required TResult Function() markAllAsRead,
    required TResult Function(String token) deleteFcmToken,
  }) {
    return updateNotificationStatus(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? saveFcmToken,
    TResult? Function()? loadNotificationList,
    TResult? Function(int notificationId)? updateNotificationStatus,
    TResult? Function()? markAllAsRead,
    TResult? Function(String token)? deleteFcmToken,
  }) {
    return updateNotificationStatus?.call(notificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? saveFcmToken,
    TResult Function()? loadNotificationList,
    TResult Function(int notificationId)? updateNotificationStatus,
    TResult Function()? markAllAsRead,
    TResult Function(String token)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (updateNotificationStatus != null) {
      return updateNotificationStatus(notificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveFcmToken value) saveFcmToken,
    required TResult Function(_LoadNotificationList value) loadNotificationList,
    required TResult Function(_UpdateNotificationStatus value)
    updateNotificationStatus,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
  }) {
    return updateNotificationStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveFcmToken value)? saveFcmToken,
    TResult? Function(_LoadNotificationList value)? loadNotificationList,
    TResult? Function(_UpdateNotificationStatus value)?
    updateNotificationStatus,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
  }) {
    return updateNotificationStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveFcmToken value)? saveFcmToken,
    TResult Function(_LoadNotificationList value)? loadNotificationList,
    TResult Function(_UpdateNotificationStatus value)? updateNotificationStatus,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (updateNotificationStatus != null) {
      return updateNotificationStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateNotificationStatus implements NotificationEvent {
  const factory _UpdateNotificationStatus({required final int notificationId}) =
      _$UpdateNotificationStatusImpl;

  int get notificationId;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNotificationStatusImplCopyWith<_$UpdateNotificationStatusImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MarkAllAsReadImplCopyWith<$Res> {
  factory _$$MarkAllAsReadImplCopyWith(
    _$MarkAllAsReadImpl value,
    $Res Function(_$MarkAllAsReadImpl) then,
  ) = __$$MarkAllAsReadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkAllAsReadImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$MarkAllAsReadImpl>
    implements _$$MarkAllAsReadImplCopyWith<$Res> {
  __$$MarkAllAsReadImplCopyWithImpl(
    _$MarkAllAsReadImpl _value,
    $Res Function(_$MarkAllAsReadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MarkAllAsReadImpl implements _MarkAllAsRead {
  const _$MarkAllAsReadImpl();

  @override
  String toString() {
    return 'NotificationEvent.markAllAsRead()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkAllAsReadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) saveFcmToken,
    required TResult Function() loadNotificationList,
    required TResult Function(int notificationId) updateNotificationStatus,
    required TResult Function() markAllAsRead,
    required TResult Function(String token) deleteFcmToken,
  }) {
    return markAllAsRead();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? saveFcmToken,
    TResult? Function()? loadNotificationList,
    TResult? Function(int notificationId)? updateNotificationStatus,
    TResult? Function()? markAllAsRead,
    TResult? Function(String token)? deleteFcmToken,
  }) {
    return markAllAsRead?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? saveFcmToken,
    TResult Function()? loadNotificationList,
    TResult Function(int notificationId)? updateNotificationStatus,
    TResult Function()? markAllAsRead,
    TResult Function(String token)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (markAllAsRead != null) {
      return markAllAsRead();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveFcmToken value) saveFcmToken,
    required TResult Function(_LoadNotificationList value) loadNotificationList,
    required TResult Function(_UpdateNotificationStatus value)
    updateNotificationStatus,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
  }) {
    return markAllAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveFcmToken value)? saveFcmToken,
    TResult? Function(_LoadNotificationList value)? loadNotificationList,
    TResult? Function(_UpdateNotificationStatus value)?
    updateNotificationStatus,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
  }) {
    return markAllAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveFcmToken value)? saveFcmToken,
    TResult Function(_LoadNotificationList value)? loadNotificationList,
    TResult Function(_UpdateNotificationStatus value)? updateNotificationStatus,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (markAllAsRead != null) {
      return markAllAsRead(this);
    }
    return orElse();
  }
}

abstract class _MarkAllAsRead implements NotificationEvent {
  const factory _MarkAllAsRead() = _$MarkAllAsReadImpl;
}

/// @nodoc
abstract class _$$DeleteFcmTokenImplCopyWith<$Res> {
  factory _$$DeleteFcmTokenImplCopyWith(
    _$DeleteFcmTokenImpl value,
    $Res Function(_$DeleteFcmTokenImpl) then,
  ) = __$$DeleteFcmTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$DeleteFcmTokenImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$DeleteFcmTokenImpl>
    implements _$$DeleteFcmTokenImplCopyWith<$Res> {
  __$$DeleteFcmTokenImplCopyWithImpl(
    _$DeleteFcmTokenImpl _value,
    $Res Function(_$DeleteFcmTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? token = null}) {
    return _then(
      _$DeleteFcmTokenImpl(
        null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteFcmTokenImpl implements _DeleteFcmToken {
  const _$DeleteFcmTokenImpl(this.token);

  @override
  final String token;

  @override
  String toString() {
    return 'NotificationEvent.deleteFcmToken(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFcmTokenImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFcmTokenImplCopyWith<_$DeleteFcmTokenImpl> get copyWith =>
      __$$DeleteFcmTokenImplCopyWithImpl<_$DeleteFcmTokenImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String token) saveFcmToken,
    required TResult Function() loadNotificationList,
    required TResult Function(int notificationId) updateNotificationStatus,
    required TResult Function() markAllAsRead,
    required TResult Function(String token) deleteFcmToken,
  }) {
    return deleteFcmToken(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String token)? saveFcmToken,
    TResult? Function()? loadNotificationList,
    TResult? Function(int notificationId)? updateNotificationStatus,
    TResult? Function()? markAllAsRead,
    TResult? Function(String token)? deleteFcmToken,
  }) {
    return deleteFcmToken?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String token)? saveFcmToken,
    TResult Function()? loadNotificationList,
    TResult Function(int notificationId)? updateNotificationStatus,
    TResult Function()? markAllAsRead,
    TResult Function(String token)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (deleteFcmToken != null) {
      return deleteFcmToken(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveFcmToken value) saveFcmToken,
    required TResult Function(_LoadNotificationList value) loadNotificationList,
    required TResult Function(_UpdateNotificationStatus value)
    updateNotificationStatus,
    required TResult Function(_MarkAllAsRead value) markAllAsRead,
    required TResult Function(_DeleteFcmToken value) deleteFcmToken,
  }) {
    return deleteFcmToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SaveFcmToken value)? saveFcmToken,
    TResult? Function(_LoadNotificationList value)? loadNotificationList,
    TResult? Function(_UpdateNotificationStatus value)?
    updateNotificationStatus,
    TResult? Function(_MarkAllAsRead value)? markAllAsRead,
    TResult? Function(_DeleteFcmToken value)? deleteFcmToken,
  }) {
    return deleteFcmToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveFcmToken value)? saveFcmToken,
    TResult Function(_LoadNotificationList value)? loadNotificationList,
    TResult Function(_UpdateNotificationStatus value)? updateNotificationStatus,
    TResult Function(_MarkAllAsRead value)? markAllAsRead,
    TResult Function(_DeleteFcmToken value)? deleteFcmToken,
    required TResult orElse(),
  }) {
    if (deleteFcmToken != null) {
      return deleteFcmToken(this);
    }
    return orElse();
  }
}

abstract class _DeleteFcmToken implements NotificationEvent {
  const factory _DeleteFcmToken(final String token) = _$DeleteFcmTokenImpl;

  String get token;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteFcmTokenImplCopyWith<_$DeleteFcmTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() tokenSaved,
    required TResult Function(List<NotificationEntity> notifications)
    listLoaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? tokenSaved,
    TResult? Function(List<NotificationEntity> notifications)? listLoaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? tokenSaved,
    TResult Function(List<NotificationEntity> notifications)? listLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TokenSaved value) tokenSaved,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TokenSaved value)? tokenSaved,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TokenSaved value)? tokenSaved,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
    NotificationState value,
    $Res Function(NotificationState) then,
  ) = _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NotificationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() tokenSaved,
    required TResult Function(List<NotificationEntity> notifications)
    listLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? tokenSaved,
    TResult? Function(List<NotificationEntity> notifications)? listLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? tokenSaved,
    TResult Function(List<NotificationEntity> notifications)? listLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TokenSaved value) tokenSaved,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TokenSaved value)? tokenSaved,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TokenSaved value)? tokenSaved,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NotificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NotificationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() tokenSaved,
    required TResult Function(List<NotificationEntity> notifications)
    listLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? tokenSaved,
    TResult? Function(List<NotificationEntity> notifications)? listLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? tokenSaved,
    TResult Function(List<NotificationEntity> notifications)? listLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TokenSaved value) tokenSaved,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TokenSaved value)? tokenSaved,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TokenSaved value)? tokenSaved,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NotificationState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$TokenSavedImplCopyWith<$Res> {
  factory _$$TokenSavedImplCopyWith(
    _$TokenSavedImpl value,
    $Res Function(_$TokenSavedImpl) then,
  ) = __$$TokenSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TokenSavedImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$TokenSavedImpl>
    implements _$$TokenSavedImplCopyWith<$Res> {
  __$$TokenSavedImplCopyWithImpl(
    _$TokenSavedImpl _value,
    $Res Function(_$TokenSavedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TokenSavedImpl implements _TokenSaved {
  const _$TokenSavedImpl();

  @override
  String toString() {
    return 'NotificationState.tokenSaved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TokenSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() tokenSaved,
    required TResult Function(List<NotificationEntity> notifications)
    listLoaded,
    required TResult Function(String message) error,
  }) {
    return tokenSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? tokenSaved,
    TResult? Function(List<NotificationEntity> notifications)? listLoaded,
    TResult? Function(String message)? error,
  }) {
    return tokenSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? tokenSaved,
    TResult Function(List<NotificationEntity> notifications)? listLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (tokenSaved != null) {
      return tokenSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TokenSaved value) tokenSaved,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_Error value) error,
  }) {
    return tokenSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TokenSaved value)? tokenSaved,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return tokenSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TokenSaved value)? tokenSaved,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (tokenSaved != null) {
      return tokenSaved(this);
    }
    return orElse();
  }
}

abstract class _TokenSaved implements NotificationState {
  const factory _TokenSaved() = _$TokenSavedImpl;
}

/// @nodoc
abstract class _$$ListLoadedImplCopyWith<$Res> {
  factory _$$ListLoadedImplCopyWith(
    _$ListLoadedImpl value,
    $Res Function(_$ListLoadedImpl) then,
  ) = __$$ListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationEntity> notifications});
}

/// @nodoc
class __$$ListLoadedImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$ListLoadedImpl>
    implements _$$ListLoadedImplCopyWith<$Res> {
  __$$ListLoadedImplCopyWithImpl(
    _$ListLoadedImpl _value,
    $Res Function(_$ListLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notifications = null}) {
    return _then(
      _$ListLoadedImpl(
        notifications:
            null == notifications
                ? _value._notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                    as List<NotificationEntity>,
      ),
    );
  }
}

/// @nodoc

class _$ListLoadedImpl implements _ListLoaded {
  const _$ListLoadedImpl({
    required final List<NotificationEntity> notifications,
  }) : _notifications = notifications;

  final List<NotificationEntity> _notifications;
  @override
  List<NotificationEntity> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationState.listLoaded(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListLoadedImpl &&
            const DeepCollectionEquality().equals(
              other._notifications,
              _notifications,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_notifications),
  );

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListLoadedImplCopyWith<_$ListLoadedImpl> get copyWith =>
      __$$ListLoadedImplCopyWithImpl<_$ListLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() tokenSaved,
    required TResult Function(List<NotificationEntity> notifications)
    listLoaded,
    required TResult Function(String message) error,
  }) {
    return listLoaded(notifications);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? tokenSaved,
    TResult? Function(List<NotificationEntity> notifications)? listLoaded,
    TResult? Function(String message)? error,
  }) {
    return listLoaded?.call(notifications);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? tokenSaved,
    TResult Function(List<NotificationEntity> notifications)? listLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(notifications);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TokenSaved value) tokenSaved,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_Error value) error,
  }) {
    return listLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TokenSaved value)? tokenSaved,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return listLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TokenSaved value)? tokenSaved,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (listLoaded != null) {
      return listLoaded(this);
    }
    return orElse();
  }
}

abstract class _ListLoaded implements NotificationState {
  const factory _ListLoaded({
    required final List<NotificationEntity> notifications,
  }) = _$ListLoadedImpl;

  List<NotificationEntity> get notifications;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListLoadedImplCopyWith<_$ListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() tokenSaved,
    required TResult Function(List<NotificationEntity> notifications)
    listLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? tokenSaved,
    TResult? Function(List<NotificationEntity> notifications)? listLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? tokenSaved,
    TResult Function(List<NotificationEntity> notifications)? listLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TokenSaved value) tokenSaved,
    required TResult Function(_ListLoaded value) listLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TokenSaved value)? tokenSaved,
    TResult? Function(_ListLoaded value)? listLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TokenSaved value)? tokenSaved,
    TResult Function(_ListLoaded value)? listLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements NotificationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of NotificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
