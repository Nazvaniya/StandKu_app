import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stand_app/page/add_event%20copy.dart';


class ManageEventPage extends StatefulWidget {
  @override
  _ManageEventPageState createState() => _ManageEventPageState();
}


class _ManageEventPageState extends State<ManageEventPage>{

  @override 

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Manage Event') ,
      leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>AddEvent()));},
          ),),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("event").snapshots(),
        builder: (context, snapshot){
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
                deletData() async{
                CollectionReference collectionReference = FirebaseFirestore.instance.collection('event');
                QuerySnapshot querySnapshot = await collectionReference.get();
                querySnapshot.docs[index].reference.delete();
              }
              
              DocumentSnapshot event = snapshot.data.docs[index];
              return Container(
                     height: 350,
                     child: Card(
                       elevation: 5,
                       child: Row(
                         children: <Widget> [
                           Container(
                             padding: EdgeInsets.all(5),
                             height: 200,
                             width: 200,
                             child: Image.network(event['img'],
                             fit: BoxFit.cover,),
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
                                 child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(event['place'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal
                                    ),),
                                  ),
                               ),
                                   Container(
                                 padding: EdgeInsets.all(5),
                                 child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(event['date'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal
                                    ),),
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
                                   padding: EdgeInsets.fromLTRB(20, 80, 10, 0),
                                   child: Row(
                                      children: [
                                    //   ElevatedButton
                                    // (child: Icon(Icons.edit),
                                    // onPressed:() 
                                    // {
                                    //  deletData();
                                    // }
                                    
                                    // ),
                                    SizedBox(width: 50,),
                                    ElevatedButton
                                    (child: Icon(Icons.delete),
                                    onPressed:() 
                                    {
                                     deletData();
                                    }
                                    
                                    ),
                                      
                                      ]),
                                 ),
                              ],
                             ),
                           )],
                       )
                     ),
                  
                    );
            
            },);
        },
      ),
    );
  }
}
