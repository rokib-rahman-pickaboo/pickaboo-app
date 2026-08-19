// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_point_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ClubPointEvent {
  int get limit => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int page) getClubPoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int page)? getClubPoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int page)? getClubPoints,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClubPoints value) getClubPoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClubPoints value)? getClubPoints,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClubPoints value)? getClubPoints,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ClubPointEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubPointEventCopyWith<ClubPointEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubPointEventCopyWith<$Res> {
  factory $ClubPointEventCopyWith(
    ClubPointEvent value,
    $Res Function(ClubPointEvent) then,
  ) = _$ClubPointEventCopyWithImpl<$Res, ClubPointEvent>;
  @useResult
  $Res call({int limit, int page});
}

/// @nodoc
class _$ClubPointEventCopyWithImpl<$Res, $Val extends ClubPointEvent>
    implements $ClubPointEventCopyWith<$Res> {
  _$ClubPointEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClubPointEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? limit = null, Object? page = null}) {
    return _then(
      _value.copyWith(
            limit:
                null == limit
                    ? _value.limit
                    : limit // ignore: cast_nullable_to_non_nullable
                        as int,
            page:
                null == page
                    ? _value.page
                    : page // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetClubPointsImplCopyWith<$Res>
    implements $ClubPointEventCopyWith<$Res> {
  factory _$$GetClubPointsImplCopyWith(
    _$GetClubPointsImpl value,
    $Res Function(_$GetClubPointsImpl) then,
  ) = __$$GetClubPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int page});
}

/// @nodoc
class __$$GetClubPointsImplCopyWithImpl<$Res>
    extends _$ClubPointEventCopyWithImpl<$Res, _$GetClubPointsImpl>
    implements _$$GetClubPointsImplCopyWith<$Res> {
  __$$GetClubPointsImplCopyWithImpl(
    _$GetClubPointsImpl _value,
    $Res Function(_$GetClubPointsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClubPointEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? limit = null, Object? page = null}) {
    return _then(
      _$GetClubPointsImpl(
        limit:
            null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                    as int,
        page:
            null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$GetClubPointsImpl implements _GetClubPoints {
  const _$GetClubPointsImpl({this.limit = 5, this.page = 1});

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'ClubPointEvent.getClubPoints(limit: $limit, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetClubPointsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, page);

  /// Create a copy of ClubPointEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetClubPointsImplCopyWith<_$GetClubPointsImpl> get copyWith =>
      __$$GetClubPointsImplCopyWithImpl<_$GetClubPointsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int page) getClubPoints,
  }) {
    return getClubPoints(limit, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int page)? getClubPoints,
  }) {
    return getClubPoints?.call(limit, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int page)? getClubPoints,
    required TResult orElse(),
  }) {
    if (getClubPoints != null) {
      return getClubPoints(limit, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClubPoints value) getClubPoints,
  }) {
    return getClubPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClubPoints value)? getClubPoints,
  }) {
    return getClubPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClubPoints value)? getClubPoints,
    required TResult orElse(),
  }) {
    if (getClubPoints != null) {
      return getClubPoints(this);
    }
    return orElse();
  }
}

abstract class _GetClubPoints implements ClubPointEvent {
  const factory _GetClubPoints({final int limit, final int page}) =
      _$GetClubPointsImpl;

  @override
  int get limit;
  @override
  int get page;

  /// Create a copy of ClubPointEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetClubPointsImplCopyWith<_$GetClubPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
