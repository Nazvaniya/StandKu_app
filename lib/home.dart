import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();


 
}

class _HomeState extends State<Home> {
   @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Home'),
     ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('HOME')
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
          buildNavBarItem(Icons.home),
          buildNavBarItem(Icons.search),
          buildNavBarItem(Icons.notifications),
          buildNavBarItem(Icons.person),
        ],),
      ),
   );
  }

   Container buildNavBarItem(IconData icon) {
     return Container(
       width: MediaQuery.of(context).size.width/4,
          height: 50,
          child: Container(child: Icon(icon,
          size: 30,
          color: Colors.black,),
          ),
        );
   }
}

