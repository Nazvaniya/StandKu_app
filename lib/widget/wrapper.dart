import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stand_app/landingpage.dart';
import 'package:stand_app/login.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/page/main_page.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/splashscreen.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     User user = Provider.of<User>(context);
    return (user == null) ? LandingPage() : MainPage();
  }
}