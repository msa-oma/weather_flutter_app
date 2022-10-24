// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weather_task/feature/weather/domain/entity/weather_entity_x.dart';
import 'package:flutter_weather_task/feature/weather/domain/usecases/weather_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherusecase}) : super(WeatherInitial());

  final Weatherusecase weatherusecase;

  Future<void> getWeatherInfo() async {
    emit(WeatherLoading());
    Either<Failure, WeatherEntityX> response = await weatherusecase.call();

    emit(response.fold(
        (failure) => WeatherError(msg: _mapFailureToMsg(failure)),
        (weather) => WeatherLoaded(weatherEntityX: weather)));
  }
}

String _mapFailureToMsg(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailure;
    case OfflineFaliure:
      return AppStrings.offlineFailure;
    default:
      return AppStrings.unexpectedError;
  }
}
