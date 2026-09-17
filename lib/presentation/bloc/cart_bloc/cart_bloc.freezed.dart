// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetCartImplCopyWith<$Res> {
  factory _$$GetCartImplCopyWith(
    _$GetCartImpl value,
    $Res Function(_$GetCartImpl) then,
  ) = __$$GetCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$GetCartImpl>
    implements _$$GetCartImplCopyWith<$Res> {
  __$$GetCartImplCopyWithImpl(
    _$GetCartImpl _value,
    $Res Function(_$GetCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetCartImpl with DiagnosticableTreeMixin implements _GetCart {
  const _$GetCartImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.getCart()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartEvent.getCart'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return getCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return getCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return getCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return getCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart(this);
    }
    return orElse();
  }
}

abstract class _GetCart implements CartEvent {
  const factory _GetCart() = _$GetCartImpl;
}

/// @nodoc
abstract class _$$RefreshCartImplCopyWith<$Res> {
  factory _$$RefreshCartImplCopyWith(
    _$RefreshCartImpl value,
    $Res Function(_$RefreshCartImpl) then,
  ) = __$$RefreshCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RefreshCartImpl>
    implements _$$RefreshCartImplCopyWith<$Res> {
  __$$RefreshCartImplCopyWithImpl(
    _$RefreshCartImpl _value,
    $Res Function(_$RefreshCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshCartImpl with DiagnosticableTreeMixin implements _RefreshCart {
  const _$RefreshCartImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.refreshCart()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartEvent.refreshCart'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return refreshCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return refreshCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (refreshCart != null) {
      return refreshCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return refreshCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return refreshCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (refreshCart != null) {
      return refreshCart(this);
    }
    return orElse();
  }
}

abstract class _RefreshCart implements CartEvent {
  const factory _RefreshCart() = _$RefreshCartImpl;
}

/// @nodoc
abstract class _$$AddToCartImplCopyWith<$Res> {
  factory _$$AddToCartImplCopyWith(
    _$AddToCartImpl value,
    $Res Function(_$AddToCartImpl) then,
  ) = __$$AddToCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String sku,
    int qty,
    String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  });
}

/// @nodoc
class __$$AddToCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddToCartImpl>
    implements _$$AddToCartImplCopyWith<$Res> {
  __$$AddToCartImplCopyWithImpl(
    _$AddToCartImpl _value,
    $Res Function(_$AddToCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = null,
    Object? qty = null,
    Object? quoteId = null,
    Object? productType = freezed,
    Object? configurableOptions = freezed,
  }) {
    return _then(
      _$AddToCartImpl(
        sku:
            null == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String,
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
        productType:
            freezed == productType
                ? _value.productType
                : productType // ignore: cast_nullable_to_non_nullable
                    as String?,
        configurableOptions:
            freezed == configurableOptions
                ? _value._configurableOptions
                : configurableOptions // ignore: cast_nullable_to_non_nullable
                    as List<ConfigurableItemOptionEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$AddToCartImpl with DiagnosticableTreeMixin implements _AddToCart {
  const _$AddToCartImpl({
    required this.sku,
    required this.qty,
    required this.quoteId,
    this.productType,
    final List<ConfigurableItemOptionEntity>? configurableOptions,
  }) : _configurableOptions = configurableOptions;

  @override
  final String sku;
  @override
  final int qty;
  @override
  final String quoteId;
  @override
  final String? productType;
  final List<ConfigurableItemOptionEntity>? _configurableOptions;
  @override
  List<ConfigurableItemOptionEntity>? get configurableOptions {
    final value = _configurableOptions;
    if (value == null) return null;
    if (_configurableOptions is EqualUnmodifiableListView)
      return _configurableOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.addToCart(sku: $sku, qty: $qty, quoteId: $quoteId, productType: $productType, configurableOptions: $configurableOptions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.addToCart'))
      ..add(DiagnosticsProperty('sku', sku))
      ..add(DiagnosticsProperty('qty', qty))
      ..add(DiagnosticsProperty('quoteId', quoteId))
      ..add(DiagnosticsProperty('productType', productType))
      ..add(DiagnosticsProperty('configurableOptions', configurableOptions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartImpl &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            const DeepCollectionEquality().equals(
              other._configurableOptions,
              _configurableOptions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sku,
    qty,
    quoteId,
    productType,
    const DeepCollectionEquality().hash(_configurableOptions),
  );

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      __$$AddToCartImplCopyWithImpl<_$AddToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return addToCart(sku, qty, quoteId, productType, configurableOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return addToCart?.call(sku, qty, quoteId, productType, configurableOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(sku, qty, quoteId, productType, configurableOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class _AddToCart implements CartEvent {
  const factory _AddToCart({
    required final String sku,
    required final int qty,
    required final String quoteId,
    final String? productType,
    final List<ConfigurableItemOptionEntity>? configurableOptions,
  }) = _$AddToCartImpl;

  String get sku;
  int get qty;
  String get quoteId;
  String? get productType;
  List<ConfigurableItemOptionEntity>? get configurableOptions;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemSmartImplCopyWith<$Res> {
  factory _$$AddItemSmartImplCopyWith(
    _$AddItemSmartImpl value,
    $Res Function(_$AddItemSmartImpl) then,
  ) = __$$AddItemSmartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String sku,
    int qty,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  });
}

/// @nodoc
class __$$AddItemSmartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddItemSmartImpl>
    implements _$$AddItemSmartImplCopyWith<$Res> {
  __$$AddItemSmartImplCopyWithImpl(
    _$AddItemSmartImpl _value,
    $Res Function(_$AddItemSmartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sku = null,
    Object? qty = null,
    Object? productType = freezed,
    Object? configurableOptions = freezed,
  }) {
    return _then(
      _$AddItemSmartImpl(
        sku:
            null == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String,
        qty:
            null == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                    as int,
        productType:
            freezed == productType
                ? _value.productType
                : productType // ignore: cast_nullable_to_non_nullable
                    as String?,
        configurableOptions:
            freezed == configurableOptions
                ? _value._configurableOptions
                : configurableOptions // ignore: cast_nullable_to_non_nullable
                    as List<ConfigurableItemOptionEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$AddItemSmartImpl with DiagnosticableTreeMixin implements _AddItemSmart {
  const _$AddItemSmartImpl({
    required this.sku,
    required this.qty,
    this.productType,
    final List<ConfigurableItemOptionEntity>? configurableOptions,
  }) : _configurableOptions = configurableOptions;

  @override
  final String sku;
  @override
  final int qty;
  @override
  final String? productType;
  final List<ConfigurableItemOptionEntity>? _configurableOptions;
  @override
  List<ConfigurableItemOptionEntity>? get configurableOptions {
    final value = _configurableOptions;
    if (value == null) return null;
    if (_configurableOptions is EqualUnmodifiableListView)
      return _configurableOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.addItemSmart(sku: $sku, qty: $qty, productType: $productType, configurableOptions: $configurableOptions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.addItemSmart'))
      ..add(DiagnosticsProperty('sku', sku))
      ..add(DiagnosticsProperty('qty', qty))
      ..add(DiagnosticsProperty('productType', productType))
      ..add(DiagnosticsProperty('configurableOptions', configurableOptions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemSmartImpl &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            const DeepCollectionEquality().equals(
              other._configurableOptions,
              _configurableOptions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sku,
    qty,
    productType,
    const DeepCollectionEquality().hash(_configurableOptions),
  );

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemSmartImplCopyWith<_$AddItemSmartImpl> get copyWith =>
      __$$AddItemSmartImplCopyWithImpl<_$AddItemSmartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return addItemSmart(sku, qty, productType, configurableOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return addItemSmart?.call(sku, qty, productType, configurableOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (addItemSmart != null) {
      return addItemSmart(sku, qty, productType, configurableOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return addItemSmart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return addItemSmart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (addItemSmart != null) {
      return addItemSmart(this);
    }
    return orElse();
  }
}

abstract class _AddItemSmart implements CartEvent {
  const factory _AddItemSmart({
    required final String sku,
    required final int qty,
    final String? productType,
    final List<ConfigurableItemOptionEntity>? configurableOptions,
  }) = _$AddItemSmartImpl;

  String get sku;
  int get qty;
  String? get productType;
  List<ConfigurableItemOptionEntity>? get configurableOptions;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddItemSmartImplCopyWith<_$AddItemSmartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemQuantityImplCopyWith<$Res> {
  factory _$$UpdateItemQuantityImplCopyWith(
    _$UpdateItemQuantityImpl value,
    $Res Function(_$UpdateItemQuantityImpl) then,
  ) = __$$UpdateItemQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemId, int qty, String quoteId});
}

/// @nodoc
class __$$UpdateItemQuantityImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateItemQuantityImpl>
    implements _$$UpdateItemQuantityImplCopyWith<$Res> {
  __$$UpdateItemQuantityImplCopyWithImpl(
    _$UpdateItemQuantityImpl _value,
    $Res Function(_$UpdateItemQuantityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? qty = null,
    Object? quoteId = null,
  }) {
    return _then(
      _$UpdateItemQuantityImpl(
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

class _$UpdateItemQuantityImpl
    with DiagnosticableTreeMixin
    implements _UpdateItemQuantity {
  const _$UpdateItemQuantityImpl({
    required this.itemId,
    required this.qty,
    required this.quoteId,
  });

  @override
  final int itemId;
  @override
  final int qty;
  @override
  final String quoteId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.updateItemQuantity(itemId: $itemId, qty: $qty, quoteId: $quoteId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.updateItemQuantity'))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('qty', qty))
      ..add(DiagnosticsProperty('quoteId', quoteId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemQuantityImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId, qty, quoteId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemQuantityImplCopyWith<_$UpdateItemQuantityImpl> get copyWith =>
      __$$UpdateItemQuantityImplCopyWithImpl<_$UpdateItemQuantityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return updateItemQuantity(itemId, qty, quoteId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return updateItemQuantity?.call(itemId, qty, quoteId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(itemId, qty, quoteId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return updateItemQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return updateItemQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemQuantity implements CartEvent {
  const factory _UpdateItemQuantity({
    required final int itemId,
    required final int qty,
    required final String quoteId,
  }) = _$UpdateItemQuantityImpl;

  int get itemId;
  int get qty;
  String get quoteId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateItemQuantityImplCopyWith<_$UpdateItemQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemImplCopyWith<$Res> {
  factory _$$RemoveItemImplCopyWith(
    _$RemoveItemImpl value,
    $Res Function(_$RemoveItemImpl) then,
  ) = __$$RemoveItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int itemId});
}

/// @nodoc
class __$$RemoveItemImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveItemImpl>
    implements _$$RemoveItemImplCopyWith<$Res> {
  __$$RemoveItemImplCopyWithImpl(
    _$RemoveItemImpl _value,
    $Res Function(_$RemoveItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? itemId = null}) {
    return _then(
      _$RemoveItemImpl(
        itemId:
            null == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$RemoveItemImpl with DiagnosticableTreeMixin implements _RemoveItem {
  const _$RemoveItemImpl({required this.itemId});

  @override
  final int itemId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.removeItem(itemId: $itemId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.removeItem'))
      ..add(DiagnosticsProperty('itemId', itemId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      __$$RemoveItemImplCopyWithImpl<_$RemoveItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return removeItem(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return removeItem?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return removeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return removeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(this);
    }
    return orElse();
  }
}

abstract class _RemoveItem implements CartEvent {
  const factory _RemoveItem({required final int itemId}) = _$RemoveItemImpl;

  int get itemId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyCartImplCopyWith<$Res> {
  factory _$$EmptyCartImplCopyWith(
    _$EmptyCartImpl value,
    $Res Function(_$EmptyCartImpl) then,
  ) = __$$EmptyCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String quoteId});
}

/// @nodoc
class __$$EmptyCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$EmptyCartImpl>
    implements _$$EmptyCartImplCopyWith<$Res> {
  __$$EmptyCartImplCopyWithImpl(
    _$EmptyCartImpl _value,
    $Res Function(_$EmptyCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? quoteId = null}) {
    return _then(
      _$EmptyCartImpl(
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

class _$EmptyCartImpl with DiagnosticableTreeMixin implements _EmptyCart {
  const _$EmptyCartImpl({required this.quoteId});

  @override
  final String quoteId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.emptyCart(quoteId: $quoteId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.emptyCart'))
      ..add(DiagnosticsProperty('quoteId', quoteId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyCartImpl &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quoteId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyCartImplCopyWith<_$EmptyCartImpl> get copyWith =>
      __$$EmptyCartImplCopyWithImpl<_$EmptyCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return emptyCart(quoteId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return emptyCart?.call(quoteId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (emptyCart != null) {
      return emptyCart(quoteId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return emptyCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return emptyCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (emptyCart != null) {
      return emptyCart(this);
    }
    return orElse();
  }
}

abstract class _EmptyCart implements CartEvent {
  const factory _EmptyCart({required final String quoteId}) = _$EmptyCartImpl;

  String get quoteId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmptyCartImplCopyWith<_$EmptyCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyCouponImplCopyWith<$Res> {
  factory _$$ApplyCouponImplCopyWith(
    _$ApplyCouponImpl value,
    $Res Function(_$ApplyCouponImpl) then,
  ) = __$$ApplyCouponImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartId, String coupon});
}

/// @nodoc
class __$$ApplyCouponImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ApplyCouponImpl>
    implements _$$ApplyCouponImplCopyWith<$Res> {
  __$$ApplyCouponImplCopyWithImpl(
    _$ApplyCouponImpl _value,
    $Res Function(_$ApplyCouponImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartId = null, Object? coupon = null}) {
    return _then(
      _$ApplyCouponImpl(
        cartId:
            null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                    as String,
        coupon:
            null == coupon
                ? _value.coupon
                : coupon // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ApplyCouponImpl with DiagnosticableTreeMixin implements _ApplyCoupon {
  const _$ApplyCouponImpl({required this.cartId, required this.coupon});

  @override
  final String cartId;
  @override
  final String coupon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.applyCoupon(cartId: $cartId, coupon: $coupon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.applyCoupon'))
      ..add(DiagnosticsProperty('cartId', cartId))
      ..add(DiagnosticsProperty('coupon', coupon));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyCouponImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.coupon, coupon) || other.coupon == coupon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartId, coupon);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyCouponImplCopyWith<_$ApplyCouponImpl> get copyWith =>
      __$$ApplyCouponImplCopyWithImpl<_$ApplyCouponImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return applyCoupon(cartId, coupon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return applyCoupon?.call(cartId, coupon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (applyCoupon != null) {
      return applyCoupon(cartId, coupon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return applyCoupon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return applyCoupon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (applyCoupon != null) {
      return applyCoupon(this);
    }
    return orElse();
  }
}

abstract class _ApplyCoupon implements CartEvent {
  const factory _ApplyCoupon({
    required final String cartId,
    required final String coupon,
  }) = _$ApplyCouponImpl;

  String get cartId;
  String get coupon;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyCouponImplCopyWith<_$ApplyCouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveCouponImplCopyWith<$Res> {
  factory _$$RemoveCouponImplCopyWith(
    _$RemoveCouponImpl value,
    $Res Function(_$RemoveCouponImpl) then,
  ) = __$$RemoveCouponImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartId});
}

/// @nodoc
class __$$RemoveCouponImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveCouponImpl>
    implements _$$RemoveCouponImplCopyWith<$Res> {
  __$$RemoveCouponImplCopyWithImpl(
    _$RemoveCouponImpl _value,
    $Res Function(_$RemoveCouponImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartId = null}) {
    return _then(
      _$RemoveCouponImpl(
        cartId:
            null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveCouponImpl with DiagnosticableTreeMixin implements _RemoveCoupon {
  const _$RemoveCouponImpl({required this.cartId});

  @override
  final String cartId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.removeCoupon(cartId: $cartId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.removeCoupon'))
      ..add(DiagnosticsProperty('cartId', cartId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCouponImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCouponImplCopyWith<_$RemoveCouponImpl> get copyWith =>
      __$$RemoveCouponImplCopyWithImpl<_$RemoveCouponImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return removeCoupon(cartId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return removeCoupon?.call(cartId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (removeCoupon != null) {
      return removeCoupon(cartId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return removeCoupon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return removeCoupon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (removeCoupon != null) {
      return removeCoupon(this);
    }
    return orElse();
  }
}

abstract class _RemoveCoupon implements CartEvent {
  const factory _RemoveCoupon({required final String cartId}) =
      _$RemoveCouponImpl;

  String get cartId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveCouponImplCopyWith<_$RemoveCouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApplyRewardPointsImplCopyWith<$Res> {
  factory _$$ApplyRewardPointsImplCopyWith(
    _$ApplyRewardPointsImpl value,
    $Res Function(_$ApplyRewardPointsImpl) then,
  ) = __$$ApplyRewardPointsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartId, int pointAmount});
}

/// @nodoc
class __$$ApplyRewardPointsImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ApplyRewardPointsImpl>
    implements _$$ApplyRewardPointsImplCopyWith<$Res> {
  __$$ApplyRewardPointsImplCopyWithImpl(
    _$ApplyRewardPointsImpl _value,
    $Res Function(_$ApplyRewardPointsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartId = null, Object? pointAmount = null}) {
    return _then(
      _$ApplyRewardPointsImpl(
        cartId:
            null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                    as String,
        pointAmount:
            null == pointAmount
                ? _value.pointAmount
                : pointAmount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$ApplyRewardPointsImpl
    with DiagnosticableTreeMixin
    implements _ApplyRewardPoints {
  const _$ApplyRewardPointsImpl({
    required this.cartId,
    required this.pointAmount,
  });

  @override
  final String cartId;
  @override
  final int pointAmount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.applyRewardPoints(cartId: $cartId, pointAmount: $pointAmount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.applyRewardPoints'))
      ..add(DiagnosticsProperty('cartId', cartId))
      ..add(DiagnosticsProperty('pointAmount', pointAmount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyRewardPointsImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.pointAmount, pointAmount) ||
                other.pointAmount == pointAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartId, pointAmount);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyRewardPointsImplCopyWith<_$ApplyRewardPointsImpl> get copyWith =>
      __$$ApplyRewardPointsImplCopyWithImpl<_$ApplyRewardPointsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return applyRewardPoints(cartId, pointAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return applyRewardPoints?.call(cartId, pointAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (applyRewardPoints != null) {
      return applyRewardPoints(cartId, pointAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return applyRewardPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return applyRewardPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (applyRewardPoints != null) {
      return applyRewardPoints(this);
    }
    return orElse();
  }
}

abstract class _ApplyRewardPoints implements CartEvent {
  const factory _ApplyRewardPoints({
    required final String cartId,
    required final int pointAmount,
  }) = _$ApplyRewardPointsImpl;

  String get cartId;
  int get pointAmount;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyRewardPointsImplCopyWith<_$ApplyRewardPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveRewardPointsImplCopyWith<$Res> {
  factory _$$RemoveRewardPointsImplCopyWith(
    _$RemoveRewardPointsImpl value,
    $Res Function(_$RemoveRewardPointsImpl) then,
  ) = __$$RemoveRewardPointsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartId});
}

/// @nodoc
class __$$RemoveRewardPointsImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveRewardPointsImpl>
    implements _$$RemoveRewardPointsImplCopyWith<$Res> {
  __$$RemoveRewardPointsImplCopyWithImpl(
    _$RemoveRewardPointsImpl _value,
    $Res Function(_$RemoveRewardPointsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartId = null}) {
    return _then(
      _$RemoveRewardPointsImpl(
        cartId:
            null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveRewardPointsImpl
    with DiagnosticableTreeMixin
    implements _RemoveRewardPoints {
  const _$RemoveRewardPointsImpl({required this.cartId});

  @override
  final String cartId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.removeRewardPoints(cartId: $cartId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.removeRewardPoints'))
      ..add(DiagnosticsProperty('cartId', cartId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveRewardPointsImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveRewardPointsImplCopyWith<_$RemoveRewardPointsImpl> get copyWith =>
      __$$RemoveRewardPointsImplCopyWithImpl<_$RemoveRewardPointsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return removeRewardPoints(cartId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return removeRewardPoints?.call(cartId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (removeRewardPoints != null) {
      return removeRewardPoints(cartId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return removeRewardPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return removeRewardPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (removeRewardPoints != null) {
      return removeRewardPoints(this);
    }
    return orElse();
  }
}

abstract class _RemoveRewardPoints implements CartEvent {
  const factory _RemoveRewardPoints({required final String cartId}) =
      _$RemoveRewardPointsImpl;

  String get cartId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveRewardPointsImplCopyWith<_$RemoveRewardPointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveForLaterImplCopyWith<$Res> {
  factory _$$SaveForLaterImplCopyWith(
    _$SaveForLaterImpl value,
    $Res Function(_$SaveForLaterImpl) then,
  ) = __$$SaveForLaterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int customerId, String cartId, int itemId});
}

/// @nodoc
class __$$SaveForLaterImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$SaveForLaterImpl>
    implements _$$SaveForLaterImplCopyWith<$Res> {
  __$$SaveForLaterImplCopyWithImpl(
    _$SaveForLaterImpl _value,
    $Res Function(_$SaveForLaterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? cartId = null,
    Object? itemId = null,
  }) {
    return _then(
      _$SaveForLaterImpl(
        customerId:
            null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                    as int,
        cartId:
            null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                    as String,
        itemId:
            null == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$SaveForLaterImpl with DiagnosticableTreeMixin implements _SaveForLater {
  const _$SaveForLaterImpl({
    required this.customerId,
    required this.cartId,
    required this.itemId,
  });

  @override
  final int customerId;
  @override
  final String cartId;
  @override
  final int itemId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.saveForLater(customerId: $customerId, cartId: $cartId, itemId: $itemId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.saveForLater'))
      ..add(DiagnosticsProperty('customerId', customerId))
      ..add(DiagnosticsProperty('cartId', cartId))
      ..add(DiagnosticsProperty('itemId', itemId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveForLaterImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerId, cartId, itemId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveForLaterImplCopyWith<_$SaveForLaterImpl> get copyWith =>
      __$$SaveForLaterImplCopyWithImpl<_$SaveForLaterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return saveForLater(customerId, cartId, itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return saveForLater?.call(customerId, cartId, itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (saveForLater != null) {
      return saveForLater(customerId, cartId, itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return saveForLater(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return saveForLater?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (saveForLater != null) {
      return saveForLater(this);
    }
    return orElse();
  }
}

abstract class _SaveForLater implements CartEvent {
  const factory _SaveForLater({
    required final int customerId,
    required final String cartId,
    required final int itemId,
  }) = _$SaveForLaterImpl;

  int get customerId;
  String get cartId;
  int get itemId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveForLaterImplCopyWith<_$SaveForLaterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateGuestCartImplCopyWith<$Res> {
  factory _$$CreateGuestCartImplCopyWith(
    _$CreateGuestCartImpl value,
    $Res Function(_$CreateGuestCartImpl) then,
  ) = __$$CreateGuestCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateGuestCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$CreateGuestCartImpl>
    implements _$$CreateGuestCartImplCopyWith<$Res> {
  __$$CreateGuestCartImplCopyWithImpl(
    _$CreateGuestCartImpl _value,
    $Res Function(_$CreateGuestCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateGuestCartImpl
    with DiagnosticableTreeMixin
    implements _CreateGuestCart {
  const _$CreateGuestCartImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.createGuestCart()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartEvent.createGuestCart'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateGuestCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return createGuestCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return createGuestCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (createGuestCart != null) {
      return createGuestCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return createGuestCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return createGuestCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (createGuestCart != null) {
      return createGuestCart(this);
    }
    return orElse();
  }
}

abstract class _CreateGuestCart implements CartEvent {
  const factory _CreateGuestCart() = _$CreateGuestCartImpl;
}

/// @nodoc
abstract class _$$AddToGuestCartImplCopyWith<$Res> {
  factory _$$AddToGuestCartImplCopyWith(
    _$AddToGuestCartImpl value,
    $Res Function(_$AddToGuestCartImpl) then,
  ) = __$$AddToGuestCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String guestCartId,
    String sku,
    int qty,
    String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  });
}

/// @nodoc
class __$$AddToGuestCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddToGuestCartImpl>
    implements _$$AddToGuestCartImplCopyWith<$Res> {
  __$$AddToGuestCartImplCopyWithImpl(
    _$AddToGuestCartImpl _value,
    $Res Function(_$AddToGuestCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guestCartId = null,
    Object? sku = null,
    Object? qty = null,
    Object? quoteId = null,
    Object? productType = freezed,
    Object? configurableOptions = freezed,
  }) {
    return _then(
      _$AddToGuestCartImpl(
        guestCartId:
            null == guestCartId
                ? _value.guestCartId
                : guestCartId // ignore: cast_nullable_to_non_nullable
                    as String,
        sku:
            null == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                    as String,
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
        productType:
            freezed == productType
                ? _value.productType
                : productType // ignore: cast_nullable_to_non_nullable
                    as String?,
        configurableOptions:
            freezed == configurableOptions
                ? _value._configurableOptions
                : configurableOptions // ignore: cast_nullable_to_non_nullable
                    as List<ConfigurableItemOptionEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$AddToGuestCartImpl
    with DiagnosticableTreeMixin
    implements _AddToGuestCart {
  const _$AddToGuestCartImpl({
    required this.guestCartId,
    required this.sku,
    required this.qty,
    required this.quoteId,
    this.productType,
    final List<ConfigurableItemOptionEntity>? configurableOptions,
  }) : _configurableOptions = configurableOptions;

  @override
  final String guestCartId;
  @override
  final String sku;
  @override
  final int qty;
  @override
  final String quoteId;
  @override
  final String? productType;
  final List<ConfigurableItemOptionEntity>? _configurableOptions;
  @override
  List<ConfigurableItemOptionEntity>? get configurableOptions {
    final value = _configurableOptions;
    if (value == null) return null;
    if (_configurableOptions is EqualUnmodifiableListView)
      return _configurableOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.addToGuestCart(guestCartId: $guestCartId, sku: $sku, qty: $qty, quoteId: $quoteId, productType: $productType, configurableOptions: $configurableOptions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.addToGuestCart'))
      ..add(DiagnosticsProperty('guestCartId', guestCartId))
      ..add(DiagnosticsProperty('sku', sku))
      ..add(DiagnosticsProperty('qty', qty))
      ..add(DiagnosticsProperty('quoteId', quoteId))
      ..add(DiagnosticsProperty('productType', productType))
      ..add(DiagnosticsProperty('configurableOptions', configurableOptions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToGuestCartImpl &&
            (identical(other.guestCartId, guestCartId) ||
                other.guestCartId == guestCartId) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.quoteId, quoteId) || other.quoteId == quoteId) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            const DeepCollectionEquality().equals(
              other._configurableOptions,
              _configurableOptions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    guestCartId,
    sku,
    qty,
    quoteId,
    productType,
    const DeepCollectionEquality().hash(_configurableOptions),
  );

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToGuestCartImplCopyWith<_$AddToGuestCartImpl> get copyWith =>
      __$$AddToGuestCartImplCopyWithImpl<_$AddToGuestCartImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return addToGuestCart(
      guestCartId,
      sku,
      qty,
      quoteId,
      productType,
      configurableOptions,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return addToGuestCart?.call(
      guestCartId,
      sku,
      qty,
      quoteId,
      productType,
      configurableOptions,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (addToGuestCart != null) {
      return addToGuestCart(
        guestCartId,
        sku,
        qty,
        quoteId,
        productType,
        configurableOptions,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return addToGuestCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return addToGuestCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (addToGuestCart != null) {
      return addToGuestCart(this);
    }
    return orElse();
  }
}

abstract class _AddToGuestCart implements CartEvent {
  const factory _AddToGuestCart({
    required final String guestCartId,
    required final String sku,
    required final int qty,
    required final String quoteId,
    final String? productType,
    final List<ConfigurableItemOptionEntity>? configurableOptions,
  }) = _$AddToGuestCartImpl;

  String get guestCartId;
  String get sku;
  int get qty;
  String get quoteId;
  String? get productType;
  List<ConfigurableItemOptionEntity>? get configurableOptions;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToGuestCartImplCopyWith<_$AddToGuestCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadGuestCartImplCopyWith<$Res> {
  factory _$$LoadGuestCartImplCopyWith(
    _$LoadGuestCartImpl value,
    $Res Function(_$LoadGuestCartImpl) then,
  ) = __$$LoadGuestCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String guestCartId});
}

/// @nodoc
class __$$LoadGuestCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$LoadGuestCartImpl>
    implements _$$LoadGuestCartImplCopyWith<$Res> {
  __$$LoadGuestCartImplCopyWithImpl(
    _$LoadGuestCartImpl _value,
    $Res Function(_$LoadGuestCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? guestCartId = null}) {
    return _then(
      _$LoadGuestCartImpl(
        guestCartId:
            null == guestCartId
                ? _value.guestCartId
                : guestCartId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadGuestCartImpl
    with DiagnosticableTreeMixin
    implements _LoadGuestCart {
  const _$LoadGuestCartImpl({required this.guestCartId});

  @override
  final String guestCartId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.loadGuestCart(guestCartId: $guestCartId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.loadGuestCart'))
      ..add(DiagnosticsProperty('guestCartId', guestCartId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadGuestCartImpl &&
            (identical(other.guestCartId, guestCartId) ||
                other.guestCartId == guestCartId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, guestCartId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadGuestCartImplCopyWith<_$LoadGuestCartImpl> get copyWith =>
      __$$LoadGuestCartImplCopyWithImpl<_$LoadGuestCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return loadGuestCart(guestCartId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return loadGuestCart?.call(guestCartId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (loadGuestCart != null) {
      return loadGuestCart(guestCartId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return loadGuestCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return loadGuestCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (loadGuestCart != null) {
      return loadGuestCart(this);
    }
    return orElse();
  }
}

abstract class _LoadGuestCart implements CartEvent {
  const factory _LoadGuestCart({required final String guestCartId}) =
      _$LoadGuestCartImpl;

  String get guestCartId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadGuestCartImplCopyWith<_$LoadGuestCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MergeGuestCartImplCopyWith<$Res> {
  factory _$$MergeGuestCartImplCopyWith(
    _$MergeGuestCartImpl value,
    $Res Function(_$MergeGuestCartImpl) then,
  ) = __$$MergeGuestCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String guestCartId});
}

/// @nodoc
class __$$MergeGuestCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$MergeGuestCartImpl>
    implements _$$MergeGuestCartImplCopyWith<$Res> {
  __$$MergeGuestCartImplCopyWithImpl(
    _$MergeGuestCartImpl _value,
    $Res Function(_$MergeGuestCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? guestCartId = null}) {
    return _then(
      _$MergeGuestCartImpl(
        guestCartId:
            null == guestCartId
                ? _value.guestCartId
                : guestCartId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$MergeGuestCartImpl
    with DiagnosticableTreeMixin
    implements _MergeGuestCart {
  const _$MergeGuestCartImpl({required this.guestCartId});

  @override
  final String guestCartId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.mergeGuestCart(guestCartId: $guestCartId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.mergeGuestCart'))
      ..add(DiagnosticsProperty('guestCartId', guestCartId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MergeGuestCartImpl &&
            (identical(other.guestCartId, guestCartId) ||
                other.guestCartId == guestCartId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, guestCartId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MergeGuestCartImplCopyWith<_$MergeGuestCartImpl> get copyWith =>
      __$$MergeGuestCartImplCopyWithImpl<_$MergeGuestCartImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return mergeGuestCart(guestCartId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return mergeGuestCart?.call(guestCartId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (mergeGuestCart != null) {
      return mergeGuestCart(guestCartId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return mergeGuestCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return mergeGuestCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (mergeGuestCart != null) {
      return mergeGuestCart(this);
    }
    return orElse();
  }
}

abstract class _MergeGuestCart implements CartEvent {
  const factory _MergeGuestCart({required final String guestCartId}) =
      _$MergeGuestCartImpl;

  String get guestCartId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MergeGuestCartImplCopyWith<_$MergeGuestCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializeSessionImplCopyWith<$Res> {
  factory _$$InitializeSessionImplCopyWith(
    _$InitializeSessionImpl value,
    $Res Function(_$InitializeSessionImpl) then,
  ) = __$$InitializeSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeSessionImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$InitializeSessionImpl>
    implements _$$InitializeSessionImplCopyWith<$Res> {
  __$$InitializeSessionImplCopyWithImpl(
    _$InitializeSessionImpl _value,
    $Res Function(_$InitializeSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeSessionImpl
    with DiagnosticableTreeMixin
    implements _InitializeSession {
  const _$InitializeSessionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.initializeSession()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartEvent.initializeSession'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return initializeSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return initializeSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (initializeSession != null) {
      return initializeSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return initializeSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return initializeSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (initializeSession != null) {
      return initializeSession(this);
    }
    return orElse();
  }
}

abstract class _InitializeSession implements CartEvent {
  const factory _InitializeSession() = _$InitializeSessionImpl;
}

/// @nodoc
abstract class _$$ClearCartSessionImplCopyWith<$Res> {
  factory _$$ClearCartSessionImplCopyWith(
    _$ClearCartSessionImpl value,
    $Res Function(_$ClearCartSessionImpl) then,
  ) = __$$ClearCartSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCartSessionImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearCartSessionImpl>
    implements _$$ClearCartSessionImplCopyWith<$Res> {
  __$$ClearCartSessionImplCopyWithImpl(
    _$ClearCartSessionImpl _value,
    $Res Function(_$ClearCartSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearCartSessionImpl
    with DiagnosticableTreeMixin
    implements _ClearCartSession {
  const _$ClearCartSessionImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.clearCartSession()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartEvent.clearCartSession'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCartSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToCart,
    required TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addItemSmart,
    required TResult Function(int itemId, int qty, String quoteId)
    updateItemQuantity,
    required TResult Function(int itemId) removeItem,
    required TResult Function(String quoteId) emptyCart,
    required TResult Function(String cartId, String coupon) applyCoupon,
    required TResult Function(String cartId) removeCoupon,
    required TResult Function(String cartId, int pointAmount) applyRewardPoints,
    required TResult Function(String cartId) removeRewardPoints,
    required TResult Function(int customerId, String cartId, int itemId)
    saveForLater,
    required TResult Function() createGuestCart,
    required TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )
    addToGuestCart,
    required TResult Function(String guestCartId) loadGuestCart,
    required TResult Function(String guestCartId) mergeGuestCart,
    required TResult Function() initializeSession,
    required TResult Function() clearCartSession,
  }) {
    return clearCartSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult? Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult? Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult? Function(int itemId)? removeItem,
    TResult? Function(String quoteId)? emptyCart,
    TResult? Function(String cartId, String coupon)? applyCoupon,
    TResult? Function(String cartId)? removeCoupon,
    TResult? Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult? Function(String cartId)? removeRewardPoints,
    TResult? Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult? Function()? createGuestCart,
    TResult? Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult? Function(String guestCartId)? loadGuestCart,
    TResult? Function(String guestCartId)? mergeGuestCart,
    TResult? Function()? initializeSession,
    TResult? Function()? clearCartSession,
  }) {
    return clearCartSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToCart,
    TResult Function(
      String sku,
      int qty,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addItemSmart,
    TResult Function(int itemId, int qty, String quoteId)? updateItemQuantity,
    TResult Function(int itemId)? removeItem,
    TResult Function(String quoteId)? emptyCart,
    TResult Function(String cartId, String coupon)? applyCoupon,
    TResult Function(String cartId)? removeCoupon,
    TResult Function(String cartId, int pointAmount)? applyRewardPoints,
    TResult Function(String cartId)? removeRewardPoints,
    TResult Function(int customerId, String cartId, int itemId)? saveForLater,
    TResult Function()? createGuestCart,
    TResult Function(
      String guestCartId,
      String sku,
      int qty,
      String quoteId,
      String? productType,
      List<ConfigurableItemOptionEntity>? configurableOptions,
    )?
    addToGuestCart,
    TResult Function(String guestCartId)? loadGuestCart,
    TResult Function(String guestCartId)? mergeGuestCart,
    TResult Function()? initializeSession,
    TResult Function()? clearCartSession,
    required TResult orElse(),
  }) {
    if (clearCartSession != null) {
      return clearCartSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_AddItemSmart value) addItemSmart,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_EmptyCart value) emptyCart,
    required TResult Function(_ApplyCoupon value) applyCoupon,
    required TResult Function(_RemoveCoupon value) removeCoupon,
    required TResult Function(_ApplyRewardPoints value) applyRewardPoints,
    required TResult Function(_RemoveRewardPoints value) removeRewardPoints,
    required TResult Function(_SaveForLater value) saveForLater,
    required TResult Function(_CreateGuestCart value) createGuestCart,
    required TResult Function(_AddToGuestCart value) addToGuestCart,
    required TResult Function(_LoadGuestCart value) loadGuestCart,
    required TResult Function(_MergeGuestCart value) mergeGuestCart,
    required TResult Function(_InitializeSession value) initializeSession,
    required TResult Function(_ClearCartSession value) clearCartSession,
  }) {
    return clearCartSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_AddItemSmart value)? addItemSmart,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_EmptyCart value)? emptyCart,
    TResult? Function(_ApplyCoupon value)? applyCoupon,
    TResult? Function(_RemoveCoupon value)? removeCoupon,
    TResult? Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult? Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult? Function(_SaveForLater value)? saveForLater,
    TResult? Function(_CreateGuestCart value)? createGuestCart,
    TResult? Function(_AddToGuestCart value)? addToGuestCart,
    TResult? Function(_LoadGuestCart value)? loadGuestCart,
    TResult? Function(_MergeGuestCart value)? mergeGuestCart,
    TResult? Function(_InitializeSession value)? initializeSession,
    TResult? Function(_ClearCartSession value)? clearCartSession,
  }) {
    return clearCartSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_AddItemSmart value)? addItemSmart,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_EmptyCart value)? emptyCart,
    TResult Function(_ApplyCoupon value)? applyCoupon,
    TResult Function(_RemoveCoupon value)? removeCoupon,
    TResult Function(_ApplyRewardPoints value)? applyRewardPoints,
    TResult Function(_RemoveRewardPoints value)? removeRewardPoints,
    TResult Function(_SaveForLater value)? saveForLater,
    TResult Function(_CreateGuestCart value)? createGuestCart,
    TResult Function(_AddToGuestCart value)? addToGuestCart,
    TResult Function(_LoadGuestCart value)? loadGuestCart,
    TResult Function(_MergeGuestCart value)? mergeGuestCart,
    TResult Function(_InitializeSession value)? initializeSession,
    TResult Function(_ClearCartSession value)? clearCartSession,
    required TResult orElse(),
  }) {
    if (clearCartSession != null) {
      return clearCartSession(this);
    }
    return orElse();
  }
}

abstract class _ClearCartSession implements CartEvent {
  const factory _ClearCartSession() = _$ClearCartSessionImpl;
}

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
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
    extends _$CartStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartState.loading'));
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CartState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity cart});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cart = null}) {
    return _then(
      _$LoadedImpl(
        null == cart
            ? _value.cart
            : cart // ignore: cast_nullable_to_non_nullable
                as CartEntity,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl(this.cart);

  @override
  final CartEntity cart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.loaded(cart: $cart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.loaded'))
      ..add(DiagnosticsProperty('cart', cart));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return loaded(cart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return loaded?.call(cart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(cart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CartState {
  const factory _Loaded(final CartEntity cart) = _$LoadedImpl;

  CartEntity get cart;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
    _$EmptyImpl value,
    $Res Function(_$EmptyImpl) then,
  ) = __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
    _$EmptyImpl _value,
    $Res Function(_$EmptyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyImpl with DiagnosticableTreeMixin implements _Empty {
  const _$EmptyImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'CartState.empty'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements CartState {
  const factory _Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$OperationInProgressImplCopyWith<$Res> {
  factory _$$OperationInProgressImplCopyWith(
    _$OperationInProgressImpl value,
    $Res Function(_$OperationInProgressImpl) then,
  ) = __$$OperationInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity cart, String operation});
}

/// @nodoc
class __$$OperationInProgressImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$OperationInProgressImpl>
    implements _$$OperationInProgressImplCopyWith<$Res> {
  __$$OperationInProgressImplCopyWithImpl(
    _$OperationInProgressImpl _value,
    $Res Function(_$OperationInProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cart = null, Object? operation = null}) {
    return _then(
      _$OperationInProgressImpl(
        cart:
            null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                    as CartEntity,
        operation:
            null == operation
                ? _value.operation
                : operation // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$OperationInProgressImpl
    with DiagnosticableTreeMixin
    implements _OperationInProgress {
  const _$OperationInProgressImpl({
    required this.cart,
    required this.operation,
  });

  @override
  final CartEntity cart;
  @override
  final String operation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.operationInProgress(cart: $cart, operation: $operation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.operationInProgress'))
      ..add(DiagnosticsProperty('cart', cart))
      ..add(DiagnosticsProperty('operation', operation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationInProgressImpl &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.operation, operation) ||
                other.operation == operation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart, operation);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OperationInProgressImplCopyWith<_$OperationInProgressImpl> get copyWith =>
      __$$OperationInProgressImplCopyWithImpl<_$OperationInProgressImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return operationInProgress(cart, operation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return operationInProgress?.call(cart, operation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (operationInProgress != null) {
      return operationInProgress(cart, operation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return operationInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return operationInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (operationInProgress != null) {
      return operationInProgress(this);
    }
    return orElse();
  }
}

abstract class _OperationInProgress implements CartState {
  const factory _OperationInProgress({
    required final CartEntity cart,
    required final String operation,
  }) = _$OperationInProgressImpl;

  CartEntity get cart;
  String get operation;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OperationInProgressImplCopyWith<_$OperationInProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemAddedImplCopyWith<$Res> {
  factory _$$ItemAddedImplCopyWith(
    _$ItemAddedImpl value,
    $Res Function(_$ItemAddedImpl) then,
  ) = __$$ItemAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity cart, String message});
}

/// @nodoc
class __$$ItemAddedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ItemAddedImpl>
    implements _$$ItemAddedImplCopyWith<$Res> {
  __$$ItemAddedImplCopyWithImpl(
    _$ItemAddedImpl _value,
    $Res Function(_$ItemAddedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cart = null, Object? message = null}) {
    return _then(
      _$ItemAddedImpl(
        cart:
            null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                    as CartEntity,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$ItemAddedImpl with DiagnosticableTreeMixin implements _ItemAdded {
  const _$ItemAddedImpl({required this.cart, required this.message});

  @override
  final CartEntity cart;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.itemAdded(cart: $cart, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.itemAdded'))
      ..add(DiagnosticsProperty('cart', cart))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemAddedImpl &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart, message);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemAddedImplCopyWith<_$ItemAddedImpl> get copyWith =>
      __$$ItemAddedImplCopyWithImpl<_$ItemAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return itemAdded(cart, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return itemAdded?.call(cart, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(cart, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return itemAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return itemAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(this);
    }
    return orElse();
  }
}

abstract class _ItemAdded implements CartState {
  const factory _ItemAdded({
    required final CartEntity cart,
    required final String message,
  }) = _$ItemAddedImpl;

  CartEntity get cart;
  String get message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemAddedImplCopyWith<_$ItemAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CouponAppliedImplCopyWith<$Res> {
  factory _$$CouponAppliedImplCopyWith(
    _$CouponAppliedImpl value,
    $Res Function(_$CouponAppliedImpl) then,
  ) = __$$CouponAppliedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity cart, String couponCode});
}

/// @nodoc
class __$$CouponAppliedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CouponAppliedImpl>
    implements _$$CouponAppliedImplCopyWith<$Res> {
  __$$CouponAppliedImplCopyWithImpl(
    _$CouponAppliedImpl _value,
    $Res Function(_$CouponAppliedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cart = null, Object? couponCode = null}) {
    return _then(
      _$CouponAppliedImpl(
        cart:
            null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                    as CartEntity,
        couponCode:
            null == couponCode
                ? _value.couponCode
                : couponCode // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$CouponAppliedImpl
    with DiagnosticableTreeMixin
    implements _CouponApplied {
  const _$CouponAppliedImpl({required this.cart, required this.couponCode});

  @override
  final CartEntity cart;
  @override
  final String couponCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.couponApplied(cart: $cart, couponCode: $couponCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.couponApplied'))
      ..add(DiagnosticsProperty('cart', cart))
      ..add(DiagnosticsProperty('couponCode', couponCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponAppliedImpl &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart, couponCode);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponAppliedImplCopyWith<_$CouponAppliedImpl> get copyWith =>
      __$$CouponAppliedImplCopyWithImpl<_$CouponAppliedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return couponApplied(cart, couponCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return couponApplied?.call(cart, couponCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (couponApplied != null) {
      return couponApplied(cart, couponCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return couponApplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return couponApplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (couponApplied != null) {
      return couponApplied(this);
    }
    return orElse();
  }
}

abstract class _CouponApplied implements CartState {
  const factory _CouponApplied({
    required final CartEntity cart,
    required final String couponCode,
  }) = _$CouponAppliedImpl;

  CartEntity get cart;
  String get couponCode;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponAppliedImplCopyWith<_$CouponAppliedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CouponRemovedImplCopyWith<$Res> {
  factory _$$CouponRemovedImplCopyWith(
    _$CouponRemovedImpl value,
    $Res Function(_$CouponRemovedImpl) then,
  ) = __$$CouponRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity cart});
}

/// @nodoc
class __$$CouponRemovedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CouponRemovedImpl>
    implements _$$CouponRemovedImplCopyWith<$Res> {
  __$$CouponRemovedImplCopyWithImpl(
    _$CouponRemovedImpl _value,
    $Res Function(_$CouponRemovedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cart = null}) {
    return _then(
      _$CouponRemovedImpl(
        cart:
            null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                    as CartEntity,
      ),
    );
  }
}

/// @nodoc

class _$CouponRemovedImpl
    with DiagnosticableTreeMixin
    implements _CouponRemoved {
  const _$CouponRemovedImpl({required this.cart});

  @override
  final CartEntity cart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.couponRemoved(cart: $cart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.couponRemoved'))
      ..add(DiagnosticsProperty('cart', cart));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CouponRemovedImpl &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CouponRemovedImplCopyWith<_$CouponRemovedImpl> get copyWith =>
      __$$CouponRemovedImplCopyWithImpl<_$CouponRemovedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return couponRemoved(cart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return couponRemoved?.call(cart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (couponRemoved != null) {
      return couponRemoved(cart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return couponRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return couponRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (couponRemoved != null) {
      return couponRemoved(this);
    }
    return orElse();
  }
}

abstract class _CouponRemoved implements CartState {
  const factory _CouponRemoved({required final CartEntity cart}) =
      _$CouponRemovedImpl;

  CartEntity get cart;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CouponRemovedImplCopyWith<_$CouponRemovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RewardPointsAppliedImplCopyWith<$Res> {
  factory _$$RewardPointsAppliedImplCopyWith(
    _$RewardPointsAppliedImpl value,
    $Res Function(_$RewardPointsAppliedImpl) then,
  ) = __$$RewardPointsAppliedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity cart, int pointsUsed});
}

/// @nodoc
class __$$RewardPointsAppliedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$RewardPointsAppliedImpl>
    implements _$$RewardPointsAppliedImplCopyWith<$Res> {
  __$$RewardPointsAppliedImplCopyWithImpl(
    _$RewardPointsAppliedImpl _value,
    $Res Function(_$RewardPointsAppliedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cart = null, Object? pointsUsed = null}) {
    return _then(
      _$RewardPointsAppliedImpl(
        cart:
            null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                    as CartEntity,
        pointsUsed:
            null == pointsUsed
                ? _value.pointsUsed
                : pointsUsed // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$RewardPointsAppliedImpl
    with DiagnosticableTreeMixin
    implements _RewardPointsApplied {
  const _$RewardPointsAppliedImpl({
    required this.cart,
    required this.pointsUsed,
  });

  @override
  final CartEntity cart;
  @override
  final int pointsUsed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.rewardPointsApplied(cart: $cart, pointsUsed: $pointsUsed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.rewardPointsApplied'))
      ..add(DiagnosticsProperty('cart', cart))
      ..add(DiagnosticsProperty('pointsUsed', pointsUsed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardPointsAppliedImpl &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.pointsUsed, pointsUsed) ||
                other.pointsUsed == pointsUsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart, pointsUsed);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardPointsAppliedImplCopyWith<_$RewardPointsAppliedImpl> get copyWith =>
      __$$RewardPointsAppliedImplCopyWithImpl<_$RewardPointsAppliedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return rewardPointsApplied(cart, pointsUsed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return rewardPointsApplied?.call(cart, pointsUsed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (rewardPointsApplied != null) {
      return rewardPointsApplied(cart, pointsUsed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return rewardPointsApplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return rewardPointsApplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (rewardPointsApplied != null) {
      return rewardPointsApplied(this);
    }
    return orElse();
  }
}

abstract class _RewardPointsApplied implements CartState {
  const factory _RewardPointsApplied({
    required final CartEntity cart,
    required final int pointsUsed,
  }) = _$RewardPointsAppliedImpl;

  CartEntity get cart;
  int get pointsUsed;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardPointsAppliedImplCopyWith<_$RewardPointsAppliedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RewardPointsRemovedImplCopyWith<$Res> {
  factory _$$RewardPointsRemovedImplCopyWith(
    _$RewardPointsRemovedImpl value,
    $Res Function(_$RewardPointsRemovedImpl) then,
  ) = __$$RewardPointsRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartEntity cart});
}

/// @nodoc
class __$$RewardPointsRemovedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$RewardPointsRemovedImpl>
    implements _$$RewardPointsRemovedImplCopyWith<$Res> {
  __$$RewardPointsRemovedImplCopyWithImpl(
    _$RewardPointsRemovedImpl _value,
    $Res Function(_$RewardPointsRemovedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cart = null}) {
    return _then(
      _$RewardPointsRemovedImpl(
        cart:
            null == cart
                ? _value.cart
                : cart // ignore: cast_nullable_to_non_nullable
                    as CartEntity,
      ),
    );
  }
}

/// @nodoc

class _$RewardPointsRemovedImpl
    with DiagnosticableTreeMixin
    implements _RewardPointsRemoved {
  const _$RewardPointsRemovedImpl({required this.cart});

  @override
  final CartEntity cart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.rewardPointsRemoved(cart: $cart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.rewardPointsRemoved'))
      ..add(DiagnosticsProperty('cart', cart));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardPointsRemovedImpl &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardPointsRemovedImplCopyWith<_$RewardPointsRemovedImpl> get copyWith =>
      __$$RewardPointsRemovedImplCopyWithImpl<_$RewardPointsRemovedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return rewardPointsRemoved(cart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return rewardPointsRemoved?.call(cart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (rewardPointsRemoved != null) {
      return rewardPointsRemoved(cart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return rewardPointsRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return rewardPointsRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (rewardPointsRemoved != null) {
      return rewardPointsRemoved(this);
    }
    return orElse();
  }
}

abstract class _RewardPointsRemoved implements CartState {
  const factory _RewardPointsRemoved({required final CartEntity cart}) =
      _$RewardPointsRemovedImpl;

  CartEntity get cart;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardPointsRemovedImplCopyWith<_$RewardPointsRemovedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrorEntity error, CartEntity? lastCart});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null, Object? lastCart = freezed}) {
    return _then(
      _$ErrorImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppErrorEntity,
        lastCart:
            freezed == lastCart
                ? _value.lastCart
                : lastCart // ignore: cast_nullable_to_non_nullable
                    as CartEntity?,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl({required this.error, this.lastCart});

  @override
  final AppErrorEntity error;
  @override
  final CartEntity? lastCart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState.error(error: $error, lastCart: $lastCart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState.error'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('lastCart', lastCart));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lastCart, lastCart) ||
                other.lastCart == lastCart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, lastCart);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CartEntity cart) loaded,
    required TResult Function() empty,
    required TResult Function(CartEntity cart, String operation)
    operationInProgress,
    required TResult Function(CartEntity cart, String message) itemAdded,
    required TResult Function(CartEntity cart, String couponCode) couponApplied,
    required TResult Function(CartEntity cart) couponRemoved,
    required TResult Function(CartEntity cart, int pointsUsed)
    rewardPointsApplied,
    required TResult Function(CartEntity cart) rewardPointsRemoved,
    required TResult Function(AppErrorEntity error, CartEntity? lastCart) error,
  }) {
    return error(this.error, lastCart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CartEntity cart)? loaded,
    TResult? Function()? empty,
    TResult? Function(CartEntity cart, String operation)? operationInProgress,
    TResult? Function(CartEntity cart, String message)? itemAdded,
    TResult? Function(CartEntity cart, String couponCode)? couponApplied,
    TResult? Function(CartEntity cart)? couponRemoved,
    TResult? Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult? Function(CartEntity cart)? rewardPointsRemoved,
    TResult? Function(AppErrorEntity error, CartEntity? lastCart)? error,
  }) {
    return error?.call(this.error, lastCart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CartEntity cart)? loaded,
    TResult Function()? empty,
    TResult Function(CartEntity cart, String operation)? operationInProgress,
    TResult Function(CartEntity cart, String message)? itemAdded,
    TResult Function(CartEntity cart, String couponCode)? couponApplied,
    TResult Function(CartEntity cart)? couponRemoved,
    TResult Function(CartEntity cart, int pointsUsed)? rewardPointsApplied,
    TResult Function(CartEntity cart)? rewardPointsRemoved,
    TResult Function(AppErrorEntity error, CartEntity? lastCart)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, lastCart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_OperationInProgress value) operationInProgress,
    required TResult Function(_ItemAdded value) itemAdded,
    required TResult Function(_CouponApplied value) couponApplied,
    required TResult Function(_CouponRemoved value) couponRemoved,
    required TResult Function(_RewardPointsApplied value) rewardPointsApplied,
    required TResult Function(_RewardPointsRemoved value) rewardPointsRemoved,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_OperationInProgress value)? operationInProgress,
    TResult? Function(_ItemAdded value)? itemAdded,
    TResult? Function(_CouponApplied value)? couponApplied,
    TResult? Function(_CouponRemoved value)? couponRemoved,
    TResult? Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult? Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_OperationInProgress value)? operationInProgress,
    TResult Function(_ItemAdded value)? itemAdded,
    TResult Function(_CouponApplied value)? couponApplied,
    TResult Function(_CouponRemoved value)? couponRemoved,
    TResult Function(_RewardPointsApplied value)? rewardPointsApplied,
    TResult Function(_RewardPointsRemoved value)? rewardPointsRemoved,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CartState {
  const factory _Error({
    required final AppErrorEntity error,
    final CartEntity? lastCart,
  }) = _$ErrorImpl;

  AppErrorEntity get error;
  CartEntity? get lastCart;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
