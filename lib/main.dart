// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_haven/core/di/dependency_injection.dart';
import 'package:game_haven/core/routing/app_router.dart';
import 'package:game_haven/game_haven_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await setupGetIt();
  runApp(GameHavenApp(appRouter: AppRouter(),));
}
