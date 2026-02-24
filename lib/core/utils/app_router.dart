import 'package:go_router/go_router.dart';
import 'package:homz/features/authentication/password_actions/presentation/pages/forgot_password_page.dart';
import 'package:homz/features/authentication/password_actions/presentation/pages/password_verification_page.dart';
import 'package:homz/features/authentication/password_actions/presentation/pages/reset_password_page.dart';
import 'package:homz/features/authentication/sign_in/presentation/pages/sign_in_page.dart';
import 'package:homz/features/authentication/sign_up/presentation/pages/sign_up_page.dart';
import 'package:homz/features/onboarding/presentation/pages/onboarding_page.dart';

abstract class AppRouter {
  static const kPageHome = '/';
  static const kPageOnboarding = '/onboardingPage';
  static const kPageSignIn = '/signInPage';
  static const kPageSignUp = '/signUpPage';
  static const kPageForgotPassword = '/forgotPasswordPage';
  static const kPageResetPassword = '/resetPasswordPage';
  static const kPagePasswordVerification = '/passwordVerificationPage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kPageHome,
        //? TODO: To be changed after debugging
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: kPageOnboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: kPageSignIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: kPageSignUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: kPageForgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: kPageResetPassword,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: kPagePasswordVerification,
        builder: (context, state) => const PasswordVerificationPage(),
      ),
    ],
  );
}
