// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CategoryBannerEvent {
  int get categoryId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? load,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CategoryBannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryBannerEventCopyWith<CategoryBannerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBannerEventCopyWith<$Res> {
  factory $CategoryBannerEventCopyWith(
    CategoryBannerEvent value,
    $Res Function(CategoryBannerEvent) then,
  ) = _$CategoryBannerEventCopyWithImpl<$Res, CategoryBannerEvent>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class _$CategoryBannerEventCopyWithImpl<$Res, $Val extends CategoryBannerEvent>
    implements $CategoryBannerEventCopyWith<$Res> {
  _$CategoryBannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryBannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null}) {
    return _then(
      _value.copyWith(
            categoryId:
                null == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res>
    implements $CategoryBannerEventCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
    _$LoadImpl value,
    $Res Function(_$LoadImpl) then,
  ) = __$$LoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$CategoryBannerEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of CategoryBannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null}) {
    return _then(
      _$LoadImpl(
        categoryId:
            null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl({required this.categoryId});

  @override
  final int categoryId;

  @override
  String toString() {
    return 'CategoryBannerEvent.load(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of CategoryBannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int categoryId) load,
  }) {
    return load(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int categoryId)? load,
  }) {
    return load?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int categoryId)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements CategoryBannerEvent {
  const factory _Load({required final int categoryId}) = _$LoadImpl;

  @override
  int get categoryId;

  /// Create a copy of CategoryBannerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryBannerState {
  CategoryBannerStatus get status => throw _privateConstructorUsedError;
  List<CategoryBannerEntity> get banners => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;

  /// Create a copy of CategoryBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryBannerStateCopyWith<CategoryBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBannerStateCopyWith<$Res> {
  factory $CategoryBannerStateCopyWith(
    CategoryBannerState value,
    $Res Function(CategoryBannerState) then,
  ) = _$CategoryBannerStateCopyWithImpl<$Res, CategoryBannerState>;
  @useResult
  $Res call({
    CategoryBannerStatus status,
    List<CategoryBannerEntity> banners,
    AppErrorEntity? error,
  });
}

/// @nodoc
class _$CategoryBannerStateCopyWithImpl<$Res, $Val extends CategoryBannerState>
    implements $CategoryBannerStateCopyWith<$Res> {
  _$CategoryBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryBannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? banners = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as CategoryBannerStatus,
            banners:
                null == banners
                    ? _value.banners
                    : banners // ignore: cast_nullable_to_non_nullable
                        as List<CategoryBannerEntity>,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryBannerStateImplCopyWith<$Res>
    implements $CategoryBannerStateCopyWith<$Res> {
  factory _$$CategoryBannerStateImplCopyWith(
    _$CategoryBannerStateImpl value,
    $Res Function(_$CategoryBannerStateImpl) then,
  ) = __$$CategoryBannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CategoryBannerStatus status,
    List<CategoryBannerEntity> banners,
    AppErrorEntity? error,
  });
}

/// @nodoc
class __$$CategoryBannerStateImplCopyWithImpl<$Res>
    extends _$CategoryBannerStateCopyWithImpl<$Res, _$CategoryBannerStateImpl>
    implements _$$CategoryBannerStateImplCopyWith<$Res> {
  __$$CategoryBannerStateImplCopyWithImpl(
    _$CategoryBannerStateImpl _value,
    $Res Function(_$CategoryBannerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryBannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? banners = null,
    Object? error = freezed,
  }) {
    return _then(
      _$CategoryBannerStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as CategoryBannerStatus,
        banners:
            null == banners
                ? _value._banners
                : banners // ignore: cast_nullable_to_non_nullable
                    as List<CategoryBannerEntity>,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
      ),
    );
  }
}

/// @nodoc

class _$CategoryBannerStateImpl implements _CategoryBannerState {
  const _$CategoryBannerStateImpl({
    this.status = CategoryBannerStatus.initial,
    final List<CategoryBannerEntity> banners = const <CategoryBannerEntity>[],
    this.error,
  }) : _banners = banners;

  @override
  @JsonKey()
  final CategoryBannerStatus status;
  final List<CategoryBannerEntity> _banners;
  @override
  @JsonKey()
  List<CategoryBannerEntity> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  final AppErrorEntity? error;

  @override
  String toString() {
    return 'CategoryBannerState(status: $status, banners: $banners, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryBannerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_banners),
    error,
  );

  /// Create a copy of CategoryBannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryBannerStateImplCopyWith<_$CategoryBannerStateImpl> get copyWith =>
      __$$CategoryBannerStateImplCopyWithImpl<_$CategoryBannerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CategoryBannerState implements CategoryBannerState {
  const factory _CategoryBannerState({
    final CategoryBannerStatus status,
    final List<CategoryBannerEntity> banners,
    final AppErrorEntity? error,
  }) = _$CategoryBannerStateImpl;

  @override
  CategoryBannerStatus get status;
  @override
  List<CategoryBannerEntity> get banners;
  @override
  AppErrorEntity? get error;

  /// Create a copy of CategoryBannerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryBannerStateImplCopyWith<_$CategoryBannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
