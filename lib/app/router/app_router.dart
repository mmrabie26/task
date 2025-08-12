import 'package:go_router/go_router.dart';
import 'package:task/feature/authentication/presentation/pages/login_page.dart';

abstract class AppRouter {
  static const String kLoginPage = '/login';
  static const String kRegisterPage = '/register';
  static const String kForgetPasswordPage = '/forget-password';
  static const String kVerifyOtpPage = '/verify-otp';
  static const String kChangePasswordPage = '/change-password';
  static const String kHomePage = '/home';

  static final router = GoRouter(
    initialLocation: kLoginPage,
    routes:
    [
      GoRoute(path: kLoginPage, builder: (context, state) => LoginPage()),
    ],
  );
}
