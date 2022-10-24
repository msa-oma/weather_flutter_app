import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_weather_task/feature/weather/domain/entity/weather_entity_x.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/weather_repository.dart';
import '../data_source/weather_remote_datasource.dart';

class WeatherRepoImpl implements WeatherRepository {
  final NetworkInfo networkInfo;
  final WeatherDatasource weatherDatasource;
  WeatherRepoImpl({
    required this.weatherDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherEntityX>> getWeatherInfo() async {
    if (await networkInfo.isConnected) {
      if (kDebugMode) {
        print(" msa  ${networkInfo.isConnected}");
      }
      try {
        final weatherInfo = await weatherDatasource.getAllWeatherInfo();

        return Right(weatherInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFaliure());
  }
}
