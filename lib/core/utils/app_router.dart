import 'package:go_router/go_router.dart';
import 'package:homz/features/authentication/password_actions/presentation/views/forgot_password/forgot_password_view.dart';
import 'package:homz/features/authentication/password_actions/presentation/views/password_verification/password_verification_view.dart';
import 'package:homz/features/authentication/password_actions/presentation/views/reset_password/reset_password_view.dart';
import 'package:homz/features/authentication/sign_in/presentation/views/sign_in_view.dart';
import 'package:homz/features/authentication/sign_up/presentation/views/sign_up_view.dart';
import 'package:homz/features/home/presentation/views/home_view.dart';
import 'package:homz/features/onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const kViewHome = '/homeView';
  static const kViewOnboarding = '/onboardingView';
  static const kViewSignIn = '/signInView';
  static const kViewSignUp = '/signUpView';
  static const kViewForgotPassword = '/forgotPasswordView';
  static const kViewResetPassword = '/resetPasswordView';
  static const kViewPasswordVerification = '/passwordVerificationView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: kViewHome, builder: (context, state) => const HomeView()),
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
      GoRoute(
        path: kViewSignIn,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: kViewSignUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kViewForgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: kViewResetPassword,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(
        path: kViewPasswordVerification,
        builder: (context, state) => const PasswordVerificationView(),
      ),
    ],
  );
}
