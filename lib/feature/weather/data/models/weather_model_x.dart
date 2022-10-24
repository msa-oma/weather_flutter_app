import 'package:flutter_weather_task/feature/weather/domain/entity/weather_entity_x.dart';

class WeatherModelX extends WeatherEntityX {
  const WeatherModelX(
      {required super.cod,
      required super.message,
      required super.cnt,
      required super.list,
      required super.city});

  factory WeatherModelX.fromJson(Map<String, dynamic> json) => WeatherModelX(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElementModel.fromJson(x))),
        city: CityModel.fromJson(json["city"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "cod": cod,
  //       "message": message,
  //       "cnt": cnt,
  //       "list": List<dynamic>.from(list.map((x) => x.toJson())),
  //       "city": city, // city.toJson(),
  //     };
}

class CityModel extends City {
  CityModel(
      {required super.id,
      required super.name,
      required super.coord,
      required super.country,
      required super.population,
      required super.timezone,
      required super.sunrise,
      required super.sunset});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
        coord: CoordModel.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord, //coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class CoordModel extends Coord {
  CoordModel({required super.lat, required super.lon});
  factory CoordModel.fromJson(Map<String, dynamic> json) => CoordModel(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class ListElementModel extends ListElement {
  ListElementModel(
      {required super.dt,
      required super.main,
      required super.weather,
      required super.clouds,
      required super.wind,
      required super.visibility,
      required super.pop,
      required super.sys,
      required super.dtTxt});

  factory ListElementModel.fromJson(Map<String, dynamic> json) =>
      ListElementModel(
        dt: json["dt"],
        main: MainClassModel.fromJson(json["main"]),
        weather: List<WeatherElement>.from(
            json["weather"].map((x) => WeatherElementModel.fromJson(x))),
        clouds: CloudsModel.fromJson(json["clouds"]),
        wind: WindModel.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"],
        sys: SysModel.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "dt": dt,
  //       "main": main, //main.toJson(),
  //       "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
  //       "clouds": clouds, // clouds.toJson(),
  //       "wind": wind, // wind.toJson(),
  //       "visibility": visibility,
  //       "pop": pop,
  //       "sys": sys, // sys.toJson(),
  //       "dt_txt": dtTxt.toIso8601String(),
  //     };
}

class CloudsModel extends Clouds {
  CloudsModel({required super.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) => CloudsModel(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class MainClassModel extends MainClass {
  MainClassModel(
      {required super.temp,
      required super.feelsLike,
      required super.tempMin,
      required super.tempMax,
      required super.pressure,
      required super.seaLevel,
      required super.grndLevel,
      required super.humidity,
      required super.tempKf});

  factory MainClassModel.fromJson(Map<String, dynamic> json) => MainClassModel(
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        tempMin: json["temp_min"].toDouble(),
        tempMax: json["temp_max"].toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class SysModel extends Sys {
  SysModel({required super.pod});

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        pod: podValues.map[json["pod"]],
      );

  Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
      };
}

class WeatherElementModel extends WeatherElement {
  WeatherElementModel(
      {required super.id,
      required super.main,
      required super.description,
      required super.icon});

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      WeatherElementModel(
        id: json["id"],
        main: mainEnumValues.map[json["main"]],
        description: descriptionValues.map[json["description"]],
        icon: iconValues.map[json["icon"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": iconValues.reverse[icon],
      };
}

class WindModel extends Wind {
  WindModel({required super.speed, required super.deg, required super.gust});
  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
