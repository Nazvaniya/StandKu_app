
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
   late User user; 

  @override
  void initState(){
    super.initState();
 user = UserPreferences.getUser();
  } 


  @override
  Widget build(BuildContext context) => Scaffold(
     appBar: buildAppBar(context),
     body: ListView(
       padding: EdgeInsets.symmetric(horizontal: 32),
       physics: BouncingScrollPhysics(),
       children: [
         SizedBox(height: 10,),
         ProfileWidget(
           imagePath: user.imagePath, 
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

                    setState(() => user = user.copy(imagePath: newImage.path));
           },
           ),
           const SizedBox(height: 24), 
           TextFieldWidget(
             label: 'Alamat',
             text: user.alamat,
             onChanged: (alamat) => user = user.copy(alamat: alamat),
           ),
             const SizedBox(height: 14), 
            TextFieldWidget(
             label: 'Nomor',
             text: user.nomor,
             onChanged: (nomor) => user = user.copy(nomor: nomor) ,
           ),
             const SizedBox(height: 14), 
            TextFieldWidget(
             label: 'Jenis UKM',
             text: user.jenis,
             onChanged: (jenis) => user = user.copy(jenis: jenis),
           ),
           const SizedBox(height: 24),
           ButtonWidget(
             text: "Save",
             onClicked: () {
               UserPreferences.setUser(user);
               Navigator.of(context).pop();
             },
           ),
       ],
     ),
  );
       

}