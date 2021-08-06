import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stand_app/page/add_event%20copy.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/model/user.dart';
import 'package:stand_app/page/detail.dart';
import 'package:stand_app/page/home_page%20copy.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/page/search_page.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/photo_profile.dart';







class NotifPage extends StatefulWidget {
  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
 User user;
  int index;
   int _selectedItemIndex = 3;
    final people = UserPreferences.getUser();

 Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
       automaticallyImplyLeading: false,
      ),
      
      body: _buildListView(context),
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

  ListView _buildListView(BuildContext context){
    return ListView.builder(
      itemCount: 3,
       itemBuilder: (context, index) {
         return InkWell(
           onTap: (){
            
           },
           child: Container (
             height: 150,
             child: Card(
               elevation: 10,
              child: Column(
                children: <Widget> [
                buildPostWidget(context, index)
                ],
              ),
              ),
           ),
         );
         
       },
    );
  }

  Widget buildPostWidget(BuildContext context, int index ){
    return Container(
      
          child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
               
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Icon(
                    Icons.keyboard_control,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              ],
              ),
              ),
            
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Pemesanan Stand A$index pada Event NIGHT" ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text("Batam"),
                )
                  ],
                ),
              ),
            

            ],
          ),
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



