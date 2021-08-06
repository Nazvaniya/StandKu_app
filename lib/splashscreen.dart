import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stand_app/page/add_event%20copy.dart';
import 'package:stand_app/page/main_page.dart';
import 'package:stand_app/widget/wrapper.dart';

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
        MaterialPageRoute(builder: (context) => Wrapper()),
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
            Container(
              width: 250,
              child: Image(
                image: AssetImage("images/logo.PNG"),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
