import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {


  return AppBar(
      title: Text('Profil'),
         leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
       
  );
}
