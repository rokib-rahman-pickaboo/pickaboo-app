import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/cart/add_cart_item_request/add_cart_item_request.dart';
import 'package:pickaboo/data/model/cart/cart_item_response/cart_item_response.dart';
import 'package:pickaboo/data/model/cart/cart_response/cart_response.dart';
import 'package:pickaboo/data/model/cart/checkout_response/checkout_response.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';

abstract class CartApiService {
  Future<Either<ErrorResponse, String>> createCart();
  Future<Either<ErrorResponse, CheckoutResponse>> getCartCheckout();
  Future<Either<ErrorResponse, CartResponse>> getBasicCart();
  Future<Either<ErrorResponse, CartItemResponse>> addItem({
    required AddCartItemRequest request,
  });
  Future<Either<ErrorResponse, CartItemResponse>> updateItem({
    required int itemId,
    required int qty,
    required String quoteId,
  });
  Future<Either<ErrorResponse, bool>> deleteItem({required int itemId});
  Future<Either<ErrorResponse, bool>> applyCoupon({
    required String cartId,
    required String coupon,
  });
  Future<Either<ErrorResponse, bool>> removeCoupon({required String cartId});
  Future<Either<ErrorResponse, bool>> applyRewardPoints({
    required String cartId,
    required int pointAmount,
  });
  Future<Either<ErrorResponse, bool>> emptyCart({required String quoteId});
  Future<Either<ErrorResponse, bool>> saveForLater({
    required int customerId,
    required String cartId,
    required int itemId,
  });

  Future<Either<ErrorResponse, String>> createGuestCart();
  Future<Either<ErrorResponse, CartResponse>> getGuestCart({
    required String cartId,
  });

  Future<Either<ErrorResponse, CartItemResponse>> addGuestItem({
    required String cartId,
    required AddCartItemRequest request,
  });
  Future<Either<ErrorResponse, CartItemResponse>> updateGuestItem({
    required String cartId,
    required int itemId,
    required int qty,
    required String quoteId,
  });
  Future<Either<ErrorResponse, bool>> deleteGuestItem({
    required String cartId,
    required int itemId,
  });

  Future<Either<ErrorResponse, bool>> mergeGuestCart({
    required String guestCartId,
    required int customerId,
    required int storeId,
  });
}
