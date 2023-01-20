import 'dart:convert';

import 'package:http/http.dart' as http;

class Worker {
  Worker({this.location});
  String? serchcontroller;
  String? location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? descreption;
  String? main;
  String? icon;

  Future<void> getdata() async {
    try {
      http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=37058e8523bd289d6612dfa484dd990b",
      ));

      Map data = jsonDecode(response.body);

// weather data
      List weather_data = data["weather"];

      Map weather_main_data = weather_data[0];

      String getweather_main = weather_main_data['main'];
      String getweather_description = weather_main_data['description'];

// getting temp , humadity
      Map temp_data = data['main'];

      double gettemp = temp_data['temp'] - 273.15;
      String gethumidity = temp_data['humidity'].toString();
      icon = weather_main_data['icon'];

      // air data speed

      Map wind_data = data['wind'];
      double getair_speed = wind_data['speed'] / 0.27777777777778;
      String getair_deg = wind_data['deg'].toString();

      // assinging values  to variables

      location = data['name'];
      temp = gettemp.toString().substring(0, 4);

      humidity = gethumidity;
      air_speed = getair_speed.toString().substring(0, 4);
      descreption = getweather_description.toUpperCase();
      main = getweather_main;

      icon = icon.toString();
    } catch (e) {
      temp = "0";
      humidity = "0";
      air_speed = "0";
      descreption = "no data";
      main = "no  data";
      icon = "03n";
      location = "no city";
    }
  }
}
