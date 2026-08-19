// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SavedPaymentEvent {
  String get customerId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerId) getSavedPayments,
    required TResult Function(String customerId, String phoneNumber)
    deleteSavedPayment,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerId)? getSavedPayments,
    TResult? Function(String customerId, String phoneNumber)?
    deleteSavedPayment,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerId)? getSavedPayments,
    TResult Function(String customerId, String phoneNumber)? deleteSavedPayment,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSavedPayments value) getSavedPayments,
    required TResult Function(_DeleteSavedPayment value) deleteSavedPayment,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSavedPayments value)? getSavedPayments,
    TResult? Function(_DeleteSavedPayment value)? deleteSavedPayment,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSavedPayments value)? getSavedPayments,
    TResult Function(_DeleteSavedPayment value)? deleteSavedPayment,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPaymentEventCopyWith<SavedPaymentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPaymentEventCopyWith<$Res> {
  factory $SavedPaymentEventCopyWith(
    SavedPaymentEvent value,
    $Res Function(SavedPaymentEvent) then,
  ) = _$SavedPaymentEventCopyWithImpl<$Res, SavedPaymentEvent>;
  @useResult
  $Res call({String customerId});
}

/// @nodoc
class _$SavedPaymentEventCopyWithImpl<$Res, $Val extends SavedPaymentEvent>
    implements $SavedPaymentEventCopyWith<$Res> {
  _$SavedPaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? customerId = null}) {
    return _then(
      _value.copyWith(
            customerId:
                null == customerId
                    ? _value.customerId
                    : customerId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetSavedPaymentsImplCopyWith<$Res>
    implements $SavedPaymentEventCopyWith<$Res> {
  factory _$$GetSavedPaymentsImplCopyWith(
    _$GetSavedPaymentsImpl value,
    $Res Function(_$GetSavedPaymentsImpl) then,
  ) = __$$GetSavedPaymentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customerId});
}

/// @nodoc
class __$$GetSavedPaymentsImplCopyWithImpl<$Res>
    extends _$SavedPaymentEventCopyWithImpl<$Res, _$GetSavedPaymentsImpl>
    implements _$$GetSavedPaymentsImplCopyWith<$Res> {
  __$$GetSavedPaymentsImplCopyWithImpl(
    _$GetSavedPaymentsImpl _value,
    $Res Function(_$GetSavedPaymentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? customerId = null}) {
    return _then(
      _$GetSavedPaymentsImpl(
        null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$GetSavedPaymentsImpl implements _GetSavedPayments {
  const _$GetSavedPaymentsImpl(this.customerId);

  @override
  final String customerId;

  @override
  String toString() {
    return 'SavedPaymentEvent.getSavedPayments(customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSavedPaymentsImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerId);

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSavedPaymentsImplCopyWith<_$GetSavedPaymentsImpl> get copyWith =>
      __$$GetSavedPaymentsImplCopyWithImpl<_$GetSavedPaymentsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerId) getSavedPayments,
    required TResult Function(String customerId, String phoneNumber)
    deleteSavedPayment,
  }) {
    return getSavedPayments(customerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerId)? getSavedPayments,
    TResult? Function(String customerId, String phoneNumber)?
    deleteSavedPayment,
  }) {
    return getSavedPayments?.call(customerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerId)? getSavedPayments,
    TResult Function(String customerId, String phoneNumber)? deleteSavedPayment,
    required TResult orElse(),
  }) {
    if (getSavedPayments != null) {
      return getSavedPayments(customerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSavedPayments value) getSavedPayments,
    required TResult Function(_DeleteSavedPayment value) deleteSavedPayment,
  }) {
    return getSavedPayments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSavedPayments value)? getSavedPayments,
    TResult? Function(_DeleteSavedPayment value)? deleteSavedPayment,
  }) {
    return getSavedPayments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSavedPayments value)? getSavedPayments,
    TResult Function(_DeleteSavedPayment value)? deleteSavedPayment,
    required TResult orElse(),
  }) {
    if (getSavedPayments != null) {
      return getSavedPayments(this);
    }
    return orElse();
  }
}

abstract class _GetSavedPayments implements SavedPaymentEvent {
  const factory _GetSavedPayments(final String customerId) =
      _$GetSavedPaymentsImpl;

  @override
  String get customerId;

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSavedPaymentsImplCopyWith<_$GetSavedPaymentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSavedPaymentImplCopyWith<$Res>
    implements $SavedPaymentEventCopyWith<$Res> {
  factory _$$DeleteSavedPaymentImplCopyWith(
    _$DeleteSavedPaymentImpl value,
    $Res Function(_$DeleteSavedPaymentImpl) then,
  ) = __$$DeleteSavedPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String customerId, String phoneNumber});
}

/// @nodoc
class __$$DeleteSavedPaymentImplCopyWithImpl<$Res>
    extends _$SavedPaymentEventCopyWithImpl<$Res, _$DeleteSavedPaymentImpl>
    implements _$$DeleteSavedPaymentImplCopyWith<$Res> {
  __$$DeleteSavedPaymentImplCopyWithImpl(
    _$DeleteSavedPaymentImpl _value,
    $Res Function(_$DeleteSavedPaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? customerId = null, Object? phoneNumber = null}) {
    return _then(
      _$DeleteSavedPaymentImpl(
        customerId:
            null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as String,
        phoneNumber:
            null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteSavedPaymentImpl implements _DeleteSavedPayment {
  const _$DeleteSavedPaymentImpl({
    required this.customerId,
    required this.phoneNumber,
  });

  @override
  final String customerId;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SavedPaymentEvent.deleteSavedPayment(customerId: $customerId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSavedPaymentImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerId, phoneNumber);

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSavedPaymentImplCopyWith<_$DeleteSavedPaymentImpl> get copyWith =>
      __$$DeleteSavedPaymentImplCopyWithImpl<_$DeleteSavedPaymentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String customerId) getSavedPayments,
    required TResult Function(String customerId, String phoneNumber)
    deleteSavedPayment,
  }) {
    return deleteSavedPayment(customerId, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String customerId)? getSavedPayments,
    TResult? Function(String customerId, String phoneNumber)?
    deleteSavedPayment,
  }) {
    return deleteSavedPayment?.call(customerId, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String customerId)? getSavedPayments,
    TResult Function(String customerId, String phoneNumber)? deleteSavedPayment,
    required TResult orElse(),
  }) {
    if (deleteSavedPayment != null) {
      return deleteSavedPayment(customerId, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSavedPayments value) getSavedPayments,
    required TResult Function(_DeleteSavedPayment value) deleteSavedPayment,
  }) {
    return deleteSavedPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSavedPayments value)? getSavedPayments,
    TResult? Function(_DeleteSavedPayment value)? deleteSavedPayment,
  }) {
    return deleteSavedPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSavedPayments value)? getSavedPayments,
    TResult Function(_DeleteSavedPayment value)? deleteSavedPayment,
    required TResult orElse(),
  }) {
    if (deleteSavedPayment != null) {
      return deleteSavedPayment(this);
    }
    return orElse();
  }
}

abstract class _DeleteSavedPayment implements SavedPaymentEvent {
  const factory _DeleteSavedPayment({
    required final String customerId,
    required final String phoneNumber,
  }) = _$DeleteSavedPaymentImpl;

  @override
  String get customerId;
  String get phoneNumber;

  /// Create a copy of SavedPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSavedPaymentImplCopyWith<_$DeleteSavedPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SavedPaymentState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<SavedPaymentEntity> get savedPayments =>
      throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SavedPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPaymentStateCopyWith<SavedPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPaymentStateCopyWith<$Res> {
  factory $SavedPaymentStateCopyWith(
    SavedPaymentState value,
    $Res Function(SavedPaymentState) then,
  ) = _$SavedPaymentStateCopyWithImpl<$Res, SavedPaymentState>;
  @useResult
  $Res call({
    bool isLoading,
    List<SavedPaymentEntity> savedPayments,
    String? successMessage,
    String? errorMessage,
  });
}

/// @nodoc
class _$SavedPaymentStateCopyWithImpl<$Res, $Val extends SavedPaymentState>
    implements $SavedPaymentStateCopyWith<$Res> {
  _$SavedPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? savedPayments = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            savedPayments:
                null == savedPayments
                    ? _value.savedPayments
                    : savedPayments // ignore: cast_nullable_to_non_nullable
                        as List<SavedPaymentEntity>,
            successMessage:
                freezed == successMessage
                    ? _value.successMessage
                    : successMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SavedPaymentStateImplCopyWith<$Res>
    implements $SavedPaymentStateCopyWith<$Res> {
  factory _$$SavedPaymentStateImplCopyWith(
    _$SavedPaymentStateImpl value,
    $Res Function(_$SavedPaymentStateImpl) then,
  ) = __$$SavedPaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<SavedPaymentEntity> savedPayments,
    String? successMessage,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SavedPaymentStateImplCopyWithImpl<$Res>
    extends _$SavedPaymentStateCopyWithImpl<$Res, _$SavedPaymentStateImpl>
    implements _$$SavedPaymentStateImplCopyWith<$Res> {
  __$$SavedPaymentStateImplCopyWithImpl(
    _$SavedPaymentStateImpl _value,
    $Res Function(_$SavedPaymentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? savedPayments = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SavedPaymentStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        savedPayments:
            null == savedPayments
                ? _value._savedPayments
                : savedPayments // ignore: cast_nullable_to_non_nullable
                    as List<SavedPaymentEntity>,
        successMessage:
            freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$SavedPaymentStateImpl implements _SavedPaymentState {
  const _$SavedPaymentStateImpl({
    this.isLoading = false,
    final List<SavedPaymentEntity> savedPayments = const [],
    this.successMessage,
    this.errorMessage,
  }) : _savedPayments = savedPayments;

  @override
  @JsonKey()
  final bool isLoading;
  final List<SavedPaymentEntity> _savedPayments;
  @override
  @JsonKey()
  List<SavedPaymentEntity> get savedPayments {
    if (_savedPayments is EqualUnmodifiableListView) return _savedPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedPayments);
  }

  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SavedPaymentState(isLoading: $isLoading, savedPayments: $savedPayments, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPaymentStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(
              other._savedPayments,
              _savedPayments,
            ) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_savedPayments),
    successMessage,
    errorMessage,
  );

  /// Create a copy of SavedPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPaymentStateImplCopyWith<_$SavedPaymentStateImpl> get copyWith =>
      __$$SavedPaymentStateImplCopyWithImpl<_$SavedPaymentStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SavedPaymentState implements SavedPaymentState {
  const factory _SavedPaymentState({
    final bool isLoading,
    final List<SavedPaymentEntity> savedPayments,
    final String? successMessage,
    final String? errorMessage,
  }) = _$SavedPaymentStateImpl;

  @override
  bool get isLoading;
  @override
  List<SavedPaymentEntity> get savedPayments;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;

  /// Create a copy of SavedPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedPaymentStateImplCopyWith<_$SavedPaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
