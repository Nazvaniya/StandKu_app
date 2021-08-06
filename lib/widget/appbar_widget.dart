import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/widget/navbar_widget.dart';

AppBar buildAppBar(BuildContext context) {


  return AppBar(
      title: Text('Profil'),
         leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>ProfilePage()));},
          ),
       
  );
}
