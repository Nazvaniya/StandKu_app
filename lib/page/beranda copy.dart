import 'package:flutter/material.dart';
import 'package:stand_app/model/user.dart';
import 'package:stand_app/page/detail.dart';
import 'package:stand_app/page/home_page%20copy.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/photo_profile.dart';







class BerandaPage extends StatelessWidget {
    final people = UserPreferences.getUser();
 Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('StandKu'),
       automaticallyImplyLeading: false,
      ),
      body: _buildListView(context),
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
             height: 480,
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
                  padding: EdgeInsets.fromLTRB(0, 14.5, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
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
             Image(
              image: AssetImage("images/doge.jpeg"),
                width: double.infinity,
                
                fit: BoxFit.fitWidth,
            ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Event NIGHT + $index" ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text("Batam"),
                )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0) ,
                child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

            ],
          ),
    ));
  }
Widget buildPostWidget2(int index  ){
 
    return Container(
          child: Padding(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                 Padding(
                  padding: EdgeInsets.fromLTRB(0, 14.5, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                ),
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
             Image(
              image: AssetImage("images/mina.jpg"),
                width: double.infinity,
                fit: BoxFit.fitWidth,
            ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Event Megamall + $index" ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text("Batam"),
                )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0) ,
                child: Container(
                  width: double.infinity,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),

            ],
          ),
    ));
  }
}



