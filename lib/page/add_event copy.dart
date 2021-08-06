import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/page/manage_event_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:stand_app/utils/display_toas.dart';



class AddEvent extends StatefulWidget{
  @override 
  _AddEventState createState() => _AddEventState();
}
final _picker = ImagePicker();
class _AddEventState extends State<AddEvent>{
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
 TextEditingController img = TextEditingController();
 TextEditingController place = TextEditingController();
 TextEditingController date = TextEditingController();
 TextEditingController desc = TextEditingController();
 File image;
 String imgUrl;
 sendData()async{
   if(formKey.currentState.validate()){
     var storageImage = FirebaseStorage.instance.ref().child(image.path);
   var task = storageImage.putFile(image);
   imgUrl = await (await task).ref.getDownloadURL();
   await FirebaseFirestore.instance.collection("event").add({'name' : name.text, 'place' : place.text, 
   'date' : date.text, 'desc' : desc.text, 'img' : imgUrl});
   name.clear();
   place.clear();
   date.clear();
   desc.clear();
   img.clear();
   displayToastMessage("Event Berhasil DItambah", context);
   }else{
     displayToastMessage("Tidak Bisa Menambahkan Event", context);
    
   }
 }

 Future getImage()async {
  
   var img = await _picker.getImage(source: ImageSource.gallery);
   setState(() {
     image = File(img.path);
   });
 }

  @override 

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Event'),
      leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>EventPage()));},
          ),
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: <Widget> [
                Padding(
                  padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                         radius: 50,
                      backgroundImage: image != null ? FileImage(image) : NetworkImage(''),
                    ),
                  ),
                   Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                      color: Colors.green,
                      child: Text(
                        "Galeri",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        getImage();
                      }),
                ],
          ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: name,
                    validator: (value){
                      if(value.isEmpty){
                        return 'isi kolom!';
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Event'
                    ),
                  ),
                ),
                      Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: place,
                    validator: (value){
                      if(value.isEmpty){
                        return 'isi kolom!';
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Tempat Event'
                    ),
                  ),
                ),
                      Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: date,
                    validator: (value){
                      if(value.isEmpty){
                        return 'isi kolom!';
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: ' Tanggal Event'
                    ),
                  ),
                ),
                      Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    maxLines: 5,
                    controller: desc,
                    validator: (value){
                      if(value.isEmpty){
                        return 'isi kolom!';
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: ' Deskripsi Event'
                    ),
                  ),
                ),
               
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        primary: Colors.blue,
                        ),
                        onPressed: ()  { 
                          sendData();
                          
                         },  
                        child: Text(
                          'Tambah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Padding(
                  padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    primary: Colors.blue,
                    ),
                    onPressed: ()  { 
                    Navigator.pushReplacement(context,
                     MaterialPageRoute(builder: (context)=> ManageEventPage()));},   
                    child: Text(
                      'Manage Event',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

  }
}
// class ImagePick extends StatefulWidget{
//   @override
//   _ImagePickState createState() => _ImagePickState();

  
// } 


// class _ImagePickState extends State<ImagePick>{
  
//   File _selectedFile;
//   bool _inProcess = false;

 
//   getImage(ImageSource source) async {
//       this.setState((){
//         _inProcess = true;
//       });
//       	PickedFile image = (await _picker.getImage(source: source));
//           if(image != null){
//         File cropped = (await ImageCropper.cropImage(
//             sourcePath: image.path,
//             aspectRatio: CropAspectRatio(
//                 ratioX: 1, ratioY: 1),
//             compressQuality: 100,
//             maxWidth: 700,
//             maxHeight: 700,
//             compressFormat: ImageCompressFormat.jpg,
//             androidUiSettings: AndroidUiSettings(
//               toolbarColor: Colors.deepOrange,
//               toolbarTitle: "RPS Cropper",
//               statusBarColor: Colors.deepOrange.shade900,
//               backgroundColor: Colors.white,
//             )
//         ));

//         this.setState((){
//           _selectedFile = cropped;
//           _inProcess = false;
//         });
//       } else {
//         this.setState((){
//           _inProcess = false;
//         });
//       }
//   }

// @override
// Widget build(BuildContext context){
//   return Container(
//        child: Column(
//      children: <Widget>[
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           getImageWidget(),
//             SizedBox(
//                   width: 20,
//                  ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   MaterialButton(
//                       color: Colors.green,
//                       child: Text(
//                         "Kamera",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       onPressed: () {
//                         getImage(ImageSource.gallery);
//                       }),
//                 ],
//           )
//         ],
//       )
//     ],
//     )
//   );
  
// }
 
// }