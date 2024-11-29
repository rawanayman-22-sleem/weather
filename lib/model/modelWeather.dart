// class WeatherModel {
//   final String cityName;
//   final String country;
//   final double temperature;
//   final String conditionText;
//   final String conditionIconUrl;
//
//   WeatherModel({
//     required this.cityName,
//     required this.country,
//     required this.temperature,
//     required this.conditionText,
//     required this.conditionIconUrl,
//   });
//
//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     return WeatherModel(
//       cityName: json['location']['name'],
//       country: json['location']['country'],
//       temperature: json['current']['temp_c'].toDouble(),
//       conditionText: json['current']['condition']['text'],
//       conditionIconUrl: 'http:${json['current']['condition']['icon']}',
//     );
//   }
// }

class WeatherModel {
  final String cityName;
  final String country;
  final double temperature;
  final String conditionText;
  final String conditionIconUrl;
  final double maxTemperature;
  final double minTemperature;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.conditionText,
    required this.conditionIconUrl,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      temperature: json['current']['temp_c'].toDouble(),
      conditionText: json['current']['condition']['text'],
      conditionIconUrl: 'http:${json['current']['condition']['icon']}',
      maxTemperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      minTemperature: json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
    );
  }
}
