import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsportal/View/EntertainmentNews/Ent_all_news.dart' as allnews;
import 'package:newsportal/View/EntertainmentNews/Ent_news_gallery.dart' as gallery;

import '../View/LocalNews/Lo_news_gallery.dart';

class EntertainmentNews extends StatefulWidget {
  const EntertainmentNews({Key? key}) : super(key: key);

  @override
  State<EntertainmentNews> createState() => _EntertainmentNewsState();
}

class _EntertainmentNewsState extends State<EntertainmentNews>with SingleTickerProviderStateMixin {

  TabController? tabController;

  @override
  void initState() {
    tabController=new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
          title: new Text("Entertainment News"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,

            tabs: <Widget>[

              new Tab(icon: Icon(Icons.next_week),text: "Entertainment",),
              new Tab(icon: Icon(Icons.image),text: "Gallery",)

            ],
          )
      ),

      body: new TabBarView(
        controller: tabController,
        children: <Widget>[

          new allnews.EntAllNews(),
          new gallery.EntGallery()
        ],
      ),

    );
  }
}
