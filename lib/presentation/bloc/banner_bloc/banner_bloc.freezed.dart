// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBannerContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBannerContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBannerContent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBannerContent value) getBannerContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBannerContent value)? getBannerContent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBannerContent value)? getBannerContent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerEventCopyWith<$Res> {
  factory $BannerEventCopyWith(
    BannerEvent value,
    $Res Function(BannerEvent) then,
  ) = _$BannerEventCopyWithImpl<$Res, BannerEvent>;
}

/// @nodoc
class _$BannerEventCopyWithImpl<$Res, $Val extends BannerEvent>
    implements $BannerEventCopyWith<$Res> {
  _$BannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetBannerContentImplCopyWith<$Res> {
  factory _$$GetBannerContentImplCopyWith(
    _$GetBannerContentImpl value,
    $Res Function(_$GetBannerContentImpl) then,
  ) = __$$GetBannerContentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBannerContentImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$GetBannerContentImpl>
    implements _$$GetBannerContentImplCopyWith<$Res> {
  __$$GetBannerContentImplCopyWithImpl(
    _$GetBannerContentImpl _value,
    $Res Function(_$GetBannerContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BannerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetBannerContentImpl
    with DiagnosticableTreeMixin
    implements _GetBannerContent {
  const _$GetBannerContentImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerEvent.getBannerContent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannerEvent.getBannerContent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBannerContentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getBannerContent,
  }) {
    return getBannerContent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getBannerContent,
  }) {
    return getBannerContent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getBannerContent,
    required TResult orElse(),
  }) {
    if (getBannerContent != null) {
      return getBannerContent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBannerContent value) getBannerContent,
  }) {
    return getBannerContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBannerContent value)? getBannerContent,
  }) {
    return getBannerContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBannerContent value)? getBannerContent,
    required TResult orElse(),
  }) {
    if (getBannerContent != null) {
      return getBannerContent(this);
    }
    return orElse();
  }
}

abstract class _GetBannerContent implements BannerEvent {
  const factory _GetBannerContent() = _$GetBannerContentImpl;
}

/// @nodoc
mixin _$BannerState {
  BannerStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  List<BannerEntity> get banners => throw _privateConstructorUsedError;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerStateCopyWith<BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
    BannerState value,
    $Res Function(BannerState) then,
  ) = _$BannerStateCopyWithImpl<$Res, BannerState>;
  @useResult
  $Res call({
    BannerStatus status,
    AppErrorEntity? error,
    List<BannerEntity> banners,
  });
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? banners = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as BannerStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            banners:
                null == banners
                    ? _value.banners
                    : banners // ignore: cast_nullable_to_non_nullable
                        as List<BannerEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BannerStateImplCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$BannerStateImplCopyWith(
    _$BannerStateImpl value,
    $Res Function(_$BannerStateImpl) then,
  ) = __$$BannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BannerStatus status,
    AppErrorEntity? error,
    List<BannerEntity> banners,
  });
}

/// @nodoc
class __$$BannerStateImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateImpl>
    implements _$$BannerStateImplCopyWith<$Res> {
  __$$BannerStateImplCopyWithImpl(
    _$BannerStateImpl _value,
    $Res Function(_$BannerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? banners = null,
  }) {
    return _then(
      _$BannerStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as BannerStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        banners:
            null == banners
                ? _value._banners
                : banners // ignore: cast_nullable_to_non_nullable
                    as List<BannerEntity>,
      ),
    );
  }
}

/// @nodoc

class _$BannerStateImpl with DiagnosticableTreeMixin implements _BannerState {
  const _$BannerStateImpl({
    this.status = BannerStatus.initial,
    this.error,
    final List<BannerEntity> banners = const [],
  }) : _banners = banners;

  @override
  @JsonKey()
  final BannerStatus status;
  @override
  final AppErrorEntity? error;
  final List<BannerEntity> _banners;
  @override
  @JsonKey()
  List<BannerEntity> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerState(status: $status, error: $error, banners: $banners)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannerState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('banners', banners));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    const DeepCollectionEquality().hash(_banners),
  );

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      __$$BannerStateImplCopyWithImpl<_$BannerStateImpl>(this, _$identity);
}

abstract class _BannerState implements BannerState {
  const factory _BannerState({
    final BannerStatus status,
    final AppErrorEntity? error,
    final List<BannerEntity> banners,
  }) = _$BannerStateImpl;

  @override
  BannerStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  List<BannerEntity> get banners;

  /// Create a copy of BannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
