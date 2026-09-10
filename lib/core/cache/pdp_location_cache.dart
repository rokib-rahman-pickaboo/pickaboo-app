import 'dart:convert';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Helper to persist and restore the user's selected delivery location
/// across product detail pages using local phone storage (SharedPreferences).
class PdpLocationCache {
  static const String _key = 'pdp_cached_delivery_location';

  /// Saves the user-selected delivery location into local phone storage.
  static Future<void> saveLocation(PlacePickResultEntity location) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, jsonEncode(location.toJson()));
    } catch (_) {}
  }

  /// Retrieves the saved delivery location from local phone storage.
  static Future<PlacePickResultEntity?> getLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw == null || raw.isEmpty) return null;
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return PlacePickResultEntity.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  /// Clears the cached delivery location.
  static Future<void> clearLocation() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_key);
    } catch (_) {}
  }
}
