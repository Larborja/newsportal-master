import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsportal/Controller/EntertainmentNews.dart';
import 'dart:async';

import 'Controller/LatestNews.dart';
import 'Controller/LocalNews.dart';
import 'Controller/PoliticNews.dart';
import 'Controller/SateliteCampusNews.dart';
import 'Controller/SportsNews.dart';
import 'HomePostDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot>? snapshot;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("LatestPost");

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.docs;
      });
    });

    super.initState();
  }

  final List<String>     items= [
    'https://firebasestorage.googleapis.com/v0/b/gctu-news.appspot.com/o/Sports%2Fsports03.jpg?alt=media&token=a90f120d-0953-4f1f-914b-cb57307bd4ac'
    'https://firebasestorage.googleapis.com/v0/b/gctu-news.appspot.com/o/Entertainment%2Fentertainment01.jpg?alt=media&token=f13eae13-9e36-4c5e-b830-a47704886e78'
'https://firebasestorage.googleapis.com/v0/b/gctu-news.appspot.com/o/LatestPosts%2Flatestposts02.jpg?alt=media&token=57fe4367-642a-4901-ae54-c7a07db85c95'
'https://firebasestorage.googleapis.com/v0/b/gctu-news.appspot.com/o/LatestPosts%2Flatestposts01.jpg?alt=media&token=74d03ab5-c319-4fd2-aa2e-b8d9afdfd379'
'https://firebasestorage.googleapis.com/v0/b/gctu-news.appspot.com/o/LatestPosts%2Flatestposts01.jpg?alt=media&token=74d03ab5-c319-4fd2-aa2e-b8d9afdfd379'
'https://firebasestorage.googleapis.com/v0/b/gctu-news.appspot.com/o/LatestPosts%2Flatestposts01.jpg?alt=media&token=74d03ab5-c319-4fd2-aa2e-b8d9afdfd379'
  ];
  @override
  Widget build(BuildContext context) {

    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: new AppBar(
        title: new Text("GCTU News Portal"),
        backgroundColor: Color(0xFF222240),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF272B4A),
          child: ListView(
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("GCTU News Portal"),
                accountEmail: null,
                decoration: BoxDecoration(color: Color(0xFF222240)),
              ),
              ListTile(
                title: Text(
                  "Satellite Campus News",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: new Icon(
                  Icons.next_week,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              ListTile(
                title: Text(
                  "Sport News",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: new Icon(
                  Icons.sports,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              new ListTile(
                title: new Text(
                  "Main Campus News",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: new Icon(
                  Icons.book,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              new ListTile(
                title: new Text(
                  "Entertainment News",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: new Icon(
                  Icons.party_mode,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30),
                          ),
                          title: Text('Sign Out'),
                          backgroundColor: Colors.white,
                          content: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Text(
                                    'Are you certain you want to Sign Out?'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                print('yes');
                                FirebaseAuth.instance.signOut();
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/login',
                                        (route) => false);
                                // Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Cancel',
                                style:
                                TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF222240),
      body: ListView(
        children: <Widget>[
          //First Container start
          Container(
            height: 200.0,
            width: 300,
            margin: EdgeInsets.only(top: 10.0, left: 0.0),
            child: SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Latest Post",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  new StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("LatestPosts")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong!');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return SizedBox(
                          height: 180,
                          width: 800,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {

                                var result = snapshot.data?.docs;
                                return Container(
                                  height: 40,
                                  width: 400.0,
                                  margin: EdgeInsets.only(left: 10.0),
                                  color: Color(0xFF272B4A),
                                  child: new Row(
                                    children: <Widget>[
                                      new Expanded(
                                        flex: 1,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15.0),
                                          child: new Image.network(
                                            result![index]["image"] ?? "",
                                            height: 100.0,
                                            width: 300,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        width: 10.0,
                                      ),
                                      new Expanded(
                                        flex: 2,
                                        child: new Container(
                                          color: Color(0xFF272B4A),
                                          child: new Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      new MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePageDetails(
                                                                  snapshot.data!.docs[index])));
                                                },
                                                child: new Text(
                                                  result[index]["title"]??"",
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontSize: 21.0,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              new SizedBox(
                                                height: 10.0,
                                              ),
                                              // new Text(
                                              //   result[index]["des"] ?? "",
                                              //   maxLines: 3,
                                              //   style: TextStyle(
                                              //       fontSize: 17.0,
                                              //       color: Colors.white),
                                              // ),
                                              new SizedBox(
                                                height: 5.0,
                                              ),
                                              new Container(
                                                child: new Row(
                                                  children: <Widget>[
                                                    new Icon(
                                                      Icons.remove_red_eye,
                                                      color: Colors.orange,
                                                    ),
                                                    new SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    new Text(
                                                      "View",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      })
                ],
              ),
            ),
          ),
          //First Container end..

          //second container start...

          // new Container(
          //   margin: EdgeInsets.all(10.0),
          //   height: 150.0,
          //   decoration:
          //       new BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          //   child: Center(
          //       child: Container(
          //         height: 350.0,
          //         width: MediaQuery.of(context).size.width,
          //         child: CarouselSlider(
          //
          //      options: CarouselOptions(),
          //           items: items
          //               .map((item) => Container(
          //             child: Center(child:   Image.network(item,fit: BoxFit.cover, width: 500)),
          //             color: Colors.transparent,
          //           ))
          //               .toList(),
          //         )),
          //         ),
          //       ),
                //second container end..
          //Third Container start...
          new Container(
            height: 300.0,
            margin: EdgeInsets.all(10.0),
            child: new ListView(
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            LatestNews()));
                              },
                              child: new Text(
                                "Latest News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(
                        width: 10.0,
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => SatCampusNews()));
                              },
                              child: new Text(
                                "Satelite Campus News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), //first container end..

                new SizedBox(
                  height: 10.0,
                ),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => EntertainmentNews()));
                              },
                              child: new Text(
                                "Entertainment News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(
                        width: 10.0,
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => Sports()));
                              },
                              child: new Text(
                                "Sports News",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

          //Third Container End....
        ],
      ),
    );
  }
}
