import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  final  event;
  //event = snapshot.data.docs[index];
  DetailPage(this.event);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Detail'),
      ),
      body: Column(
        children: [
          Container( 
           margin: EdgeInsets.all(10),
            height: 300,
            width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
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
                image: NetworkImage(event['img']),
              )),
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

                      Container(
                        margin: EdgeInsets.all(80),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            primary: Colors.white,
                            ),
                            onPressed: ()  { 
                    
                            }, 

                            child: Text(
                              'Pilih Stand',
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
                  )
        ],
      ) 
    );
  }
}