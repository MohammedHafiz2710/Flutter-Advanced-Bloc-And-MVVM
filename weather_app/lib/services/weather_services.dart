import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherServices {
  final Dio dio;
  final String apiKey = 'b4e8100bf52a4265b80164524241009';
  final String baseUrl = 'https://api.weatherapi.com/v1';
  WeatherServices(this.dio);

  Future<WeatherModel> getCurretWeather({required String cityName}) async {
    try {
      Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ?? 'oops! something went wrong';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops! something went wrong');
    }
  }
}
