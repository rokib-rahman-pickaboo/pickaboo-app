// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AutocompleteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String q, bool subArea, bool subDistrict) fetch,
    required TResult Function() clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String q, bool subArea, bool subDistrict)? fetch,
    TResult? Function()? clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String q, bool subArea, bool subDistrict)? fetch,
    TResult Function()? clear,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Clear value) clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Clear value)? clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteEventCopyWith<$Res> {
  factory $AutocompleteEventCopyWith(
    AutocompleteEvent value,
    $Res Function(AutocompleteEvent) then,
  ) = _$AutocompleteEventCopyWithImpl<$Res, AutocompleteEvent>;
}

/// @nodoc
class _$AutocompleteEventCopyWithImpl<$Res, $Val extends AutocompleteEvent>
    implements $AutocompleteEventCopyWith<$Res> {
  _$AutocompleteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutocompleteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String q, bool subArea, bool subDistrict});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$AutocompleteEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompleteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? subArea = null,
    Object? subDistrict = null,
  }) {
    return _then(
      _$FetchImpl(
        q:
            null == q
                ? _value.q
                : q // ignore: cast_nullable_to_non_nullable
                    as String,
        subArea:
            null == subArea
                ? _value.subArea
                : subArea // ignore: cast_nullable_to_non_nullable
                    as bool,
        subDistrict:
            null == subDistrict
                ? _value.subDistrict
                : subDistrict // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({
    required this.q,
    this.subArea = true,
    this.subDistrict = true,
  });

  @override
  final String q;
  @override
  @JsonKey()
  final bool subArea;
  @override
  @JsonKey()
  final bool subDistrict;

  @override
  String toString() {
    return 'AutocompleteEvent.fetch(q: $q, subArea: $subArea, subDistrict: $subDistrict)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.subArea, subArea) || other.subArea == subArea) &&
            (identical(other.subDistrict, subDistrict) ||
                other.subDistrict == subDistrict));
  }

  @override
  int get hashCode => Object.hash(runtimeType, q, subArea, subDistrict);

  /// Create a copy of AutocompleteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String q, bool subArea, bool subDistrict) fetch,
    required TResult Function() clear,
  }) {
    return fetch(q, subArea, subDistrict);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String q, bool subArea, bool subDistrict)? fetch,
    TResult? Function()? clear,
  }) {
    return fetch?.call(q, subArea, subDistrict);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String q, bool subArea, bool subDistrict)? fetch,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(q, subArea, subDistrict);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Clear value) clear,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Clear value)? clear,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AutocompleteEvent {
  const factory _Fetch({
    required final String q,
    final bool subArea,
    final bool subDistrict,
  }) = _$FetchImpl;

  String get q;
  bool get subArea;
  bool get subDistrict;

  /// Create a copy of AutocompleteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
    _$ClearImpl value,
    $Res Function(_$ClearImpl) then,
  ) = __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$AutocompleteEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
    _$ClearImpl _value,
    $Res Function(_$ClearImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompleteEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'AutocompleteEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String q, bool subArea, bool subDistrict) fetch,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String q, bool subArea, bool subDistrict)? fetch,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String q, bool subArea, bool subDistrict)? fetch,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements AutocompleteEvent {
  const factory _Clear() = _$ClearImpl;
}

/// @nodoc
mixin _$AutocompleteState {
  AutocompleteStatus get status => throw _privateConstructorUsedError;
  List<PlacePickResultEntity> get suggestions =>
      throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;

  /// Create a copy of AutocompleteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AutocompleteStateCopyWith<AutocompleteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompleteStateCopyWith<$Res> {
  factory $AutocompleteStateCopyWith(
    AutocompleteState value,
    $Res Function(AutocompleteState) then,
  ) = _$AutocompleteStateCopyWithImpl<$Res, AutocompleteState>;
  @useResult
  $Res call({
    AutocompleteStatus status,
    List<PlacePickResultEntity> suggestions,
    AppErrorEntity? error,
  });
}

/// @nodoc
class _$AutocompleteStateCopyWithImpl<$Res, $Val extends AutocompleteState>
    implements $AutocompleteStateCopyWith<$Res> {
  _$AutocompleteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AutocompleteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? suggestions = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as AutocompleteStatus,
            suggestions:
                null == suggestions
                    ? _value.suggestions
                    : suggestions // ignore: cast_nullable_to_non_nullable
                        as List<PlacePickResultEntity>,
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
abstract class _$$AutocompleteStateImplCopyWith<$Res>
    implements $AutocompleteStateCopyWith<$Res> {
  factory _$$AutocompleteStateImplCopyWith(
    _$AutocompleteStateImpl value,
    $Res Function(_$AutocompleteStateImpl) then,
  ) = __$$AutocompleteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AutocompleteStatus status,
    List<PlacePickResultEntity> suggestions,
    AppErrorEntity? error,
  });
}

/// @nodoc
class __$$AutocompleteStateImplCopyWithImpl<$Res>
    extends _$AutocompleteStateCopyWithImpl<$Res, _$AutocompleteStateImpl>
    implements _$$AutocompleteStateImplCopyWith<$Res> {
  __$$AutocompleteStateImplCopyWithImpl(
    _$AutocompleteStateImpl _value,
    $Res Function(_$AutocompleteStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AutocompleteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? suggestions = null,
    Object? error = freezed,
  }) {
    return _then(
      _$AutocompleteStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as AutocompleteStatus,
        suggestions:
            null == suggestions
                ? _value._suggestions
                : suggestions // ignore: cast_nullable_to_non_nullable
                    as List<PlacePickResultEntity>,
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

class _$AutocompleteStateImpl implements _AutocompleteState {
  const _$AutocompleteStateImpl({
    this.status = AutocompleteStatus.initial,
    final List<PlacePickResultEntity> suggestions = const [],
    this.error,
  }) : _suggestions = suggestions;

  @override
  @JsonKey()
  final AutocompleteStatus status;
  final List<PlacePickResultEntity> _suggestions;
  @override
  @JsonKey()
  List<PlacePickResultEntity> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  final AppErrorEntity? error;

  @override
  String toString() {
    return 'AutocompleteState(status: $status, suggestions: $suggestions, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompleteStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._suggestions,
              _suggestions,
            ) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_suggestions),
    error,
  );

  /// Create a copy of AutocompleteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompleteStateImplCopyWith<_$AutocompleteStateImpl> get copyWith =>
      __$$AutocompleteStateImplCopyWithImpl<_$AutocompleteStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AutocompleteState implements AutocompleteState {
  const factory _AutocompleteState({
    final AutocompleteStatus status,
    final List<PlacePickResultEntity> suggestions,
    final AppErrorEntity? error,
  }) = _$AutocompleteStateImpl;

  @override
  AutocompleteStatus get status;
  @override
  List<PlacePickResultEntity> get suggestions;
  @override
  AppErrorEntity? get error;

  /// Create a copy of AutocompleteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutocompleteStateImplCopyWith<_$AutocompleteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
