import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task/core/services/local_storage_service.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeHelper extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeHelper() {
    _loadSavedTheme();
  }

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void _loadSavedTheme() {
    final savedThemeMode = LocalStorageService().getTheme();
    if (savedThemeMode != null) {
      _themeMode = _getThemeModeFromString(savedThemeMode);
      notifyListeners();
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode != mode) {
      _themeMode = mode;
      await LocalStorageService().setTheme(mode.toString());
      notifyListeners();
    }
  }

  Future<void> toggleTheme() async {
    await setThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  ThemeMode _getThemeModeFromString(String themeModeString) {
    switch (themeModeString) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  static ThemeData get lightMode => lightTheme();
  static ThemeData get darkMode => darkTheme();
}
