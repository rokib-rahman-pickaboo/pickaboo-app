import 'package:flutter/material.dart';
import 'package:pickaboo/core/cache/fast_cache_manager.dart';
import 'package:pickaboo/core/cache/theme_key.dart';

class ThemeCacheManager {
  const ThemeCacheManager._();

  static bool? isDarkMode() {
    final value = FastCacheManager.getString(ThemeKey.theme.keyValue);
    if (value == null) return null;
    return value == 'true';
  }

  static Future<void> setThemeCache({required ThemeMode themeMode}) async {
    switch (themeMode) {
      case ThemeMode.dark:
        await FastCacheManager.setString(ThemeKey.theme.keyValue, 'true');
      case ThemeMode.light:
        await FastCacheManager.setString(ThemeKey.theme.keyValue, 'false');
      case ThemeMode.system:
        await FastCacheManager.remove(ThemeKey.theme.keyValue);
    }
  }
}
