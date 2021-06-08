import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'register.dart';
import 'home.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
  }

Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blueGrey,
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        ),
      )
    ],
  );
}
Widget buildPassword(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
        ),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.blueGrey,
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.black38
            )
          ),
        ),
      )
    ],
  );
}
Widget buildForgotPassBtn(){

  
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(right:0),
      ),
      onPressed: () => print("Lupa Password ditekan"),
      child: Text(
        'Lupa Password?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}
Widget buildLoginBtn(context){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2),
    width: 200,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
         shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
       primary: Colors.white,
      ),
       onPressed: ()  { 
         Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> Home()));},  
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
} 
Widget buildRegisBtn(context){
       return Container(
        alignment: Alignment.center,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(top: 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>Register()));},
          child: Text(
            'Register Sekarang',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      );
}
  class _LoginScreenState extends State<LoginScreen>{

    @override
    Widget build(BuildContext context){
      return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD3FFF9),
                        Color(0xFF6EFFEB),
                       // Color(0xFF00FFDB),
                      ]
                    )

                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 60,
                    ),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'MASUK',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  SizedBox(height: 50,),
                  buildEmail(),
                  SizedBox(height: 20,),
                  buildPassword(),
                  buildForgotPassBtn(),
                  SizedBox(height: 30,),
                  buildLoginBtn(context),
                  SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text('Belum Punya Akun?'
                        ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          ),
              ),
        ],
    ),
                  buildRegisBtn(context)
                    ],
                  ),
                  ),
                )
              ],
            ),
          )
        ),
      );
    }
}