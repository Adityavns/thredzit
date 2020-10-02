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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Electoral Roll for a Graduate's Constituency",style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: FlatButton(
                    color: Colors.yellow,
                    onPressed: () {
                      gotoNewEnrolmentScreen();
                    },
                    child: Text("New Enrollment"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Powered By ThredzIT Solutions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          )
        ],
      ),
    );

    return Center(
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Electoral Roll for a Graduate's Constituency",style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.yellow,
                  onPressed: () {
                    gotoNewEnrolmentScreen();
                  },
                  child: Text("New Enrollment"),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: <Widget>[
              //       FlatButton(
              //         color: Colors.yellow,
              //         child: Text("Telugu"),
              //         onPressed: () {
              //           gotoNewEnrolmentScreen("English");
              //         },
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

  void gotoNewEnrolmentScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new NewEnrollment()),
    );
  }
}
