
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stand_app/model/user.dart';
import 'package:stand_app/page/edit_profile_page.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/appbar_widget.dart';
import 'package:stand_app/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override 
  Widget build(BuildContext context){
    final user = UserPreferences.getUser();

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 10,),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
          ),
          const SizedBox(height: 30,),
          buildName(user),
          const SizedBox(height: 40,),
          buildText(user),
          
          
        ],
      ),
    );
  }
}

 Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.job,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
   Widget buildText(User user) => Column(
     crossAxisAlignment: CrossAxisAlignment.start,
  
        children: <Widget> [
          Container( 
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
           "Nama " "        : " + user.name,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          ),
          const SizedBox(height: 24),
          Container(
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
           "Alamat " "      : " + user.alamat,
           style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          ),
           const SizedBox(height: 24),
           Container(
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
          "Email: " "        : " +  user.email,
           style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          ),
           const SizedBox(height: 24),
           Container(
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
          "Nomor " "       : " +  user.nomor,
           style: TextStyle(color: Colors.black, fontSize: 18),
          ),
           ),
           const SizedBox(height: 24),
           Container(
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
          "Jenis UKM " ": " +  user.jenis,
           style: TextStyle(color: Colors.black, fontSize: 18),
          )
           ),
        ],
      );
      
    