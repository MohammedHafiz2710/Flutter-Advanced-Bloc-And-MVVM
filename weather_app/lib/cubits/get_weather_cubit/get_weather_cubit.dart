import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(NoWeatherStates());
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(Dio()).getCurretWeather(cityName: cityName);
      emit(WeatherLoadedStates());
    } catch (e) {
      emit(WeatherFailureStates(e.toString()));
    }
  }
}
