import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/endpoints/api_endpoints.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/place_picker/place_autocomplete_response/place_autocomplete_response.dart';
import 'package:pickaboo/data/model/place_picker/reverse_geocode_response/reverse_geocode_response.dart';
import 'place_picker_api_service.dart';

@LazySingleton(as: PlacePickerApiService)
class IPlacePickerApiService extends PlacePickerApiService {
  final Dio _client;

  IPlacePickerApiService(@Named('barikoi') this._client);

  @override
  Future<Either<ErrorResponse, PlaceAutocompleteResponse>> autocomplete({
    required String query,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoints.barikoiAutocompleteUrl,
        queryParameters: {
          'api_key': ApiEndpoints.barikoiApiKey,
          'q': query,
          'sub_area': true,
          'sub_district': true,
        },
      );

      if (kDebugMode) {
        print('🔍 [PlacePicker] autocomplete($query) → ${response.statusCode}');
        final rawPlaces = (response.data as Map<String, dynamic>?)?['places'];
        if (rawPlaces is List && rawPlaces.isNotEmpty) {
          print('🔍 [PlacePicker] autocomplete raw first place JSON:');
          print('   ${rawPlaces.first}');
          print('   → all keys in first place: ${(rawPlaces.first as Map).keys.toList()}');
        }
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return right(PlaceAutocompleteResponse.fromJson(data));
      }
      return left(ErrorResponse.unknown());
    } on DioException catch (e) {
      if (kDebugMode) print('❌ [PlacePicker] autocomplete error: ${e.message}');
      return left(
        ErrorResponse(message: (e.response?.data is Map ? e.response?.data['message'] : null) ?? e.message),
      );
    } catch (e) {
      if (kDebugMode) print('❌ [PlacePicker] autocomplete unexpected: $e');
      return left(ErrorResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<ErrorResponse, ReverseGeocodeResponse>> reverseGeocode({
    required double latitude,
    required double longitude,
  }) async {
    const maxRetries = 3;
    int attempt = 0;

    while (attempt < maxRetries) {
      try {
        if (kDebugMode) {
          print(
            '📍 [PlacePicker] reverseGeocode (attempt ${attempt + 1}) '
            '→ $latitude, $longitude',
          );
        }

        final response = await _client.get(
          ApiEndpoints.barikoiReverseGeocodeUrl,
          queryParameters: {
            'api_key': ApiEndpoints.barikoiApiKey,
            'longitude': longitude,
            'latitude': latitude,
            'country': true,
            'district': true,
            'post_code': true,
            'sub_district': true,
            'union': false,
            'pauroshova': true,
            'location_type': true,
            'division': true,
            'address': true,
            'area': true,
            'bangla': false,
            'thana': true,
          },
        );

        if (kDebugMode) {
          print('📍 [PlacePicker] reverseGeocode → ${response.statusCode}');
          final raw = response.data;
          if (raw is Map<String, dynamic>) {
            final topPlace = raw['place'];
            if (topPlace is Map) {
              print('📍 [PlacePicker] reverseGeocode raw place JSON:');
              print('   $topPlace');
              print('   → all keys: ${topPlace.keys.toList()}');
            }
            final addr = raw['address'];
            if (addr is Map && addr['place'] is Map) {
              print('📍 [PlacePicker] reverseGeocode raw address.place JSON:');
              print('   ${addr['place']}');
              print('   → all keys: ${(addr['place'] as Map).keys.toList()}');
            }
          }
        }

        final responseData = response.data;
        if (responseData is Map<String, dynamic>) {
          return right(ReverseGeocodeResponse.fromJson(responseData));
        }
        return left(ErrorResponse.unknown());
      } on DioException catch (e) {
        final shouldRetry = e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.unknown;

        if (shouldRetry && attempt < maxRetries - 1) {
          attempt++;
          await Future.delayed(const Duration(seconds: 1));
          continue;
        }

        if (kDebugMode) {
          print('❌ [PlacePicker] reverseGeocode error: ${e.message}');
        }
        return left(
          ErrorResponse(message: (e.response?.data is Map ? e.response?.data['message'] : null) ?? e.message),
        );
      } catch (e) {
        if (kDebugMode) {
          print('❌ [PlacePicker] reverseGeocode unexpected: $e');
        }
        return left(ErrorResponse(message: e.toString()));
      }
    }

    return left(const ErrorResponse(message: 'Max retries exceeded'));
  }
}
