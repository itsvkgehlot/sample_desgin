import 'package:flutter/material.dart';

import 'package:sample_desgin/Login_Page.dart';
import 'package:sample_desgin/splashscr.dart';

void main() {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(

        primarySwatch: MaterialColor(
          0xFF021942,
          <int, Color>{
            50: Color(0xFF021942),
            100: Color(0xFF021942),
            200: Color(0xFF021942),
            300: Color(0xFF021942),
            400: Color(0xFF021942),
            500: Color(0xFF021942),
            600: Color(0xFF021942),
            700: Color(0xFF021942),
            800: Color(0xFF021942),
            900: Color(0xFF021942),
          },
        ),
      ),
    );
  }
}







