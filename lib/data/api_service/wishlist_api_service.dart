import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/wishlist_response/wishlist_response.dart';

abstract class WishlistApiService {
  Future<Either<ErrorResponse, List<WishlistResponse>>> getWishlist();
  Future<Either<ErrorResponse, bool>> addToWishlist(String productId);
  Future<Either<ErrorResponse, bool>> removeFromWishlist(String productId);
}
