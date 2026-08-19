// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_cache_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfileCacheWrapper _$UserProfileCacheWrapperFromJson(
  Map<String, dynamic> json,
) {
  return _UserProfileCacheWrapper.fromJson(json);
}

/// @nodoc
mixin _$UserProfileCacheWrapper {
  @HiveField(0)
  UserResponse get user => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get cachedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfileCacheWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCacheWrapperCopyWith<UserProfileCacheWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCacheWrapperCopyWith<$Res> {
  factory $UserProfileCacheWrapperCopyWith(
    UserProfileCacheWrapper value,
    $Res Function(UserProfileCacheWrapper) then,
  ) = _$UserProfileCacheWrapperCopyWithImpl<$Res, UserProfileCacheWrapper>;
  @useResult
  $Res call({@HiveField(0) UserResponse user, @HiveField(1) DateTime cachedAt});

  $UserResponseCopyWith<$Res> get user;
}

/// @nodoc
class _$UserProfileCacheWrapperCopyWithImpl<
  $Res,
  $Val extends UserProfileCacheWrapper
>
    implements $UserProfileCacheWrapperCopyWith<$Res> {
  _$UserProfileCacheWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? cachedAt = null}) {
    return _then(
      _value.copyWith(
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserResponse,
            cachedAt:
                null == cachedAt
                    ? _value.cachedAt
                    : cachedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of UserProfileCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res> get user {
    return $UserResponseCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileCacheWrapperImplCopyWith<$Res>
    implements $UserProfileCacheWrapperCopyWith<$Res> {
  factory _$$UserProfileCacheWrapperImplCopyWith(
    _$UserProfileCacheWrapperImpl value,
    $Res Function(_$UserProfileCacheWrapperImpl) then,
  ) = __$$UserProfileCacheWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) UserResponse user, @HiveField(1) DateTime cachedAt});

  @override
  $UserResponseCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserProfileCacheWrapperImplCopyWithImpl<$Res>
    extends
        _$UserProfileCacheWrapperCopyWithImpl<
          $Res,
          _$UserProfileCacheWrapperImpl
        >
    implements _$$UserProfileCacheWrapperImplCopyWith<$Res> {
  __$$UserProfileCacheWrapperImplCopyWithImpl(
    _$UserProfileCacheWrapperImpl _value,
    $Res Function(_$UserProfileCacheWrapperImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfileCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? cachedAt = null}) {
    return _then(
      _$UserProfileCacheWrapperImpl(
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserResponse,
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
class _$UserProfileCacheWrapperImpl implements _UserProfileCacheWrapper {
  const _$UserProfileCacheWrapperImpl({
    @HiveField(0) required this.user,
    @HiveField(1) required this.cachedAt,
  });

  factory _$UserProfileCacheWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileCacheWrapperImplFromJson(json);

  @override
  @HiveField(0)
  final UserResponse user;
  @override
  @HiveField(1)
  final DateTime cachedAt;

  @override
  String toString() {
    return 'UserProfileCacheWrapper(user: $user, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileCacheWrapperImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, cachedAt);

  /// Create a copy of UserProfileCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileCacheWrapperImplCopyWith<_$UserProfileCacheWrapperImpl>
  get copyWith => __$$UserProfileCacheWrapperImplCopyWithImpl<
    _$UserProfileCacheWrapperImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileCacheWrapperImplToJson(this);
  }
}

abstract class _UserProfileCacheWrapper implements UserProfileCacheWrapper {
  const factory _UserProfileCacheWrapper({
    @HiveField(0) required final UserResponse user,
    @HiveField(1) required final DateTime cachedAt,
  }) = _$UserProfileCacheWrapperImpl;

  factory _UserProfileCacheWrapper.fromJson(Map<String, dynamic> json) =
      _$UserProfileCacheWrapperImpl.fromJson;

  @override
  @HiveField(0)
  UserResponse get user;
  @override
  @HiveField(1)
  DateTime get cachedAt;

  /// Create a copy of UserProfileCacheWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileCacheWrapperImplCopyWith<_$UserProfileCacheWrapperImpl>
  get copyWith => throw _privateConstructorUsedError;
}
