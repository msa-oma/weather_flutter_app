import 'package:dartz/dartz.dart';
import 'package:flutter_weather_task/feature/weather/domain/entity/weather_entity_x.dart';
import 'package:flutter_weather_task/feature/weather/domain/repositories/weather_repository.dart';

import '../../../../core/error/failures.dart';

class Weatherusecase {
  final WeatherRepository weatherRepository;

  Weatherusecase({required this.weatherRepository});

  Future<Either<Failure, WeatherEntityX>> call() async {
    return await weatherRepository.getWeatherInfo();
  }
}
