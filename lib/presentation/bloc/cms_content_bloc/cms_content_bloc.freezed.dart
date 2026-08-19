// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cms_content_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CmsContentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAll,
    required TResult Function(CmsBlockType blockType) loadBlock,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAll,
    TResult? Function(CmsBlockType blockType)? loadBlock,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(CmsBlockType blockType)? loadBlock,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_LoadBlock value) loadBlock,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadBlock value)? loadBlock,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadBlock value)? loadBlock,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CmsContentEventCopyWith<$Res> {
  factory $CmsContentEventCopyWith(
    CmsContentEvent value,
    $Res Function(CmsContentEvent) then,
  ) = _$CmsContentEventCopyWithImpl<$Res, CmsContentEvent>;
}

/// @nodoc
class _$CmsContentEventCopyWithImpl<$Res, $Val extends CmsContentEvent>
    implements $CmsContentEventCopyWith<$Res> {
  _$CmsContentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CmsContentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadAllImplCopyWith<$Res> {
  factory _$$LoadAllImplCopyWith(
    _$LoadAllImpl value,
    $Res Function(_$LoadAllImpl) then,
  ) = __$$LoadAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAllImplCopyWithImpl<$Res>
    extends _$CmsContentEventCopyWithImpl<$Res, _$LoadAllImpl>
    implements _$$LoadAllImplCopyWith<$Res> {
  __$$LoadAllImplCopyWithImpl(
    _$LoadAllImpl _value,
    $Res Function(_$LoadAllImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CmsContentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadAllImpl implements _LoadAll {
  const _$LoadAllImpl();

  @override
  String toString() {
    return 'CmsContentEvent.loadAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAll,
    required TResult Function(CmsBlockType blockType) loadBlock,
  }) {
    return loadAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAll,
    TResult? Function(CmsBlockType blockType)? loadBlock,
  }) {
    return loadAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(CmsBlockType blockType)? loadBlock,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_LoadBlock value) loadBlock,
  }) {
    return loadAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadBlock value)? loadBlock,
  }) {
    return loadAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadBlock value)? loadBlock,
    required TResult orElse(),
  }) {
    if (loadAll != null) {
      return loadAll(this);
    }
    return orElse();
  }
}

abstract class _LoadAll implements CmsContentEvent {
  const factory _LoadAll() = _$LoadAllImpl;
}

/// @nodoc
abstract class _$$LoadBlockImplCopyWith<$Res> {
  factory _$$LoadBlockImplCopyWith(
    _$LoadBlockImpl value,
    $Res Function(_$LoadBlockImpl) then,
  ) = __$$LoadBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CmsBlockType blockType});
}

/// @nodoc
class __$$LoadBlockImplCopyWithImpl<$Res>
    extends _$CmsContentEventCopyWithImpl<$Res, _$LoadBlockImpl>
    implements _$$LoadBlockImplCopyWith<$Res> {
  __$$LoadBlockImplCopyWithImpl(
    _$LoadBlockImpl _value,
    $Res Function(_$LoadBlockImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CmsContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? blockType = null}) {
    return _then(
      _$LoadBlockImpl(
        blockType:
            null == blockType
                ? _value.blockType
                : blockType // ignore: cast_nullable_to_non_nullable
                    as CmsBlockType,
      ),
    );
  }
}

/// @nodoc

class _$LoadBlockImpl implements _LoadBlock {
  const _$LoadBlockImpl({required this.blockType});

  @override
  final CmsBlockType blockType;

  @override
  String toString() {
    return 'CmsContentEvent.loadBlock(blockType: $blockType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadBlockImpl &&
            (identical(other.blockType, blockType) ||
                other.blockType == blockType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockType);

  /// Create a copy of CmsContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadBlockImplCopyWith<_$LoadBlockImpl> get copyWith =>
      __$$LoadBlockImplCopyWithImpl<_$LoadBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAll,
    required TResult Function(CmsBlockType blockType) loadBlock,
  }) {
    return loadBlock(blockType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAll,
    TResult? Function(CmsBlockType blockType)? loadBlock,
  }) {
    return loadBlock?.call(blockType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAll,
    TResult Function(CmsBlockType blockType)? loadBlock,
    required TResult orElse(),
  }) {
    if (loadBlock != null) {
      return loadBlock(blockType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAll value) loadAll,
    required TResult Function(_LoadBlock value) loadBlock,
  }) {
    return loadBlock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAll value)? loadAll,
    TResult? Function(_LoadBlock value)? loadBlock,
  }) {
    return loadBlock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAll value)? loadAll,
    TResult Function(_LoadBlock value)? loadBlock,
    required TResult orElse(),
  }) {
    if (loadBlock != null) {
      return loadBlock(this);
    }
    return orElse();
  }
}

abstract class _LoadBlock implements CmsContentEvent {
  const factory _LoadBlock({required final CmsBlockType blockType}) =
      _$LoadBlockImpl;

  CmsBlockType get blockType;

  /// Create a copy of CmsContentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadBlockImplCopyWith<_$LoadBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CmsContentState {
  CmsBlockEntity? get productOffer => throw _privateConstructorUsedError;
  CmsBlockEntity? get priceGuarantee => throw _privateConstructorUsedError;
  CmsBlockEntity? get priceGuaranteeTc => throw _privateConstructorUsedError;
  CmsBlockEntity? get pickabooVerified => throw _privateConstructorUsedError;
  CmsBlockEntity? get expressDelivery => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  AppErrorEntity? get error => throw _privateConstructorUsedError;

  /// Create a copy of CmsContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CmsContentStateCopyWith<CmsContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CmsContentStateCopyWith<$Res> {
  factory $CmsContentStateCopyWith(
    CmsContentState value,
    $Res Function(CmsContentState) then,
  ) = _$CmsContentStateCopyWithImpl<$Res, CmsContentState>;
  @useResult
  $Res call({
    CmsBlockEntity? productOffer,
    CmsBlockEntity? priceGuarantee,
    CmsBlockEntity? priceGuaranteeTc,
    CmsBlockEntity? pickabooVerified,
    CmsBlockEntity? expressDelivery,
    bool isLoading,
    AppErrorEntity? error,
  });
}

/// @nodoc
class _$CmsContentStateCopyWithImpl<$Res, $Val extends CmsContentState>
    implements $CmsContentStateCopyWith<$Res> {
  _$CmsContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CmsContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productOffer = freezed,
    Object? priceGuarantee = freezed,
    Object? priceGuaranteeTc = freezed,
    Object? pickabooVerified = freezed,
    Object? expressDelivery = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            productOffer:
                freezed == productOffer
                    ? _value.productOffer
                    : productOffer // ignore: cast_nullable_to_non_nullable
                        as CmsBlockEntity?,
            priceGuarantee:
                freezed == priceGuarantee
                    ? _value.priceGuarantee
                    : priceGuarantee // ignore: cast_nullable_to_non_nullable
                        as CmsBlockEntity?,
            priceGuaranteeTc:
                freezed == priceGuaranteeTc
                    ? _value.priceGuaranteeTc
                    : priceGuaranteeTc // ignore: cast_nullable_to_non_nullable
                        as CmsBlockEntity?,
            pickabooVerified:
                freezed == pickabooVerified
                    ? _value.pickabooVerified
                    : pickabooVerified // ignore: cast_nullable_to_non_nullable
                        as CmsBlockEntity?,
            expressDelivery:
                freezed == expressDelivery
                    ? _value.expressDelivery
                    : expressDelivery // ignore: cast_nullable_to_non_nullable
                        as CmsBlockEntity?,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as AppErrorEntity?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CmsContentStateImplCopyWith<$Res>
    implements $CmsContentStateCopyWith<$Res> {
  factory _$$CmsContentStateImplCopyWith(
    _$CmsContentStateImpl value,
    $Res Function(_$CmsContentStateImpl) then,
  ) = __$$CmsContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CmsBlockEntity? productOffer,
    CmsBlockEntity? priceGuarantee,
    CmsBlockEntity? priceGuaranteeTc,
    CmsBlockEntity? pickabooVerified,
    CmsBlockEntity? expressDelivery,
    bool isLoading,
    AppErrorEntity? error,
  });
}

/// @nodoc
class __$$CmsContentStateImplCopyWithImpl<$Res>
    extends _$CmsContentStateCopyWithImpl<$Res, _$CmsContentStateImpl>
    implements _$$CmsContentStateImplCopyWith<$Res> {
  __$$CmsContentStateImplCopyWithImpl(
    _$CmsContentStateImpl _value,
    $Res Function(_$CmsContentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CmsContentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productOffer = freezed,
    Object? priceGuarantee = freezed,
    Object? priceGuaranteeTc = freezed,
    Object? pickabooVerified = freezed,
    Object? expressDelivery = freezed,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$CmsContentStateImpl(
        productOffer:
            freezed == productOffer
                ? _value.productOffer
                : productOffer // ignore: cast_nullable_to_non_nullable
                    as CmsBlockEntity?,
        priceGuarantee:
            freezed == priceGuarantee
                ? _value.priceGuarantee
                : priceGuarantee // ignore: cast_nullable_to_non_nullable
                    as CmsBlockEntity?,
        priceGuaranteeTc:
            freezed == priceGuaranteeTc
                ? _value.priceGuaranteeTc
                : priceGuaranteeTc // ignore: cast_nullable_to_non_nullable
                    as CmsBlockEntity?,
        pickabooVerified:
            freezed == pickabooVerified
                ? _value.pickabooVerified
                : pickabooVerified // ignore: cast_nullable_to_non_nullable
                    as CmsBlockEntity?,
        expressDelivery:
            freezed == expressDelivery
                ? _value.expressDelivery
                : expressDelivery // ignore: cast_nullable_to_non_nullable
                    as CmsBlockEntity?,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity?,
      ),
    );
  }
}

/// @nodoc

class _$CmsContentStateImpl implements _CmsContentState {
  const _$CmsContentStateImpl({
    this.productOffer,
    this.priceGuarantee,
    this.priceGuaranteeTc,
    this.pickabooVerified,
    this.expressDelivery,
    required this.isLoading,
    this.error,
  });

  @override
  final CmsBlockEntity? productOffer;
  @override
  final CmsBlockEntity? priceGuarantee;
  @override
  final CmsBlockEntity? priceGuaranteeTc;
  @override
  final CmsBlockEntity? pickabooVerified;
  @override
  final CmsBlockEntity? expressDelivery;
  @override
  final bool isLoading;
  @override
  final AppErrorEntity? error;

  @override
  String toString() {
    return 'CmsContentState(productOffer: $productOffer, priceGuarantee: $priceGuarantee, priceGuaranteeTc: $priceGuaranteeTc, pickabooVerified: $pickabooVerified, expressDelivery: $expressDelivery, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CmsContentStateImpl &&
            (identical(other.productOffer, productOffer) ||
                other.productOffer == productOffer) &&
            (identical(other.priceGuarantee, priceGuarantee) ||
                other.priceGuarantee == priceGuarantee) &&
            (identical(other.priceGuaranteeTc, priceGuaranteeTc) ||
                other.priceGuaranteeTc == priceGuaranteeTc) &&
            (identical(other.pickabooVerified, pickabooVerified) ||
                other.pickabooVerified == pickabooVerified) &&
            (identical(other.expressDelivery, expressDelivery) ||
                other.expressDelivery == expressDelivery) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    productOffer,
    priceGuarantee,
    priceGuaranteeTc,
    pickabooVerified,
    expressDelivery,
    isLoading,
    error,
  );

  /// Create a copy of CmsContentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CmsContentStateImplCopyWith<_$CmsContentStateImpl> get copyWith =>
      __$$CmsContentStateImplCopyWithImpl<_$CmsContentStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CmsContentState implements CmsContentState {
  const factory _CmsContentState({
    final CmsBlockEntity? productOffer,
    final CmsBlockEntity? priceGuarantee,
    final CmsBlockEntity? priceGuaranteeTc,
    final CmsBlockEntity? pickabooVerified,
    final CmsBlockEntity? expressDelivery,
    required final bool isLoading,
    final AppErrorEntity? error,
  }) = _$CmsContentStateImpl;

  @override
  CmsBlockEntity? get productOffer;
  @override
  CmsBlockEntity? get priceGuarantee;
  @override
  CmsBlockEntity? get priceGuaranteeTc;
  @override
  CmsBlockEntity? get pickabooVerified;
  @override
  CmsBlockEntity? get expressDelivery;
  @override
  bool get isLoading;
  @override
  AppErrorEntity? get error;

  /// Create a copy of CmsContentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CmsContentStateImplCopyWith<_$CmsContentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
