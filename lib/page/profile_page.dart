
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
import 'package:stand_app/utils/display_toas.dart';
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
        displayToastMessage("Keluar Dari Akun", context);
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
           FutureBuilder<String>(
                      future: AuthServices.getUsername(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          );
                        } else {
                          return Text(
                            "Loading data...",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          );
                        }
                      },
                    ),
                     FutureBuilder<String>(
                      future: AuthServices.getjob(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          );
                        } else {
                          return Text(
                            "Loading data...",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          );
                        }
                      },
                    ),
        ],
      );
   Widget buildText(People people) =>
    Column(
     crossAxisAlignment: CrossAxisAlignment.start,
  
        children: <Widget> [
           Container(
             padding: EdgeInsets.only(left: 20),
             child: FutureBuilder<String>(
                        future: AuthServices.getUsername(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text( "Nama " "        : " + 
                              snapshot.data,
                              style: TextStyle(
                                
                                fontSize: 18,
                                color: Colors.black,
                                
                              ),
                              textAlign: TextAlign.left,
                            );
                          } else {
                            return Text(
                              "Loading data...",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            );
                          }
                        },
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
             padding: EdgeInsets.only(left: 20),
             child: FutureBuilder<String>(
                        future: AuthServices.getEmail(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text( "Email " "        : " + 
                              snapshot.data,
                              style: TextStyle(
                                
                                fontSize: 18,
                                color: Colors.black,
                                
                              ),
                              textAlign: TextAlign.left,
                            );
                          } else {
                            return Text(
                              "Loading data...",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            );
                          }
                        },
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

 