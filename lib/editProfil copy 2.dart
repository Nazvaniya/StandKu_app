import 'package:flutter/material.dart';

class EditProfil extends StatefulWidget {
  @override
  _EditProfilState createState() => _EditProfilState();
}
  class _EditProfilState extends State<EditProfil> {
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profil'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
          actions: [
            IconButton(icon: Icon(Icons.settings, 
            color: Colors.white,), 
            onPressed: (){})
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, top:20, right: 15),
          child: ListView(
         children: [ 
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2, blurRadius: 10,
                      color:  Colors.black.withOpacity(0.1),
                      offset: Offset(0,10)
                    )
                  ],
                   shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/logo.PNG"),
                    )
                ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )
                        ),
                  ],
                ),
              ),
               Text(
                "Siti Maimunah",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              ],
          ),
        ),
      );
    }
  }