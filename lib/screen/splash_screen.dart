import 'dart:async';

import 'package:flutter/material.dart';
import '../utils/helper.dart';
import 'landingScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(Duration(milliseconds: 4000), () {
      Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                  "assets/images/splashIcon.png",
                  fit: BoxFit.fill
            )
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo_app.png",
              height: 200,
              width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
