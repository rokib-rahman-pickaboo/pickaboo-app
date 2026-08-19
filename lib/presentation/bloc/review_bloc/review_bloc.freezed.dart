// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) load,
    required TResult Function(String productId) refresh,
    required TResult Function(String productId, String reviewId) voteHelpful,
    required TResult Function(String productId, String reviewId) voteNotHelpful,
    required TResult Function() getUserReviews,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? load,
    TResult? Function(String productId)? refresh,
    TResult? Function(String productId, String reviewId)? voteHelpful,
    TResult? Function(String productId, String reviewId)? voteNotHelpful,
    TResult? Function()? getUserReviews,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? load,
    TResult Function(String productId)? refresh,
    TResult Function(String productId, String reviewId)? voteHelpful,
    TResult Function(String productId, String reviewId)? voteNotHelpful,
    TResult Function()? getUserReviews,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_VoteHelpful value) voteHelpful,
    required TResult Function(_VoteNotHelpful value) voteNotHelpful,
    required TResult Function(_GetUserReviews value) getUserReviews,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_VoteHelpful value)? voteHelpful,
    TResult? Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult? Function(_GetUserReviews value)? getUserReviews,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_VoteHelpful value)? voteHelpful,
    TResult Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult Function(_GetUserReviews value)? getUserReviews,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEventCopyWith<$Res> {
  factory $ReviewEventCopyWith(
    ReviewEvent value,
    $Res Function(ReviewEvent) then,
  ) = _$ReviewEventCopyWithImpl<$Res, ReviewEvent>;
}

/// @nodoc
class _$ReviewEventCopyWithImpl<$Res, $Val extends ReviewEvent>
    implements $ReviewEventCopyWith<$Res> {
  _$ReviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
    _$LoadImpl value,
    $Res Function(_$LoadImpl) then,
  ) = __$$LoadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null}) {
    return _then(
      _$LoadImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl({required this.productId});

  @override
  final String productId;

  @override
  String toString() {
    return 'ReviewEvent.load(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) load,
    required TResult Function(String productId) refresh,
    required TResult Function(String productId, String reviewId) voteHelpful,
    required TResult Function(String productId, String reviewId) voteNotHelpful,
    required TResult Function() getUserReviews,
  }) {
    return load(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? load,
    TResult? Function(String productId)? refresh,
    TResult? Function(String productId, String reviewId)? voteHelpful,
    TResult? Function(String productId, String reviewId)? voteNotHelpful,
    TResult? Function()? getUserReviews,
  }) {
    return load?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? load,
    TResult Function(String productId)? refresh,
    TResult Function(String productId, String reviewId)? voteHelpful,
    TResult Function(String productId, String reviewId)? voteNotHelpful,
    TResult Function()? getUserReviews,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_VoteHelpful value) voteHelpful,
    required TResult Function(_VoteNotHelpful value) voteNotHelpful,
    required TResult Function(_GetUserReviews value) getUserReviews,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_VoteHelpful value)? voteHelpful,
    TResult? Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult? Function(_GetUserReviews value)? getUserReviews,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_VoteHelpful value)? voteHelpful,
    TResult Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult Function(_GetUserReviews value)? getUserReviews,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements ReviewEvent {
  const factory _Load({required final String productId}) = _$LoadImpl;

  String get productId;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null}) {
    return _then(
      _$RefreshImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl({required this.productId});

  @override
  final String productId;

  @override
  String toString() {
    return 'ReviewEvent.refresh(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) load,
    required TResult Function(String productId) refresh,
    required TResult Function(String productId, String reviewId) voteHelpful,
    required TResult Function(String productId, String reviewId) voteNotHelpful,
    required TResult Function() getUserReviews,
  }) {
    return refresh(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? load,
    TResult? Function(String productId)? refresh,
    TResult? Function(String productId, String reviewId)? voteHelpful,
    TResult? Function(String productId, String reviewId)? voteNotHelpful,
    TResult? Function()? getUserReviews,
  }) {
    return refresh?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? load,
    TResult Function(String productId)? refresh,
    TResult Function(String productId, String reviewId)? voteHelpful,
    TResult Function(String productId, String reviewId)? voteNotHelpful,
    TResult Function()? getUserReviews,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_VoteHelpful value) voteHelpful,
    required TResult Function(_VoteNotHelpful value) voteNotHelpful,
    required TResult Function(_GetUserReviews value) getUserReviews,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_VoteHelpful value)? voteHelpful,
    TResult? Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult? Function(_GetUserReviews value)? getUserReviews,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_VoteHelpful value)? voteHelpful,
    TResult Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult Function(_GetUserReviews value)? getUserReviews,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements ReviewEvent {
  const factory _Refresh({required final String productId}) = _$RefreshImpl;

  String get productId;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VoteHelpfulImplCopyWith<$Res> {
  factory _$$VoteHelpfulImplCopyWith(
    _$VoteHelpfulImpl value,
    $Res Function(_$VoteHelpfulImpl) then,
  ) = __$$VoteHelpfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId, String reviewId});
}

/// @nodoc
class __$$VoteHelpfulImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$VoteHelpfulImpl>
    implements _$$VoteHelpfulImplCopyWith<$Res> {
  __$$VoteHelpfulImplCopyWithImpl(
    _$VoteHelpfulImpl _value,
    $Res Function(_$VoteHelpfulImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null, Object? reviewId = null}) {
    return _then(
      _$VoteHelpfulImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String,
        reviewId:
            null == reviewId
                ? _value.reviewId
                : reviewId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$VoteHelpfulImpl implements _VoteHelpful {
  const _$VoteHelpfulImpl({required this.productId, required this.reviewId});

  @override
  final String productId;
  @override
  final String reviewId;

  @override
  String toString() {
    return 'ReviewEvent.voteHelpful(productId: $productId, reviewId: $reviewId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteHelpfulImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, reviewId);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteHelpfulImplCopyWith<_$VoteHelpfulImpl> get copyWith =>
      __$$VoteHelpfulImplCopyWithImpl<_$VoteHelpfulImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) load,
    required TResult Function(String productId) refresh,
    required TResult Function(String productId, String reviewId) voteHelpful,
    required TResult Function(String productId, String reviewId) voteNotHelpful,
    required TResult Function() getUserReviews,
  }) {
    return voteHelpful(productId, reviewId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? load,
    TResult? Function(String productId)? refresh,
    TResult? Function(String productId, String reviewId)? voteHelpful,
    TResult? Function(String productId, String reviewId)? voteNotHelpful,
    TResult? Function()? getUserReviews,
  }) {
    return voteHelpful?.call(productId, reviewId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? load,
    TResult Function(String productId)? refresh,
    TResult Function(String productId, String reviewId)? voteHelpful,
    TResult Function(String productId, String reviewId)? voteNotHelpful,
    TResult Function()? getUserReviews,
    required TResult orElse(),
  }) {
    if (voteHelpful != null) {
      return voteHelpful(productId, reviewId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_VoteHelpful value) voteHelpful,
    required TResult Function(_VoteNotHelpful value) voteNotHelpful,
    required TResult Function(_GetUserReviews value) getUserReviews,
  }) {
    return voteHelpful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_VoteHelpful value)? voteHelpful,
    TResult? Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult? Function(_GetUserReviews value)? getUserReviews,
  }) {
    return voteHelpful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_VoteHelpful value)? voteHelpful,
    TResult Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult Function(_GetUserReviews value)? getUserReviews,
    required TResult orElse(),
  }) {
    if (voteHelpful != null) {
      return voteHelpful(this);
    }
    return orElse();
  }
}

abstract class _VoteHelpful implements ReviewEvent {
  const factory _VoteHelpful({
    required final String productId,
    required final String reviewId,
  }) = _$VoteHelpfulImpl;

  String get productId;
  String get reviewId;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoteHelpfulImplCopyWith<_$VoteHelpfulImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VoteNotHelpfulImplCopyWith<$Res> {
  factory _$$VoteNotHelpfulImplCopyWith(
    _$VoteNotHelpfulImpl value,
    $Res Function(_$VoteNotHelpfulImpl) then,
  ) = __$$VoteNotHelpfulImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId, String reviewId});
}

/// @nodoc
class __$$VoteNotHelpfulImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$VoteNotHelpfulImpl>
    implements _$$VoteNotHelpfulImplCopyWith<$Res> {
  __$$VoteNotHelpfulImplCopyWithImpl(
    _$VoteNotHelpfulImpl _value,
    $Res Function(_$VoteNotHelpfulImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null, Object? reviewId = null}) {
    return _then(
      _$VoteNotHelpfulImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as String,
        reviewId:
            null == reviewId
                ? _value.reviewId
                : reviewId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$VoteNotHelpfulImpl implements _VoteNotHelpful {
  const _$VoteNotHelpfulImpl({required this.productId, required this.reviewId});

  @override
  final String productId;
  @override
  final String reviewId;

  @override
  String toString() {
    return 'ReviewEvent.voteNotHelpful(productId: $productId, reviewId: $reviewId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteNotHelpfulImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, reviewId);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteNotHelpfulImplCopyWith<_$VoteNotHelpfulImpl> get copyWith =>
      __$$VoteNotHelpfulImplCopyWithImpl<_$VoteNotHelpfulImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) load,
    required TResult Function(String productId) refresh,
    required TResult Function(String productId, String reviewId) voteHelpful,
    required TResult Function(String productId, String reviewId) voteNotHelpful,
    required TResult Function() getUserReviews,
  }) {
    return voteNotHelpful(productId, reviewId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? load,
    TResult? Function(String productId)? refresh,
    TResult? Function(String productId, String reviewId)? voteHelpful,
    TResult? Function(String productId, String reviewId)? voteNotHelpful,
    TResult? Function()? getUserReviews,
  }) {
    return voteNotHelpful?.call(productId, reviewId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? load,
    TResult Function(String productId)? refresh,
    TResult Function(String productId, String reviewId)? voteHelpful,
    TResult Function(String productId, String reviewId)? voteNotHelpful,
    TResult Function()? getUserReviews,
    required TResult orElse(),
  }) {
    if (voteNotHelpful != null) {
      return voteNotHelpful(productId, reviewId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_VoteHelpful value) voteHelpful,
    required TResult Function(_VoteNotHelpful value) voteNotHelpful,
    required TResult Function(_GetUserReviews value) getUserReviews,
  }) {
    return voteNotHelpful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_VoteHelpful value)? voteHelpful,
    TResult? Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult? Function(_GetUserReviews value)? getUserReviews,
  }) {
    return voteNotHelpful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_VoteHelpful value)? voteHelpful,
    TResult Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult Function(_GetUserReviews value)? getUserReviews,
    required TResult orElse(),
  }) {
    if (voteNotHelpful != null) {
      return voteNotHelpful(this);
    }
    return orElse();
  }
}

abstract class _VoteNotHelpful implements ReviewEvent {
  const factory _VoteNotHelpful({
    required final String productId,
    required final String reviewId,
  }) = _$VoteNotHelpfulImpl;

  String get productId;
  String get reviewId;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoteNotHelpfulImplCopyWith<_$VoteNotHelpfulImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserReviewsImplCopyWith<$Res> {
  factory _$$GetUserReviewsImplCopyWith(
    _$GetUserReviewsImpl value,
    $Res Function(_$GetUserReviewsImpl) then,
  ) = __$$GetUserReviewsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserReviewsImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$GetUserReviewsImpl>
    implements _$$GetUserReviewsImplCopyWith<$Res> {
  __$$GetUserReviewsImplCopyWithImpl(
    _$GetUserReviewsImpl _value,
    $Res Function(_$GetUserReviewsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserReviewsImpl implements _GetUserReviews {
  const _$GetUserReviewsImpl();

  @override
  String toString() {
    return 'ReviewEvent.getUserReviews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserReviewsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) load,
    required TResult Function(String productId) refresh,
    required TResult Function(String productId, String reviewId) voteHelpful,
    required TResult Function(String productId, String reviewId) voteNotHelpful,
    required TResult Function() getUserReviews,
  }) {
    return getUserReviews();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? load,
    TResult? Function(String productId)? refresh,
    TResult? Function(String productId, String reviewId)? voteHelpful,
    TResult? Function(String productId, String reviewId)? voteNotHelpful,
    TResult? Function()? getUserReviews,
  }) {
    return getUserReviews?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? load,
    TResult Function(String productId)? refresh,
    TResult Function(String productId, String reviewId)? voteHelpful,
    TResult Function(String productId, String reviewId)? voteNotHelpful,
    TResult Function()? getUserReviews,
    required TResult orElse(),
  }) {
    if (getUserReviews != null) {
      return getUserReviews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_VoteHelpful value) voteHelpful,
    required TResult Function(_VoteNotHelpful value) voteNotHelpful,
    required TResult Function(_GetUserReviews value) getUserReviews,
  }) {
    return getUserReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_VoteHelpful value)? voteHelpful,
    TResult? Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult? Function(_GetUserReviews value)? getUserReviews,
  }) {
    return getUserReviews?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_VoteHelpful value)? voteHelpful,
    TResult Function(_VoteNotHelpful value)? voteNotHelpful,
    TResult Function(_GetUserReviews value)? getUserReviews,
    required TResult orElse(),
  }) {
    if (getUserReviews != null) {
      return getUserReviews(this);
    }
    return orElse();
  }
}

abstract class _GetUserReviews implements ReviewEvent {
  const factory _GetUserReviews() = _$GetUserReviewsImpl;
}

/// @nodoc
mixin _$ReviewState {
  PagingState<int, ReviewEntity> get pagingState =>
      throw _privateConstructorUsedError;
  ProductReviewsEntity? get summary => throw _privateConstructorUsedError;
  String? get votingReviewId => throw _privateConstructorUsedError;
  AppErrorEntity? get voteError => throw _privateConstructorUsedError;
  bool get isUserReviewsLoading => throw _privateConstructorUsedError;
  List<UserReviewEntity>? get userReviews => throw _privateConstructorUsedError;
  AppErrorEntity? get userReviewsError => throw _privateConstructorUsedError;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
    ReviewState value,
    $Res Function(ReviewState) then,
  ) = _$ReviewStateCopyWithImpl<$Res, ReviewState>;
  @useResult
  $Res call({
    PagingState<int, ReviewEntity> pagingState,
    ProductReviewsEntity? summary,
    String? votingReviewId,
    AppErrorEntity? voteError,
    bool isUserReviewsLoading,
    List<UserReviewEntity>? userReviews,
    AppErrorEntity? userReviewsError,
  });
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? summary = freezed,
    Object? votingReviewId = freezed,
    Object? voteError = freezed,
    Object? isUserReviewsLoading = null,
    Object? userReviews = freezed,
    Object? userReviewsError = freezed,
  }) {
    return _then(
      _value.copyWith(
            pagingState:
                null == pagingState
                    ? _value.pagingState
                    : pagingState // ignore: cast_nullable_to_non_nullable
                        as PagingState<int, ReviewEntity>,
            summary:
                freezed == summary
                    ? _value.summary
                    : summary // ignore: cast_nullable_to_non_nullable
                        as ProductReviewsEntity?,
            votingReviewId:
                freezed == votingReviewId
                    ? _value.votingReviewId
                    : votingReviewId // ignore: cast_nullable_to_non_nullable
                        as String?,
            voteError:
                freezed == voteError
                    ? _value.voteError
                    : voteError // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
            isUserReviewsLoading:
                null == isUserReviewsLoading
                    ? _value.isUserReviewsLoading
                    : isUserReviewsLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            userReviews:
                freezed == userReviews
                    ? _value.userReviews
                    : userReviews // ignore: cast_nullable_to_non_nullable
                        as List<UserReviewEntity>?,
            userReviewsError:
                freezed == userReviewsError
                    ? _value.userReviewsError
                    : userReviewsError // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewStateImplCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$ReviewStateImplCopyWith(
    _$ReviewStateImpl value,
    $Res Function(_$ReviewStateImpl) then,
  ) = __$$ReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PagingState<int, ReviewEntity> pagingState,
    ProductReviewsEntity? summary,
    String? votingReviewId,
    AppErrorEntity? voteError,
    bool isUserReviewsLoading,
    List<UserReviewEntity>? userReviews,
    AppErrorEntity? userReviewsError,
  });
}

/// @nodoc
class __$$ReviewStateImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$ReviewStateImpl>
    implements _$$ReviewStateImplCopyWith<$Res> {
  __$$ReviewStateImplCopyWithImpl(
    _$ReviewStateImpl _value,
    $Res Function(_$ReviewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagingState = null,
    Object? summary = freezed,
    Object? votingReviewId = freezed,
    Object? voteError = freezed,
    Object? isUserReviewsLoading = null,
    Object? userReviews = freezed,
    Object? userReviewsError = freezed,
  }) {
    return _then(
      _$ReviewStateImpl(
        pagingState:
            null == pagingState
                ? _value.pagingState
                : pagingState // ignore: cast_nullable_to_non_nullable
                    as PagingState<int, ReviewEntity>,
        summary:
            freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                    as ProductReviewsEntity?,
        votingReviewId:
            freezed == votingReviewId
                ? _value.votingReviewId
                : votingReviewId // ignore: cast_nullable_to_non_nullable
                    as String?,
        voteError:
            freezed == voteError
                ? _value.voteError
                : voteError // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
        isUserReviewsLoading:
            null == isUserReviewsLoading
                ? _value.isUserReviewsLoading
                : isUserReviewsLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        userReviews:
            freezed == userReviews
                ? _value._userReviews
                : userReviews // ignore: cast_nullable_to_non_nullable
                    as List<UserReviewEntity>?,
        userReviewsError:
            freezed == userReviewsError
                ? _value.userReviewsError
                : userReviewsError // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
      ),
    );
  }
}

/// @nodoc

class _$ReviewStateImpl implements _ReviewState {
  const _$ReviewStateImpl({
    required this.pagingState,
    this.summary,
    this.votingReviewId,
    this.voteError,
    this.isUserReviewsLoading = false,
    final List<UserReviewEntity>? userReviews,
    this.userReviewsError,
  }) : _userReviews = userReviews;

  @override
  final PagingState<int, ReviewEntity> pagingState;
  @override
  final ProductReviewsEntity? summary;
  @override
  final String? votingReviewId;
  @override
  final AppErrorEntity? voteError;
  @override
  @JsonKey()
  final bool isUserReviewsLoading;
  final List<UserReviewEntity>? _userReviews;
  @override
  List<UserReviewEntity>? get userReviews {
    final value = _userReviews;
    if (value == null) return null;
    if (_userReviews is EqualUnmodifiableListView) return _userReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AppErrorEntity? userReviewsError;

  @override
  String toString() {
    return 'ReviewState(pagingState: $pagingState, summary: $summary, votingReviewId: $votingReviewId, voteError: $voteError, isUserReviewsLoading: $isUserReviewsLoading, userReviews: $userReviews, userReviewsError: $userReviewsError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateImpl &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.votingReviewId, votingReviewId) ||
                other.votingReviewId == votingReviewId) &&
            (identical(other.voteError, voteError) ||
                other.voteError == voteError) &&
            (identical(other.isUserReviewsLoading, isUserReviewsLoading) ||
                other.isUserReviewsLoading == isUserReviewsLoading) &&
            const DeepCollectionEquality().equals(
              other._userReviews,
              _userReviews,
            ) &&
            (identical(other.userReviewsError, userReviewsError) ||
                other.userReviewsError == userReviewsError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    pagingState,
    summary,
    votingReviewId,
    voteError,
    isUserReviewsLoading,
    const DeepCollectionEquality().hash(_userReviews),
    userReviewsError,
  );

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      __$$ReviewStateImplCopyWithImpl<_$ReviewStateImpl>(this, _$identity);
}

abstract class _ReviewState implements ReviewState {
  const factory _ReviewState({
    required final PagingState<int, ReviewEntity> pagingState,
    final ProductReviewsEntity? summary,
    final String? votingReviewId,
    final AppErrorEntity? voteError,
    final bool isUserReviewsLoading,
    final List<UserReviewEntity>? userReviews,
    final AppErrorEntity? userReviewsError,
  }) = _$ReviewStateImpl;

  @override
  PagingState<int, ReviewEntity> get pagingState;
  @override
  ProductReviewsEntity? get summary;
  @override
  String? get votingReviewId;
  @override
  AppErrorEntity? get voteError;
  @override
  bool get isUserReviewsLoading;
  @override
  List<UserReviewEntity>? get userReviews;
  @override
  AppErrorEntity? get userReviewsError;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
