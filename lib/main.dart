// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_haven/core/di/dependency_injection.dart';
import 'package:game_haven/core/helpers/shared_pref_helper.dart';
import 'package:game_haven/core/routing/app_router.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/game_haven_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  String? token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);

  String initialRoute = (token != null && token.isNotEmpty) 
      ? Routes.mainScreen 
      : Routes.loginScreen;

  runApp(GameHavenApp(
    appRouter: AppRouter(),
    initialRoute: initialRoute,
  ));
}
