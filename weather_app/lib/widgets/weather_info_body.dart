import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          getThemeMaterialColor(weatherModel?.weatherCondition),
          getThemeMaterialColor(weatherModel?.weatherCondition)[300]!,
          getThemeMaterialColor(weatherModel?.weatherCondition)[50]!,
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel!.cityName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              "updated at ${DateFormat.jm().format(weatherModel.date)}",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${weatherModel.image}",
                  scale: 0.9,
                ),
                Text(
                  "${weatherModel.temperature.round()}°C",
                  style: TextStyle(fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      "MaxTemp: ${weatherModel.maxTemperature.round()}°C",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text("MinTemp: ${weatherModel.minTemperature.round()}°C", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(weatherModel.weatherCondition, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
