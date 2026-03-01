import 'package:flutter/material.dart';
import 'package:homz/core/routing/routes.dart';
import 'package:homz/features/authentication/sign_in/presentation/views/sign_in_view.dart';
import 'package:homz/features/onboarding/presentation/views/onboarding_view.dart';

class AppRouter {
    Route? onGenerateRoute(RouteSettings settings) {
        //this arguments to be passed in any screen like this ( arguments as ClassName )
        //final arguments = settings.arguments;
        switch (settings.name) {
            case Routes.onBoardingScreen:
                return MaterialPageRoute(builder: (_) => OnboardingView());
              case Routes.signInScreen:
                return MaterialPageRoute(builder: (_) => SignInView());
            default:
                return null;
        }
    }
}