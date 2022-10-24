import 'package:flutter_weather_task/feature/weather/data/data_source/weather_remote_datasource.dart';
import 'package:flutter_weather_task/feature/weather/data/repositories/weather_repo_impl.dart';
import 'package:flutter_weather_task/feature/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather_task/feature/weather/domain/usecases/weather_usecase.dart';
import 'package:flutter_weather_task/feature/weather/presintation/cubit/weather_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/api_interceptor.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Feature

  // Blocs
  sl.registerFactory<WeatherCubit>(() => WeatherCubit(weatherusecase: sl()));
  // Use cases

  sl.registerLazySingleton<Weatherusecase>(
      () => Weatherusecase(weatherRepository: sl()));
  // Repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepoImpl(
        networkInfo: sl(),
        weatherDatasource: sl(),
      ));
  // Data Sources
  sl.registerLazySingleton<WeatherDatasource>(
      () => WeatherDatasourceImpl(apiConsumer: sl()));
  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(
        client: sl(),
      ));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
