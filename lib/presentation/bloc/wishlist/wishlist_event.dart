import 'package:freezed_annotation/freezed_annotation.dart';

part 'wishlist_event.freezed.dart';

@freezed
class WishlistEvent with _$WishlistEvent {
  const factory WishlistEvent.started() = Started;
  const factory WishlistEvent.addToWishlist(String productId) = AddToWishlist;
  const factory WishlistEvent.removeFromWishlist(String productId) =
      RemoveFromWishlist;
}
