// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CardBinEvent {
  String? get orderId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? orderId) getStatus,
    required TResult Function(String orderId) verify,
    required TResult Function(String orderId, String cardBin) apply,
    required TResult Function(String orderId) remove,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? orderId)? getStatus,
    TResult? Function(String orderId)? verify,
    TResult? Function(String orderId, String cardBin)? apply,
    TResult? Function(String orderId)? remove,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? orderId)? getStatus,
    TResult Function(String orderId)? verify,
    TResult Function(String orderId, String cardBin)? apply,
    TResult Function(String orderId)? remove,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStatus value) getStatus,
    required TResult Function(_Verify value) verify,
    required TResult Function(_Apply value) apply,
    required TResult Function(_Remove value) remove,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStatus value)? getStatus,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_Apply value)? apply,
    TResult? Function(_Remove value)? remove,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStatus value)? getStatus,
    TResult Function(_Verify value)? verify,
    TResult Function(_Apply value)? apply,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinEventCopyWith<CardBinEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinEventCopyWith<$Res> {
  factory $CardBinEventCopyWith(
    CardBinEvent value,
    $Res Function(CardBinEvent) then,
  ) = _$CardBinEventCopyWithImpl<$Res, CardBinEvent>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class _$CardBinEventCopyWithImpl<$Res, $Val extends CardBinEvent>
    implements $CardBinEventCopyWith<$Res> {
  _$CardBinEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _value.copyWith(
            orderId:
                null == orderId
                    ? _value.orderId!
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetStatusImplCopyWith<$Res>
    implements $CardBinEventCopyWith<$Res> {
  factory _$$GetStatusImplCopyWith(
    _$GetStatusImpl value,
    $Res Function(_$GetStatusImpl) then,
  ) = __$$GetStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? orderId});
}

/// @nodoc
class __$$GetStatusImplCopyWithImpl<$Res>
    extends _$CardBinEventCopyWithImpl<$Res, _$GetStatusImpl>
    implements _$$GetStatusImplCopyWith<$Res> {
  __$$GetStatusImplCopyWithImpl(
    _$GetStatusImpl _value,
    $Res Function(_$GetStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = freezed}) {
    return _then(
      _$GetStatusImpl(
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$GetStatusImpl with DiagnosticableTreeMixin implements _GetStatus {
  const _$GetStatusImpl({this.orderId});

  @override
  final String? orderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardBinEvent.getStatus(orderId: $orderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardBinEvent.getStatus'))
      ..add(DiagnosticsProperty('orderId', orderId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStatusImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStatusImplCopyWith<_$GetStatusImpl> get copyWith =>
      __$$GetStatusImplCopyWithImpl<_$GetStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? orderId) getStatus,
    required TResult Function(String orderId) verify,
    required TResult Function(String orderId, String cardBin) apply,
    required TResult Function(String orderId) remove,
  }) {
    return getStatus(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? orderId)? getStatus,
    TResult? Function(String orderId)? verify,
    TResult? Function(String orderId, String cardBin)? apply,
    TResult? Function(String orderId)? remove,
  }) {
    return getStatus?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? orderId)? getStatus,
    TResult Function(String orderId)? verify,
    TResult Function(String orderId, String cardBin)? apply,
    TResult Function(String orderId)? remove,
    required TResult orElse(),
  }) {
    if (getStatus != null) {
      return getStatus(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStatus value) getStatus,
    required TResult Function(_Verify value) verify,
    required TResult Function(_Apply value) apply,
    required TResult Function(_Remove value) remove,
  }) {
    return getStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStatus value)? getStatus,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_Apply value)? apply,
    TResult? Function(_Remove value)? remove,
  }) {
    return getStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStatus value)? getStatus,
    TResult Function(_Verify value)? verify,
    TResult Function(_Apply value)? apply,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (getStatus != null) {
      return getStatus(this);
    }
    return orElse();
  }
}

abstract class _GetStatus implements CardBinEvent {
  const factory _GetStatus({final String? orderId}) = _$GetStatusImpl;

  @override
  String? get orderId;

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetStatusImplCopyWith<_$GetStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyImplCopyWith<$Res>
    implements $CardBinEventCopyWith<$Res> {
  factory _$$VerifyImplCopyWith(
    _$VerifyImpl value,
    $Res Function(_$VerifyImpl) then,
  ) = __$$VerifyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$VerifyImplCopyWithImpl<$Res>
    extends _$CardBinEventCopyWithImpl<$Res, _$VerifyImpl>
    implements _$$VerifyImplCopyWith<$Res> {
  __$$VerifyImplCopyWithImpl(
    _$VerifyImpl _value,
    $Res Function(_$VerifyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$VerifyImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyImpl with DiagnosticableTreeMixin implements _Verify {
  const _$VerifyImpl({required this.orderId});

  @override
  final String orderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardBinEvent.verify(orderId: $orderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardBinEvent.verify'))
      ..add(DiagnosticsProperty('orderId', orderId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      __$$VerifyImplCopyWithImpl<_$VerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? orderId) getStatus,
    required TResult Function(String orderId) verify,
    required TResult Function(String orderId, String cardBin) apply,
    required TResult Function(String orderId) remove,
  }) {
    return verify(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? orderId)? getStatus,
    TResult? Function(String orderId)? verify,
    TResult? Function(String orderId, String cardBin)? apply,
    TResult? Function(String orderId)? remove,
  }) {
    return verify?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? orderId)? getStatus,
    TResult Function(String orderId)? verify,
    TResult Function(String orderId, String cardBin)? apply,
    TResult Function(String orderId)? remove,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStatus value) getStatus,
    required TResult Function(_Verify value) verify,
    required TResult Function(_Apply value) apply,
    required TResult Function(_Remove value) remove,
  }) {
    return verify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStatus value)? getStatus,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_Apply value)? apply,
    TResult? Function(_Remove value)? remove,
  }) {
    return verify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStatus value)? getStatus,
    TResult Function(_Verify value)? verify,
    TResult Function(_Apply value)? apply,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(this);
    }
    return orElse();
  }
}

abstract class _Verify implements CardBinEvent {
  const factory _Verify({required final String orderId}) = _$VerifyImpl;

  @override
  String get orderId;

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyImplCopyWith<$Res>
    implements $CardBinEventCopyWith<$Res> {
  factory _$$ApplyImplCopyWith(
    _$ApplyImpl value,
    $Res Function(_$ApplyImpl) then,
  ) = __$$ApplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId, String cardBin});
}

/// @nodoc
class __$$ApplyImplCopyWithImpl<$Res>
    extends _$CardBinEventCopyWithImpl<$Res, _$ApplyImpl>
    implements _$$ApplyImplCopyWith<$Res> {
  __$$ApplyImplCopyWithImpl(
    _$ApplyImpl _value,
    $Res Function(_$ApplyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? cardBin = null}) {
    return _then(
      _$ApplyImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
        cardBin:
            null == cardBin
                ? _value.cardBin
                : cardBin // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ApplyImpl with DiagnosticableTreeMixin implements _Apply {
  const _$ApplyImpl({required this.orderId, required this.cardBin});

  @override
  final String orderId;
  @override
  final String cardBin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardBinEvent.apply(orderId: $orderId, cardBin: $cardBin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardBinEvent.apply'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('cardBin', cardBin));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.cardBin, cardBin) || other.cardBin == cardBin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, cardBin);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyImplCopyWith<_$ApplyImpl> get copyWith =>
      __$$ApplyImplCopyWithImpl<_$ApplyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? orderId) getStatus,
    required TResult Function(String orderId) verify,
    required TResult Function(String orderId, String cardBin) apply,
    required TResult Function(String orderId) remove,
  }) {
    return apply(orderId, cardBin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? orderId)? getStatus,
    TResult? Function(String orderId)? verify,
    TResult? Function(String orderId, String cardBin)? apply,
    TResult? Function(String orderId)? remove,
  }) {
    return apply?.call(orderId, cardBin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? orderId)? getStatus,
    TResult Function(String orderId)? verify,
    TResult Function(String orderId, String cardBin)? apply,
    TResult Function(String orderId)? remove,
    required TResult orElse(),
  }) {
    if (apply != null) {
      return apply(orderId, cardBin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStatus value) getStatus,
    required TResult Function(_Verify value) verify,
    required TResult Function(_Apply value) apply,
    required TResult Function(_Remove value) remove,
  }) {
    return apply(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStatus value)? getStatus,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_Apply value)? apply,
    TResult? Function(_Remove value)? remove,
  }) {
    return apply?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStatus value)? getStatus,
    TResult Function(_Verify value)? verify,
    TResult Function(_Apply value)? apply,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (apply != null) {
      return apply(this);
    }
    return orElse();
  }
}

abstract class _Apply implements CardBinEvent {
  const factory _Apply({
    required final String orderId,
    required final String cardBin,
  }) = _$ApplyImpl;

  @override
  String get orderId;
  String get cardBin;

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyImplCopyWith<_$ApplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res>
    implements $CardBinEventCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
    _$RemoveImpl value,
    $Res Function(_$RemoveImpl) then,
  ) = __$$RemoveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$CardBinEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
    _$RemoveImpl _value,
    $Res Function(_$RemoveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$RemoveImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveImpl with DiagnosticableTreeMixin implements _Remove {
  const _$RemoveImpl({required this.orderId});

  @override
  final String orderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardBinEvent.remove(orderId: $orderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardBinEvent.remove'))
      ..add(DiagnosticsProperty('orderId', orderId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? orderId) getStatus,
    required TResult Function(String orderId) verify,
    required TResult Function(String orderId, String cardBin) apply,
    required TResult Function(String orderId) remove,
  }) {
    return remove(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? orderId)? getStatus,
    TResult? Function(String orderId)? verify,
    TResult? Function(String orderId, String cardBin)? apply,
    TResult? Function(String orderId)? remove,
  }) {
    return remove?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? orderId)? getStatus,
    TResult Function(String orderId)? verify,
    TResult Function(String orderId, String cardBin)? apply,
    TResult Function(String orderId)? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetStatus value) getStatus,
    required TResult Function(_Verify value) verify,
    required TResult Function(_Apply value) apply,
    required TResult Function(_Remove value) remove,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetStatus value)? getStatus,
    TResult? Function(_Verify value)? verify,
    TResult? Function(_Apply value)? apply,
    TResult? Function(_Remove value)? remove,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetStatus value)? getStatus,
    TResult Function(_Verify value)? verify,
    TResult Function(_Apply value)? apply,
    TResult Function(_Remove value)? remove,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements CardBinEvent {
  const factory _Remove({required final String orderId}) = _$RemoveImpl;

  @override
  String get orderId;

  /// Create a copy of CardBinEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CardBinState {
  CardBinStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  CardBinStatusEntity? get cardBinStatus => throw _privateConstructorUsedError;
  CardBinVerifyEntity? get cardBinVerifyResponse =>
      throw _privateConstructorUsedError;
  CardBinEntity? get cardBinResponse => throw _privateConstructorUsedError;
  CardBinRemoveEntity? get cardBinRemoveResponse =>
      throw _privateConstructorUsedError;
  String? get appliedBinNumber => throw _privateConstructorUsedError;

  /// Create a copy of CardBinState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinStateCopyWith<CardBinState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinStateCopyWith<$Res> {
  factory $CardBinStateCopyWith(
    CardBinState value,
    $Res Function(CardBinState) then,
  ) = _$CardBinStateCopyWithImpl<$Res, CardBinState>;
  @useResult
  $Res call({
    CardBinStatus status,
    AppErrorEntity? error,
    CardBinStatusEntity? cardBinStatus,
    CardBinVerifyEntity? cardBinVerifyResponse,
    CardBinEntity? cardBinResponse,
    CardBinRemoveEntity? cardBinRemoveResponse,
    String? appliedBinNumber,
  });

  $CardBinRemoveEntityCopyWith<$Res>? get cardBinRemoveResponse;
}

/// @nodoc
class _$CardBinStateCopyWithImpl<$Res, $Val extends CardBinState>
    implements $CardBinStateCopyWith<$Res> {
  _$CardBinStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? cardBinStatus = freezed,
    Object? cardBinVerifyResponse = freezed,
    Object? cardBinResponse = freezed,
    Object? cardBinRemoveResponse = freezed,
    Object? appliedBinNumber = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as CardBinStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            cardBinStatus:
                freezed == cardBinStatus
                    ? _value.cardBinStatus
                    : cardBinStatus // ignore: cast_nullable_to_non_nullable
                        as CardBinStatusEntity?,
            cardBinVerifyResponse:
                freezed == cardBinVerifyResponse
                    ? _value.cardBinVerifyResponse
                    : cardBinVerifyResponse // ignore: cast_nullable_to_non_nullable
                        as CardBinVerifyEntity?,
            cardBinResponse:
                freezed == cardBinResponse
                    ? _value.cardBinResponse
                    : cardBinResponse // ignore: cast_nullable_to_non_nullable
                        as CardBinEntity?,
            cardBinRemoveResponse:
                freezed == cardBinRemoveResponse
                    ? _value.cardBinRemoveResponse
                    : cardBinRemoveResponse // ignore: cast_nullable_to_non_nullable
                        as CardBinRemoveEntity?,
            appliedBinNumber:
                freezed == appliedBinNumber
                    ? _value.appliedBinNumber
                    : appliedBinNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CardBinState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardBinRemoveEntityCopyWith<$Res>? get cardBinRemoveResponse {
    if (_value.cardBinRemoveResponse == null) {
      return null;
    }

    return $CardBinRemoveEntityCopyWith<$Res>(_value.cardBinRemoveResponse!, (
      value,
    ) {
      return _then(_value.copyWith(cardBinRemoveResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardBinStateImplCopyWith<$Res>
    implements $CardBinStateCopyWith<$Res> {
  factory _$$CardBinStateImplCopyWith(
    _$CardBinStateImpl value,
    $Res Function(_$CardBinStateImpl) then,
  ) = __$$CardBinStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CardBinStatus status,
    AppErrorEntity? error,
    CardBinStatusEntity? cardBinStatus,
    CardBinVerifyEntity? cardBinVerifyResponse,
    CardBinEntity? cardBinResponse,
    CardBinRemoveEntity? cardBinRemoveResponse,
    String? appliedBinNumber,
  });

  @override
  $CardBinRemoveEntityCopyWith<$Res>? get cardBinRemoveResponse;
}

/// @nodoc
class __$$CardBinStateImplCopyWithImpl<$Res>
    extends _$CardBinStateCopyWithImpl<$Res, _$CardBinStateImpl>
    implements _$$CardBinStateImplCopyWith<$Res> {
  __$$CardBinStateImplCopyWithImpl(
    _$CardBinStateImpl _value,
    $Res Function(_$CardBinStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? cardBinStatus = freezed,
    Object? cardBinVerifyResponse = freezed,
    Object? cardBinResponse = freezed,
    Object? cardBinRemoveResponse = freezed,
    Object? appliedBinNumber = freezed,
  }) {
    return _then(
      _$CardBinStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as CardBinStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        cardBinStatus:
            freezed == cardBinStatus
                ? _value.cardBinStatus
                : cardBinStatus // ignore: cast_nullable_to_non_nullable
                    as CardBinStatusEntity?,
        cardBinVerifyResponse:
            freezed == cardBinVerifyResponse
                ? _value.cardBinVerifyResponse
                : cardBinVerifyResponse // ignore: cast_nullable_to_non_nullable
                    as CardBinVerifyEntity?,
        cardBinResponse:
            freezed == cardBinResponse
                ? _value.cardBinResponse
                : cardBinResponse // ignore: cast_nullable_to_non_nullable
                    as CardBinEntity?,
        cardBinRemoveResponse:
            freezed == cardBinRemoveResponse
                ? _value.cardBinRemoveResponse
                : cardBinRemoveResponse // ignore: cast_nullable_to_non_nullable
                    as CardBinRemoveEntity?,
        appliedBinNumber:
            freezed == appliedBinNumber
                ? _value.appliedBinNumber
                : appliedBinNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$CardBinStateImpl with DiagnosticableTreeMixin implements _CardBinState {
  const _$CardBinStateImpl({
    this.status = CardBinStatus.initial,
    this.error,
    this.cardBinStatus,
    this.cardBinVerifyResponse,
    this.cardBinResponse,
    this.cardBinRemoveResponse,
    this.appliedBinNumber,
  });

  @override
  @JsonKey()
  final CardBinStatus status;
  @override
  final AppErrorEntity? error;
  @override
  final CardBinStatusEntity? cardBinStatus;
  @override
  final CardBinVerifyEntity? cardBinVerifyResponse;
  @override
  final CardBinEntity? cardBinResponse;
  @override
  final CardBinRemoveEntity? cardBinRemoveResponse;
  @override
  final String? appliedBinNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CardBinState(status: $status, error: $error, cardBinStatus: $cardBinStatus, cardBinVerifyResponse: $cardBinVerifyResponse, cardBinResponse: $cardBinResponse, cardBinRemoveResponse: $cardBinRemoveResponse, appliedBinNumber: $appliedBinNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CardBinState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('cardBinStatus', cardBinStatus))
      ..add(DiagnosticsProperty('cardBinVerifyResponse', cardBinVerifyResponse))
      ..add(DiagnosticsProperty('cardBinResponse', cardBinResponse))
      ..add(DiagnosticsProperty('cardBinRemoveResponse', cardBinRemoveResponse))
      ..add(DiagnosticsProperty('appliedBinNumber', appliedBinNumber));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardBinStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.cardBinStatus, cardBinStatus) ||
                other.cardBinStatus == cardBinStatus) &&
            (identical(other.cardBinVerifyResponse, cardBinVerifyResponse) ||
                other.cardBinVerifyResponse == cardBinVerifyResponse) &&
            (identical(other.cardBinResponse, cardBinResponse) ||
                other.cardBinResponse == cardBinResponse) &&
            (identical(other.cardBinRemoveResponse, cardBinRemoveResponse) ||
                other.cardBinRemoveResponse == cardBinRemoveResponse) &&
            (identical(other.appliedBinNumber, appliedBinNumber) ||
                other.appliedBinNumber == appliedBinNumber));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    cardBinStatus,
    cardBinVerifyResponse,
    cardBinResponse,
    cardBinRemoveResponse,
    appliedBinNumber,
  );

  /// Create a copy of CardBinState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardBinStateImplCopyWith<_$CardBinStateImpl> get copyWith =>
      __$$CardBinStateImplCopyWithImpl<_$CardBinStateImpl>(this, _$identity);
}

abstract class _CardBinState implements CardBinState {
  const factory _CardBinState({
    final CardBinStatus status,
    final AppErrorEntity? error,
    final CardBinStatusEntity? cardBinStatus,
    final CardBinVerifyEntity? cardBinVerifyResponse,
    final CardBinEntity? cardBinResponse,
    final CardBinRemoveEntity? cardBinRemoveResponse,
    final String? appliedBinNumber,
  }) = _$CardBinStateImpl;

  @override
  CardBinStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  CardBinStatusEntity? get cardBinStatus;
  @override
  CardBinVerifyEntity? get cardBinVerifyResponse;
  @override
  CardBinEntity? get cardBinResponse;
  @override
  CardBinRemoveEntity? get cardBinRemoveResponse;
  @override
  String? get appliedBinNumber;

  /// Create a copy of CardBinState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardBinStateImplCopyWith<_$CardBinStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
