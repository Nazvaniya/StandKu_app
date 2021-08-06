import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/page/manage_event_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class AddEvent1 extends StatefulWidget{
  @override 
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent1>{
  bool isVisible = true;
   int _selectedItemIndex = 2;
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
   await FirebaseFirestore.instance.collection("event").add({'name' : name.text, 'place' : place.text, 
   'date' : date.text, 'desc' : desc.text, 'img' : img.text});
   }else{
     ScaffoldMessenger(child: Text('Tidak Bisa Menambahkan Kolom Kosong'));
     SnackBar(content: ScaffoldMessenger(child: Text('Tidak Bisa')));
   }
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
          ),),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: <Widget> [
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
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: img,
                    validator: (value){
                      if(value.isEmpty){
                        return 'isi kolom!';
                      }else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: ' img'
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