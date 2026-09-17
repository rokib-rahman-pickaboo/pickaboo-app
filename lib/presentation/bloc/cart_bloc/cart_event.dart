part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.getCart() = _GetCart;
  const factory CartEvent.refreshCart() = _RefreshCart;

  const factory CartEvent.addToCart({
    required String sku,
    required int qty,
    required String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  }) = _AddToCart;

  const factory CartEvent.addItemSmart({
    required String sku,
    required int qty,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  }) = _AddItemSmart;

  const factory CartEvent.updateItemQuantity({
    required int itemId,
    required int qty,
    required String quoteId,
  }) = _UpdateItemQuantity;

  const factory CartEvent.removeItem({required int itemId}) = _RemoveItem;

  const factory CartEvent.emptyCart({required String quoteId}) = _EmptyCart;

  const factory CartEvent.applyCoupon({
    required String cartId,
    required String coupon,
  }) = _ApplyCoupon;

  const factory CartEvent.removeCoupon({required String cartId}) =
      _RemoveCoupon;

  const factory CartEvent.applyRewardPoints({
    required String cartId,
    required int pointAmount,
  }) = _ApplyRewardPoints;

  const factory CartEvent.removeRewardPoints({required String cartId}) =
      _RemoveRewardPoints;

  const factory CartEvent.saveForLater({
    required int customerId,
    required String cartId,
    required int itemId,
  }) = _SaveForLater;

  const factory CartEvent.createGuestCart() = _CreateGuestCart;

  const factory CartEvent.addToGuestCart({
    required String guestCartId,
    required String sku,
    required int qty,
    required String quoteId,
    String? productType,
    List<ConfigurableItemOptionEntity>? configurableOptions,
  }) = _AddToGuestCart;

  const factory CartEvent.loadGuestCart({required String guestCartId}) =
      _LoadGuestCart;

  const factory CartEvent.mergeGuestCart({required String guestCartId}) =
      _MergeGuestCart;

  const factory CartEvent.initializeSession() = _InitializeSession;

  const factory CartEvent.clearCartSession() = _ClearCartSession;
}
