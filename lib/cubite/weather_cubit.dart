import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/cubite/weather_state.dart';
import 'package:weather/model/modelWeather.dart';



class WeatherCubit extends Cubit<WeatherState> {
  final String apiKey = 'bf8334fa28894d25baa193638240411';

  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    final url = Uri.parse(
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=1&aqi=no&alerts=no',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final weather = WeatherModel.fromJson(data);
        emit(WeatherLoaded(weather));
      } else {
        emit(WeatherError('Failed to load weather data.'));
      }
    } catch (e) {
      emit(WeatherError('An error occurred: $e'));
    }
  }
}
