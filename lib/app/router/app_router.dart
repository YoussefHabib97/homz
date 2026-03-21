import 'package:go_router/go_router.dart';
import 'package:homz/features/authentication/password_actions/forgot_password/views/forgot_password_view.dart';
import 'package:homz/features/authentication/password_actions/password_verification/views/password_verification_view.dart';
import 'package:homz/features/authentication/password_actions/reset_password/views/reset_password_view.dart';
import 'package:homz/features/authentication/sign_in/ui/views/sign_in_view.dart';
import 'package:homz/features/authentication/sign_up/ui/views/sign_up_view.dart';
import 'package:homz/features/chat/ui/views/chat_view.dart';
import 'package:homz/features/home/ui/views/home_view.dart';
import 'package:homz/features/onboarding/ui/views/onboarding_view.dart';
import 'package:homz/features/residential/details/ui/views/details_view.dart';
import 'package:homz/features/residential/look/ui/views/look_screen.dart';

abstract class AppRouter {
  static const kViewHome = '/homeView';
  static const kViewOnboarding = '/onboardingView';
  static const kViewSignIn = '/signInView';
  static const kViewSignUp = '/signUpView';
  static const kViewForgotPassword = '/forgotPasswordView';
  static const kViewResetPassword = '/resetPasswordView';
  static const kViewPasswordVerification = '/passwordVerificationView';
  static const kViewResidentialLook = '/residentialLookScreen';
  static const kViewResidentialDetails = '/residentialDetailsScreen';
  static const kViewChat = '/chatView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(
        path: kViewOnboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kViewSignIn,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(path: kViewChat, builder: (context, state) => const ChatView()),
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
      GoRoute(
        path: kViewResidentialLook,
        builder: (context, state) => const LookView(),
      ),
      GoRoute(
        path: kViewResidentialDetails,
        builder: (context, state) => DetailsView(),
      ),
    ],
  );
}
