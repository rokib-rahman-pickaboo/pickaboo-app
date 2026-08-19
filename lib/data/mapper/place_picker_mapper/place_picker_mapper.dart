import 'package:pickaboo/data/model/place_picker/place_autocomplete_response/place_autocomplete_response.dart';
import 'package:pickaboo/data/model/place_picker/reverse_geocode_response/reverse_geocode_response.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';

extension AutocompletePlaceModelMapper on AutocompletePlaceModel {
  PlacePickResultEntity toEntity() {
    return PlacePickResultEntity(
      placeId: id,
      latitude: double.tryParse(latitude ?? '') ?? 0.0,
      longitude: double.tryParse(longitude ?? '') ?? 0.0,
      address: address,
      area: area,
      subArea: subArea,
      city: city,
      subDistrict: subDistrict,
      district: district,
      uCode: uCode,
      postCode: postCode,
      pType: pType,
      subType: subType,
    );
  }
}

extension ReverseGeocodeResponseMapper on ReverseGeocodeResponse {
  ReverseGeocodePlace? resolvePlace() {
    if (place != null) return place;

    final addr = address;
    if (addr != null) {
      final nested = addr.maybeWhen(
        object: (a) => a.place,
        orElse: () => null,
      );
      if (nested != null) return nested;
    }

    return null;
  }
}

extension ReverseGeocodePlaceMapper on ReverseGeocodePlace {
  PlacePickResultEntity toEntity({
    required double latitude,
    required double longitude,
  }) {
    return PlacePickResultEntity(
      placeId: id,
      latitude: latitude,
      longitude: longitude,
      placeName: addressComponents?.placeName,
      house: addressComponents?.house,
      road: addressComponents?.road,
      address: address,
      area: area ?? areaComponents?.area,
      subArea: areaComponents?.subArea,
      city: city,
      subDistrict: subDistrict,
      district: district,
      division: division,
      postCode: _parsePostCode(postCode ?? postCodeSnake),
      country: country,
      distanceWithinMeters: distanceWithinMeters,
    );
  }

  int? _parsePostCode(Object? value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value.toString().trim());
  }
}
