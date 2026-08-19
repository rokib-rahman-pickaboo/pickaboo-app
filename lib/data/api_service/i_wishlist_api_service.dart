import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/api_service/wishlist_api_service.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/wishlist_response/wishlist_response.dart';

@LazySingleton(as: WishlistApiService)
class IWishlistApiService implements WishlistApiService {
  final Dio _dio;

  IWishlistApiService(this._dio);

  @override
  Future<Either<ErrorResponse, List<WishlistResponse>>> getWishlist() async {
    try {
      if (kDebugMode) {
        print(
          '📡 Sending Get Wishlist Request to ${ApiEndpoints.getWishlistUrl}',
        );
      }
      final response = await _dio.get(ApiEndpoints.getWishlistUrl);

      if (kDebugMode) {
        print('📥 Get Wishlist Response: ${jsonEncode(response.data)}');
      }

      if (response.data is List) {
        final list = (response.data as List)
            .map((e) => WishlistResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Right(list);
      }
      return const Right([]);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ Get Wishlist Error: $e');
        if (e.response != null) {
          print('❌ Error Response: ${jsonEncode(e.response?.data)}');
        }
      }
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    } catch (e) {
      if (kDebugMode) {
        print('❌ Unexpected Get Wishlist Error: $e');
      }
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> addToWishlist(String productId) async {
    try {
      final endpoint = ApiEndpoints.addToWishlistUrl(productId: productId);
      if (kDebugMode) {
        print('📡 Sending Add to Wishlist Request: $endpoint');
      }
      final response = await _dio.post(endpoint);

      if (kDebugMode) {
        print('📥 Add to Wishlist Response: ${jsonEncode(response.data)}');
      }

      return Right(response.statusCode == 200 || response.data == true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ Add to Wishlist Error: $e');
        if (e.response != null) {
          print('❌ Error Response: ${jsonEncode(e.response?.data)}');
        }
      }
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, bool>> removeFromWishlist(
    String productId,
  ) async {
    try {
      if (kDebugMode) {
        print(
          '📡 Sending Remove from Wishlist Request: ${ApiEndpoints.removeFromWishlistUrl}?productId=$productId',
        );
      }
      final response = await _dio.delete(
        ApiEndpoints.removeFromWishlistUrl,
        queryParameters: {'productId': productId},
      );

      if (kDebugMode) {
        print('📥 Remove from Wishlist Response: ${jsonEncode(response.data)}');
      }

      return Right(response.statusCode == 200 || response.data == true);
    } on DioException catch (e) {
      if (kDebugMode) {
        print('❌ Remove from Wishlist Error: $e');
        if (e.response != null) {
          print('❌ Error Response: ${jsonEncode(e.response?.data)}');
        }
      }
      return Left(ErrorResponse.fromJson(e.response?.data ?? {}));
    } catch (e) {
      return Left(ErrorResponse(message: e.toString()));
    }
  }
}
