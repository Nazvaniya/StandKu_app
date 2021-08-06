import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stand_app/main.dart';
import 'package:stand_app/model/user.dart';
import 'package:stand_app/utils/auth_services.dart';
import 'package:stand_app/utils/display_toas.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/photo_widget.dart';
import 'package:path/path.dart';

import 'login.dart';

class EditKtp extends StatefulWidget {
  @override 
  _EditKtpState createState() => _EditKtpState();
}
class _EditKtpState extends State<EditKtp> {
     People people; 

  @override
  void initState(){
    super.initState();
 people = UserPreferences.getUser();
  } 

  @override 
  Widget build(BuildContext context){
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
             PhotoWidget(
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
           SizedBox(width: 20),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      child: Text(
                        "Upload KTP",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                    
                      }),
                ],
          )
          ],
        ),
    );
  }
  
}

class ImagePick extends StatefulWidget{
  @override
  _ImagePickState createState() => _ImagePickState();

  
} 
final _picker = ImagePicker();
class _ImagePickState extends State<ImagePick>{
  
  File _selectedFile;
  bool _inProcess = false;

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "images/logo.PNG",
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      );
    }
  }
  getImage(ImageSource source) async {
      this.setState((){
        _inProcess = true;
      });
      	PickedFile image = (await _picker.getImage(source: source));
          if(image != null){
        File cropped = (await ImageCropper.cropImage(
            sourcePath: image.path,
            aspectRatio: CropAspectRatio(
                ratioX: 1, ratioY: 1),
            compressQuality: 100,
            maxWidth: 700,
            maxHeight: 700,
            compressFormat: ImageCompressFormat.jpg,
            androidUiSettings: AndroidUiSettings(
              toolbarColor: Colors.deepOrange,
              toolbarTitle: "RPS Cropper",
              statusBarColor: Colors.deepOrange.shade900,
              backgroundColor: Colors.white,
            )
        ));

        this.setState((){
          _selectedFile = cropped;
          _inProcess = false;
        });
      } else {
        this.setState((){
          _inProcess = false;
        });
      }
  }

@override
Widget build(BuildContext context){
  return Container(
       child: Column(
     children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          getImageWidget(),
            SizedBox(
                  width: 20,
                 ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                      color: Colors.green,
                      child: Text(
                        "Kamera",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        getImage(ImageSource.gallery);
                      }),
                ],
          )
        ],
      )
    ],
    )
  );
  
}
 
}

class MyChoice{
  String choice;
  int index;
  MyChoice({ this.index,  this.choice});
}

class RadioGroup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
 return new RadioGroupState();
  }
}
class RadioGroupState extends State<RadioGroup>{
 static String default_choice = "Penyelenggara";
  int default_index = 0;
  var role;
  List<MyChoice> choices = [
    MyChoice(index:0,choice: "Penyelenggara"),
    MyChoice(index:1,choice: "Pedagang"),
  ];
  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget> [
      Wrap(
        children: <Widget>[
          Container(
            child: Column(
              children: choices.map((data) => RadioListTile(
                title: Text('${data.choice}'),
                groupValue: default_index,
                value: data.index,
                onChanged: (value){
                  setState(() {
                    default_choice = data.choice;
                    default_index = data.index;

                  });
                },
              )).toList(),
            )
          )
        ]
      ),
      Padding(padding: EdgeInsets.all(0),
      child:   Text('$default_choice', style: TextStyle(fontSize: 16),),)
      
      ],
    );
  }
}

class CheckBox extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new CheckBoxState();
  }
}

class CheckBoxState extends State<CheckBox>{
 static bool setujuCb = false;
  @override
Widget build(context){
  return Container(
    height: 20,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.black ),
          child: Checkbox(
            value: setujuCb,
            checkColor: Colors.white,
            activeColor: Colors.blue,
            onChanged: (value) {
             setState(() {
               setujuCb = value;
             });
            },
          ),
        ),
        Text(
          'Setuju Syarat & Ketentuan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )
        )
      ]
    )
  );
}

}

class Register extends StatefulWidget {


  @override
  _RegisterState createState() => _RegisterState();
}
TextEditingController name = TextEditingController(text: "");
 TextEditingController img = TextEditingController(text: "");
 TextEditingController email = TextEditingController(text: "");
 TextEditingController role = TextEditingController(text: "");
 TextEditingController nomor = TextEditingController(text: "");
 TextEditingController password = TextEditingController(text: "");
 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


class _RegisterState extends State<Register> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height + 300,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Registrasi",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),),
                  SizedBox(height: 20,),
                  Text(" ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)


                ],
              ),
           
              Column(
                children: <Widget>[
                  inputNama(label: "Nama Pengguna"),
                  inputEmail(label: "Email"),
                  inputPhone(label: "Nomor Telepon" ),
                  inputPass(label: "Password", obscureText: true),
                  
                ],
              ),
            RadioGroup(), 
            ImagePick(),
            CheckBox(),
              Container(
                padding: EdgeInsets.only(top: 0, left: 0),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),



                    )

                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () 
                   { 
                    if(name.text.length < 2)
                    {
                      displayToastMessage('nama kurang', context);
                    }else if(!email.text.contains("@")){
                      displayToastMessage("alamat email tidak valid", context);
                    }else if(nomor.text.isEmpty)
                    {
                      displayToastMessage("Nomor tidak boleh kosong", context);
                    }else if(password.text.length <5)
                    {
                      displayToastMessage("Password Kurang panjang", context);
                    } else if(CheckBoxState.setujuCb == false){
                      displayToastMessage("Belum Setuju Syarat & Ketentuan !", context);
                    }else
                    {
                      AuthServices.registerNewUser(context).then((authResult) {
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                       }); 
                      
                    }
                    },
                  color: Colors.indigo,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: Text(
                    "Daftar", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  
                  ),
                  
                ),



              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
            
                children: <Widget>[
                  Text("Sudah Punya Akun?"),
                  TextButton(
                  child: Text(" Login", style:TextStyle(
                   fontWeight: FontWeight.w600,
                     fontSize: 18
                  ),
                  ),
                   onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                  ),
                ],
                ),
              



            ],

          ),


        ),

      ),

    );
  }
}


// we will be creating a widget for text field
Widget inputNama({label})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        controller: name,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}
// we will be creating a widget for text field
Widget inputEmail({label})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
       
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}
// we will be creating a widget for text field
Widget inputPhone({label})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        
        controller: nomor,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}
// we will be creating a widget for text field
Widget inputPass({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        
        controller: password,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}

