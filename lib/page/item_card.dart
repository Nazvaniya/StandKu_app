import 'package:flutter/material.dart';
import 'package:stand_app/page/profile_page.dart';
import 'package:stand_app/register.dart';
import 'package:stand_app/utils/user_preferences.dart';
import 'package:stand_app/widget/photo_profile.dart';


class ItemCard extends StatefulWidget {
  final String name;
  final String img;
  final String date;
  final String place;
  final String desc;
  //// Pointer to Update Function
  final Function onUpdate;
  //// Pointer to Delete Function
  final Function onDelete;

  ItemCard(this.name, this.img, this.date, this.place, this.desc, {this.onUpdate, this.onDelete});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
   final people = UserPreferences.getUser();
  @override
  Widget build(BuildContext context) {
 return Container(
   
 
                       height: 550,
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
                               child: Image.network(widget.img,
                               fit: BoxFit.fitWidth),
                             ),
                             Expanded(
                               child: Column(
                                 children: <Widget>[
                                  
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(widget.name,
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
                                        Text(widget.place,
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
                                    Text(widget.date),
                                  ]
                                  ),
                                ),
                                 
                               
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                   child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(widget.desc,
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
                      );
      
            
            
  }
}