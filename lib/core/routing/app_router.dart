
import 'package:flutter/material.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/features/auth/login_screen.dart';
import 'package:game_haven/features/auth/signup_screen.dart';
import 'package:game_haven/features/home/home_screen.dart';
import 'package:game_haven/features/home/main_wrapper.dart';
import 'package:game_haven/features/home/widgets/favorites_screen.dart';
import 'package:game_haven/features/home/widgets/game_details_screen.dart';
import 'package:game_haven/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => MainWrapper());
      case Routes.favoritesScreen:
        return MaterialPageRoute(builder: (_) => FavoritesScreen());
      case Routes.gameDetailsScreen:
        return MaterialPageRoute(builder: (_) => GameDetailsScreen());
      // case Routes.editProfile:
      //   return MaterialPageRoute(builder: (_) => EditProfile());
      // case Routes.personalInformation:
      //   return MaterialPageRoute(builder: (_) => PersonalInformationScreen());
      // case Routes.allCards:
      //   return MaterialPageRoute(builder: (_) => AllCards());
      // case Routes.addNewCard:
      //   return MaterialPageRoute(builder: (_) => AddNewCard());
      // case Routes.changePassword:
      //   return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
      // case Routes.privacyPolicy:
      //   return MaterialPageRoute(builder: (_) => PrivacyPolicy());
      // case Routes.languageScreen:
      //   return MaterialPageRoute(builder: (_) => LanguageSelectorScreen());

      default:
        return null;
    }
  }
}
