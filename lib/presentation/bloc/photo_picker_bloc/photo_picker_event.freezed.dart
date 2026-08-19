// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_picker_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PhotoPickerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromCamera,
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromGallery,
    required TResult Function() clear,
    required TResult Function(int index) removeImageAtIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult? Function()? clear,
    TResult? Function(int index)? removeImageAtIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult Function()? clear,
    TResult Function(int index)? removeImageAtIndex,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickFromCamera value) pickFromCamera,
    required TResult Function(PickFromGallery value) pickFromGallery,
    required TResult Function(Clear value) clear,
    required TResult Function(RemoveImageAtIndex value) removeImageAtIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickFromCamera value)? pickFromCamera,
    TResult? Function(PickFromGallery value)? pickFromGallery,
    TResult? Function(Clear value)? clear,
    TResult? Function(RemoveImageAtIndex value)? removeImageAtIndex,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickFromCamera value)? pickFromCamera,
    TResult Function(PickFromGallery value)? pickFromGallery,
    TResult Function(Clear value)? clear,
    TResult Function(RemoveImageAtIndex value)? removeImageAtIndex,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoPickerEventCopyWith<$Res> {
  factory $PhotoPickerEventCopyWith(
    PhotoPickerEvent value,
    $Res Function(PhotoPickerEvent) then,
  ) = _$PhotoPickerEventCopyWithImpl<$Res, PhotoPickerEvent>;
}

/// @nodoc
class _$PhotoPickerEventCopyWithImpl<$Res, $Val extends PhotoPickerEvent>
    implements $PhotoPickerEventCopyWith<$Res> {
  _$PhotoPickerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PickFromCameraImplCopyWith<$Res> {
  factory _$$PickFromCameraImplCopyWith(
    _$PickFromCameraImpl value,
    $Res Function(_$PickFromCameraImpl) then,
  ) = __$$PickFromCameraImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? imageQuality, double? maxWidth, double? maxHeight});
}

/// @nodoc
class __$$PickFromCameraImplCopyWithImpl<$Res>
    extends _$PhotoPickerEventCopyWithImpl<$Res, _$PickFromCameraImpl>
    implements _$$PickFromCameraImplCopyWith<$Res> {
  __$$PickFromCameraImplCopyWithImpl(
    _$PickFromCameraImpl _value,
    $Res Function(_$PickFromCameraImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageQuality = freezed,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
  }) {
    return _then(
      _$PickFromCameraImpl(
        imageQuality:
            freezed == imageQuality
                ? _value.imageQuality
                : imageQuality // ignore: cast_nullable_to_non_nullable
                    as int?,
        maxWidth:
            freezed == maxWidth
                ? _value.maxWidth
                : maxWidth // ignore: cast_nullable_to_non_nullable
                    as double?,
        maxHeight:
            freezed == maxHeight
                ? _value.maxHeight
                : maxHeight // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc

class _$PickFromCameraImpl implements PickFromCamera {
  const _$PickFromCameraImpl({
    this.imageQuality,
    this.maxWidth,
    this.maxHeight,
  });

  @override
  final int? imageQuality;
  @override
  final double? maxWidth;
  @override
  final double? maxHeight;

  @override
  String toString() {
    return 'PhotoPickerEvent.pickFromCamera(imageQuality: $imageQuality, maxWidth: $maxWidth, maxHeight: $maxHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickFromCameraImpl &&
            (identical(other.imageQuality, imageQuality) ||
                other.imageQuality == imageQuality) &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, imageQuality, maxWidth, maxHeight);

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickFromCameraImplCopyWith<_$PickFromCameraImpl> get copyWith =>
      __$$PickFromCameraImplCopyWithImpl<_$PickFromCameraImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromCamera,
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromGallery,
    required TResult Function() clear,
    required TResult Function(int index) removeImageAtIndex,
  }) {
    return pickFromCamera(imageQuality, maxWidth, maxHeight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult? Function()? clear,
    TResult? Function(int index)? removeImageAtIndex,
  }) {
    return pickFromCamera?.call(imageQuality, maxWidth, maxHeight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult Function()? clear,
    TResult Function(int index)? removeImageAtIndex,
    required TResult orElse(),
  }) {
    if (pickFromCamera != null) {
      return pickFromCamera(imageQuality, maxWidth, maxHeight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickFromCamera value) pickFromCamera,
    required TResult Function(PickFromGallery value) pickFromGallery,
    required TResult Function(Clear value) clear,
    required TResult Function(RemoveImageAtIndex value) removeImageAtIndex,
  }) {
    return pickFromCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickFromCamera value)? pickFromCamera,
    TResult? Function(PickFromGallery value)? pickFromGallery,
    TResult? Function(Clear value)? clear,
    TResult? Function(RemoveImageAtIndex value)? removeImageAtIndex,
  }) {
    return pickFromCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickFromCamera value)? pickFromCamera,
    TResult Function(PickFromGallery value)? pickFromGallery,
    TResult Function(Clear value)? clear,
    TResult Function(RemoveImageAtIndex value)? removeImageAtIndex,
    required TResult orElse(),
  }) {
    if (pickFromCamera != null) {
      return pickFromCamera(this);
    }
    return orElse();
  }
}

abstract class PickFromCamera implements PhotoPickerEvent {
  const factory PickFromCamera({
    final int? imageQuality,
    final double? maxWidth,
    final double? maxHeight,
  }) = _$PickFromCameraImpl;

  int? get imageQuality;
  double? get maxWidth;
  double? get maxHeight;

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickFromCameraImplCopyWith<_$PickFromCameraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PickFromGalleryImplCopyWith<$Res> {
  factory _$$PickFromGalleryImplCopyWith(
    _$PickFromGalleryImpl value,
    $Res Function(_$PickFromGalleryImpl) then,
  ) = __$$PickFromGalleryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? imageQuality, double? maxWidth, double? maxHeight});
}

/// @nodoc
class __$$PickFromGalleryImplCopyWithImpl<$Res>
    extends _$PhotoPickerEventCopyWithImpl<$Res, _$PickFromGalleryImpl>
    implements _$$PickFromGalleryImplCopyWith<$Res> {
  __$$PickFromGalleryImplCopyWithImpl(
    _$PickFromGalleryImpl _value,
    $Res Function(_$PickFromGalleryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageQuality = freezed,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
  }) {
    return _then(
      _$PickFromGalleryImpl(
        imageQuality:
            freezed == imageQuality
                ? _value.imageQuality
                : imageQuality // ignore: cast_nullable_to_non_nullable
                    as int?,
        maxWidth:
            freezed == maxWidth
                ? _value.maxWidth
                : maxWidth // ignore: cast_nullable_to_non_nullable
                    as double?,
        maxHeight:
            freezed == maxHeight
                ? _value.maxHeight
                : maxHeight // ignore: cast_nullable_to_non_nullable
                    as double?,
      ),
    );
  }
}

/// @nodoc

class _$PickFromGalleryImpl implements PickFromGallery {
  const _$PickFromGalleryImpl({
    this.imageQuality,
    this.maxWidth,
    this.maxHeight,
  });

  @override
  final int? imageQuality;
  @override
  final double? maxWidth;
  @override
  final double? maxHeight;

  @override
  String toString() {
    return 'PhotoPickerEvent.pickFromGallery(imageQuality: $imageQuality, maxWidth: $maxWidth, maxHeight: $maxHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickFromGalleryImpl &&
            (identical(other.imageQuality, imageQuality) ||
                other.imageQuality == imageQuality) &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, imageQuality, maxWidth, maxHeight);

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickFromGalleryImplCopyWith<_$PickFromGalleryImpl> get copyWith =>
      __$$PickFromGalleryImplCopyWithImpl<_$PickFromGalleryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromCamera,
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromGallery,
    required TResult Function() clear,
    required TResult Function(int index) removeImageAtIndex,
  }) {
    return pickFromGallery(imageQuality, maxWidth, maxHeight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult? Function()? clear,
    TResult? Function(int index)? removeImageAtIndex,
  }) {
    return pickFromGallery?.call(imageQuality, maxWidth, maxHeight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult Function()? clear,
    TResult Function(int index)? removeImageAtIndex,
    required TResult orElse(),
  }) {
    if (pickFromGallery != null) {
      return pickFromGallery(imageQuality, maxWidth, maxHeight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickFromCamera value) pickFromCamera,
    required TResult Function(PickFromGallery value) pickFromGallery,
    required TResult Function(Clear value) clear,
    required TResult Function(RemoveImageAtIndex value) removeImageAtIndex,
  }) {
    return pickFromGallery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickFromCamera value)? pickFromCamera,
    TResult? Function(PickFromGallery value)? pickFromGallery,
    TResult? Function(Clear value)? clear,
    TResult? Function(RemoveImageAtIndex value)? removeImageAtIndex,
  }) {
    return pickFromGallery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickFromCamera value)? pickFromCamera,
    TResult Function(PickFromGallery value)? pickFromGallery,
    TResult Function(Clear value)? clear,
    TResult Function(RemoveImageAtIndex value)? removeImageAtIndex,
    required TResult orElse(),
  }) {
    if (pickFromGallery != null) {
      return pickFromGallery(this);
    }
    return orElse();
  }
}

abstract class PickFromGallery implements PhotoPickerEvent {
  const factory PickFromGallery({
    final int? imageQuality,
    final double? maxWidth,
    final double? maxHeight,
  }) = _$PickFromGalleryImpl;

  int? get imageQuality;
  double? get maxWidth;
  double? get maxHeight;

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickFromGalleryImplCopyWith<_$PickFromGalleryImpl> get copyWith =>
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
    extends _$PhotoPickerEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
    _$ClearImpl _value,
    $Res Function(_$ClearImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'PhotoPickerEvent.clear()';
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
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromCamera,
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromGallery,
    required TResult Function() clear,
    required TResult Function(int index) removeImageAtIndex,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult? Function()? clear,
    TResult? Function(int index)? removeImageAtIndex,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult Function()? clear,
    TResult Function(int index)? removeImageAtIndex,
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
    required TResult Function(PickFromCamera value) pickFromCamera,
    required TResult Function(PickFromGallery value) pickFromGallery,
    required TResult Function(Clear value) clear,
    required TResult Function(RemoveImageAtIndex value) removeImageAtIndex,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickFromCamera value)? pickFromCamera,
    TResult? Function(PickFromGallery value)? pickFromGallery,
    TResult? Function(Clear value)? clear,
    TResult? Function(RemoveImageAtIndex value)? removeImageAtIndex,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickFromCamera value)? pickFromCamera,
    TResult Function(PickFromGallery value)? pickFromGallery,
    TResult Function(Clear value)? clear,
    TResult Function(RemoveImageAtIndex value)? removeImageAtIndex,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class Clear implements PhotoPickerEvent {
  const factory Clear() = _$ClearImpl;
}

/// @nodoc
abstract class _$$RemoveImageAtIndexImplCopyWith<$Res> {
  factory _$$RemoveImageAtIndexImplCopyWith(
    _$RemoveImageAtIndexImpl value,
    $Res Function(_$RemoveImageAtIndexImpl) then,
  ) = __$$RemoveImageAtIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveImageAtIndexImplCopyWithImpl<$Res>
    extends _$PhotoPickerEventCopyWithImpl<$Res, _$RemoveImageAtIndexImpl>
    implements _$$RemoveImageAtIndexImplCopyWith<$Res> {
  __$$RemoveImageAtIndexImplCopyWithImpl(
    _$RemoveImageAtIndexImpl _value,
    $Res Function(_$RemoveImageAtIndexImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$RemoveImageAtIndexImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$RemoveImageAtIndexImpl implements RemoveImageAtIndex {
  const _$RemoveImageAtIndexImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'PhotoPickerEvent.removeImageAtIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImageAtIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImageAtIndexImplCopyWith<_$RemoveImageAtIndexImpl> get copyWith =>
      __$$RemoveImageAtIndexImplCopyWithImpl<_$RemoveImageAtIndexImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromCamera,
    required TResult Function(
      int? imageQuality,
      double? maxWidth,
      double? maxHeight,
    )
    pickFromGallery,
    required TResult Function() clear,
    required TResult Function(int index) removeImageAtIndex,
  }) {
    return removeImageAtIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult? Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult? Function()? clear,
    TResult? Function(int index)? removeImageAtIndex,
  }) {
    return removeImageAtIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromCamera,
    TResult Function(int? imageQuality, double? maxWidth, double? maxHeight)?
    pickFromGallery,
    TResult Function()? clear,
    TResult Function(int index)? removeImageAtIndex,
    required TResult orElse(),
  }) {
    if (removeImageAtIndex != null) {
      return removeImageAtIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickFromCamera value) pickFromCamera,
    required TResult Function(PickFromGallery value) pickFromGallery,
    required TResult Function(Clear value) clear,
    required TResult Function(RemoveImageAtIndex value) removeImageAtIndex,
  }) {
    return removeImageAtIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickFromCamera value)? pickFromCamera,
    TResult? Function(PickFromGallery value)? pickFromGallery,
    TResult? Function(Clear value)? clear,
    TResult? Function(RemoveImageAtIndex value)? removeImageAtIndex,
  }) {
    return removeImageAtIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickFromCamera value)? pickFromCamera,
    TResult Function(PickFromGallery value)? pickFromGallery,
    TResult Function(Clear value)? clear,
    TResult Function(RemoveImageAtIndex value)? removeImageAtIndex,
    required TResult orElse(),
  }) {
    if (removeImageAtIndex != null) {
      return removeImageAtIndex(this);
    }
    return orElse();
  }
}

abstract class RemoveImageAtIndex implements PhotoPickerEvent {
  const factory RemoveImageAtIndex(final int index) = _$RemoveImageAtIndexImpl;

  int get index;

  /// Create a copy of PhotoPickerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImageAtIndexImplCopyWith<_$RemoveImageAtIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
