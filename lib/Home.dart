import 'package:flutter/material.dart';
import 'package:thredzit/survey.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Election Enrollment"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Electoral Roll for a graduate's Constituency",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Start New Enrollment By Selecting the Language"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  color: Colors.yellow,
                  onPressed: () {
                    gotoNewEnrolmentScreen("English");
                  },
                  child: Text("English"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton(
                  color: Colors.yellow,
                  child: Text("Telugu"),
                  onPressed: () {
                    gotoNewEnrolmentScreen("English");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void gotoNewEnrolmentScreen(String selectedLanguage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new NewEnrollment(selectedLanguage)),
    );
  }
}
