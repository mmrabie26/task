import 'package:flutter/material.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/core/theme/dark_theme.dart';
import 'package:task/core/theme/light_theme.dart';



class ThemeHelper {
  static ThemeData get lightMode => lightTheme();

  static ThemeData get darkMode => darkTheme();

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    LocalStorageService().readSettingBox<String>(AppString.kTheme) == AppString.darkMode
        ? ThemeMode.dark
        : ThemeMode.light ?? ThemeMode.system,
  );
}
