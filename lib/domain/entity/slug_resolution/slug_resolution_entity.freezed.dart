// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slug_resolution_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SlugResolutionEntity {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Create a copy of SlugResolutionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlugResolutionEntityCopyWith<SlugResolutionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlugResolutionEntityCopyWith<$Res> {
  factory $SlugResolutionEntityCopyWith(
    SlugResolutionEntity value,
    $Res Function(SlugResolutionEntity) then,
  ) = _$SlugResolutionEntityCopyWithImpl<$Res, SlugResolutionEntity>;
  @useResult
  $Res call({String id, String type});
}

/// @nodoc
class _$SlugResolutionEntityCopyWithImpl<
  $Res,
  $Val extends SlugResolutionEntity
>
    implements $SlugResolutionEntityCopyWith<$Res> {
  _$SlugResolutionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SlugResolutionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? type = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SlugResolutionEntityImplCopyWith<$Res>
    implements $SlugResolutionEntityCopyWith<$Res> {
  factory _$$SlugResolutionEntityImplCopyWith(
    _$SlugResolutionEntityImpl value,
    $Res Function(_$SlugResolutionEntityImpl) then,
  ) = __$$SlugResolutionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String type});
}

/// @nodoc
class __$$SlugResolutionEntityImplCopyWithImpl<$Res>
    extends _$SlugResolutionEntityCopyWithImpl<$Res, _$SlugResolutionEntityImpl>
    implements _$$SlugResolutionEntityImplCopyWith<$Res> {
  __$$SlugResolutionEntityImplCopyWithImpl(
    _$SlugResolutionEntityImpl _value,
    $Res Function(_$SlugResolutionEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SlugResolutionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? type = null}) {
    return _then(
      _$SlugResolutionEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$SlugResolutionEntityImpl implements _SlugResolutionEntity {
  const _$SlugResolutionEntityImpl({required this.id, required this.type});

  @override
  final String id;
  @override
  final String type;

  @override
  String toString() {
    return 'SlugResolutionEntity(id: $id, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlugResolutionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  /// Create a copy of SlugResolutionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlugResolutionEntityImplCopyWith<_$SlugResolutionEntityImpl>
  get copyWith =>
      __$$SlugResolutionEntityImplCopyWithImpl<_$SlugResolutionEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _SlugResolutionEntity implements SlugResolutionEntity {
  const factory _SlugResolutionEntity({
    required final String id,
    required final String type,
  }) = _$SlugResolutionEntityImpl;

  @override
  String get id;
  @override
  String get type;

  /// Create a copy of SlugResolutionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlugResolutionEntityImplCopyWith<_$SlugResolutionEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
