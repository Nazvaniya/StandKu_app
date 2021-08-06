import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/register.dart';
import 'package:stand_app/utils/auth_services.dart';
import 'login.dart';
import 'register.dart';
class LandingPage extends StatelessWidget {
  static User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(80),
              child: Image(
                alignment: Alignment.topCenter,
                width: 250,
                height: 250,
                image: AssetImage("images/logo.PNG"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                     primary: Colors.indigo.shade200,
                  ),
                 
                  child: Text("Login"),

                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                ),
        
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     primary: Colors.indigo.shade500,
                  ),
                  onPressed: () {  Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Register()));
                  },
                  child: Text("Register"),
                 
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                TextButton(onPressed: () {
                  AuthServices.signInAnonymous();
                  }, child: Text(
                    'lanjut tanpa masuk',
                  style: TextStyle(color: Colors.indigo),), )
                  
                ])
          ],
        ),
      ),
    )
    );
    
  }
}
