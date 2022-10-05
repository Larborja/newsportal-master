import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
 _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GCTU News Portal"),
        backgroundColor: Color(0xFF222240),
      ),
      drawer: new Drawer(

        child: Container(
          color: Color(0xFF272B4A),
          child: new ListView(
            children: <Widget> [

              new UserAccountsDrawerHeader(
                  accountName: new Text("GCTU News Portal"),
                  accountEmail: null,
                decoration: new BoxDecoration(
                  color: Color(0xFF222240)
                ),
              ),

              new ListTile(
                title: new Text("Satellite Campus News",
                style: TextStyle(
                fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.next_week,color: Colors.white,size: 20.0,),
                ),

              new ListTile(
                title: new Text("Sport News",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.sports,color: Colors.white,size: 20.0,),
              ),

              new ListTile(
                title: new Text("Main Campus News",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.book,color: Colors.white,size: 20.0,),
              ),

              new ListTile(
                title: new Text("Entertainment News",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.party_mode,color: Colors.white,size: 20.0,),
              ),

            ],
          ),
        ),

      ),

    );
  }
}
