import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galsa_trial2/core/di/dependency_injection.dart';
import 'package:galsa_trial2/core/routing/routes.dart';
import 'package:galsa_trial2/features/add_post_screen/cubit/add_post_cubit.dart';
import 'package:galsa_trial2/features/home_screen/home_screen.dart';

import 'package:galsa_trial2/features/login_screen/login_screen.dart';
import 'package:galsa_trial2/features/signup_screen/cubit/signup_cubit.dart';
import 'package:galsa_trial2/features/signup_screen/signup_screen.dart';
import 'package:galsa_trial2/features/signup_screen/signup_successful.dart';
import '../../features/login_screen/cubit/login_cubit.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute (RouteSettings settings){
    switch(settings.name){
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen()),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.signUpSuccessfulScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupSuccessfulScreen(),
        );
        case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddPostCubit(),
              child: const HomeScreen()),
        );
        // case Routes.addPostScreen:
        // return MaterialPageRoute(
        //   builder: (_) => BlocProvider(
        //       create: (BuildContext context) => AddPostCubit(),
        //       child: const AddPostScreen()),
        // );
      default:
        return null;
    }
  }
}