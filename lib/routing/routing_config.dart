import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../splash_screen.dart';
import '../weather_app/Home.dart';

class MyAppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'splash_screen',
      builder: (context, state) => const Splashscreen(),
    ),
    GoRoute(
        path: '/Home/:weatherdata/:weatherdescdata/:weathericondata/:weathertempdata/:weathertempmindata/:weathertempmaxdata/:weatherhumiditydata/:weatherpressuredata/:weatherwindspeeddata/:weatherraindata',
        name: 'Home',
        builder: (BuildContext context, GoRouterState state) => Home(
              weatherData: state.pathParameters['weatherdata']!,
              weatherDescData: state.pathParameters['weatherdescdata']!,
              weatherIconData: state.pathParameters['weathericondata']!,
              weatherTempData: state.pathParameters['weathertempdata']!,
              weatherTempMinData: state.pathParameters['weathertempmindata']!,
              weatherTempMaxData: state.pathParameters['weathertempmaxdata']!,
              weatherHumidityData: state.pathParameters['weatherhumiditydata']!,
              weatherPressureData: state.pathParameters['weatherpressuredata']!,
              weatherWindSpeedData: state.pathParameters['weatherwindspeeddata']!,
              weatherRainData: state.pathParameters['weatherraindata']!,
            )),
  ]);
}
