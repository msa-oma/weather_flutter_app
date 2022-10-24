import 'package:flutter_weather_task/feature/weather/domain/entity/weather_entity_x.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntityX>> getWeatherInfo();
}
