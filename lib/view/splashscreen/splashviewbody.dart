import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constant.dart';
import '../../cubite/weather_cubit.dart';
import '../weatherscreen/weatherbody.dart';
import '../weatherscreen/weatherviewbody.dart';


class Splashviewbody extends StatefulWidget {
  @override
  _SplashviewbodyState createState() => _SplashviewbodyState();
}

class _SplashviewbodyState extends State<Splashviewbody> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 8));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => WeatherCubit(),
          child: WeatherViewBody(initialCity: 'London'), // المدينة الافتراضية
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashground,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo, // تأكد من وضع الصورة في مجلد assets وتحديث pubspec.yaml
                width: 350,
                height: 400,
              ),
              SizedBox(height: 20),
              Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
