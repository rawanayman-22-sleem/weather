import 'package:flutter/material.dart';
import 'weatherviewbody.dart';

class Weatherbody extends StatelessWidget {
  const Weatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeatherViewBody( initialCity: '',),
    );
  }
}
