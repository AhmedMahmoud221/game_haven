import 'package:game_haven/core/networking/api_service.dart';
import 'package:game_haven/features/auth/data/repos/login_repo.dart';
import 'package:game_haven/features/auth/data/repos/signup_repo.dart';
import 'package:game_haven/features/auth/logic/cubit/login_cubit.dart';
import 'package:game_haven/features/auth/logic/cubit/signup_cubit.dart';
import 'package:game_haven/features/home/data/repos/home_repo.dart';
import 'package:game_haven/features/home/logic/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    return dio;
  });

  // 2. ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // 3. Repos
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));

  // 4. Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}