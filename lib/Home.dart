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
        title: Text("TDP-MLC Enrollment"),
        backgroundColor: new Color.fromRGBO(255, 208, 17, 1),
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
                getPhotos(),
                Text("Electoral Roll for a Graduate's Constituency",style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: FlatButton(
                    color: new Color.fromRGBO(255, 208, 17, 1),
                    onPressed: () {
                      gotoNewEnrolmentScreen();
                    },
                    child: Text("New Enrollment"),
                  ),
                ),
              ],
            ),



          ),
         /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Powered By ThredzIT Solutions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          )*/
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

  Widget getPhotos() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/ntr.png",width: 100,height: 100,),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/cbn.png",width: 100,height: 100,),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/ramana.png",width: 100,height: 100,),
            )),
        ],
      ),
    );
  }
}
