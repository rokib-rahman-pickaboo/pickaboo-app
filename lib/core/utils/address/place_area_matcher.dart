import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';

List<String> areaCandidates(PlacePickResultEntity place) {
  final values = <String>[
    place.subDistrict ?? '',
    place.area ?? '',
    place.subArea ?? '',
  ];

  final seen = <String>{};
  final candidates = <String>[];
  for (final value in values) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) continue;
    if (seen.add(trimmed.toLowerCase())) candidates.add(trimmed);
  }
  return candidates;
}

Map<String, dynamic> matchArea(
  List<Map<String, dynamic>> areas,
  PlacePickResultEntity place,
) {
  if (areas.isEmpty) return <String, dynamic>{};

  String norm(Object? value) => value?.toString().trim().toLowerCase() ?? '';

  final candidates = areaCandidates(place);

  for (final candidate in candidates) {
    final target = candidate.toLowerCase();
    final match = areas.firstWhere(
      (a) => norm(a['cities_name']) == target || norm(a['zip_code']) == target,
      orElse: () => <String, dynamic>{},
    );
    if (match.isNotEmpty) return match;
  }

  final postCode = place.postCode?.toString().trim() ?? '';
  if (postCode.isNotEmpty) {
    final match = areas.firstWhere(
      (a) => norm(a['zip_code']) == postCode.toLowerCase(),
      orElse: () => <String, dynamic>{},
    );
    if (match.isNotEmpty) return match;
  }

  for (final candidate in candidates) {
    final target = candidate.toLowerCase();
    final match = areas.firstWhere((a) {
      final name = norm(a['cities_name']);
      if (name.isEmpty) return false;
      return name.contains(target) || target.contains(name);
    }, orElse: () => <String, dynamic>{});
    if (match.isNotEmpty) return match;
  }

  return <String, dynamic>{};
}

String immediateAreaLabel(PlacePickResultEntity place) {
  final candidates = areaCandidates(place);
  return candidates.isEmpty ? '' : candidates.first;
}
