import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/cart_api_service.dart';
import 'package:pickaboo/data/model/cart/add_cart_item_request/add_cart_item_request.dart';
import 'package:pickaboo/data/model/cart/cart_item_response/cart_item_response.dart';
import 'package:pickaboo/data/model/cart/cart_response/cart_response.dart';
import 'package:pickaboo/data/model/cart/checkout_response/checkout_response.dart';
import 'package:pickaboo/data/model/cart/update_cart_item_request/update_cart_item_request.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';

@LazySingleton(as: CartApiService)
class ICartApiService extends CartApiService {
  final Dio _client;

  ICartApiService(this._client);

  static const _invalidCouponMessage =
      "This discount code isn't valid. Please check the code and try again.";

  ErrorResponse checkErrorResponse(DioException err) {
    if (kDebugMode) {
      print('🌐 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
      print('🌐 SERVER ERROR');
      print('🌐 URL     : ${err.requestOptions.method} ${err.requestOptions.uri}');
      print('🌐 Status  : ${err.response?.statusCode ?? 'no response'}');
      print('🌐 Message : ${err.message}');
      print('🌐 Body    : ${err.response?.data}');
      print('🌐 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    }
    if (err.type == DioExceptionType.badResponse) {
      final errorData = err.response?.data;
      if (errorData is Map<String, dynamic>) {
        return ErrorResponse.fromJson(errorData);
      }
    }
    return const ErrorResponse();
  }

  @override
  Future<Either<ErrorResponse, String>> createCart() async {
    try {
      final response = await _client.post(ApiEndpoints.createCartUrl);

      if (kDebugMode) {
        print("create_cart -> ${response.data}");
      }

      if (response.data is String) {
        return right(response.data.toString().replaceAll('"', ''));
      } else if (response.data is int) {
        return right(response.data.toString());
      }

      return left(const ErrorResponse(message: 'Invalid cart response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("create_cart_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CheckoutResponse>> getCartCheckout() async {
    try {
      final response = await _client.get(ApiEndpoints.getCartUrl);

      if (kDebugMode) {
        print("get_cart -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CheckoutResponse.fromJson(data);
        return right(result);
      }

      return left(const ErrorResponse(message: 'Invalid cart response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("get_cart_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CartResponse>> getBasicCart() async {
    try {
      final response = await _client.get(
        ApiEndpoints
            .createCartUrl,
      );

      if (kDebugMode) {
        print("get_basic_cart -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CartResponse.fromJson(data);
        return right(result);
      }

      return left(const ErrorResponse(message: 'Invalid cart response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("get_basic_cart_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CartItemResponse>> addItem({
    required AddCartItemRequest request,
  }) async {
    if (kDebugMode) {
      print("add_cart_request_config -> ${json.encode(request.toJson())}");
    }

    try {
      final response = await _client.post(
        ApiEndpoints.addCartItemUrl,
        data: request.toJson(),
      );

      if (kDebugMode) {
        print("add_cart_item -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CartItemResponse.fromJson(data);
        return right(result);
      }

      return left(const ErrorResponse(message: 'Invalid add item response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("add_cart_item_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CartItemResponse>> updateItem({
    required int itemId,
    required int qty,
    required String quoteId,
  }) async {
    try {
      final request = UpdateCartItemRequest(
        cartItem: CartItemUpdateRequest(
          itemId: itemId,
          qty: qty,
          quoteId: quoteId,
        ),
      );

      final response = await _client.put(
        ApiEndpoints.updateCartItemUrl(itemId: itemId),
        data: request.toJson(),
      );

      if (kDebugMode) {
        print("update_cart_item -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CartItemResponse.fromJson(data);
        return right(result);
      }

      return left(const ErrorResponse(message: 'Invalid update item response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("update_cart_item_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> deleteItem({required int itemId}) async {
    try {
      final response = await _client.delete(
        ApiEndpoints.deleteCartItemUrl(itemId: itemId),
      );

      if (kDebugMode) {
        print("delete_cart_item -> ${response.data}");
      }

      return right(response.data == true || response.statusCode == 200);
    } on DioException catch (e) {
      if (kDebugMode) {
        print("delete_cart_item_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> applyCoupon({
    required String cartId,
    required String coupon,
  }) async {
    try {
      final url = ApiEndpoints.applyCouponUrl(cartId: cartId, coupon: coupon);
      if (kDebugMode) {
        print("🎟️ apply_coupon_url -> $url");
      }

      final response = await _client.put(url);

      if (kDebugMode) {
        print("🎟️ apply_coupon_response -> ${response.data}");
        print("🎟️ apply_coupon_status -> ${response.statusCode}");
      }

      final data = response.data;

      if (data == true) return right(true);

      if (data is Map<String, dynamic>) {
        if (data['success'] == true) return right(true);
        final message = data['message']?.toString();
        return left(
          ErrorResponse(
            success: false,
            message: (message == null || message.trim().isEmpty)
                ? _invalidCouponMessage
                : message,
          ),
        );
      }

      if (data is String) {
        final text = data.trim().replaceAll('"', '');
        if (text.toLowerCase() == 'true') return right(true);
        return left(
          ErrorResponse(
            success: false,
            message: text.isEmpty ? _invalidCouponMessage : text,
          ),
        );
      }

      return left(
        const ErrorResponse(success: false, message: _invalidCouponMessage),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print("❌ apply_coupon_error -> $e");
        print("❌ apply_coupon_error_response -> ${e.response?.data}");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> removeCoupon({
    required String cartId,
  }) async {
    try {
      final response = await _client.delete(
        ApiEndpoints.removeCouponUrl(cartId: cartId),
      );

      if (kDebugMode) {
        print("remove_coupon -> ${response.data}");
      }

      return right(response.data == true || response.statusCode == 200);
    } on DioException catch (e) {
      if (kDebugMode) {
        print("remove_coupon_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> applyRewardPoints({
    required String cartId,
    required int pointAmount,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.applyRewardPointsUrl(
          cartId: cartId,
          pointAmount: pointAmount,
        ),
      );

      if (kDebugMode) {
        print("apply_reward_points -> ${response.data}");
      }

      final data = response.data;

      if (data == true) return right(true);

      if (data is Map<String, dynamic>) {
        if (data['success'] == true) return right(true);
        final message = data['message']?.toString();
        return left(
          ErrorResponse(
            success: false,
            message: (message == null || message.trim().isEmpty)
                ? _rewardPointsRejectedMessage
                : message,
          ),
        );
      }

      if (data is String) {
        final text = data.trim().replaceAll('"', '');
        if (text.toLowerCase() == 'true') return right(true);
        return left(
          ErrorResponse(
            success: false,
            message: text.isEmpty ? _rewardPointsRejectedMessage : text,
          ),
        );
      }

      return left(
        const ErrorResponse(
          success: false,
          message: _rewardPointsRejectedMessage,
        ),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print("apply_reward_points_error -> $e");
        print("apply_reward_points_error_response -> ${e.response?.data}");
      }
      return left(checkErrorResponse(e));
    }
  }

  static const String _rewardPointsRejectedMessage =
      'Could not update your club points. Please try again.';

  @override
  Future<Either<ErrorResponse, bool>> emptyCart({
    required String quoteId,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.emptyCartUrl(quoteId: quoteId),
      );

      if (kDebugMode) {
        print("empty_cart -> ${response.data}");
      }

      return right(response.data == true || response.statusCode == 200);
    } on DioException catch (e) {
      if (kDebugMode) {
        print("empty_cart_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> saveForLater({
    required int customerId,
    required String cartId,
    required int itemId,
  }) async {
    try {
      if (kDebugMode) {
        print("=== SAVE FOR LATER REQUEST ===");
        print("Endpoint: ${ApiEndpoints.saveForLaterUrl}");
        print("customerId: $customerId");
        print("cart_id: $cartId");
        print("item_id: $itemId");
      }

      final response = await _client.post(
        ApiEndpoints.saveForLaterUrl,
        queryParameters: {
          'customer_id': customerId,
          'cart_id': cartId,
          'item_id': itemId,
        },
      );

      if (kDebugMode) {
        print("=== SAVE FOR LATER RESPONSE ===");
        print("Status Code: ${response.statusCode}");
        print("Response Data: ${response.data}");
        print("Response Type: ${response.data.runtimeType}");
      }

      return right(response.data == true || response.statusCode == 200);
    } on DioException catch (e) {
      if (kDebugMode) {
        print("=== SAVE FOR LATER ERROR ===");
        print("Error Type: ${e.type}");
        print("Status Code: ${e.response?.statusCode}");
        print("Error Message: ${e.message}");
        print("Response Data: ${e.response?.data}");
        print("Full Error: $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, String>> createGuestCart() async {
    try {
      final response = await _client.post(
        ApiEndpoints.createGuestCartUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("create_guest_cart -> ${response.data}");
      }

      if (response.data is String) {
        return right(response.data.toString().replaceAll('"', ''));
      }

      return left(const ErrorResponse(message: 'Invalid guest cart response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("create_guest_cart_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CartResponse>> getGuestCart({
    required String cartId,
  }) async {
    try {
      if (kDebugMode) {
        print(
          "get_guest_request -> ${ApiEndpoints.getGuestCartUrl(cartId: cartId)}",
        );
      }

      final response = await _client.get(
        ApiEndpoints.getGuestCartUrl(cartId: cartId),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("get_guest_cart -> ${json.encode(response.data)}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CartResponse.fromJson(data);
        return right(result);
      }

      return left(const ErrorResponse(message: 'Invalid guest cart response'));
    } on DioException catch (e) {
      if (kDebugMode) {
        print("get_guest_cart_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CartItemResponse>> addGuestItem({
    required String cartId,
    required AddCartItemRequest request,
  }) async {
    try {
      final response = await _client.post(
        ApiEndpoints.addGuestCartItemUrl(cartId: cartId),
        data: request.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("add_guest_cart_item -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CartItemResponse.fromJson(data);
        return right(result);
      }

      return left(
        const ErrorResponse(message: 'Invalid add guest item response'),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print("add_guest_cart_item_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, CartItemResponse>> updateGuestItem({
    required String cartId,
    required int itemId,
    required int qty,
    required String quoteId,
  }) async {
    try {
      final request = UpdateCartItemRequest(
        cartItem: CartItemUpdateRequest(
          itemId: itemId,
          qty: qty,
          quoteId: quoteId,
        ),
      );

      final response = await _client.put(
        ApiEndpoints.updateGuestCartItemUrl(cartId: cartId, itemId: itemId),
        data: request.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("update_guest_cart_item -> ${response.data}");
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        final result = CartItemResponse.fromJson(data);
        return right(result);
      }

      return left(
        const ErrorResponse(message: 'Invalid update guest item response'),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print("update_guest_cart_item_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> deleteGuestItem({
    required String cartId,
    required int itemId,
  }) async {
    try {
      final response = await _client.delete(
        ApiEndpoints.deleteGuestCartItemUrl(cartId: cartId, itemId: itemId),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("delete_guest_cart_item -> ${response.data}");
      }

      return right(response.data == true || response.statusCode == 200);
    } on DioException catch (e) {
      if (kDebugMode) {
        print("delete_guest_cart_item_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> mergeGuestCart({
    required String guestCartId,
    required int customerId,
    required int storeId,
  }) async {
    try {
      final response = await _client.put(
        ApiEndpoints.mergeGuestCartUrl(guestCartId: guestCartId),
        data: {"customerId": customerId, "storeId": storeId},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (kDebugMode) {
        print("merge_guest_cart -> ${response.data}");
      }

      return right(response.data == true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print("merge_guest_cart_error -> $e");
      }
      return left(checkErrorResponse(e));
    }
  }
}
