// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../models/weather_model_x.dart';

abstract class WeatherDatasource {
  Future<WeatherModelX> getAllWeatherInfo();
}

class WeatherDatasourceImpl implements WeatherDatasource {
  ApiConsumer apiConsumer;
  WeatherDatasourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<WeatherModelX> getAllWeatherInfo() async {
    final response = await apiConsumer.get(EndPoints.wUrl);
    final weatherModel = WeatherModelX.fromJson(response);
    print(weatherModel);
    return weatherModel;
  }
}
