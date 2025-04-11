

class WeatherStates {}

class NoWeatherStates extends WeatherStates {}

class WeatherLoadedStates extends WeatherStates {
}

class WeatherFailureStates extends WeatherStates {
  final String error;
  WeatherFailureStates(this.error);
}
