import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        body: Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Image(
              alignment: Alignment.topCenter,
              width: 500,
              height: 250,
              image: AssetImage("images/logo.PNG"),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {},
                  child: Text("Login"),
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
=======
      appBar: AppBar(
        title: Text("Login"),
>>>>>>> df86205af8b08b5ee456e9df5f0388ef9ccf39ef
      ),
    ));
  }
}
