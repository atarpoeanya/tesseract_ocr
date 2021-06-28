import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
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
          return SecondSplashScreenPage();
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
          'images\\tutwuri.png',
        ),
      ),
    );
  }
}
