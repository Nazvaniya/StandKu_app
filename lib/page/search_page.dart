import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stand_app/page/add_event%20copy.dart';
import 'package:stand_app/page/event_page.dart';
import 'package:stand_app/page/notif_page.dart';
import 'package:stand_app/page/profile_page.dart';

class SearchPage extends StatefulWidget{
   @override
  _SearchPageState createState() => _SearchPageState();

}

class _SearchPageState extends State<SearchPage> {
  User user;
   int _selectedItemIndex = 1;
   TextEditingController _searchController = TextEditingController();
  @override
  void initState(){
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose(){
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged(){
    print(_searchController.text);
  }
  
  Widget build(BuildContext context){
       return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
            child: TextField(
              
              controller: _searchController,
              decoration: InputDecoration(
                 border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
             ),
              hintText: 'Pencarian',
                prefixIcon: Icon(Icons.search)
              ),
            ),
          ),
         
        ],
      ),
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