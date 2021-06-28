import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tesseract_ocr_example/home_screen.dart';

class SecondSplashScreen extends StatefulWidget {
  @override
  _SecondSplashScreenState createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen>
  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomeScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFEFEFEFE),
      body: Center(
        child: Image.asset(
          'images\\mame.png',
        ),
      ),
    );
  }
}
