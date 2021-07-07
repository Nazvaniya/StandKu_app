import 'package:flutter/material.dart';
import 'package:stand_app/home.dart';
import 'package:stand_app/page/profile_page.dart';

class NavBar extends StatefulWidget {
  @override 
  _NavBarState createState() => _NavBarState();
}
class _NavBarState extends State<NavBar>{
  int currentTab = 0;
  final List<Widget> screens = [ 
    ProfilePage(),
    Home(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home(); 

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: PageStorage(
        child:currentScreen,
        bucket: bucket,
        ),
        
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 81,
                        onPressed: () {
                          setState(() {
                          currentScreen = Home();
                          currentTab = 0;                            
                                                    });
                        
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color:  currentTab == 0? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'HOME',
                              style: TextStyle(color:  currentTab == 0 ? Colors.blue : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    MaterialButton(
                        minWidth: 50,
                        onPressed: () {
                          setState(() {
                          currentScreen = ProfilePage();
                          currentTab = 1;                            
                                                    });
                        
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color:  currentTab == 1? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'SEARCH',
                              style: TextStyle(color:  currentTab == 1 ? Colors.blue : Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        minWidth: 50,
                        onPressed: () {
                          setState(() {
                          currentScreen = Home();
                          currentTab = 2;                            
                                       });
                        
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications,
                              color:  currentTab == 2? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Notifikasi',
                              style: TextStyle(color:  currentTab == 2 ? Colors.blue : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                          currentScreen = ProfilePage();
                          currentTab = 3;                            
                                                    });
                        
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color:  currentTab == 3? Colors.blue : Colors.grey,
                            ),
                            Text(
                              'Profil',
                              style: TextStyle(color:  currentTab ==  3? Colors.blue : Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }
}



