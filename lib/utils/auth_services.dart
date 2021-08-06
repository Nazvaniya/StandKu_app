import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stand_app/landingpage.dart';
import 'package:stand_app/login.dart';
import 'package:stand_app/main.dart';
import 'package:stand_app/page/forget_password.dart';

import '../register.dart';
import 'display_toas.dart';



class AuthServices {
 static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


 static Stream<User> get firebaseUserStream => _firebaseAuth.authStateChanges();
  
  static Future<String> signIn(String email, String password, context) async{
    try{
    UserCredential authResult =  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User user = authResult.user;
    emailController.clear();
    passwordController.clear();
    displayToastMessage("Berhasil Login", context);
    
    } catch (e) {
       emailController.clear();
    passwordController.clear();
      print(e.toString());
      return displayToastMessage("Tidak Ada Akun, Silahkan Buat Akun", context);
    }
  }
 
 static  Future<String> signUp(String email, String password) async{
      try{
      UserCredential authResult  =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
       User  user  = authResult.user;
       
      }  catch (e) {
        print(e.toString());
        return null;
      }
    }
 
  static Future<void> signOut() async {
     try {
       return await _firebaseAuth.signOut();
     }catch(e){
       print(e.toString());
       return null;
     }
  }

     static Future<void> forgetpass(String email, context) async{
    try{
     await _firebaseAuth.sendPasswordResetEmail(email: email);
     displayToastMessage("Silahkan Cek Email Anda", context);
     emailforget.clear();
    } catch (e) {
      print(e.toString());
      emailforget.clear();
      displayToastMessage("Tidak Ada Akun", context);
    }
  }
  

  static Future<String> signInAnonymous() async{
    try {
      UserCredential authResult = await _firebaseAuth.signInAnonymously();
      User user = authResult.user;
       return user?.uid;
    } catch(e){
      print(e.toString());
      return null;
    }
  }
 static registerNewUser(BuildContext context) async{
  final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(email: email.text, 
  password: password.text).catchError((errMsg){
    displayToastMessage("error:" + errMsg.toString(), context);
  })).user;
  if (firebaseUser != null)
  {
   
   Map userDataMap = {
     "name": name.text.trim(),
     "email": email.text.trim(),
     "nomor": nomor.text.trim(),
     "password": password.text.trim(),
     "role" : RadioGroupState.default_choice.trim(),
   };
   usersRef.child(firebaseUser.uid).set(userDataMap);
   displayToastMessage("Akun Berhasil Dibuat", context);
   name.clear();
   email.clear();
   nomor.clear();
   password.clear();
    role.clear();

  }else {
    return displayToastMessage("Akun Tidak berhasil Dibuat", context);
   
  }
 }

}

