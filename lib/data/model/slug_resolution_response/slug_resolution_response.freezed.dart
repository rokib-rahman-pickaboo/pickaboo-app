// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slug_resolution_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SlugResolutionResponse _$SlugResolutionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _SlugResolutionResponse.fromJson(json);
}

/// @nodoc
mixin _$SlugResolutionResponse {
  @JsonKey(name: 'prodId')
  String? get prodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'exec_time')
  String? get execTime => throw _privateConstructorUsedError;

  /// Serializes this SlugResolutionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SlugResolutionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlugResolutionResponseCopyWith<SlugResolutionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlugResolutionResponseCopyWith<$Res> {
  factory $SlugResolutionResponseCopyWith(
    SlugResolutionResponse value,
    $Res Function(SlugResolutionResponse) then,
  ) = _$SlugResolutionResponseCopyWithImpl<$Res, SlugResolutionResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'prodId') String? prodId,
    @JsonKey(name: 'exec_time') String? execTime,
  });
}

/// @nodoc
class _$SlugResolutionResponseCopyWithImpl<
  $Res,
  $Val extends SlugResolutionResponse
>
    implements $SlugResolutionResponseCopyWith<$Res> {
  _$SlugResolutionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SlugResolutionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? prodId = freezed, Object? execTime = freezed}) {
    return _then(
      _value.copyWith(
            prodId:
                freezed == prodId
                    ? _value.prodId
                    : prodId // ignore: cast_nullable_to_non_nullable
                        as String?,
            execTime:
                freezed == execTime
                    ? _value.execTime
                    : execTime // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SlugResolutionResponseImplCopyWith<$Res>
    implements $SlugResolutionResponseCopyWith<$Res> {
  factory _$$SlugResolutionResponseImplCopyWith(
    _$SlugResolutionResponseImpl value,
    $Res Function(_$SlugResolutionResponseImpl) then,
  ) = __$$SlugResolutionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'prodId') String? prodId,
    @JsonKey(name: 'exec_time') String? execTime,
  });
}

/// @nodoc
class __$$SlugResolutionResponseImplCopyWithImpl<$Res>
    extends
        _$SlugResolutionResponseCopyWithImpl<$Res, _$SlugResolutionResponseImpl>
    implements _$$SlugResolutionResponseImplCopyWith<$Res> {
  __$$SlugResolutionResponseImplCopyWithImpl(
    _$SlugResolutionResponseImpl _value,
    $Res Function(_$SlugResolutionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SlugResolutionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? prodId = freezed, Object? execTime = freezed}) {
    return _then(
      _$SlugResolutionResponseImpl(
        prodId:
            freezed == prodId
                ? _value.prodId
                : prodId // ignore: cast_nullable_to_non_nullable
                    as String?,
        execTime:
            freezed == execTime
                ? _value.execTime
                : execTime // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SlugResolutionResponseImpl implements _SlugResolutionResponse {
  const _$SlugResolutionResponseImpl({
    @JsonKey(name: 'prodId') this.prodId,
    @JsonKey(name: 'exec_time') this.execTime,
  });

  factory _$SlugResolutionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlugResolutionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'prodId')
  final String? prodId;
  @override
  @JsonKey(name: 'exec_time')
  final String? execTime;

  @override
  String toString() {
    return 'SlugResolutionResponse(prodId: $prodId, execTime: $execTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlugResolutionResponseImpl &&
            (identical(other.prodId, prodId) || other.prodId == prodId) &&
            (identical(other.execTime, execTime) ||
                other.execTime == execTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prodId, execTime);

  /// Create a copy of SlugResolutionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlugResolutionResponseImplCopyWith<_$SlugResolutionResponseImpl>
  get copyWith =>
      __$$SlugResolutionResponseImplCopyWithImpl<_$SlugResolutionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SlugResolutionResponseImplToJson(this);
  }
}

abstract class _SlugResolutionResponse implements SlugResolutionResponse {
  const factory _SlugResolutionResponse({
    @JsonKey(name: 'prodId') final String? prodId,
    @JsonKey(name: 'exec_time') final String? execTime,
  }) = _$SlugResolutionResponseImpl;

  factory _SlugResolutionResponse.fromJson(Map<String, dynamic> json) =
      _$SlugResolutionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'prodId')
  String? get prodId;
  @override
  @JsonKey(name: 'exec_time')
  String? get execTime;

  /// Create a copy of SlugResolutionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlugResolutionResponseImplCopyWith<_$SlugResolutionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
