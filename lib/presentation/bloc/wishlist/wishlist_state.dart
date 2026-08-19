import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/domain/entity/wishlist/wishlist_entity.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;
  const factory WishlistState.loading() = _Loading;
  const factory WishlistState.loaded(List<WishlistEntity> items) = _Loaded;
  const factory WishlistState.error(String message) = _Error;
  const factory WishlistState.actionSuccess(String message) = _ActionSuccess;
}
