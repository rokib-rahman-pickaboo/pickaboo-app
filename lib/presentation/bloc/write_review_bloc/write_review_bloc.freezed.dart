// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'write_review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WriteReviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dimension, int rating) updateRating,
    required TResult Function(String text) updateReviewText,
    required TResult Function(String path) addImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<String> images) updateImages,
    required TResult Function(String productId) submitReview,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dimension, int rating)? updateRating,
    TResult? Function(String text)? updateReviewText,
    TResult? Function(String path)? addImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<String> images)? updateImages,
    TResult? Function(String productId)? submitReview,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dimension, int rating)? updateRating,
    TResult Function(String text)? updateReviewText,
    TResult Function(String path)? addImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<String> images)? updateImages,
    TResult Function(String productId)? submitReview,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateRating value) updateRating,
    required TResult Function(_UpdateReviewText value) updateReviewText,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_UpdateImages value) updateImages,
    required TResult Function(_SubmitReview value) submitReview,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateRating value)? updateRating,
    TResult? Function(_UpdateReviewText value)? updateReviewText,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_UpdateImages value)? updateImages,
    TResult? Function(_SubmitReview value)? submitReview,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateRating value)? updateRating,
    TResult Function(_UpdateReviewText value)? updateReviewText,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_UpdateImages value)? updateImages,
    TResult Function(_SubmitReview value)? submitReview,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteReviewEventCopyWith<$Res> {
  factory $WriteReviewEventCopyWith(
    WriteReviewEvent value,
    $Res Function(WriteReviewEvent) then,
  ) = _$WriteReviewEventCopyWithImpl<$Res, WriteReviewEvent>;
}

/// @nodoc
class _$WriteReviewEventCopyWithImpl<$Res, $Val extends WriteReviewEvent>
    implements $WriteReviewEventCopyWith<$Res> {
  _$WriteReviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateRatingImplCopyWith<$Res> {
  factory _$$UpdateRatingImplCopyWith(
    _$UpdateRatingImpl value,
    $Res Function(_$UpdateRatingImpl) then,
  ) = __$$UpdateRatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String dimension, int rating});
}

/// @nodoc
class __$$UpdateRatingImplCopyWithImpl<$Res>
    extends _$WriteReviewEventCopyWithImpl<$Res, _$UpdateRatingImpl>
    implements _$$UpdateRatingImplCopyWith<$Res> {
  __$$UpdateRatingImplCopyWithImpl(
    _$UpdateRatingImpl _value,
    $Res Function(_$UpdateRatingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dimension = null, Object? rating = null}) {
    return _then(
      _$UpdateRatingImpl(
        null == dimension
            ? _value.dimension
            : dimension // ignore: cast_nullable_to_non_nullable
                as String,
        null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$UpdateRatingImpl implements _UpdateRating {
  const _$UpdateRatingImpl(this.dimension, this.rating);

  @override
  final String dimension;
  @override
  final int rating;

  @override
  String toString() {
    return 'WriteReviewEvent.updateRating(dimension: $dimension, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRatingImpl &&
            (identical(other.dimension, dimension) ||
                other.dimension == dimension) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dimension, rating);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRatingImplCopyWith<_$UpdateRatingImpl> get copyWith =>
      __$$UpdateRatingImplCopyWithImpl<_$UpdateRatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dimension, int rating) updateRating,
    required TResult Function(String text) updateReviewText,
    required TResult Function(String path) addImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<String> images) updateImages,
    required TResult Function(String productId) submitReview,
  }) {
    return updateRating(dimension, rating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dimension, int rating)? updateRating,
    TResult? Function(String text)? updateReviewText,
    TResult? Function(String path)? addImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<String> images)? updateImages,
    TResult? Function(String productId)? submitReview,
  }) {
    return updateRating?.call(dimension, rating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dimension, int rating)? updateRating,
    TResult Function(String text)? updateReviewText,
    TResult Function(String path)? addImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<String> images)? updateImages,
    TResult Function(String productId)? submitReview,
    required TResult orElse(),
  }) {
    if (updateRating != null) {
      return updateRating(dimension, rating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateRating value) updateRating,
    required TResult Function(_UpdateReviewText value) updateReviewText,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_UpdateImages value) updateImages,
    required TResult Function(_SubmitReview value) submitReview,
  }) {
    return updateRating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateRating value)? updateRating,
    TResult? Function(_UpdateReviewText value)? updateReviewText,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_UpdateImages value)? updateImages,
    TResult? Function(_SubmitReview value)? submitReview,
  }) {
    return updateRating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateRating value)? updateRating,
    TResult Function(_UpdateReviewText value)? updateReviewText,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_UpdateImages value)? updateImages,
    TResult Function(_SubmitReview value)? submitReview,
    required TResult orElse(),
  }) {
    if (updateRating != null) {
      return updateRating(this);
    }
    return orElse();
  }
}

abstract class _UpdateRating implements WriteReviewEvent {
  const factory _UpdateRating(final String dimension, final int rating) =
      _$UpdateRatingImpl;

  String get dimension;
  int get rating;

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRatingImplCopyWith<_$UpdateRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateReviewTextImplCopyWith<$Res> {
  factory _$$UpdateReviewTextImplCopyWith(
    _$UpdateReviewTextImpl value,
    $Res Function(_$UpdateReviewTextImpl) then,
  ) = __$$UpdateReviewTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$UpdateReviewTextImplCopyWithImpl<$Res>
    extends _$WriteReviewEventCopyWithImpl<$Res, _$UpdateReviewTextImpl>
    implements _$$UpdateReviewTextImplCopyWith<$Res> {
  __$$UpdateReviewTextImplCopyWithImpl(
    _$UpdateReviewTextImpl _value,
    $Res Function(_$UpdateReviewTextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _$UpdateReviewTextImpl(
        null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateReviewTextImpl implements _UpdateReviewText {
  const _$UpdateReviewTextImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'WriteReviewEvent.updateReviewText(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateReviewTextImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateReviewTextImplCopyWith<_$UpdateReviewTextImpl> get copyWith =>
      __$$UpdateReviewTextImplCopyWithImpl<_$UpdateReviewTextImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dimension, int rating) updateRating,
    required TResult Function(String text) updateReviewText,
    required TResult Function(String path) addImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<String> images) updateImages,
    required TResult Function(String productId) submitReview,
  }) {
    return updateReviewText(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dimension, int rating)? updateRating,
    TResult? Function(String text)? updateReviewText,
    TResult? Function(String path)? addImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<String> images)? updateImages,
    TResult? Function(String productId)? submitReview,
  }) {
    return updateReviewText?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dimension, int rating)? updateRating,
    TResult Function(String text)? updateReviewText,
    TResult Function(String path)? addImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<String> images)? updateImages,
    TResult Function(String productId)? submitReview,
    required TResult orElse(),
  }) {
    if (updateReviewText != null) {
      return updateReviewText(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateRating value) updateRating,
    required TResult Function(_UpdateReviewText value) updateReviewText,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_UpdateImages value) updateImages,
    required TResult Function(_SubmitReview value) submitReview,
  }) {
    return updateReviewText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateRating value)? updateRating,
    TResult? Function(_UpdateReviewText value)? updateReviewText,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_UpdateImages value)? updateImages,
    TResult? Function(_SubmitReview value)? submitReview,
  }) {
    return updateReviewText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateRating value)? updateRating,
    TResult Function(_UpdateReviewText value)? updateReviewText,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_UpdateImages value)? updateImages,
    TResult Function(_SubmitReview value)? submitReview,
    required TResult orElse(),
  }) {
    if (updateReviewText != null) {
      return updateReviewText(this);
    }
    return orElse();
  }
}

abstract class _UpdateReviewText implements WriteReviewEvent {
  const factory _UpdateReviewText(final String text) = _$UpdateReviewTextImpl;

  String get text;

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateReviewTextImplCopyWith<_$UpdateReviewTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddImageImplCopyWith<$Res> {
  factory _$$AddImageImplCopyWith(
    _$AddImageImpl value,
    $Res Function(_$AddImageImpl) then,
  ) = __$$AddImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$AddImageImplCopyWithImpl<$Res>
    extends _$WriteReviewEventCopyWithImpl<$Res, _$AddImageImpl>
    implements _$$AddImageImplCopyWith<$Res> {
  __$$AddImageImplCopyWithImpl(
    _$AddImageImpl _value,
    $Res Function(_$AddImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? path = null}) {
    return _then(
      _$AddImageImpl(
        null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$AddImageImpl implements _AddImage {
  const _$AddImageImpl(this.path);

  @override
  final String path;

  @override
  String toString() {
    return 'WriteReviewEvent.addImage(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImageImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImageImplCopyWith<_$AddImageImpl> get copyWith =>
      __$$AddImageImplCopyWithImpl<_$AddImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dimension, int rating) updateRating,
    required TResult Function(String text) updateReviewText,
    required TResult Function(String path) addImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<String> images) updateImages,
    required TResult Function(String productId) submitReview,
  }) {
    return addImage(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dimension, int rating)? updateRating,
    TResult? Function(String text)? updateReviewText,
    TResult? Function(String path)? addImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<String> images)? updateImages,
    TResult? Function(String productId)? submitReview,
  }) {
    return addImage?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dimension, int rating)? updateRating,
    TResult Function(String text)? updateReviewText,
    TResult Function(String path)? addImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<String> images)? updateImages,
    TResult Function(String productId)? submitReview,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateRating value) updateRating,
    required TResult Function(_UpdateReviewText value) updateReviewText,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_UpdateImages value) updateImages,
    required TResult Function(_SubmitReview value) submitReview,
  }) {
    return addImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateRating value)? updateRating,
    TResult? Function(_UpdateReviewText value)? updateReviewText,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_UpdateImages value)? updateImages,
    TResult? Function(_SubmitReview value)? submitReview,
  }) {
    return addImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateRating value)? updateRating,
    TResult Function(_UpdateReviewText value)? updateReviewText,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_UpdateImages value)? updateImages,
    TResult Function(_SubmitReview value)? submitReview,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(this);
    }
    return orElse();
  }
}

abstract class _AddImage implements WriteReviewEvent {
  const factory _AddImage(final String path) = _$AddImageImpl;

  String get path;

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImageImplCopyWith<_$AddImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImageImplCopyWith<$Res> {
  factory _$$RemoveImageImplCopyWith(
    _$RemoveImageImpl value,
    $Res Function(_$RemoveImageImpl) then,
  ) = __$$RemoveImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$RemoveImageImplCopyWithImpl<$Res>
    extends _$WriteReviewEventCopyWithImpl<$Res, _$RemoveImageImpl>
    implements _$$RemoveImageImplCopyWith<$Res> {
  __$$RemoveImageImplCopyWithImpl(
    _$RemoveImageImpl _value,
    $Res Function(_$RemoveImageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? index = null}) {
    return _then(
      _$RemoveImageImpl(
        null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$RemoveImageImpl implements _RemoveImage {
  const _$RemoveImageImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'WriteReviewEvent.removeImage(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImageImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImageImplCopyWith<_$RemoveImageImpl> get copyWith =>
      __$$RemoveImageImplCopyWithImpl<_$RemoveImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dimension, int rating) updateRating,
    required TResult Function(String text) updateReviewText,
    required TResult Function(String path) addImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<String> images) updateImages,
    required TResult Function(String productId) submitReview,
  }) {
    return removeImage(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dimension, int rating)? updateRating,
    TResult? Function(String text)? updateReviewText,
    TResult? Function(String path)? addImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<String> images)? updateImages,
    TResult? Function(String productId)? submitReview,
  }) {
    return removeImage?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dimension, int rating)? updateRating,
    TResult Function(String text)? updateReviewText,
    TResult Function(String path)? addImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<String> images)? updateImages,
    TResult Function(String productId)? submitReview,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateRating value) updateRating,
    required TResult Function(_UpdateReviewText value) updateReviewText,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_UpdateImages value) updateImages,
    required TResult Function(_SubmitReview value) submitReview,
  }) {
    return removeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateRating value)? updateRating,
    TResult? Function(_UpdateReviewText value)? updateReviewText,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_UpdateImages value)? updateImages,
    TResult? Function(_SubmitReview value)? submitReview,
  }) {
    return removeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateRating value)? updateRating,
    TResult Function(_UpdateReviewText value)? updateReviewText,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_UpdateImages value)? updateImages,
    TResult Function(_SubmitReview value)? submitReview,
    required TResult orElse(),
  }) {
    if (removeImage != null) {
      return removeImage(this);
    }
    return orElse();
  }
}

abstract class _RemoveImage implements WriteReviewEvent {
  const factory _RemoveImage(final int index) = _$RemoveImageImpl;

  int get index;

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImageImplCopyWith<_$RemoveImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImagesImplCopyWith<$Res> {
  factory _$$UpdateImagesImplCopyWith(
    _$UpdateImagesImpl value,
    $Res Function(_$UpdateImagesImpl) then,
  ) = __$$UpdateImagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> images});
}

/// @nodoc
class __$$UpdateImagesImplCopyWithImpl<$Res>
    extends _$WriteReviewEventCopyWithImpl<$Res, _$UpdateImagesImpl>
    implements _$$UpdateImagesImplCopyWith<$Res> {
  __$$UpdateImagesImplCopyWithImpl(
    _$UpdateImagesImpl _value,
    $Res Function(_$UpdateImagesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? images = null}) {
    return _then(
      _$UpdateImagesImpl(
        null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$UpdateImagesImpl implements _UpdateImages {
  const _$UpdateImagesImpl(final List<String> images) : _images = images;

  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'WriteReviewEvent.updateImages(images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImagesImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImagesImplCopyWith<_$UpdateImagesImpl> get copyWith =>
      __$$UpdateImagesImplCopyWithImpl<_$UpdateImagesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dimension, int rating) updateRating,
    required TResult Function(String text) updateReviewText,
    required TResult Function(String path) addImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<String> images) updateImages,
    required TResult Function(String productId) submitReview,
  }) {
    return updateImages(images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dimension, int rating)? updateRating,
    TResult? Function(String text)? updateReviewText,
    TResult? Function(String path)? addImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<String> images)? updateImages,
    TResult? Function(String productId)? submitReview,
  }) {
    return updateImages?.call(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dimension, int rating)? updateRating,
    TResult Function(String text)? updateReviewText,
    TResult Function(String path)? addImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<String> images)? updateImages,
    TResult Function(String productId)? submitReview,
    required TResult orElse(),
  }) {
    if (updateImages != null) {
      return updateImages(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateRating value) updateRating,
    required TResult Function(_UpdateReviewText value) updateReviewText,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_UpdateImages value) updateImages,
    required TResult Function(_SubmitReview value) submitReview,
  }) {
    return updateImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateRating value)? updateRating,
    TResult? Function(_UpdateReviewText value)? updateReviewText,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_UpdateImages value)? updateImages,
    TResult? Function(_SubmitReview value)? submitReview,
  }) {
    return updateImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateRating value)? updateRating,
    TResult Function(_UpdateReviewText value)? updateReviewText,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_UpdateImages value)? updateImages,
    TResult Function(_SubmitReview value)? submitReview,
    required TResult orElse(),
  }) {
    if (updateImages != null) {
      return updateImages(this);
    }
    return orElse();
  }
}

abstract class _UpdateImages implements WriteReviewEvent {
  const factory _UpdateImages(final List<String> images) = _$UpdateImagesImpl;

  List<String> get images;

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateImagesImplCopyWith<_$UpdateImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitReviewImplCopyWith<$Res> {
  factory _$$SubmitReviewImplCopyWith(
    _$SubmitReviewImpl value,
    $Res Function(_$SubmitReviewImpl) then,
  ) = __$$SubmitReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$SubmitReviewImplCopyWithImpl<$Res>
    extends _$WriteReviewEventCopyWithImpl<$Res, _$SubmitReviewImpl>
    implements _$$SubmitReviewImplCopyWith<$Res> {
  __$$SubmitReviewImplCopyWithImpl(
    _$SubmitReviewImpl _value,
    $Res Function(_$SubmitReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null}) {
    return _then(
      _$SubmitReviewImpl(
        null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SubmitReviewImpl implements _SubmitReview {
  const _$SubmitReviewImpl(this.productId);

  @override
  final String productId;

  @override
  String toString() {
    return 'WriteReviewEvent.submitReview(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitReviewImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitReviewImplCopyWith<_$SubmitReviewImpl> get copyWith =>
      __$$SubmitReviewImplCopyWithImpl<_$SubmitReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String dimension, int rating) updateRating,
    required TResult Function(String text) updateReviewText,
    required TResult Function(String path) addImage,
    required TResult Function(int index) removeImage,
    required TResult Function(List<String> images) updateImages,
    required TResult Function(String productId) submitReview,
  }) {
    return submitReview(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String dimension, int rating)? updateRating,
    TResult? Function(String text)? updateReviewText,
    TResult? Function(String path)? addImage,
    TResult? Function(int index)? removeImage,
    TResult? Function(List<String> images)? updateImages,
    TResult? Function(String productId)? submitReview,
  }) {
    return submitReview?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String dimension, int rating)? updateRating,
    TResult Function(String text)? updateReviewText,
    TResult Function(String path)? addImage,
    TResult Function(int index)? removeImage,
    TResult Function(List<String> images)? updateImages,
    TResult Function(String productId)? submitReview,
    required TResult orElse(),
  }) {
    if (submitReview != null) {
      return submitReview(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateRating value) updateRating,
    required TResult Function(_UpdateReviewText value) updateReviewText,
    required TResult Function(_AddImage value) addImage,
    required TResult Function(_RemoveImage value) removeImage,
    required TResult Function(_UpdateImages value) updateImages,
    required TResult Function(_SubmitReview value) submitReview,
  }) {
    return submitReview(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateRating value)? updateRating,
    TResult? Function(_UpdateReviewText value)? updateReviewText,
    TResult? Function(_AddImage value)? addImage,
    TResult? Function(_RemoveImage value)? removeImage,
    TResult? Function(_UpdateImages value)? updateImages,
    TResult? Function(_SubmitReview value)? submitReview,
  }) {
    return submitReview?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateRating value)? updateRating,
    TResult Function(_UpdateReviewText value)? updateReviewText,
    TResult Function(_AddImage value)? addImage,
    TResult Function(_RemoveImage value)? removeImage,
    TResult Function(_UpdateImages value)? updateImages,
    TResult Function(_SubmitReview value)? submitReview,
    required TResult orElse(),
  }) {
    if (submitReview != null) {
      return submitReview(this);
    }
    return orElse();
  }
}

abstract class _SubmitReview implements WriteReviewEvent {
  const factory _SubmitReview(final String productId) = _$SubmitReviewImpl;

  String get productId;

  /// Create a copy of WriteReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitReviewImplCopyWith<_$SubmitReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WriteReviewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )
    initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriteReviewStateCopyWith<$Res> {
  factory $WriteReviewStateCopyWith(
    WriteReviewState value,
    $Res Function(WriteReviewState) then,
  ) = _$WriteReviewStateCopyWithImpl<$Res, WriteReviewState>;
}

/// @nodoc
class _$WriteReviewStateCopyWithImpl<$Res, $Val extends WriteReviewState>
    implements $WriteReviewStateCopyWith<$Res> {
  _$WriteReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    int priceRating,
    int valueRating,
    int qualityRating,
    int serviceRating,
    String reviewText,
    List<String> images,
  });
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WriteReviewStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceRating = null,
    Object? valueRating = null,
    Object? qualityRating = null,
    Object? serviceRating = null,
    Object? reviewText = null,
    Object? images = null,
  }) {
    return _then(
      _$InitialImpl(
        priceRating:
            null == priceRating
                ? _value.priceRating
                : priceRating // ignore: cast_nullable_to_non_nullable
                    as int,
        valueRating:
            null == valueRating
                ? _value.valueRating
                : valueRating // ignore: cast_nullable_to_non_nullable
                    as int,
        qualityRating:
            null == qualityRating
                ? _value.qualityRating
                : qualityRating // ignore: cast_nullable_to_non_nullable
                    as int,
        serviceRating:
            null == serviceRating
                ? _value.serviceRating
                : serviceRating // ignore: cast_nullable_to_non_nullable
                    as int,
        reviewText:
            null == reviewText
                ? _value.reviewText
                : reviewText // ignore: cast_nullable_to_non_nullable
                    as String,
        images:
            null == images
                ? _value._images
                : images // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({
    this.priceRating = 5,
    this.valueRating = 5,
    this.qualityRating = 5,
    this.serviceRating = 5,
    this.reviewText = '',
    final List<String> images = const [],
  }) : _images = images;

  @override
  @JsonKey()
  final int priceRating;
  @override
  @JsonKey()
  final int valueRating;
  @override
  @JsonKey()
  final int qualityRating;
  @override
  @JsonKey()
  final int serviceRating;
  @override
  @JsonKey()
  final String reviewText;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'WriteReviewState.initial(priceRating: $priceRating, valueRating: $valueRating, qualityRating: $qualityRating, serviceRating: $serviceRating, reviewText: $reviewText, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.priceRating, priceRating) ||
                other.priceRating == priceRating) &&
            (identical(other.valueRating, valueRating) ||
                other.valueRating == valueRating) &&
            (identical(other.qualityRating, qualityRating) ||
                other.qualityRating == qualityRating) &&
            (identical(other.serviceRating, serviceRating) ||
                other.serviceRating == serviceRating) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    priceRating,
    valueRating,
    qualityRating,
    serviceRating,
    reviewText,
    const DeepCollectionEquality().hash(_images),
  );

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )
    initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return initial(
      priceRating,
      valueRating,
      qualityRating,
      serviceRating,
      reviewText,
      images,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call(
      priceRating,
      valueRating,
      qualityRating,
      serviceRating,
      reviewText,
      images,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
        priceRating,
        valueRating,
        qualityRating,
        serviceRating,
        reviewText,
        images,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WriteReviewState {
  const factory _Initial({
    final int priceRating,
    final int valueRating,
    final int qualityRating,
    final int serviceRating,
    final String reviewText,
    final List<String> images,
  }) = _$InitialImpl;

  int get priceRating;
  int get valueRating;
  int get qualityRating;
  int get serviceRating;
  String get reviewText;
  List<String> get images;

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$WriteReviewStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'WriteReviewState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )
    initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements WriteReviewState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$WriteReviewStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'WriteReviewState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )
    initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements WriteReviewState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$WriteReviewStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'WriteReviewState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )
    initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int priceRating,
      int valueRating,
      int qualityRating,
      int serviceRating,
      String reviewText,
      List<String> images,
    )?
    initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements WriteReviewState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of WriteReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
