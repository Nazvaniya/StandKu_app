import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stand_app/page/add_event%20copy.dart';
import 'package:stand_app/page/detail.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/page/search_page.dart';
import 'package:stand_app/utils/auth_services.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/photo_profile.dart';

import 'notif_page.dart';


class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage>{
   User user;
  final AuthServices _firebaseAuth = AuthServices();
  
      final people = UserPreferences.getUser();
       int _selectedItemIndex = 0;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('StandKu'), 
      automaticallyImplyLeading: false,),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("event").snapshots(),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              DocumentSnapshot event = snapshot.data.docs[index];
              return InkWell(
                   onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(event = snapshot.data.docs[index])));
           },
                child: Container(
                       height: 600,
                       child: Card(
                         elevation: 5,
                         child: Column(
                           children: <Widget> [
                    Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Container(
                          width: 40,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                         child:  PhotoProfile(
                          imagePath: people.imagePath,
                           onClicked: () async {
                          await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                        ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(people.name),
                      ),
                    ],
                  ),
                             Container(
                               padding: EdgeInsets.all(0),
                               height: 250,
                               width: double.infinity,
                               child: Image.network(event['img'],
                               fit: BoxFit.fitWidth),
                             ),
                             Expanded(
                               child: Column(
                                 children: <Widget>[
                                  
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(event['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal
                                      ),),
                                    ),
                                  ),
                                 Container(
                                   padding: EdgeInsets.all(5),
                                   child: Row(
                                      children: [
                                        Icon(Icons.place),
                                        Text(event['place'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal
                                      ),),
                                      ]),
                                 ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                      Icon(Icons.date_range),
                                    Text(event['date']),
                                  ]
                                  ),
                                ),
                                 
                               
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                   child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(event['desc'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal
                                      ),),
                                    ),
                                 ),
                                ],
                               ),
                             )],
                         )
                       ),
                      ),
              );
            
            },);
        },
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
    ));
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

