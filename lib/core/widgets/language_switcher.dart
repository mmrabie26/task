import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:task/core/constants/app_strings.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (Locale locale) {
        context.setLocale(locale);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<Locale>(
          value: const Locale('en'),
          child: Row(
            children: [
              const Text('🇺🇸 '),
              Text(AppString.lightTheme.tr()), // Using light theme key for English
            ],
          ),
        ),
        PopupMenuItem<Locale>(
          value: const Locale('ar'),
          child: Row(
            children: [
              const Text('🇸🇦 '),
              Text(AppString.darkTheme.tr()), // Using dark theme key for Arabic
            ],
          ),
        ),
      ],
    );
  }
} 