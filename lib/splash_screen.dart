import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'getApiData/weatherApi.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void apiDataLoad() async {
    GetApiData instanceData = GetApiData();
    await instanceData.getData();
    //*******//
    String weatherData = instanceData.weather;
    String weatherDescData = instanceData.weatherDesc;
    String weatherIconData = instanceData.weatherIcon;
    //*******//
    String weatherTempData = instanceData.weatherTemp;
    String weatherTempMinData = instanceData.weatherTempMin;
    String weatherTempMaxData = instanceData.weatherTempMax;
    String weatherHumidityData = instanceData.weatherHumidity;
    String weatherPressureData = instanceData.weatherPressure;
    //*******//
    String weatherWindSpeedData = instanceData.weatherWindSpeed;
    //*******//
    String weatherRainData = instanceData.weatherRain;
    //*******//
    GoRouter.of(context).pushReplacementNamed('Home', pathParameters: {
      //*******//
      'weatherdata': weatherData,
      'weatherdescdata': weatherDescData,
      'weathericondata': weatherIconData,
      //*******//
      'weathertempdata': weatherTempData,
      'weathertempmindata': weatherTempMinData,
      'weathertempmaxdata': weatherTempMaxData,
      'weatherhumiditydata': weatherHumidityData,
      'weatherpressuredata': weatherPressureData,
      //*******//
      'weatherwindspeeddata': weatherWindSpeedData,
      //*******//
      'weatherraindata': weatherRainData,
    });
  }

  @override
  void initState() {
    super.initState();
    // apiDataLoad();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [Text("i am loading screen")]),
    );
  }
}
