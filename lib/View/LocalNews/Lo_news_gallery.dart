import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocalGallery extends StatefulWidget {
  @override
  _LocalGalleryState createState() => new _LocalGalleryState();
}

class _LocalGalleryState extends State<LocalGallery> {

  StreamSubscription<QuerySnapshot>?subscription;

  List<DocumentSnapshot>?snapshot;

  CollectionReference collectionReference=FirebaseFirestore.instance.collection("LatestNews");

  @override
  void initState() {

    subscription=collectionReference.snapshots().listen((datasnap){
      setState(() {
        snapshot=datasnap.docs;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF222240),

      body: new ListView.builder(
          itemCount: snapshot?.length,
          itemBuilder: (context,index){

            return Container(
              margin: EdgeInsets.all(10.0),
              child: new Stack(
                children: <Widget>[

                  new Container(
                    child: new ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: new Image.network(snapshot?[index]["image"],
                        height: 300.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 40.0,
                    left: 30.0,
                    child: new Container(
                      height: 50.0,
                      width: 250.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0)
                          )
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: new Text("Local News",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
            );

          }
      ),

    );
  }

}
