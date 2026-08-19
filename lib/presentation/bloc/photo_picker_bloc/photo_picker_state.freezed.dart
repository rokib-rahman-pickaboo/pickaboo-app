// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PhotoPickerState _$PhotoPickerStateFromJson(Map<String, dynamic> json) {
  return _PhotoPickerState.fromJson(json);
}

/// @nodoc
mixin _$PhotoPickerState {
  PhotoPickerStatus get status => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<XFile>? get images => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this PhotoPickerState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotoPickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoPickerStateCopyWith<PhotoPickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoPickerStateCopyWith<$Res> {
  factory $PhotoPickerStateCopyWith(
    PhotoPickerState value,
    $Res Function(PhotoPickerState) then,
  ) = _$PhotoPickerStateCopyWithImpl<$Res, PhotoPickerState>;
  @useResult
  $Res call({
    PhotoPickerStatus status,
    @JsonKey(includeFromJson: false, includeToJson: false) List<XFile>? images,
    String? errorMessage,
  });
}

/// @nodoc
class _$PhotoPickerStateCopyWithImpl<$Res, $Val extends PhotoPickerState>
    implements $PhotoPickerStateCopyWith<$Res> {
  _$PhotoPickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoPickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? images = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as PhotoPickerStatus,
            images:
                freezed == images
                    ? _value.images
                    : images // ignore: cast_nullable_to_non_nullable
                        as List<XFile>?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PhotoPickerStateImplCopyWith<$Res>
    implements $PhotoPickerStateCopyWith<$Res> {
  factory _$$PhotoPickerStateImplCopyWith(
    _$PhotoPickerStateImpl value,
    $Res Function(_$PhotoPickerStateImpl) then,
  ) = __$$PhotoPickerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PhotoPickerStatus status,
    @JsonKey(includeFromJson: false, includeToJson: false) List<XFile>? images,
    String? errorMessage,
  });
}

/// @nodoc
class __$$PhotoPickerStateImplCopyWithImpl<$Res>
    extends _$PhotoPickerStateCopyWithImpl<$Res, _$PhotoPickerStateImpl>
    implements _$$PhotoPickerStateImplCopyWith<$Res> {
  __$$PhotoPickerStateImplCopyWithImpl(
    _$PhotoPickerStateImpl _value,
    $Res Function(_$PhotoPickerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhotoPickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? images = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$PhotoPickerStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as PhotoPickerStatus,
        images:
            freezed == images
                ? _value._images
                : images // ignore: cast_nullable_to_non_nullable
                    as List<XFile>?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoPickerStateImpl implements _PhotoPickerState {
  const _$PhotoPickerStateImpl({
    this.status = PhotoPickerStatus.initial,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<XFile>? images,
    this.errorMessage,
  }) : _images = images;

  factory _$PhotoPickerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoPickerStateImplFromJson(json);

  @override
  @JsonKey()
  final PhotoPickerStatus status;
  final List<XFile>? _images;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<XFile>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PhotoPickerState(status: $status, images: $images, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoPickerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_images),
    errorMessage,
  );

  /// Create a copy of PhotoPickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoPickerStateImplCopyWith<_$PhotoPickerStateImpl> get copyWith =>
      __$$PhotoPickerStateImplCopyWithImpl<_$PhotoPickerStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoPickerStateImplToJson(this);
  }
}

abstract class _PhotoPickerState implements PhotoPickerState {
  const factory _PhotoPickerState({
    final PhotoPickerStatus status,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final List<XFile>? images,
    final String? errorMessage,
  }) = _$PhotoPickerStateImpl;

  factory _PhotoPickerState.fromJson(Map<String, dynamic> json) =
      _$PhotoPickerStateImpl.fromJson;

  @override
  PhotoPickerStatus get status;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<XFile>? get images;
  @override
  String? get errorMessage;

  /// Create a copy of PhotoPickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoPickerStateImplCopyWith<_$PhotoPickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
