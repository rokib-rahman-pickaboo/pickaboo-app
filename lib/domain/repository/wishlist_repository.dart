import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/domain/entity/wishlist/wishlist_entity.dart';

abstract class WishlistRepository {
  Future<Either<ErrorResponse, List<WishlistEntity>>> getWishlist();
  Future<Either<ErrorResponse, bool>> addToWishlist(String productId);
  Future<Either<ErrorResponse, bool>> removeFromWishlist(String productId);
}
