import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_haven/core/di/dependency_injection.dart';
import 'package:game_haven/core/helpers/shared_pref_helper.dart';
import 'package:game_haven/core/routing/app_router.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/game_haven_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();

  // check user token from secure storage
  String? token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  // check if user has seen onboarding
  bool hasSeenOnboarding = await SharedPrefHelper.getBool('hasSeenOnboarding');
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  String initialRoute;

  // determine initial route based on onboarding and authentication status
  if (!hasSeenOnboarding) {
    initialRoute = Routes.onBoardingScreen;
  } else {
    initialRoute = (token != null && token.isNotEmpty) 
        ? Routes.mainScreen 
        : Routes.loginScreen;
  }

  runApp(GameHavenApp(
    appRouter: AppRouter(),
    initialRoute: initialRoute,
  ));
}
