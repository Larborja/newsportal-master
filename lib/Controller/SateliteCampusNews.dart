import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsportal/View/satelitecampusNews/sat_all_news.dart' as allnews;
import 'package:newsportal/View/satelitecampusNews/sat_news_gallery.dart' as gallery;

import '../View/LocalNews/Lo_news_gallery.dart';

class SatCampusNews extends StatefulWidget {
  const SatCampusNews({Key? key}) : super(key: key);

  @override
  State<SatCampusNews> createState() => _SatCampusNewsState();
}

class _SatCampusNewsState extends State<SatCampusNews>with SingleTickerProviderStateMixin {

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
          title: new Text("Satelite News"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,

            tabs: <Widget>[

              new Tab(icon: Icon(Icons.next_week),text: "Satelite",),
              new Tab(icon: Icon(Icons.image),text: "Gallery",)

            ],
          )
      ),

      body: new TabBarView(
        controller: tabController,
        children: <Widget>[

          new allnews.sat_AllNews(),
          new gallery.sat_Gallery()
        ],
      ),

    );
  }
}
