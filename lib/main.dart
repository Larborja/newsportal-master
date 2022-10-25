import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newsportal/Home.dart';

import 'Registration.dart';
import 'loginScreen.dart';

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("Users");
void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Home(),



    initialRoute: FirebaseAuth.instance.currentUser == null
        ? '/login'
        : '/home',
    routes:
    {

      '/registration': (context) => RegistrationScreen(),
      '/login': (context) => LoginScreen(),
      '/home': (context) => Home(),






    },
  ));


}