import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
    if(user != null){
    emailController.clear();
    passwordController.clear();
    displayToastMessage("Berhasil Login", context);
   

    }else {
    }
    
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
 static Future<String> getUsername() async {
    final ref = FirebaseDatabase.instance.reference();
    User user = await _firebaseAuth.currentUser;

    return ref.child('users').child(user.uid).once().then((DataSnapshot snap) {
      final String userName = snap.value['name'].toString();
     if (user != null){
       return userName;
     } else {
       
     }
      print(userName);
      return userName;
    });
  }
   static Future<String> getNo() async {
    final ref = FirebaseDatabase.instance.reference();
    User user = await _firebaseAuth.currentUser;

    return ref.child('users').child(user.uid).once().then((DataSnapshot snap) {
      final String no = snap.value['nomor'].toString();
     if (user != null){
       return no;
     } else {
       
     }
      print(no);
      return no;
    });
  }
  static Future<String> getjob() async {
    final ref = FirebaseDatabase.instance.reference();
    User user = await _firebaseAuth.currentUser;

    return ref.child('users').child(user.uid).once().then((DataSnapshot snap) {
      final String job = snap.value['role'].toString();
     if (user != null){
       return job;
     } else {
       
     }
      print(job);
      return job;
    });
  }
   static Future<String> getEmail() async {
    final ref = FirebaseDatabase.instance.reference();
    User user = await _firebaseAuth.currentUser;

    return ref.child('users').child(user.uid).once().then((DataSnapshot snap) {
      final String emal = snap.value['email'].toString();
     if (user != null){
       return emal;
     } else {
       
     }
      print(emal);
      return emal;
    });
  }


}

