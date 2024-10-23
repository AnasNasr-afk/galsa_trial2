import 'package:flutter/material.dart';
import 'package:galsa_trial2/core/routing/app_router.dart';
import 'package:galsa_trial2/main.dart';

import 'core/routing/routes.dart';
import 'core/theming/color_manager.dart';

class ShopApp extends StatelessWidget {
  final AppRouter appRouter;
  const ShopApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      theme: ThemeData(
        primaryColor: ColorManager.mainBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn? Routes.homeScreen : Routes.onBoardingScreen ,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
