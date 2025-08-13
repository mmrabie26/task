# Internationalization (i18n) Setup

This Flutter app is set up with internationalization using the `easy_localization` package to support both Arabic (ar) and English (en) languages.

## Setup

### 1. Dependencies
The `easy_localization: ^3.0.8` package is already added to `pubspec.yaml`.

### 2. Translation Files
Translation files are located in `assets/translations/`:
- `en.json` - English translations
- `ar.json` - Arabic translations

### 3. Main Configuration
The app is configured in `lib/app/main.dart` with:
```dart
EasyLocalization(
  supportedLocales: const [Locale('ar'), Locale('en')],
  path: 'assets/translations',
  child: const MyApp(),
),
```

## Usage

### 1. Adding New Translation Keys

#### Step 1: Add to JSON files
Add the key-value pairs to both `en.json` and `ar.json`:

```json
// en.json
{
  "new_section": {
    "new_key": "English text"
  }
}

// ar.json
{
  "new_section": {
    "new_key": "النص العربي"
  }
}
```

#### Step 2: Add to AppString class
Add the constant to `lib/core/constants/app_strings.dart`:

```dart
static const String newKey = 'new_section.new_key';
```

#### Step 3: Use in widgets
```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:task/core/constants/app_strings.dart';

Text(AppString.newKey.tr())
```

### 2. Using Translations in Widgets

#### Basic usage:
```dart
Text(AppString.welcomeBack.tr())
```

#### With parameters:
```dart
Text(AppString.resendCodeInSeconds.tr(args: ['30']))
```

### 3. Language Switching

Use the `LanguageSwitcher` widget to allow users to change languages:

```dart
import 'package:task/core/widgets/language_switcher.dart';

AppBar(
  actions: [
    const LanguageSwitcher(),
  ],
)
```

### 4. Programmatic Language Change

```dart
// Change to Arabic
context.setLocale(const Locale('ar'));

// Change to English
context.setLocale(const Locale('en'));
```

## Current Translation Keys

### Authentication
- `auth.welcome_back` - Welcome back message
- `auth.login_subtitle` - Login subtitle
- `auth.email` - Email field label
- `auth.password` - Password field label
- `auth.forgot_password` - Forgot password link
- `auth.login` - Login button
- `auth.no_account` - No account message
- `auth.sign_up` - Sign up button
- And many more...

### Common
- `common.edit` - Edit button
- `common.save` - Save button

### Profile & Settings
- `profile.title` - Profile title
- `settings.change_language` - Change language option
- `settings.change_theme` - Change theme option

### Dashboard & Features
- `dashboard.title` - Dashboard title
- `attendance.title` - Attendance title
- `payments.title` - Payments title
- `chat.type_message` - Chat input placeholder

## Best Practices

1. **Always use translation keys** instead of hardcoded strings
2. **Keep keys organized** by feature/section (e.g., `auth.*`, `dashboard.*`)
3. **Use descriptive key names** that clearly indicate the content
4. **Test both languages** to ensure proper text display
5. **Consider text length** - Arabic text might be longer/shorter than English
6. **Use parameters** for dynamic content (e.g., `{seconds}` in countdown)

## Adding New Languages

To add a new language (e.g., French):

1. Create `fr.json` in `assets/translations/`
2. Add `Locale('fr')` to `supportedLocales` in `main.dart`
3. Translate all keys to French
4. Update the `LanguageSwitcher` widget to include French option

## Troubleshooting

### Text not showing in correct language:
- Check if the translation key exists in both JSON files
- Verify the key is added to `AppString` class
- Ensure `easy_localization` is properly imported
- Check if the locale is set correctly

### App crashes on language change:
- Verify all translation keys exist in the new language
- Check for syntax errors in JSON files
- Ensure the locale is supported in `supportedLocales` 