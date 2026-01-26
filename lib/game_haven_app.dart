import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_haven/core/routing/app_router.dart';
import 'package:game_haven/core/routing/routes.dart';
import 'package:game_haven/core/theming/colors.dart';

class GameHavenApp extends StatelessWidget {
  final AppRouter appRouter;
  const GameHavenApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
        title: 'Game Haven App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainPurple,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
       );
      },
    );
  }
}