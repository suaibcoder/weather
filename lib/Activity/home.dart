import 'dart:math';

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:weather_icons/weather_icons.dart';

// ignore: camel_case_types
class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    var city_names = [
      "Delhi",
      "Mumbai",
      "Chennai",
      "Kolkata",
      "Bangalore",
      "Dubai"
    ];
    final _random = Random();
    var city = city_names[_random.nextInt(city_names.length)];
    String icon = info["icon_value"];
    String desc = info['descreption_value'];
    String area = info['location'];

    TextEditingController serchcontroller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 131, 191),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color.fromRGBO(21, 101, 192, 1),
                Color.fromRGBO(100, 181, 246, 1),
              ])),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                margin: EdgeInsets.all(25.0),
                height: 60,
                child: TextField(
                  controller: serchcontroller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search any city name as $city ',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // serchcontroller.clear();
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      )),
                ).centered(),
              ),
              Container(
                margin: EdgeInsets.all(25.0),
                height: 115,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Image(
                        image: NetworkImage(
                            "http://openweathermap.org/img/wn/$icon@2x.png")),
                    //TODO: Add image here
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "$desc Weather".text.xl.bold.make(),
                        "In $area".text.xl.bold.make(),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.0, right: 40.0),
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      WeatherIcons.thermometer,
                      size: 30.0,
                    ).py(20).px(20),
                    " ${info["temp_value"]}°C".text.xl5.make().centered()
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.day_windy).px(0),
                              "Wind Speed"
                                  .text
                                  .bold
                                  .minFontSize(10)
                                  .maxFontSize(15)
                                  .make()
                                  .py(23)
                                  .px(20),
                            ],
                          ),
                          " ${info["air_speed_value"]} km/h"
                              .text
                              .xl4
                              .bold
                              .make()
                              .py(20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      // height: MediaQuery.of(context).size.height / 5,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                WeatherIcons.humidity,
                                size: 30,
                              ).px(10).py(23),
                              "Humidity".text.bold.make()
                            ],
                          ),
                          " ${info["humidity_value"]} %"
                              .text
                              .xl4
                              .bold
                              .make()
                              .py(10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // "Powered by suaib Productions".text.center.black.xl.make().py8(),
            ],
          ),
        ),
      ),
    );
  }
}
