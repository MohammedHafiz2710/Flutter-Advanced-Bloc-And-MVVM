import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_failure.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchView();
              }));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(builder: (context, state) {
        if (state is NoWeatherStates) {
          return NoWeatherBody();
        } else if (state is WeatherLoadedStates) {
          return WeatherInfoBody();
        } else {
          return WeatherFailureBody();
        }
      }),
    );
  }
}
