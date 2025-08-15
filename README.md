# Task Flutter App

- APK : https://drive.google.com/file/d/1qR90qSG6ZggH1YRHb3ak6KP6MMQ0mwcu/view?usp=drive_link
- video: https://drive.google.com/file/d/1bfF8sckPAo9gBFyGQQDvkOgOqxY8PAwE/view?usp=sharing

## GitHub Repository
- Public repo URL: https://github.com/mmrabie26/task

## Features
- Authentication UI (Login, Register, Forgot/Change Password, Verify OTP)
- Profile & Settings page UI (view user data, change language, change theme, logout button)
- Light/Dark themes and shared design system (colors, spacing, text styles)
- Internationalization (English and Arabic) with `easy_localization`
- Routing via `go_router`

## Tech Stack
- Language: Dart, Flutter
- Routing: `go_router`
- State Management: `flutter_bloc`, `provider`
- Networking: `dio`
- Functional utils: `dartz`
- Storage: `hive`, `hive_flutter`
- Media: `image_picker`, `image_cropper`
- Auth/Backend (ready to integrate): `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_storage`, `supabase_flutter`
- Localization: `easy_localization`

## Project Structure clean architecture

Estimated Development Time

The development of this project took approximately 10 hours, including:

Planning and designing the app structure: ~1 hour

Setting up Firebase and backend integration: ~0.5 hour

Implementing UI screens and features: ~3 hours

Adding logic to the user interface (UI Logic): ~2.5 hour

Testing, debugging, and optimization: ~3 hours

Total Estimated Time: ~10 hours

## Challenges & Solutions
- Consistent modern UI without business logic
  - Solution: Created modular, stateless screens with themed widgets and reusable components.
- Clean i18n across new screens
  - Solution: Centralized keys in `AppString`, added `en.json`/`ar.json` entries, and used `easy_localization` where reactive.
- Theme cohesion (light/dark)
  - Solution: Single source of truth in theme helper and constants; components use `Theme.of(context)`.
- Scalable navigation
  - Solution: `go_router` with named constants in `app_router.dart`.
