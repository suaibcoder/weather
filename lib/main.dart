import 'package:flutter/material.dart';
import 'package:weather/Activity/home.dart';
import 'package:weather/Activity/loading.dart';
// import 'package:weather/Activity/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Loading_page(),
        // '/location': (context) => Location_page(),
        '/home': (context) => Home_page(),
        '/loading': (context) => Loading_page(),
      },
    );
  }
}
