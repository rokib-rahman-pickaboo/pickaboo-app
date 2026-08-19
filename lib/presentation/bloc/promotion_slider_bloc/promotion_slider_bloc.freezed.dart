// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_slider_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PromotionSliderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPromotionSlider,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPromotionSlider,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPromotionSlider,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPromotionSlider value) getPromotionSlider,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPromotionSlider value)? getPromotionSlider,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPromotionSlider value)? getPromotionSlider,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionSliderEventCopyWith<$Res> {
  factory $PromotionSliderEventCopyWith(
    PromotionSliderEvent value,
    $Res Function(PromotionSliderEvent) then,
  ) = _$PromotionSliderEventCopyWithImpl<$Res, PromotionSliderEvent>;
}

/// @nodoc
class _$PromotionSliderEventCopyWithImpl<
  $Res,
  $Val extends PromotionSliderEvent
>
    implements $PromotionSliderEventCopyWith<$Res> {
  _$PromotionSliderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionSliderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetPromotionSliderImplCopyWith<$Res> {
  factory _$$GetPromotionSliderImplCopyWith(
    _$GetPromotionSliderImpl value,
    $Res Function(_$GetPromotionSliderImpl) then,
  ) = __$$GetPromotionSliderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPromotionSliderImplCopyWithImpl<$Res>
    extends _$PromotionSliderEventCopyWithImpl<$Res, _$GetPromotionSliderImpl>
    implements _$$GetPromotionSliderImplCopyWith<$Res> {
  __$$GetPromotionSliderImplCopyWithImpl(
    _$GetPromotionSliderImpl _value,
    $Res Function(_$GetPromotionSliderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromotionSliderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetPromotionSliderImpl
    with DiagnosticableTreeMixin
    implements _GetPromotionSlider {
  const _$GetPromotionSliderImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromotionSliderEvent.getPromotionSlider()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(
      DiagnosticsProperty('type', 'PromotionSliderEvent.getPromotionSlider'),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPromotionSliderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPromotionSlider,
  }) {
    return getPromotionSlider();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPromotionSlider,
  }) {
    return getPromotionSlider?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPromotionSlider,
    required TResult orElse(),
  }) {
    if (getPromotionSlider != null) {
      return getPromotionSlider();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPromotionSlider value) getPromotionSlider,
  }) {
    return getPromotionSlider(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetPromotionSlider value)? getPromotionSlider,
  }) {
    return getPromotionSlider?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPromotionSlider value)? getPromotionSlider,
    required TResult orElse(),
  }) {
    if (getPromotionSlider != null) {
      return getPromotionSlider(this);
    }
    return orElse();
  }
}

abstract class _GetPromotionSlider implements PromotionSliderEvent {
  const factory _GetPromotionSlider() = _$GetPromotionSliderImpl;
}

/// @nodoc
mixin _$PromotionSliderState {
  PromotionSliderStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  List<PromotionSliderEntity> get slides => throw _privateConstructorUsedError;

  /// Create a copy of PromotionSliderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotionSliderStateCopyWith<PromotionSliderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionSliderStateCopyWith<$Res> {
  factory $PromotionSliderStateCopyWith(
    PromotionSliderState value,
    $Res Function(PromotionSliderState) then,
  ) = _$PromotionSliderStateCopyWithImpl<$Res, PromotionSliderState>;
  @useResult
  $Res call({
    PromotionSliderStatus status,
    AppErrorEntity? error,
    List<PromotionSliderEntity> slides,
  });
}

/// @nodoc
class _$PromotionSliderStateCopyWithImpl<
  $Res,
  $Val extends PromotionSliderState
>
    implements $PromotionSliderStateCopyWith<$Res> {
  _$PromotionSliderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotionSliderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? slides = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as PromotionSliderStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            slides:
                null == slides
                    ? _value.slides
                    : slides // ignore: cast_nullable_to_non_nullable
                        as List<PromotionSliderEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromotionSliderStateImplCopyWith<$Res>
    implements $PromotionSliderStateCopyWith<$Res> {
  factory _$$PromotionSliderStateImplCopyWith(
    _$PromotionSliderStateImpl value,
    $Res Function(_$PromotionSliderStateImpl) then,
  ) = __$$PromotionSliderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PromotionSliderStatus status,
    AppErrorEntity? error,
    List<PromotionSliderEntity> slides,
  });
}

/// @nodoc
class __$$PromotionSliderStateImplCopyWithImpl<$Res>
    extends _$PromotionSliderStateCopyWithImpl<$Res, _$PromotionSliderStateImpl>
    implements _$$PromotionSliderStateImplCopyWith<$Res> {
  __$$PromotionSliderStateImplCopyWithImpl(
    _$PromotionSliderStateImpl _value,
    $Res Function(_$PromotionSliderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromotionSliderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? slides = null,
  }) {
    return _then(
      _$PromotionSliderStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as PromotionSliderStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        slides:
            null == slides
                ? _value._slides
                : slides // ignore: cast_nullable_to_non_nullable
                    as List<PromotionSliderEntity>,
      ),
    );
  }
}

/// @nodoc

class _$PromotionSliderStateImpl
    with DiagnosticableTreeMixin
    implements _PromotionSliderState {
  const _$PromotionSliderStateImpl({
    this.status = PromotionSliderStatus.initial,
    this.error,
    final List<PromotionSliderEntity> slides = const [],
  }) : _slides = slides;

  @override
  @JsonKey()
  final PromotionSliderStatus status;
  @override
  final AppErrorEntity? error;
  final List<PromotionSliderEntity> _slides;
  @override
  @JsonKey()
  List<PromotionSliderEntity> get slides {
    if (_slides is EqualUnmodifiableListView) return _slides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slides);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromotionSliderState(status: $status, error: $error, slides: $slides)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PromotionSliderState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('slides', slides));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionSliderStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._slides, _slides));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    const DeepCollectionEquality().hash(_slides),
  );

  /// Create a copy of PromotionSliderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionSliderStateImplCopyWith<_$PromotionSliderStateImpl>
  get copyWith =>
      __$$PromotionSliderStateImplCopyWithImpl<_$PromotionSliderStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PromotionSliderState implements PromotionSliderState {
  const factory _PromotionSliderState({
    final PromotionSliderStatus status,
    final AppErrorEntity? error,
    final List<PromotionSliderEntity> slides,
  }) = _$PromotionSliderStateImpl;

  @override
  PromotionSliderStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  List<PromotionSliderEntity> get slides;

  /// Create a copy of PromotionSliderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotionSliderStateImplCopyWith<_$PromotionSliderStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
