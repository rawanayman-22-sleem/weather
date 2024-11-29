import 'dart:convert';
import 'package:http/http.dart' as http;

// class WeatherService {
//   // استبدل بمفتاح الـ API من WeatherAPI
//   final String apiKey = 'bf8334fa28894d25baa193638240411';  // مفتاح الـ API الجديد
//
//   Future<Map<String, dynamic>> fetchWeather(String city) async {
//     final url = Uri.parse(
//         'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=1&aqi=no&alerts=no'
//     );
//
//     try {
//       // إرسال الطلب لجلب بيانات الطقس
//       final response = await http.get(url);
//
//       if (response.statusCode == 200) {
//         // إذا كانت الاستجابة ناجحة، نقوم بتحليل البيانات
//         return json.decode(response.body);
//       } else {
//         throw Exception('Failed to load weather data');
//       }
//     } catch (e) {
//       print("Error fetching weather: $e");
//       throw Exception('Failed to fetch weather');
//     }
//   }
// }