// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_cart_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateCartItemRequest _$UpdateCartItemRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateCartItemRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateCartItemRequest {
  @JsonKey(name: "cartItem")
  CartItemUpdateRequest get cartItem => throw _privateConstructorUsedError;

  /// Serializes this UpdateCartItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateCartItemRequestCopyWith<UpdateCartItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCartItemRequestCopyWith<$Res> {
  factory $UpdateCartItemRequestCopyWith(
    UpdateCartItemRequest value,
    $Res Function(UpdateCartItemRequest) then,
  ) = _$UpdateCartItemRequestCopyWithImpl<$Res, UpdateCartItemRequest>;
  @useResult
  $Res call({@JsonKey(name: "cartItem") CartItemUpdateRequest cartItem});

  $CartItemUpdateRequestCopyWith<$Res> get cartItem;
}

/// @nodoc
class _$UpdateCartItemRequestCopyWithImpl<
  $Res,
  $Val extends UpdateCartItemRequest
>
    implements $UpdateCartItemRequestCopyWith<$Res> {
  _$UpdateCartItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartItem = null}) {
    return _then(
      _value.copyWith(
            cartItem:
                null == cartItem
                    ? _value.cartItem
                    : cartItem // ignore: cast_nullable_to_non_nullable
                        as CartItemUpdateRequest,
          )
          as $Val,
    );
  }

  /// Create a copy of UpdateCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemUpdateRequestCopyWith<$Res> get cartItem {
    return $CartItemUpdateRequestCopyWith<$Res>(_value.cartItem, (value) {
      return _then(_value.copyWith(cartItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateCartItemRequestImplCopyWith<$Res>
    implements $UpdateCartItemRequestCopyWith<$Res> {
  factory _$$UpdateCartItemRequestImplCopyWith(
    _$UpdateCartItemRequestImpl value,
    $Res Function(_$UpdateCartItemRequestImpl) then,
  ) = __$$UpdateCartItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "cartItem") CartItemUpdateRequest cartItem});

  @override
  $CartItemUpdateRequestCopyWith<$Res> get cartItem;
}

/// @nodoc
class __$$UpdateCartItemRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateCartItemRequestCopyWithImpl<$Res, _$UpdateCartItemRequestImpl>
    implements _$$UpdateCartItemRequestImplCopyWith<$Res> {
  __$$UpdateCartItemRequestImplCopyWithImpl(
    _$UpdateCartItemRequestImpl _value,
    $Res Function(_$UpdateCartItemRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartItem = null}) {
    return _then(
      _$UpdateCartItemRequestImpl(
        cartItem:
            null == cartItem
                ? _value.cartItem
                : cartItem // ignore: cast_nullable_to_non_nullable
                    as CartItemUpdateRequest,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateCartItemRequestImpl implements _UpdateCartItemRequest {
  const _$UpdateCartItemRequestImpl({
    @JsonKey(name: "cartItem") required this.cartItem,
  });

  factory _$UpdateCartItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateCartItemRequestImplFromJson(json);

  @override
  @JsonKey(name: "cartItem")
  final CartItemUpdateRequest cartItem;

  @override
  String toString() {
    return 'UpdateCartItemRequest(cartItem: $cartItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCartItemRequestImpl &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cartItem);

  /// Create a copy of UpdateCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCartItemRequestImplCopyWith<_$UpdateCartItemRequestImpl>
  get copyWith =>
      __$$UpdateCartItemRequestImplCopyWithImpl<_$UpdateCartItemRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateCartItemRequestImplToJson(this);
  }
}

abstract class _UpdateCartItemRequest implements UpdateCartItemRequest {
  const factory _UpdateCartItemRequest({
    @JsonKey(name: "cartItem") required final CartItemUpdateRequest cartItem,
  }) = _$UpdateCartItemRequestImpl;

  factory _UpdateCartItemRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateCartItemRequestImpl.fromJson;

  @override
  @JsonKey(name: "cartItem")
  CartItemUpdateRequest get cartItem;

  /// Create a copy of UpdateCartItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCartItemRequestImplCopyWith<_$UpdateCartItemRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CartItemUpdateRequest _$CartItemUpdateRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CartItemUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$CartItemUpdateRequest {
  @JsonKey(name: "item_id")
  int get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: "qty")
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: "quote_id")
  String get quoteId => throw _privateConstructorUsedError;

  /// Serializes this CartItemUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemUpdateRequestCopyWith<CartItemUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemUpdateRequestCopyWith<$Res> {
  factory $CartItemUpdateRequestCopyWith(
    CartItemUpdateRequest value,
    $Res Function(CartItemUpdateRequest) then,
  ) = _$CartItemUpdateRequestCopyWithImpl<$Res, CartItemUpdateRequest>;
  @useResult
  $Res call({
    @JsonKey(name: "item_id") int itemId,
    @JsonKey(name: "qty") int qty,
    @JsonKey(name: "quote_id") String quoteId,
  });
}

/// @nodoc
class _$CartItemUpdateRequestCopyWithImpl<
  $Res,
  $Val extends CartItemUpdateRequest
>
    implements $CartItemUpdateRequestCopyWith<$Res> {
  _$CartItemUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? qty = null,
    Object? quoteId = null,
  }) {
    return _then(
      _value.copyWith(
            itemId:
                null == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as int,
            qty:
                null == qty
                    ? _value.qty
                    : qty // ignore: cast_nullable_to_non_nullable
                        as int,
            quoteId:
                null == quoteId
                    ? _value.quoteId
                    : quoteId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartItemUpdateRequestImplCopyWith<$Res>
    implements $CartItemUpdateRequestCopyWith<$Res> {
  factory _$$CartItemUpdateRequestImplCopyWith(
    _$CartItemUpdateRequestImpl value,
    $Res Function(_$CartItemUpdateRequestImpl) then,
  ) = __$$CartItemUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "item_id") int itemId,
    @JsonKey(name: "qty") int qty,
    @JsonKey(name: "quote_id") String quoteId,
  });
}

/// @nodoc
class __$$CartItemUpdateRequestImplCopyWithImpl<$Res>
    extends
        _$CartItemUpdateRequestCopyWithImpl<$Res, _$CartItemUpdateRequestImpl>
    implements _$$CartItemUpdateRequestImplCopyWith<$Res> {
  __$$CartItemUpdateRequestImplCopyWithImpl(
    _$CartItemUpdateRequestImpl _value,
    $Res Function(_$CartItemUpdateRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? qty = null,
    Object? quoteId = null,
  }) {
    return _then(
      _$CartItemUpdateRequestImpl(
        itemId:
            null == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as int,
        qty:
            null == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                    as int,
        quoteId:
            null == quoteId
                ? _value.quoteId
                : quoteId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemUpdateRequestImpl implements _CartItemUpdateRequest {
  const _$CartItemUpdateRequestImpl({
    @JsonKey(name: "item_id") required this.itemId,
    @JsonKey(name: "qty") required this.qty,
    @JsonKey(name: "quote_id") required this.quoteId,
  });

  factory _$CartItemUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemUpdateRequestImplFromJson(json);

  @override
  @JsonKey(name: "item_id")
  final int itemId;
  @override
  @JsonKey(name: "qty")
  final int qty;
  @override
  @JsonKey(name: "quote_id")
  final String quoteId;

  @override
  String toString() {
    return 'CartItemUpdateRequest(itemId: $itemId, qty: $qty, quoteId: $quoteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemUpdateRequestImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, qty, quoteId);

  /// Create a copy of CartItemUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemUpdateRequestImplCopyWith<_$CartItemUpdateRequestImpl>
  get copyWith =>
      __$$CartItemUpdateRequestImplCopyWithImpl<_$CartItemUpdateRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemUpdateRequestImplToJson(this);
  }
}

abstract class _CartItemUpdateRequest implements CartItemUpdateRequest {
  const factory _CartItemUpdateRequest({
    @JsonKey(name: "item_id") required final int itemId,
    @JsonKey(name: "qty") required final int qty,
    @JsonKey(name: "quote_id") required final String quoteId,
  }) = _$CartItemUpdateRequestImpl;

  factory _CartItemUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$CartItemUpdateRequestImpl.fromJson;

  @override
  @JsonKey(name: "item_id")
  int get itemId;
  @override
  @JsonKey(name: "qty")
  int get qty;
  @override
  @JsonKey(name: "quote_id")
  String get quoteId;

  /// Create a copy of CartItemUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemUpdateRequestImplCopyWith<_$CartItemUpdateRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
