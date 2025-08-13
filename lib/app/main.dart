import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/core/theme/dark_theme.dart';
import 'package:task/core/theme/light_theme.dart';
import 'package:task/core/theme/theme_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    LocalStorageService().openBox(),
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeHelper.themeNotifier,
      builder: (context, currentTheme, child) => MaterialApp.router(
        title: AppString.appName,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: currentTheme,
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}