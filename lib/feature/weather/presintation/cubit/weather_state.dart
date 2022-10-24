// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntityX weatherEntityX;
  const WeatherLoaded({
    required this.weatherEntityX,
  });
  @override
  List<Object> get props => [weatherEntityX];
}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  final String msg;
  const WeatherError({required this.msg});
  @override
  List<Object> get props => [msg];
}
