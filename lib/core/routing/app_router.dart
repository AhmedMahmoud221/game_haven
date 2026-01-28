import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_haven/core/di/dependency_injection.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/features/auth/logic/cubit/login_cubit.dart';
import 'package:game_haven/features/auth/logic/cubit/signup_cubit.dart';
import 'package:game_haven/features/auth/ui/login_screen.dart';
import 'package:game_haven/features/auth/ui/signup_screen.dart';
import 'package:game_haven/features/home/data/models/game_model.dart';
import 'package:game_haven/features/home/ui/home_screen.dart';
import 'package:game_haven/features/home/logic/cubit/home_cubit.dart';
import 'package:game_haven/features/home/ui/main_wrapper.dart';
import 'package:game_haven/features/home/ui/widgets/favorites_screen.dart';
import 'package:game_haven/features/home/ui/widgets/game_details_screen.dart';
import 'package:game_haven/features/onboarding/onboarding_screen.dart';
import 'package:game_haven/features/profile/profile_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.profileLogout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );

      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const MainWrapper(),
          ),
        );

      case Routes.favoritesScreen:
        return MaterialPageRoute(builder: (_) => FavoritesScreen());

      case Routes.gameDetailsScreen:
        final game = settings.arguments as GameModel?;
        return MaterialPageRoute(
          builder: (_) => GameDetailsScreen(gameModel: game),
        );
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
