// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_content_cache_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomeContentCacheWrapper _$HomeContentCacheWrapperFromJson(
  Map<String, dynamic> json,
) {
  return _HomeContentCacheWrapper.fromJson(json);
}

/// @nodoc
mixin _$HomeContentCacheWrapper {
  @HiveField(0)
  HomeContentResponse get homeContent => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  /// Serializes this HomeContentCacheWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeContentCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeContentCacheWrapperCopyWith<HomeContentCacheWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeContentCacheWrapperCopyWith<$Res> {
  factory $HomeContentCacheWrapperCopyWith(
    HomeContentCacheWrapper value,
    $Res Function(HomeContentCacheWrapper) then,
  ) = _$HomeContentCacheWrapperCopyWithImpl<$Res, HomeContentCacheWrapper>;
  @useResult
  $Res call({
    @HiveField(0) HomeContentResponse homeContent,
    @HiveField(1) DateTime cachedAt,
  });

  $HomeContentResponseCopyWith<$Res> get homeContent;
}

/// @nodoc
class _$HomeContentCacheWrapperCopyWithImpl<
  $Res,
  $Val extends HomeContentCacheWrapper
>
    implements $HomeContentCacheWrapperCopyWith<$Res> {
  _$HomeContentCacheWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeContentCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? homeContent = null, Object? cachedAt = null}) {
    return _then(
      _value.copyWith(
            homeContent:
                null == homeContent
                    ? _value.homeContent
                    : homeContent // ignore: cast_nullable_to_non_nullable
                        as HomeContentResponse,
            cachedAt:
                null == cachedAt
                    ? _value.cachedAt
                    : cachedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeContentCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeContentResponseCopyWith<$Res> get homeContent {
    return $HomeContentResponseCopyWith<$Res>(_value.homeContent, (value) {
      return _then(_value.copyWith(homeContent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeContentCacheWrapperImplCopyWith<$Res>
    implements $HomeContentCacheWrapperCopyWith<$Res> {
  factory _$$HomeContentCacheWrapperImplCopyWith(
    _$HomeContentCacheWrapperImpl value,
    $Res Function(_$HomeContentCacheWrapperImpl) then,
  ) = __$$HomeContentCacheWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @HiveField(0) HomeContentResponse homeContent,
    @HiveField(1) DateTime cachedAt,
  });

  @override
  $HomeContentResponseCopyWith<$Res> get homeContent;
}

/// @nodoc
class __$$HomeContentCacheWrapperImplCopyWithImpl<$Res>
    extends
        _$HomeContentCacheWrapperCopyWithImpl<
          $Res,
          _$HomeContentCacheWrapperImpl
        >
    implements _$$HomeContentCacheWrapperImplCopyWith<$Res> {
  __$$HomeContentCacheWrapperImplCopyWithImpl(
    _$HomeContentCacheWrapperImpl _value,
    $Res Function(_$HomeContentCacheWrapperImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeContentCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? homeContent = null, Object? cachedAt = null}) {
    return _then(
      _$HomeContentCacheWrapperImpl(
        homeContent:
            null == homeContent
                ? _value.homeContent
                : homeContent // ignore: cast_nullable_to_non_nullable
                    as HomeContentResponse,
        cachedAt:
            null == cachedAt
                ? _value.cachedAt
                : cachedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeContentCacheWrapperImpl implements _HomeContentCacheWrapper {
  const _$HomeContentCacheWrapperImpl({
    @HiveField(0) required this.homeContent,
    @HiveField(1) required this.cachedAt,
  });

  factory _$HomeContentCacheWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeContentCacheWrapperImplFromJson(json);

  @override
  @HiveField(0)
  final HomeContentResponse homeContent;
  @override
  @HiveField(1)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'HomeContentCacheWrapper(homeContent: $homeContent, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeContentCacheWrapperImpl &&
            (identical(other.homeContent, homeContent) ||
                other.homeContent == homeContent) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, homeContent, cachedAt);

  /// Create a copy of HomeContentCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeContentCacheWrapperImplCopyWith<_$HomeContentCacheWrapperImpl>
  get copyWith => __$$HomeContentCacheWrapperImplCopyWithImpl<
    _$HomeContentCacheWrapperImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeContentCacheWrapperImplToJson(this);
  }
}

abstract class _HomeContentCacheWrapper implements HomeContentCacheWrapper {
  const factory _HomeContentCacheWrapper({
    @HiveField(0) required final HomeContentResponse homeContent,
    @HiveField(1) required final DateTime cachedAt,
  }) = _$HomeContentCacheWrapperImpl;

  factory _HomeContentCacheWrapper.fromJson(Map<String, dynamic> json) =
      _$HomeContentCacheWrapperImpl.fromJson;

  @override
  @HiveField(0)
  HomeContentResponse get homeContent;
  @override
  @HiveField(1)
  DateTime get cachedAt;

  /// Create a copy of HomeContentCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeContentCacheWrapperImplCopyWith<_$HomeContentCacheWrapperImpl>
  get copyWith => throw _privateConstructorUsedError;
}
