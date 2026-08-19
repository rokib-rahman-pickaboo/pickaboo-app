// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_bin_remove_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CardBinRemoveEntity {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get previousCoupon => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;

  /// Create a copy of CardBinRemoveEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardBinRemoveEntityCopyWith<CardBinRemoveEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardBinRemoveEntityCopyWith<$Res> {
  factory $CardBinRemoveEntityCopyWith(
    CardBinRemoveEntity value,
    $Res Function(CardBinRemoveEntity) then,
  ) = _$CardBinRemoveEntityCopyWithImpl<$Res, CardBinRemoveEntity>;
  @useResult
  $Res call({
    bool success,
    String message,
    String previousCoupon,
    int statusCode,
  });
}

/// @nodoc
class _$CardBinRemoveEntityCopyWithImpl<$Res, $Val extends CardBinRemoveEntity>
    implements $CardBinRemoveEntityCopyWith<$Res> {
  _$CardBinRemoveEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardBinRemoveEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? previousCoupon = null,
    Object? statusCode = null,
  }) {
    return _then(
      _value.copyWith(
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            previousCoupon:
                null == previousCoupon
                    ? _value.previousCoupon
                    : previousCoupon // ignore: cast_nullable_to_non_nullable
                        as String,
            statusCode:
                null == statusCode
                    ? _value.statusCode
                    : statusCode // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CardBinRemoveEntityImplCopyWith<$Res>
    implements $CardBinRemoveEntityCopyWith<$Res> {
  factory _$$CardBinRemoveEntityImplCopyWith(
    _$CardBinRemoveEntityImpl value,
    $Res Function(_$CardBinRemoveEntityImpl) then,
  ) = __$$CardBinRemoveEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    String previousCoupon,
    int statusCode,
  });
}

/// @nodoc
class __$$CardBinRemoveEntityImplCopyWithImpl<$Res>
    extends _$CardBinRemoveEntityCopyWithImpl<$Res, _$CardBinRemoveEntityImpl>
    implements _$$CardBinRemoveEntityImplCopyWith<$Res> {
  __$$CardBinRemoveEntityImplCopyWithImpl(
    _$CardBinRemoveEntityImpl _value,
    $Res Function(_$CardBinRemoveEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardBinRemoveEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? previousCoupon = null,
    Object? statusCode = null,
  }) {
    return _then(
      _$CardBinRemoveEntityImpl(
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        previousCoupon:
            null == previousCoupon
                ? _value.previousCoupon
                : previousCoupon // ignore: cast_nullable_to_non_nullable
                    as String,
        statusCode:
            null == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$CardBinRemoveEntityImpl implements _CardBinRemoveEntity {
  const _$CardBinRemoveEntityImpl({
    required this.success,
    required this.message,
    required this.previousCoupon,
    required this.statusCode,
  });

  @override
  final bool success;
  @override
  final String message;
  @override
  final String previousCoupon;
  @override
  final int statusCode;

  @override
  String toString() {
    return 'CardBinRemoveEntity(success: $success, message: $message, previousCoupon: $previousCoupon, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardBinRemoveEntityImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.previousCoupon, previousCoupon) ||
                other.previousCoupon == previousCoupon) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, previousCoupon, statusCode);

  /// Create a copy of CardBinRemoveEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardBinRemoveEntityImplCopyWith<_$CardBinRemoveEntityImpl> get copyWith =>
      __$$CardBinRemoveEntityImplCopyWithImpl<_$CardBinRemoveEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _CardBinRemoveEntity implements CardBinRemoveEntity {
  const factory _CardBinRemoveEntity({
    required final bool success,
    required final String message,
    required final String previousCoupon,
    required final int statusCode,
  }) = _$CardBinRemoveEntityImpl;

  @override
  bool get success;
  @override
  String get message;
  @override
  String get previousCoupon;
  @override
  int get statusCode;

  /// Create a copy of CardBinRemoveEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardBinRemoveEntityImplCopyWith<_$CardBinRemoveEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
