// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReferralState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReferralEntity referralData, bool hasReachedMax)
    referralHistoryLoaded,
    required TResult Function() inviteSuccess,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult? Function()? inviteSuccess,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult Function()? inviteSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ReferralHistoryLoaded value)
    referralHistoryLoaded,
    required TResult Function(_InviteSuccess value) inviteSuccess,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult? Function(_InviteSuccess value)? inviteSuccess,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult Function(_InviteSuccess value)? inviteSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralStateCopyWith<$Res> {
  factory $ReferralStateCopyWith(
    ReferralState value,
    $Res Function(ReferralState) then,
  ) = _$ReferralStateCopyWithImpl<$Res, ReferralState>;
}

/// @nodoc
class _$ReferralStateCopyWithImpl<$Res, $Val extends ReferralState>
    implements $ReferralStateCopyWith<$Res> {
  _$ReferralStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralState
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
    extends _$ReferralStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ReferralState.initial()';
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
    required TResult Function(ReferralEntity referralData, bool hasReachedMax)
    referralHistoryLoaded,
    required TResult Function() inviteSuccess,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult? Function()? inviteSuccess,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult Function()? inviteSuccess,
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
    required TResult Function(_ReferralHistoryLoaded value)
    referralHistoryLoaded,
    required TResult Function(_InviteSuccess value) inviteSuccess,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult? Function(_InviteSuccess value)? inviteSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult Function(_InviteSuccess value)? inviteSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReferralState {
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
    extends _$ReferralStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ReferralState.loading()';
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
    required TResult Function(ReferralEntity referralData, bool hasReachedMax)
    referralHistoryLoaded,
    required TResult Function() inviteSuccess,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult? Function()? inviteSuccess,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult Function()? inviteSuccess,
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
    required TResult Function(_ReferralHistoryLoaded value)
    referralHistoryLoaded,
    required TResult Function(_InviteSuccess value) inviteSuccess,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult? Function(_InviteSuccess value)? inviteSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult Function(_InviteSuccess value)? inviteSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReferralState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ReferralHistoryLoadedImplCopyWith<$Res> {
  factory _$$ReferralHistoryLoadedImplCopyWith(
    _$ReferralHistoryLoadedImpl value,
    $Res Function(_$ReferralHistoryLoadedImpl) then,
  ) = __$$ReferralHistoryLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReferralEntity referralData, bool hasReachedMax});
}

/// @nodoc
class __$$ReferralHistoryLoadedImplCopyWithImpl<$Res>
    extends _$ReferralStateCopyWithImpl<$Res, _$ReferralHistoryLoadedImpl>
    implements _$$ReferralHistoryLoadedImplCopyWith<$Res> {
  __$$ReferralHistoryLoadedImplCopyWithImpl(
    _$ReferralHistoryLoadedImpl _value,
    $Res Function(_$ReferralHistoryLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? referralData = null, Object? hasReachedMax = null}) {
    return _then(
      _$ReferralHistoryLoadedImpl(
        referralData:
            null == referralData
                ? _value.referralData
                : referralData // ignore: cast_nullable_to_non_nullable
                    as ReferralEntity,
        hasReachedMax:
            null == hasReachedMax
                ? _value.hasReachedMax
                : hasReachedMax // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ReferralHistoryLoadedImpl implements _ReferralHistoryLoaded {
  const _$ReferralHistoryLoadedImpl({
    required this.referralData,
    this.hasReachedMax = false,
  });

  @override
  final ReferralEntity referralData;
  @override
  @JsonKey()
  final bool hasReachedMax;

  @override
  String toString() {
    return 'ReferralState.referralHistoryLoaded(referralData: $referralData, hasReachedMax: $hasReachedMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralHistoryLoadedImpl &&
            (identical(other.referralData, referralData) ||
                other.referralData == referralData) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax));
  }

  @override
  int get hashCode => Object.hash(runtimeType, referralData, hasReachedMax);

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralHistoryLoadedImplCopyWith<_$ReferralHistoryLoadedImpl>
  get copyWith =>
      __$$ReferralHistoryLoadedImplCopyWithImpl<_$ReferralHistoryLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReferralEntity referralData, bool hasReachedMax)
    referralHistoryLoaded,
    required TResult Function() inviteSuccess,
    required TResult Function(String message) error,
  }) {
    return referralHistoryLoaded(referralData, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult? Function()? inviteSuccess,
    TResult? Function(String message)? error,
  }) {
    return referralHistoryLoaded?.call(referralData, hasReachedMax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult Function()? inviteSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (referralHistoryLoaded != null) {
      return referralHistoryLoaded(referralData, hasReachedMax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ReferralHistoryLoaded value)
    referralHistoryLoaded,
    required TResult Function(_InviteSuccess value) inviteSuccess,
    required TResult Function(_Error value) error,
  }) {
    return referralHistoryLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult? Function(_InviteSuccess value)? inviteSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return referralHistoryLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult Function(_InviteSuccess value)? inviteSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (referralHistoryLoaded != null) {
      return referralHistoryLoaded(this);
    }
    return orElse();
  }
}

abstract class _ReferralHistoryLoaded implements ReferralState {
  const factory _ReferralHistoryLoaded({
    required final ReferralEntity referralData,
    final bool hasReachedMax,
  }) = _$ReferralHistoryLoadedImpl;

  ReferralEntity get referralData;
  bool get hasReachedMax;

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralHistoryLoadedImplCopyWith<_$ReferralHistoryLoadedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InviteSuccessImplCopyWith<$Res> {
  factory _$$InviteSuccessImplCopyWith(
    _$InviteSuccessImpl value,
    $Res Function(_$InviteSuccessImpl) then,
  ) = __$$InviteSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InviteSuccessImplCopyWithImpl<$Res>
    extends _$ReferralStateCopyWithImpl<$Res, _$InviteSuccessImpl>
    implements _$$InviteSuccessImplCopyWith<$Res> {
  __$$InviteSuccessImplCopyWithImpl(
    _$InviteSuccessImpl _value,
    $Res Function(_$InviteSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InviteSuccessImpl implements _InviteSuccess {
  const _$InviteSuccessImpl();

  @override
  String toString() {
    return 'ReferralState.inviteSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InviteSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ReferralEntity referralData, bool hasReachedMax)
    referralHistoryLoaded,
    required TResult Function() inviteSuccess,
    required TResult Function(String message) error,
  }) {
    return inviteSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult? Function()? inviteSuccess,
    TResult? Function(String message)? error,
  }) {
    return inviteSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult Function()? inviteSuccess,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (inviteSuccess != null) {
      return inviteSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ReferralHistoryLoaded value)
    referralHistoryLoaded,
    required TResult Function(_InviteSuccess value) inviteSuccess,
    required TResult Function(_Error value) error,
  }) {
    return inviteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult? Function(_InviteSuccess value)? inviteSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return inviteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult Function(_InviteSuccess value)? inviteSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (inviteSuccess != null) {
      return inviteSuccess(this);
    }
    return orElse();
  }
}

abstract class _InviteSuccess implements ReferralState {
  const factory _InviteSuccess() = _$InviteSuccessImpl;
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
    extends _$ReferralStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralState
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
    return 'ReferralState.error(message: $message)';
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

  /// Create a copy of ReferralState
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
    required TResult Function(ReferralEntity referralData, bool hasReachedMax)
    referralHistoryLoaded,
    required TResult Function() inviteSuccess,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult? Function()? inviteSuccess,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ReferralEntity referralData, bool hasReachedMax)?
    referralHistoryLoaded,
    TResult Function()? inviteSuccess,
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
    required TResult Function(_ReferralHistoryLoaded value)
    referralHistoryLoaded,
    required TResult Function(_InviteSuccess value) inviteSuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult? Function(_InviteSuccess value)? inviteSuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ReferralHistoryLoaded value)? referralHistoryLoaded,
    TResult Function(_InviteSuccess value)? inviteSuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReferralState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ReferralState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
