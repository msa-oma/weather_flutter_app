import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit.dart';
import '../widgets/xxerror_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    BlocProvider.of<WeatherCubit>(context).getWeatherInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Container(
              padding: const EdgeInsets.all(25),
              child: const Center(
                  child: CircularProgressIndicator(color: Colors.blueGrey)),
            );
          } else if (state is WeatherLoaded) {
            return Stack(children: [
              Positioned(
                left: 25,
                top: 50,
                child: Text(state.weatherEntityX.list[0].weather[0].description
                    .toString()),
              ),
              const Center(
                  child: Icon(
                Icons.cloud,
                size: 180,
                color: Colors.white70,
              )),
              Positioned(
                bottom: 100,
                left: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          state.weatherEntityX.city.name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          "${state.weatherEntityX.list[0].main.temp ~/ 10}°",
                          style: const TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "wind",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "${state.weatherEntityX.list[0].wind.speed.toInt()}km/h ",
                          style: const TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "humidity  ",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          "${state.weatherEntityX.list[0].main.humidity}%",
                          style: const TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]);
          } else if (state is WeatherError) {
            return const XxErrorWidget();
          }
          return Container(
            padding: const EdgeInsets.all(25),
            child: const Center(
                child: CircularProgressIndicator(color: Colors.red)),
          );
        },
      ),
    );
  }
}
