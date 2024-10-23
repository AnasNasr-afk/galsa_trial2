import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:galsa_trial2/core/di/dependency_injection.dart';
import 'package:galsa_trial2/core/helpers/shared_pref_helper.dart';
import 'package:galsa_trial2/core/routing/app_router.dart';
import 'package:galsa_trial2/shop_app.dart';

import 'core/constants/constants.dart';



bool isLoggedIn = false;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await checkUserLoggedIn();
  await Firebase.initializeApp();

  setUpGetIt();
  runApp(ShopApp (appRouter: AppRouter()));
}

Future<void> checkUserLoggedIn() async {
  String? token = await SharedPrefHelper.getData(Constants.userToken);

  if (token != null && token.isNotEmpty) {
    isLoggedIn = true;
  } else {
    isLoggedIn = false;
  }
}