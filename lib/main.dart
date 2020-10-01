import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:thredzit/Home.dart';
import 'package:thredzit/Messages.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //translations: Messages(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //locale: Locale('en', 'US'),
      //fallbackLocale: Locale('te', 'IN'),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
