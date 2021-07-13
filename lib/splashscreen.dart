import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stand_app/editProfil.dart';
import 'package:stand_app/page/home.dart';
import 'package:stand_app/landingpage.dart';
import 'package:stand_app/page/edit_profile_page.dart';
import 'package:stand_app/page/home_page.dart';
import 'package:stand_app/widget/navbar_widget.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("images/logo.PNG"),
            ),
            Text(
              "StandKu",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
