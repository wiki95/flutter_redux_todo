import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int timer = 0;
  @override
  void initState() {
    delay();
    super.initState();
  }

  Future delay() async {
    await Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/another');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('willbeshiftedtonextscreenin4secs'),
    );
  }
}
