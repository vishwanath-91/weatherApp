import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String currentDate = DateFormat("dd-MMMM-yyyy-EEEEE").format(DateTime.now());
  String currentTime = DateFormat("hh:mm:ss a").format(DateTime.now());

  get weatherData => widget.weatherData;

  get weatherDesc => widget.weatherDescData;

  get weatherIcon => widget.weatherIconData;

  get weatherTemp => widget.weatherTempData;

  get weatherTempMin => widget.weatherTempMinData;

  get weatherTempMax => widget.weatherTempMaxData;

  get weatherHumidity => widget.weatherHumidityData;

  get weatherPressure => widget.weatherPressureData;

  get weatherWindSpeed => widget.weatherWindSpeedData;

  get weatherRain => widget.weatherRainData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            //<-- SEE HERE,
                            fillColor: Colors.white,
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.search,
                                size: 40,
                              ),
                            ),
                            hintText: "Search By City Name",
                            hintStyle: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentDate,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            Text(currentTime,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Buxar",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${weatherTemp.toString().substring(0, 2)}°C",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 60),
                              ),
                              Text("$weatherDesc",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                          const Icon(
                            Icons.wb_sunny_outlined,
                            size: 120,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.thermostat,
                              size: 30,
                            ),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Min Temp: ${weatherTempMin.toString().substring(0, 2)}°C"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "Max Temp: ${weatherTempMax.toString().substring(0, 2)}°C"),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.ac_unit,
                              size: 30,
                            ),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Humidity: $weatherHumidity RH"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Pressure: $weatherPressure"),
                              )
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
