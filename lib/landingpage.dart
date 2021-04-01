import 'package:flutter/material.dart';
import 'login.dart';
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
                OutlineButton(
                  color: Colors.lightBlue.shade200,
                  child: Text("Login"),

                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                ),
        
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Register"),
                  color: Colors.lightBlue.shade200,
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
                  Text(
                    'lanjut tanpa masuk',
                  ),
                ])
          ],
        ),
      ),
    ));
  }
}