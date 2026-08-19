// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recaptcha_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecaptchaEvent {
  String get action => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String action) generateToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String action)? generateToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String action)? generateToken,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateToken value) generateToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateToken value)? generateToken,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateToken value)? generateToken,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of RecaptchaEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecaptchaEventCopyWith<RecaptchaEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecaptchaEventCopyWith<$Res> {
  factory $RecaptchaEventCopyWith(
    RecaptchaEvent value,
    $Res Function(RecaptchaEvent) then,
  ) = _$RecaptchaEventCopyWithImpl<$Res, RecaptchaEvent>;
  @useResult
  $Res call({String action});
}

/// @nodoc
class _$RecaptchaEventCopyWithImpl<$Res, $Val extends RecaptchaEvent>
    implements $RecaptchaEventCopyWith<$Res> {
  _$RecaptchaEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecaptchaEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? action = null}) {
    return _then(
      _value.copyWith(
            action:
                null == action
                    ? _value.action
                    : action // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenerateTokenImplCopyWith<$Res>
    implements $RecaptchaEventCopyWith<$Res> {
  factory _$$GenerateTokenImplCopyWith(
    _$GenerateTokenImpl value,
    $Res Function(_$GenerateTokenImpl) then,
  ) = __$$GenerateTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action});
}

/// @nodoc
class __$$GenerateTokenImplCopyWithImpl<$Res>
    extends _$RecaptchaEventCopyWithImpl<$Res, _$GenerateTokenImpl>
    implements _$$GenerateTokenImplCopyWith<$Res> {
  __$$GenerateTokenImplCopyWithImpl(
    _$GenerateTokenImpl _value,
    $Res Function(_$GenerateTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecaptchaEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? action = null}) {
    return _then(
      _$GenerateTokenImpl(
        null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$GenerateTokenImpl implements GenerateToken {
  const _$GenerateTokenImpl(this.action);

  @override
  final String action;

  @override
  String toString() {
    return 'RecaptchaEvent.generateToken(action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateTokenImpl &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  /// Create a copy of RecaptchaEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateTokenImplCopyWith<_$GenerateTokenImpl> get copyWith =>
      __$$GenerateTokenImplCopyWithImpl<_$GenerateTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String action) generateToken,
  }) {
    return generateToken(action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String action)? generateToken,
  }) {
    return generateToken?.call(action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String action)? generateToken,
    required TResult orElse(),
  }) {
    if (generateToken != null) {
      return generateToken(action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateToken value) generateToken,
  }) {
    return generateToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateToken value)? generateToken,
  }) {
    return generateToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateToken value)? generateToken,
    required TResult orElse(),
  }) {
    if (generateToken != null) {
      return generateToken(this);
    }
    return orElse();
  }
}

abstract class GenerateToken implements RecaptchaEvent {
  const factory GenerateToken(final String action) = _$GenerateTokenImpl;

  @override
  String get action;

  /// Create a copy of RecaptchaEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateTokenImplCopyWith<_$GenerateTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
