import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
 _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

late StreamSubscription<QuerySnapshot>subscription;

late List<DocumentSnapshot>snapshot;
final FirebaseFirestore _firestore=FirebaseFirestore.instance;

CollectionReference collectionReference=FirebaseFirestore.instance.collection("LatestPost");

@override
  void initState() {

  subscription=collectionReference.snapshots().listen((datasnap) {
    setState(() {
      snapshot=datasnap.docs;
    });
  });

  super.initState();
 }

  @override
  Widget build(BuildContext context) {
    var snapshot;
    return Scaffold(
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

      backgroundColor: Color(0xFF222240),

      body: new ListView(
        children: <Widget>[

          new Container(
            height:130.0,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Latest Post",
                  style: TextStyle(
                    fontSize:18.0,
                    color: Colors.white
                  ),
                  ),
                ),
                new SizedBox(height: 5.0,),

                StreamBuilder(
                  stream: _firestore.collection("LatestPost").snapshots(),
                  builder: (


                  BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot                  ) {
                    if (!snapshot.hasData) {
                      return Center(
                          child: SizedBox(height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                color: Colors.black,))
                      );
                    }


                    return Container(
                      height: 130,
                      margin: EdgeInsets.all(8.0),
                      color: Color(0xFF272B4A),
                      child: new ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 350.0,
                              child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      flex: 1,
                                      child: new Image.network(snapshot.data
                                          ?.docs[index]["image"],
                                          fit: BoxFit.cover,
                                          height: 130.0
                                      ),
                                    ),
                                    new SizedBox(width: 10.0,),

                                    new Expanded(
                                        flex: 2,
                                        child: new Column(
                                          children: <Widget>[
                                            new Text(snapshot.data
                                                ?.docs[index]["title"],
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white
                                              ),
                                            ),

                                            new SizedBox(height: 5.0,),

                                            new Text(snapshot.data
                                                ?.docs[index]["content"],
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white
                                              ),
                                            ),

                                            new Container(

                                                child: new Row(
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.remove_red_eye,
                                                      color: Colors.deepOrange,
                                                    ),

                                                    new Text("view",
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.white
                                                      ),

                                                    ),
                                                  ],
                                                )
                                            )

                                          ],
                                        )
                                    )
                                  ]
                              ),
                            );
                          }
                      ),
                    );
                  })]
            ),
          )
        ]
      ) ,

    );
  }
}
