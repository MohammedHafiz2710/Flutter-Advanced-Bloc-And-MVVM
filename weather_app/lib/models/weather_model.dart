class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;
  final String weatherCondition;

  WeatherModel({required this.cityName, required this.date, required this.image, required this.temperature, required this.maxTemperature, required this.minTemperature, required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temperature: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemperature: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemperature: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
