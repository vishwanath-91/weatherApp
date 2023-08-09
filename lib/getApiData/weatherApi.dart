import 'dart:convert';

import 'package:http/http.dart';

class GetApiData {
  //this is the weather variable
  dynamic weather;
  dynamic weatherDesc;
  dynamic weatherIcon;

  //this is the temperature variable
  dynamic weatherTemp;
  dynamic weatherTempMin;
  dynamic weatherTempMax;
  dynamic weatherHumidity;
  dynamic weatherPressure;

  //this is the wind variable
  dynamic weatherWindSpeed;

  //this is the rain variable
  dynamic weatherRain;

  Future<void> getData() async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=chausa&appid=c7c1ac35067c9968cc494baad5928de2");
      Response response = await get(url);

      Map data = jsonDecode(response.body);

      //this is the weather data collection
      List weatherList = data["weather"];
      Map weatherMap = weatherList[0];
      String weatherMain = weatherMap["main"];
      String weatherMainDesc = weatherMap["description"];
      String weatherMainIcon = weatherMap["icon"];

      //this is the weather main data collection
      Map weatherMainMap = data["main"];
      var weatherMainTemp = weatherMainMap["temp"] - 273.15;
      var weatherMainTempMin = weatherMainMap["temp_min"];
      var weatherMainTempMax = weatherMainMap["temp_max"];
      var weatherMainHumidity = weatherMainMap["humidity"];
      var weatherMainPressure = weatherMainMap["pressure"];

      //this is the wind data collection
      Map windMap = data["wind"];
      var windSpeedMain = windMap["speed"];

      //this is the rain data collection
      Map rainMap = data["rain"];
      var rainMainData = rainMap["1h"];

      //this is the weather value passing from API
      weather = weatherMain.toString();
      weatherDesc = weatherMainDesc.toString();
      weatherIcon = weatherMainIcon.toString();

      //this is the temperature value passing from API
      weatherTemp = weatherMainTemp.toString();
      weatherTempMin = weatherMainTempMin.toString();
      weatherTempMax = weatherMainTempMax.toString();
      weatherHumidity = weatherMainHumidity.toString();
      weatherPressure = weatherMainPressure.toString();

      //this is the wind value passing from API
      weatherWindSpeed = windSpeedMain.toString();

      //this is the rain value passing from API
      weatherRain = rainMainData.toString();
    } catch (e) {
      weather = 'NA';
      weatherDesc = 'NA';
      weatherIcon = 'NA';

      //this is the temperature value passing from API
      weatherTemp = 'NA';
      weatherTempMin = 'NA';
      weatherTempMax = 'NA';
      weatherHumidity = 'NA';
      weatherPressure = 'NA';

      //this is the wind value passing from API
      weatherWindSpeed = 'NA';

      //this is the rain value passing from API
      weatherRain = 'NA';
    }
  }
}
