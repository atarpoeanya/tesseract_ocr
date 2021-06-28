import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'dart:async';

class SecondSplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SecondSplashScreenPage>
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
