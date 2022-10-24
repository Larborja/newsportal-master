import 'package:flutter/material.dart';
import 'package:newsportal/Home.dart';
void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp()
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Home(),
  ));
}