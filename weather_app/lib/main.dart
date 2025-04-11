import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather App',
              theme: ThemeData(
                // old flutter
                primarySwatch: getThemeMaterialColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition),
                useMaterial3: false,
                // new flutter
                // useMaterial3: true,
                // primarySwatch: Colors.deepPurple,
                // appBarTheme: AppBarTheme(
                //   backgroundColor: Colors.deepPurple,
                //   foregroundColor: Colors.white,
                // ),
              ),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeMaterialColor(String? condition) {
  if (condition == null || condition.isEmpty) {
    return Colors.blueGrey;
  }

  if (condition == "Clear") {
    return Colors.yellow;
  } else if (condition == "Sunny") {
    return Colors.orange;
  } else if (condition == "Partly cloudy") {
    return Colors.lightBlue;
  } else if (condition == "Cloudy") {
    return Colors.grey;
  } else if (condition == "Overcast") {
    return Colors.blueGrey;
  } else if (condition == "Mist") {
    return Colors.teal;
  } else if (condition == "Patchy rain possible") {
    return Colors.lightBlue;
  } else if (condition == "Thundery outbreaks possible") {
    return Colors.purple;
  } else if (condition == "Patchy snow possible") {
    return Colors.blue;
  } else if (condition == "Blizzard") {
    return Colors.indigo;
  } else if (condition == "Fog") {
    return Colors.grey;
  } else if (condition.contains("rain") || condition.contains("Rain")) {
    return Colors.blue;
  } else if (condition.contains("snow") || condition.contains("Snow")) {
    return Colors.cyan;
  } else if (condition.contains("sleet") || condition.contains("Sleet")) {
    return Colors.blueGrey;
  } else if (condition.contains("ice") || condition.contains("Ice")) {
    return Colors.lightBlue;
  } else if (condition.contains("thunder") || condition.contains("Thunder")) {
    return Colors.deepPurple;
  } else {
    return Colors.blueGrey;
  }
}
