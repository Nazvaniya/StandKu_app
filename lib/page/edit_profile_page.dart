
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stand_app/model/user.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/appbar_widget.dart';
import 'package:stand_app/widget/button_widget.dart';
import 'package:stand_app/widget/profile_widget.dart';
import 'package:stand_app/widget/textfield_widget.dart';
import 'package:path/path.dart';
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
    People people; 

  @override
  void initState(){
    super.initState();
 people = UserPreferences.getUser();
  } 


  @override
  Widget build(BuildContext context) => Scaffold(
     appBar: AppBar(),
     body: ListView(
       padding: EdgeInsets.symmetric(horizontal: 32),
       physics: BouncingScrollPhysics(),
       children: [
         SizedBox(height: 10,),
         ProfileWidget(
           imagePath: people.imagePath, 
           isEdit: true,
           onClicked: () async {
             final image = await ImagePicker()
                  .getImage(source: ImageSource.gallery);

                if (image == null) return;
                
                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                 final newImage =
                        await File(image.path).copy(imageFile.path);

                    setState(() => people = people.copy(imagePath: newImage.path));
           },
           ),
           const SizedBox(height: 24), 
           TextFieldWidget(
             label: 'Alamat',
             text: people.alamat,
             onChanged: (alamat) => people = people.copy(alamat: alamat),
           ),
             const SizedBox(height: 14), 
            TextFieldWidget(
             label: 'Nomor',
             text: people.nomor,
             onChanged: (nomor) => people = people.copy(nomor: nomor) ,
           ),
           const SizedBox(height: 24),
           ButtonWidget(
             text: "Save",
             onClicked: () {
               UserPreferences.setUser(people);
               Navigator.of(context).pop();
             },
           ),
       ],
     ),
  );
       

}