import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stand_app/page/forget_password.dart';
import 'package:stand_app/utils/auth_services.dart';
import 'package:stand_app/utils/display_toas.dart';
import 'register.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
  }
    final formKey = GlobalKey<FormState>();
    final passKey = GlobalKey<FormState>();
   final AuthServices _firebaseAuth = AuthServices();   
TextEditingController emailController =TextEditingController(text: "");
 TextEditingController passwordController = TextEditingController(text: "");
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
        child: Form(
          key: formKey,
          child: TextFormField(
            controller: emailController,
             validator: (value){
                        if(value.isEmpty){
                          return 'Email Kosong!';
                        }else {
                          return null;
                        }
                      },
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
        child: Form(
          key:passKey,
          child: TextFormField(
            controller: passwordController,
             validator: (value){
                        if(value.isEmpty){
                          return 'Password Kosong';
                        }else {
                          return null;
                        }
                      },
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
        ),
      )
    ],
  );
}
Widget buildForgotPassBtn(context){

  
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.only(right:0),
      ),
      onPressed: () {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>forgetPassword()));},
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
   

  return Container (
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
       onPressed: ()  async{ 
      if (!emailController.text.contains("@")){
                      displayToastMessage("alamat email tidak valid", context);
      }  else if(passwordController.text.isEmpty){
                      displayToastMessage("Password Kosong", context);
      } else if(formKey.currentState.validate() || (passKey.currentState.validate()) ){
         await AuthServices.signIn(emailController.text, passwordController.text, context).then((authResult) {
         Navigator.of(context).pop();
       }); 
      }else{
      
      }
    
       }, 

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
              decoration:TextDecoration.underline,
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

                        Color(0xFF18B6F7),
                        Color(0xFF9B78E1),
                       //(0xFF00FFDB),
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
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  SizedBox(height: 50,),
                  buildEmail(),
                  SizedBox(height: 20,),
                  buildPassword(),
                  buildForgotPassBtn(context),
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