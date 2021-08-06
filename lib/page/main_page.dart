import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stand_app/page/add_event%20copy.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/page/item_card.dart';
import 'package:stand_app/page/notif_page.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/page/search_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

 int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference event = firestore.collection('event');
   

    return Scaffold(
        appBar: AppBar(
          title: Text('StandKu'),
          automaticallyImplyLeading: false,
          
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
              StreamBuilder(
                stream:  event.snapshots(),
                builder: (_, snapshot){
                  if(snapshot.hasData){
                   return Column(
                      children: snapshot.data.docs.map<Widget>((e) => ItemCard(e.data()['name'], e.data()['img']
                      , e.data()['date'], e.data()['place'], e.data()['desc'] )).toList(),
                    );
                  }
                  else {
                    return Text('loading');
                  }
                }
              ),
          
                SizedBox(
                  height: 150,
                )
              ],
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
    )
    
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
