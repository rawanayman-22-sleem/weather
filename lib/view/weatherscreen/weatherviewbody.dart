import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubite/weather_cubit.dart';
import 'package:weather/cubite/weather_state.dart';
import '../search.dart';

class WeatherViewBody extends StatelessWidget {
  final String initialCity;

  WeatherViewBody({required this.initialCity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
       // centerTitle: true,
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is WeatherLoaded) {
            final weather = state.weather;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue.shade300],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '${weather.cityName}, ${weather.country}',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${weather.temperature}°C',
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              weather.conditionIconUrl,
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 10),
                            Text(
                              weather.conditionText,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Temperature Details',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Max: ${weather.maxTemperature}°C',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            'Min: ${weather.minTemperature}°C',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final city = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityInputScreen()),
                      );
                      if (city != null && city.isNotEmpty) {
                        context.read<WeatherCubit>().fetchWeather(city);
                      }
                    },
                    icon: Icon(Icons.location_city, size: 24,  color: Colors.white,),
                    label: Text('Change City',style: TextStyle(fontSize: 18, color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is WeatherError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          } else {
            return Center(
              child: Text(
                'Enter a city to get the weather',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<WeatherCubit>().fetchWeather(initialCity),
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}

// class WeatherViewBody extends StatelessWidget {
//   final String initialCity;
//
//   WeatherViewBody({required this.initialCity});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//        // title: Text('Weather App'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: BlocBuilder<WeatherCubit, WeatherState>(
//         builder: (context, state) {
//           if (state is WeatherLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is WeatherLoaded) {
//             final weather = state.weather;
//             return Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.blueAccent, Colors.lightBlue.shade300],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '${weather.cityName}, ${weather.country}',
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     '${weather.temperature}°C',
//                     style: TextStyle(
//                       fontSize: 60,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.network(
//                         weather.conditionIconUrl,
//                         width: 80,
//                         height: 80,
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         weather.conditionText,
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Max: ${weather.maxTemperature}°C',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'Min: ${weather.minTemperature}°C',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton.icon(
//                     onPressed: () async {
//                       final city = await Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CityInputScreen()),
//                       );
//                       if (city != null && city.isNotEmpty) {
//                         context.read<WeatherCubit>().fetchWeather(city);
//                       }
//                     },
//                     icon: Icon(Icons.location_city),
//                     label: Text('Change City'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.blueAccent,
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is WeatherError) {
//             return Center(
//               child: Text(
//                 state.message,
//                 style: TextStyle(color: Colors.red, fontSize: 18),
//               ),
//             );
//           } else {
//             return Center(
//               child: Text(
//                 'Enter a city to get the weather',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => context.read<WeatherCubit>().fetchWeather(initialCity),
//         backgroundColor: Colors.blueAccent,
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
