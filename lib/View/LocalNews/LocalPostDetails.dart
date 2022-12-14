import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class LocalPostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;
  LocalPostDetails(this.snapshot);
  @override
  _LocalPostDetailsState createState() => new _LocalPostDetailsState();
}

class _LocalPostDetailsState extends State<LocalPostDetails> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("Local Post Details"),
        backgroundColor: Color(0xFF222240),
      ),
      backgroundColor: Color(0xFF222240),

      body: new ListView(
        children: <Widget>[

          //start first container..
          new Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network(widget.snapshot["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //end first container..

          new Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF272B4A),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //first container...
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      new CircleAvatar(
                        child: new Text(widget.snapshot["title"][0]),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                      ),
                      new SizedBox(width: 8.0,),

                      new Container(
                          width: MediaQuery.of(context).size.width/1.3,
                          child:new Text(widget.snapshot["title"],
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white
                            ),
                          )

                      )

                    ],
                  ),
                ),//end of first container
                //second container
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new Text(widget.snapshot["view"]+" View",
                    style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.deepOrange
                    ),
                  ),
                ),//end of second container..

                new SizedBox(height: 10.0,),

                new Text(widget.snapshot["des"],
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),


        ],
      ),

    );
  }
}


