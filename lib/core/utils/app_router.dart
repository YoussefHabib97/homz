import 'package:go_router/go_router.dart';
import 'package:homz/features/authentication/password_actions/forgot_password/views/forgot_password_view.dart';
import 'package:homz/features/authentication/password_actions/password_verification/views/password_verification_view.dart';
import 'package:homz/features/authentication/password_actions/reset_password/views/reset_password_view.dart';
import 'package:homz/features/authentication/sign_in/ui/views/sign_in_view.dart';
import 'package:homz/features/authentication/sign_up/ui/views/sign_up_view.dart';
import 'package:homz/features/chat/ui/views/chat_view.dart';
import 'package:homz/features/commercial/details/ui/details_screen.dart';
import 'package:homz/features/commercial/look/ui/look_screen.dart';
import 'package:homz/features/home/ui/views/home_view.dart';
import 'package:homz/features/onboarding/ui/views/onboarding_view.dart';
import 'package:homz/features/profile/ui/views/account_details_view.dart';
import 'package:homz/features/residential/details/ui/details_screen.dart';
import 'package:homz/features/residential/look/ui/look_screen.dart';
import 'package:homz/features/shop/details/ui/details_screen.dart';
import 'package:homz/features/shop/look/ui/shop_look_screen.dart';

abstract class AppRouter {
  static const kViewHome = '/homeView';
  static const kViewOnboarding = '/onboardingView';
  static const kViewSignIn = '/signInView';
  static const kViewSignUp = '/signUpView';
  static const kViewForgotPassword = '/forgotPasswordView';
  static const kViewResetPassword = '/resetPasswordView';
  static const kViewPasswordVerification = '/passwordVerificationView';
  static const kViewResidentialLook = '/residentialLookScreen';
  static const kViewCommercialLook = '/commercialLookScreen';
  static const kViewShopsLook = '/shopsLookScreen';

  static const kViewResidentialDetails = '/residentialDetailsScreen';
  static const kViewCommercialDetails = '/commercialDetailsScreen';
  static const kViewShopsDetails = '/shopsDetailsScreen';
  static const kViewChat = '/chatView';
  static const kViewAccountDetails = '/accountDetailsView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(
        path: kViewOnboarding,
        // path: kViewOnboarding,
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
        path: kViewAccountDetails,
        builder: (context, state) => AccountDetailsView(),
      ),
      GoRoute(
        path: kViewResidentialLook,
        builder: (context, state) => const LookScreen(),
      ),
      GoRoute(
        path: kViewCommercialLook,
        builder: (context, state) => const CommercialLookScreen(),
      ),
      GoRoute(
        path: kViewShopsLook,
        builder: (context, state) => const ShopLookScreen(),
      ),
      GoRoute(
        path: kViewResidentialDetails,
        builder: (context, state) => DetailsScreen(),
      ),
      GoRoute(
        path: kViewCommercialDetails,
        builder: (context, state) => CommercilDetailsScreen(),
      ),
      GoRoute(
        path: kViewShopsDetails,
        builder: (context, state) => ShopDetailsScreen(),
      ),
    ],
  );
}
