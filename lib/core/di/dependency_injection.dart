import 'package:game_haven/core/networking/api_service.dart';
import 'package:game_haven/features/home/data/repos/home_repo.dart';
import 'package:game_haven/features/home/logic/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // 1. Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // 2. ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // 3. Repos
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));

  // 4. Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}