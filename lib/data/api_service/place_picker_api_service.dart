import 'package:dartz/dartz.dart';
import 'package:pickaboo/data/model/error_response/error_response.dart';
import 'package:pickaboo/data/model/place_picker/place_autocomplete_response/place_autocomplete_response.dart';
import 'package:pickaboo/data/model/place_picker/reverse_geocode_response/reverse_geocode_response.dart';

abstract class PlacePickerApiService {
  Future<Either<ErrorResponse, PlaceAutocompleteResponse>> autocomplete({
    required String query,
  });

  Future<Either<ErrorResponse, ReverseGeocodeResponse>> reverseGeocode({
    required double latitude,
    required double longitude,
  });
}
