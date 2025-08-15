import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:task/core/services/local_storage_service.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('ar');
  static const String _languageKey = 'language_code';

  LanguageProvider() {
    _loadSavedLanguage();
  }

  Locale get currentLocale => _currentLocale;

  Future<void> _loadSavedLanguage() async {
    final savedLanguage = LocalStorageService().getLang();
    if (savedLanguage != null) {
      _currentLocale = Locale(savedLanguage);
      notifyListeners();
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (_currentLocale.languageCode != languageCode) {
      _currentLocale = Locale(languageCode);
      await LocalStorageService().setLang(languageCode);
      await LocalStorageService().setLang(languageCode);
      notifyListeners();
    }
  }

  bool get isArabic => _currentLocale.languageCode == 'ar';
}