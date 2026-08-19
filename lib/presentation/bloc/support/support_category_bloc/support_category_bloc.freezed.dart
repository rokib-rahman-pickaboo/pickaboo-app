// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SupportCategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSupportCategories,
    required TResult Function() refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSupportCategories,
    TResult? Function()? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSupportCategories,
    TResult Function()? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupportCategories value) getSupportCategories,
    required TResult Function(_Refresh value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupportCategories value)? getSupportCategories,
    TResult? Function(_Refresh value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupportCategories value)? getSupportCategories,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportCategoryEventCopyWith<$Res> {
  factory $SupportCategoryEventCopyWith(
    SupportCategoryEvent value,
    $Res Function(SupportCategoryEvent) then,
  ) = _$SupportCategoryEventCopyWithImpl<$Res, SupportCategoryEvent>;
}

/// @nodoc
class _$SupportCategoryEventCopyWithImpl<
  $Res,
  $Val extends SupportCategoryEvent
>
    implements $SupportCategoryEventCopyWith<$Res> {
  _$SupportCategoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportCategoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSupportCategoriesImplCopyWith<$Res> {
  factory _$$GetSupportCategoriesImplCopyWith(
    _$GetSupportCategoriesImpl value,
    $Res Function(_$GetSupportCategoriesImpl) then,
  ) = __$$GetSupportCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSupportCategoriesImplCopyWithImpl<$Res>
    extends _$SupportCategoryEventCopyWithImpl<$Res, _$GetSupportCategoriesImpl>
    implements _$$GetSupportCategoriesImplCopyWith<$Res> {
  __$$GetSupportCategoriesImplCopyWithImpl(
    _$GetSupportCategoriesImpl _value,
    $Res Function(_$GetSupportCategoriesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportCategoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetSupportCategoriesImpl implements _GetSupportCategories {
  const _$GetSupportCategoriesImpl();

  @override
  String toString() {
    return 'SupportCategoryEvent.getSupportCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSupportCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSupportCategories,
    required TResult Function() refresh,
  }) {
    return getSupportCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSupportCategories,
    TResult? Function()? refresh,
  }) {
    return getSupportCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSupportCategories,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (getSupportCategories != null) {
      return getSupportCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupportCategories value) getSupportCategories,
    required TResult Function(_Refresh value) refresh,
  }) {
    return getSupportCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupportCategories value)? getSupportCategories,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return getSupportCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupportCategories value)? getSupportCategories,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (getSupportCategories != null) {
      return getSupportCategories(this);
    }
    return orElse();
  }
}

abstract class _GetSupportCategories implements SupportCategoryEvent {
  const factory _GetSupportCategories() = _$GetSupportCategoriesImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$SupportCategoryEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportCategoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'SupportCategoryEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSupportCategories,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSupportCategories,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSupportCategories,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupportCategories value) getSupportCategories,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupportCategories value)? getSupportCategories,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupportCategories value)? getSupportCategories,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements SupportCategoryEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
mixin _$SupportCategoryState {
  SupportCategoryStatus get status => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;
  List<SupportCategoryEntity>? get categories =>
      throw _privateConstructorUsedError;

  /// Create a copy of SupportCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportCategoryStateCopyWith<SupportCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportCategoryStateCopyWith<$Res> {
  factory $SupportCategoryStateCopyWith(
    SupportCategoryState value,
    $Res Function(SupportCategoryState) then,
  ) = _$SupportCategoryStateCopyWithImpl<$Res, SupportCategoryState>;
  @useResult
  $Res call({
    SupportCategoryStatus status,
    AppErrorEntity? error,
    List<SupportCategoryEntity>? categories,
  });
}

/// @nodoc
class _$SupportCategoryStateCopyWithImpl<
  $Res,
  $Val extends SupportCategoryState
>
    implements $SupportCategoryStateCopyWith<$Res> {
  _$SupportCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? categories = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as SupportCategoryStatus,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            categories:
                freezed == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<SupportCategoryEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SupportCategoryStateImplCopyWith<$Res>
    implements $SupportCategoryStateCopyWith<$Res> {
  factory _$$SupportCategoryStateImplCopyWith(
    _$SupportCategoryStateImpl value,
    $Res Function(_$SupportCategoryStateImpl) then,
  ) = __$$SupportCategoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SupportCategoryStatus status,
    AppErrorEntity? error,
    List<SupportCategoryEntity>? categories,
  });
}

/// @nodoc
class __$$SupportCategoryStateImplCopyWithImpl<$Res>
    extends _$SupportCategoryStateCopyWithImpl<$Res, _$SupportCategoryStateImpl>
    implements _$$SupportCategoryStateImplCopyWith<$Res> {
  __$$SupportCategoryStateImplCopyWithImpl(
    _$SupportCategoryStateImpl _value,
    $Res Function(_$SupportCategoryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SupportCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? categories = freezed,
  }) {
    return _then(
      _$SupportCategoryStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as SupportCategoryStatus,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        categories:
            freezed == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<SupportCategoryEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$SupportCategoryStateImpl implements _SupportCategoryState {
  const _$SupportCategoryStateImpl({
    this.status = SupportCategoryStatus.initial,
    this.error,
    final List<SupportCategoryEntity>? categories,
  }) : _categories = categories;

  @override
  @JsonKey()
  final SupportCategoryStatus status;
  @override
  final AppErrorEntity? error;
  final List<SupportCategoryEntity>? _categories;
  @override
  List<SupportCategoryEntity>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SupportCategoryState(status: $status, error: $error, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportCategoryStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    const DeepCollectionEquality().hash(_categories),
  );

  /// Create a copy of SupportCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportCategoryStateImplCopyWith<_$SupportCategoryStateImpl>
  get copyWith =>
      __$$SupportCategoryStateImplCopyWithImpl<_$SupportCategoryStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SupportCategoryState implements SupportCategoryState {
  const factory _SupportCategoryState({
    final SupportCategoryStatus status,
    final AppErrorEntity? error,
    final List<SupportCategoryEntity>? categories,
  }) = _$SupportCategoryStateImpl;

  @override
  SupportCategoryStatus get status;
  @override
  AppErrorEntity? get error;
  @override
  List<SupportCategoryEntity>? get categories;

  /// Create a copy of SupportCategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportCategoryStateImplCopyWith<_$SupportCategoryStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
