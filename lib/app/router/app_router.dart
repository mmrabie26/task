import 'package:go_router/go_router.dart';
import 'package:task/core/services/app_keys.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/feature/authentication/presentation/pages/change_password_page.dart';
import 'package:task/feature/authentication/presentation/pages/forgot_password_page.dart';
import 'package:task/feature/authentication/presentation/pages/login_page.dart';
import 'package:task/feature/authentication/presentation/pages/register_page.dart';
import 'package:task/feature/authentication/presentation/pages/verify_otp_page.dart';
import 'package:task/feature/home/presentaion/pages/profile_settings_page.dart';
import 'package:task/feature/home/presentaion/pages/users_list_page.dart';

abstract class AppRouter {
  static const String kLoginPage = '/login';
  static const String kRegisterPage = '/register';
  static const String kForgetPasswordPage = '/forget-password';
  static const String kVerifyOtpPage = '/verify-otp';
  static const String kChangePasswordPage = '/change-password';
  static const String kHomePage = '/home';
  static const String kProfileSettingsPage = '/profile-settings';
  static const String kUsersListPage = '/users-list';

  static final router = GoRouter(
    navigatorKey: AppKeys.noInternetConnectionKey,
    initialLocation: LocalStorageService().getLoginStatus()??false?AppRouter.kUsersListPage:kLoginPage,
    routes:
    [
      GoRoute(path: kLoginPage, builder: (context, state) => LoginPage()),
      GoRoute(path: kRegisterPage, builder: (context, state) => RegisterPage()),
      GoRoute(path: kForgetPasswordPage, builder: (context, state) => ForgotPasswordPage()),
      GoRoute(path: kVerifyOtpPage, builder: (context, state) => VerifyOtpPage()),
      GoRoute(path: kChangePasswordPage,builder: (context, state) => ChangePasswordPage(),),
      GoRoute(path: kProfileSettingsPage, builder: (context, state) => ProfileSettingsPage()),
      GoRoute(path: kUsersListPage, builder: (context, state) => UsersListPage()),
    ],
  );
}
