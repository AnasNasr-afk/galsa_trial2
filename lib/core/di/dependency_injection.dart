import 'package:dio/dio.dart';
import 'package:galsa_trial2/features/signup_screen/cubit/signup_cubit.dart';
import 'package:galsa_trial2/features/signup_screen/data/repos/signup_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/login_screen/cubit/login_cubit.dart';
import '../../features/login_screen/data/repos/login_repo.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future <void> setUpGetIt () async {
  Dio dio = await DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

//login injection
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  // sign up injection
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt<ApiService>()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
}