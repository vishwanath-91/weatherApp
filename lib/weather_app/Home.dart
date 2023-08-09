import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String weatherData;
  final String weatherDescData;
  final String weatherIconData;

  final String weatherTempData;
  final String weatherTempMinData;
  final String weatherTempMaxData;
  final String weatherHumidityData;
  final String weatherPressureData;

  final String weatherWindSpeedData;

  final String weatherRainData;

  const Home({
    super.key,
    required this.weatherData,
    required this.weatherDescData,
    required this.weatherIconData,
    required this.weatherTempData,
    required this.weatherTempMinData,
    required this.weatherTempMaxData,
    required this.weatherHumidityData,
    required this.weatherPressureData,
    required this.weatherWindSpeedData,
    required this.weatherRainData,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get weatherData => widget.weatherData;

  get weatherDesc => widget.weatherDescData;

  get weatherTemp => widget.weatherTempData;

  get weatherTempMin => widget.weatherTempMinData;

  get weatherTempMax => widget.weatherTempMaxData;

  get weatherHumidity => widget.weatherHumidityData;

  get weatherPressure => widget.weatherPressureData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WeatherInfo")),
      body: Column(children: [Text(weatherTemp.toString().substring(0, 2))]),
    );
  }
}
