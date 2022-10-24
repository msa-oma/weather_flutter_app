import 'package:flutter/material.dart';
import 'package:flutter_weather_task/feature/weather/presintation/screens/dates_screen.dart';
import 'package:flutter_weather_task/feature/weather/presintation/screens/weather_screen.dart';

class Routes {
  static const initialRoute = '/';
  static const datesRoute = "/datesroute";
  static const weatherRoute = "/weatherroute";
}

class AppRoutrs {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const DatesScreen());

      case Routes.datesRoute:
        return MaterialPageRoute(builder: (context) => const DatesScreen());

      case Routes.weatherRoute:
        return MaterialPageRoute(builder: (context) => const WeatherScreen());
    }
    return null;
  }
}
