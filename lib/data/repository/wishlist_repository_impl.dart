import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/wishlist_api_service.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/wishlist_response/wishlist_response.dart';
import 'package:pickaboo/domain/entity/wishlist/wishlist_entity.dart';
import 'package:pickaboo/domain/repository/wishlist_repository.dart';

@LazySingleton(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final WishlistApiService _apiService;

  WishlistRepositoryImpl(this._apiService);

  @override
  Future<Either<ErrorResponse, List<WishlistEntity>>> getWishlist() async {
    final result = await _apiService.getWishlist();
    return result.fold(
      (error) => Left(error),
      (models) => Right(models.map(_mapToEntity).toList()),
    );
  }

  @override
  Future<Either<ErrorResponse, bool>> addToWishlist(String productId) {
    return _apiService.addToWishlist(productId);
  }

  @override
  Future<Either<ErrorResponse, bool>> removeFromWishlist(String productId) {
    return _apiService.removeFromWishlist(productId);
  }

  WishlistEntity _mapToEntity(WishlistResponse model) {
    return WishlistEntity(
      id: model.wishlistItemId ?? '',
      productId: model.productId ?? '',
      name: model.productName ?? '',
      sku: model.sku ?? '',
      price: (model.specialPrice ?? model.regularPrice ?? 0).toDouble(),
      thumbnail: model.image ?? '',
      inStock: model.isAvailable ?? false,
      soldBy: model.soldBy,
      regularPrice: model.regularPrice?.toDouble(),
      specialPrice: model.specialPrice?.toDouble(),
      discount: model.discount,
      productType: model.productType ?? '',
    );
  }
}
