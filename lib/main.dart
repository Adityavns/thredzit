import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:get/route_manager.dart';
import 'package:thredzit/Home.dart';
//import 'package:thredzit/Messages.dart';

Future<void> main() async {
  runApp(MyApp());
  Firebase.initializeApp();
  if (await Permission.storage.request().isGranted && await Permission.camera.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
  }else{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.camera
    ].request();
    print(statuses[Permission.storage]);
  }

// You can request multiple permissions at once.

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
