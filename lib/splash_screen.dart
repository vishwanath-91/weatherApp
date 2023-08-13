import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import 'getApiData/weatherapi.dart';

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
    late String weatherData = instanceData.weather;
    late String weatherDescData = instanceData.weatherDesc;
    late String weatherIconData = instanceData.weatherIcon;
    //*******//
    late String weatherTempData = instanceData.weatherTemp;
    late String weatherTempMinData = instanceData.weatherTempMin;
    late String weatherTempMaxData = instanceData.weatherTempMax;
    late String weatherHumidityData = instanceData.weatherHumidity;
    late String weatherPressureData = instanceData.weatherPressure;
    //*******//
    late String weatherWindSpeedData = instanceData.weatherWindSpeed;
    //*******//
    late String weatherRainData = instanceData.weatherRain;
    //*******//

    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
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
    });
  }

  @override
  void initState() {
    super.initState();
    apiDataLoad();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade900,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.lightBlueAccent,
                Colors.blue,
                Colors.red,
              ])),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                          image: AssetImage(
                              'lib/assets/images/weather-icon-png-8.png')),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitFadingCircle(
                      color: Colors.yellow,
                      size: 50.0,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weather App",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Created By Vishwanath",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
