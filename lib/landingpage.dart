import 'package:flutter/material.dart';
import 'package:stand_app/register.dart';
import 'login.dart';
import 'register.dart';
import 'home.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Image(
              alignment: Alignment.topCenter,
              width: 800,
              height: 450,
              image: AssetImage("images/logo.PNG"),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                     primary: Colors.lightBlue.shade200,
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
                     primary: Colors.lightBlue.shade200,
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
                TextButton(onPressed: () {Navigator.push(context,
        MaterialPageRoute(builder: (context)=> Home()));}, child: Text(
                    'Lanjut Tanpa Masuk',
                    style: TextStyle(
                    decoration: TextDecoration.underline,
                    ),
                  ))
                  
                ])
          ],
        ),
      ),
    ));
  }
}
