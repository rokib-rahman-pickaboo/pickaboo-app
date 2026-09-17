import 'package:pickaboo/core/constants/address_constants.dart';
import 'package:pickaboo/core/utils/address/place_area_matcher.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';

/// Helper methods for mapping a selected [PlacePickResultEntity] into
/// Division, City, and Area form structures.
class AddressPlaceHelper {
  AddressPlaceHelper._();

  /// Resolves the division from candidate fields on [place].
  static Map<String, String> matchDivision(PlacePickResultEntity place) {
    final divisionCandidates = [
      place.division,
      place.district,
      place.city,
    ].whereType<String>().where((s) => s.trim().isNotEmpty).toList();

    for (final candidate in divisionCandidates) {
      final matched = AddressConstants.divisions.firstWhere(
        (d) => d['title']?.toLowerCase() == candidate.toLowerCase(),
        orElse: () => <String, String>{},
      );
      if (matched.isNotEmpty) return matched;
    }
    return {};
  }

  /// Extracts the initial city map from [place].
  static Map<String, dynamic>? matchImmediateCity(PlacePickResultEntity place) {
    if (place.city?.isNotEmpty == true) {
      return {'cities_name': place.city};
    }
    return null;
  }

  /// Extracts the initial area map from [place].
  static Map<String, dynamic>? matchImmediateArea(PlacePickResultEntity place) {
    final areaName = immediateAreaLabel(place);
    final zipCode = place.postCode?.toString() ?? '';
    final label = areaName.isNotEmpty ? areaName : zipCode;
    if (label.isNotEmpty) {
      return {
        'states_name': place.division ?? place.district ?? '',
        'cities_name': place.city ?? '',
        'zip_code': label,
      };
    }
    return null;
  }
}
