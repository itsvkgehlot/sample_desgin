import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_desgin/Login_Page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getroute() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getroute();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 35, right: 35),
              child: Image.asset(
                'assets/images/splash_img1.png',
                height: 130,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 15,
                right: 15,
                child: Center(
                    child: Image.asset(
                  'assets/images/splash2.png',
                  scale: 2.0,
                ))),
          ],
        ),
      ),
    );
  }
}
