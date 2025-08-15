import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:task/app/router/app_router.dart';
import 'package:task/core/constants/app_strings.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/core/services/LanguageProvider.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/core/theme/dark_theme.dart';
import 'package:task/core/theme/light_theme.dart';
import 'package:task/core/theme/theme_helper.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/models/register_model.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';
import 'package:task/feature/home/presentaion/cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.initFlutter();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    Firebase.initializeApp(),
    Supabase.initialize(
      url: 'https://vwljpsaeftnvznbmycrk.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ3bGpwc2FlZnRudnpuYm15Y3JrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUxODA1NzcsImV4cCI6MjA3MDc1NjU3N30.a3N561aAWvZ90EFkR5d7dCORP6P6_pdG9jNF-sI4kc8',
    ),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeHelper()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()..getAllUsers()),
      ],
      child: Consumer2<ThemeHelper, LanguageProvider>(
        builder: (context, themeHelper, languageProvider, child) {
          return MaterialApp.router(
            title: AppString.appName,
            theme: ThemeHelper.lightMode,
            darkTheme: ThemeHelper.darkMode,
            themeMode: themeHelper.themeMode,
            routerConfig: AppRouter.router,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: languageProvider.currentLocale,
          );
        },
      ),
    );
  }
}
