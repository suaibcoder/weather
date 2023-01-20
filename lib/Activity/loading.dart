import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather/worker/worker.dart';

class Loading_page extends StatefulWidget {
  const Loading_page({Key? key}) : super(key: key);

  @override
  State<Loading_page> createState() => _Loading_pageState();
}

class _Loading_pageState extends State<Loading_page> {
  String location = "mumbai";
  String temp = "";
  String humidity = "";
  String air_speed = "";
  String descreption = "";
  String main = "";
  String icon = "03n";

  var search = "";

  void startapp() async {
    Worker instance = Worker(
      location: "delhi",
    );
    await instance.getdata();
    location = instance.location!;
    temp = instance.temp!;
    humidity = instance.humidity!;
    air_speed = instance.air_speed!;
    descreption = instance.descreption!;
    main = instance.main!;
    icon = instance.icon!;

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": location,
      "temp_value": temp,
      "humidity_value": humidity,
      "air_speed_value": air_speed,
      "descreption_value": descreption,
      "main_value": main,
      "icon_value": icon,
    });
  }

  @override
  void initState() {
    startapp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 100,
              ),
              Image(image: AssetImage("images/mlogo.png")),
              SizedBox(
                height: 20,
              ),
              Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text("Made by : Suaib saifi",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 20,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50,
              ),
              SizedBox(
                height: 300,
              ),
            ],
          )),
        ),
      ),
      bottomSheet: "Powered by : Suaib "
          .text
          .black
          .bold
          .xl
          .make()
          .px(160)
          .py(12)
          .backgroundColor(Colors.blue[300]),
    );
  }
}
