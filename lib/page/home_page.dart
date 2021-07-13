

import 'package:flutter/material.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/photo_profile.dart';

class HomePage extends StatefulWidget{
  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
      final user = UserPreferences.getUser();
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                 Padding(
                  padding: EdgeInsets.fromLTRB(0, 14.5, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Container(
                        width: 40,
                        height: 48,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:  PhotoProfile(
                        imagePath: user.imagePath,
                          onClicked: () async {
                        await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                  setState(() {});
                },
          ),
                        ),
                      ),
                    
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(user.name),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Icon(
                    Icons.keyboard_control,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              ],
              ),
              ),
             Image(
              image: AssetImage("images/mina.jpg"),
                width: double.infinity,
                fit: BoxFit.fitWidth,
            ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Event NIGHT"),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text("Batam"),
                )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0) ,
                child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}

