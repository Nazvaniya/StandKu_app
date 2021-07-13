import 'package:flutter/material.dart';
import 'package:stand_app/page/home_page.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/photo_profile.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();


 
}

class _HomeState extends State<Home> {
    final user = UserPreferences.getUser();
  int _selectedItemIndex = 0;
   @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Text("StandKu",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
              Container(
              height: 5,
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 30),
            ),
                  Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                  buildPostSection(
                      "https://i.ytimg.com/vi/cCUVGMgO0k0/maxresdefault.jpg",
                      "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=940"),
                  buildPostSection(
                      "https://cdn.idntimes.com/content-images/post/20210503/whatsapp-image-2021-05-03-at-102849-am-bd5295c6b01ab89207f2f52af1a1262e_600x400.jpeg",
                      "https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640", ),
                  buildPostSection(
                      "https://i.ytimg.com/vi/cCUVGMgO0k0/maxresdefault.jpg",
                      "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=100&w=640"),
                ],
              ),
            )
          ],
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
         
        ],),
      ),
   );
  }

   Widget buildNavBarItem(IconData icon, int index) {
     return GestureDetector(
       onTap: (){
         setState(() {
                    _selectedItemIndex =index;
                  });
       },
       
       child: Container(
         width: MediaQuery.of(context).size.width/4,
            height: 50,
            child: Container(child: Icon(icon,
            size: 30,
            color: index == _selectedItemIndex ? Colors.blue : Colors.black54,),
            ),
          ),
          
     );
   }
      Widget buildNavBarItemPerson(context,IconData icon, int index, ) {
     return GestureDetector(
       onTap: (){
         setState(() {
                    _selectedItemIndex =index;
                  });
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ProfilePage()));
       },
    
       child: Container(
         width: MediaQuery.of(context).size.width/4,
            height: 50,
            child: Container(child: Icon(icon,
            size: 30,
            color: index == _selectedItemIndex ? Colors.blue : Colors.black54,),
            ),
            
          ),
     );
   }

     Container buildPostSection(String urlPost, String urlProfilePhoto,) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPostFirstRow(),
          SizedBox(
            height: 10,
          ),
          buildPostPicture(urlPost,),
          SizedBox(
            height: 5,
          ),
          Text(
            "Event",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
  Row buildPostFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: ()  {
                 
              },
                 child: PhotoProfile(
                        imagePath: user.imagePath,
                          onClicked: () async {
                        await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                  setState(() {});
                },
          ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tom Smith",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Iceland",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        Icon(Icons.more_vert)
      ],
    );
  }
  Stack buildPostPicture(String urlPost) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlPost),
              )),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Icon(Icons.favorite,
              size: 35, color: Colors.white.withOpacity(0.7)),
        )
      ],
    );
  }
}

