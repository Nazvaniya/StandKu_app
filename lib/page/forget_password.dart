import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stand_app/login.dart';
import 'package:stand_app/utils/auth_services.dart';
import 'package:stand_app/utils/display_toas.dart';
class forgetPassword extends StatefulWidget {

  @override
  _forgetPasswordState createState() => _forgetPasswordState();
  }
    final emailKey = GlobalKey<FormState>();
   final AuthServices _firebaseAuth = AuthServices();   
TextEditingController emailforget =TextEditingController();
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
          key: emailKey,
          child: TextFormField(
            controller: emailforget,
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

Widget buildsendBtn(context){
   

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

      if  (!emailforget.text.contains("@")){
                      displayToastMessage("alamat email tidak valid", context);
     }
      else if ((emailKey.currentState.validate()) ){
         await AuthServices.forgetpass(emailforget.text, context).then((forgetpass)
        { Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: (context)=>LoginScreen()));
       });
      }
       }, 

      child: Text(
        'KIRIM',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
} 

  class _forgetPasswordState extends State<forgetPassword>{
  
 
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
                        'Lupa Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  SizedBox(height: 50,),
                  buildEmail(),
                  SizedBox(height: 50,),
                  buildsendBtn(context)
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