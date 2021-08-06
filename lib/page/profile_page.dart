
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stand_app/landingpage.dart';
import 'package:stand_app/model/user.dart';
import 'package:stand_app/page/add_event%20copy.dart';
import 'package:stand_app/page/edit_profile_page.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/page/notif_page.dart';
import 'package:stand_app/page/search_page.dart';
import 'package:stand_app/utils/auth_services.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/profile_widget.dart';
import 'package:stand_app/widget/wrapper.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}



class _ProfilePageState extends State<ProfilePage> {
   User user;
   
  final AuthServices _firebaseAuth = AuthServices();
  int _selectedItemIndex = 4;
  @override 
  Widget build(BuildContext context){
    final people = UserPreferences.getUser();

    return Scaffold(
       
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 10,),
          ProfileWidget(
            imagePath: people.imagePath,
            onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
          ),
          const SizedBox(height: 30,),
          buildName(people),
          const SizedBox(height: 40,),
          buildText(people),
           Container(
             margin: EdgeInsets.all(50),
             child: ElevatedButton(
              
      style: ElevatedButton.styleFrom(
        elevation: 5,
         shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
       primary: Colors.white,
      ),
      
       onPressed: ()  async{ 
       await AuthServices.signOut().then((authResult) {
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Wrapper()));
       });
       },  
      child: Text(
        'Keluar',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
           ),
        ],
        
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: ()  { 
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context)=> AddEvent()));},
            child: Icon(
              Icons.add,
            ),
            backgroundColor: Colors.grey[900],
            elevation: 15,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey  .withOpacity(0.1),
            spreadRadius: 1,
            )
          ],
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
          buildNavBarItem(Icons.home, 0),
            buildNavBarItemSearch(Icons.search, 1),
             buildNavBarItemAdd(null, 2),
            buildNavBarItemNotif(Icons.notifications, 3),
            buildNavBarItemPerson( context, Icons.person, 4),
        ],),
      ),
    );
    
  }
    Widget buildNavBarItem(IconData icon, int index) {
     return GestureDetector(
       onTap: (){
         setState(() {
                     _selectedItemIndex = index;
                  });
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>EventPage()));
       },
       
       child: Container(
         width: MediaQuery.of(context).size.width/5,
            height: 50,
            child: Container(child: Icon(icon,
            size: 30,
            color: index == _selectedItemIndex ? Colors.blue : Colors.black54,),
            ),
          ),
          
     );
   }
    Widget buildNavBarItemSearch(IconData icon, int index) {
     return GestureDetector(
       onTap: (){
         setState(() {
                     _selectedItemIndex = index;
                  });
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SearchPage()));
       },
       
       child: Container(
         width: MediaQuery.of(context).size.width/5,
            height: 50,
            child: Container(child: Icon(icon,
            size: 30,
            color: index == _selectedItemIndex ? Colors.blue : Colors.black54,),
            ),
          ),
          
     );
   }
    Widget buildNavBarItemAdd(IconData icon, int index) {
     return GestureDetector(
       onTap: (){
         setState(() {
                     _selectedItemIndex = index;
                  });
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>AddEvent()));
       },
       
       child: Container(
         width: MediaQuery.of(context).size.width/5,
            height: 50,
            child: Container(child: Icon(icon,
            size: 30,
            color: index == _selectedItemIndex ? Colors.blue : Colors.black54,),
            ),
          ),
          
     );
   }
      Widget buildNavBarItemNotif(IconData icon, int index) {
     return GestureDetector(
       onTap: (){
         setState(() {
                     _selectedItemIndex = index;
                  });
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>NotifPage()));
       },
       
       child: Container(
         width: MediaQuery.of(context).size.width/5,
            height: 50,
            child: Container(child: Icon(icon,
            size: 30,
            color: index == _selectedItemIndex ? Colors.blue : Colors.black54,),
            ),
          ),
          
     );
   }
      Widget buildNavBarItemPerson(context,IconData icon, int index ) {
     return GestureDetector(
       onTap: (){
         setState(() {
                    _selectedItemIndex = index;
                  });
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ProfilePage()));
       },
    
       child: Container(
         width: MediaQuery.of(context).size.width/5,
            height: 50,
            child: Container(child: Icon(icon,
            size: 30,
            color: index == _selectedItemIndex ? Colors.blue : Colors.black54,),
            ),
            
          ),
     );
   }
}


 Widget buildName(People people) => Column(
        children: [
          Text(
            people.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            people.job,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
   Widget buildText(People people) => Column(
     crossAxisAlignment: CrossAxisAlignment.start,
  
        children: <Widget> [
          Container( 
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
           "Nama " "        : " + people.name,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          ),
          const SizedBox(height: 24),
          Container(
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
           "Alamat " "      : " + people.alamat,
           style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          ),
           const SizedBox(height: 24),
           Container(
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
          "Email: " "        : " +  people.email,
           style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          ),
           const SizedBox(height: 24),
           Container(
         alignment: Alignment.centerLeft,
         padding: EdgeInsets.only(left:20),
          child: Text(
          "Nomor " "       : " +  people.nomor,
           style: TextStyle(color: Colors.black, fontSize: 18),
          ),
           ),
           const SizedBox(height: 24),
          
          
        ],
      );

 