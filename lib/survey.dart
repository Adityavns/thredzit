import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  static const int profilePic = 0;
  static const int aadhar = 1;
  static const int voter = 2;
  static const int grad = 3;
  static const int signature = 4;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _profilePic;
  File _aadharCard;
  File _voterId;
  File _graduationCertificate;
  File _signature;

  final picker = ImagePicker();

  bool voterId = true;

  TextEditingController mobileNumberController = new TextEditingController();
  TextEditingController alternativeMobileNumberController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Survey"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text("Upload Profile Pic"),
            trailing: Visibility(
              visible: _profilePic != null,
              child: new Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            onTap: () => getDialog(MyHomePage.profilePic),
          ),
          ListTile(
            title: Text("Upload Aadhar card"),
            trailing: Visibility(
              visible: _aadharCard != null,
              child: new Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            onTap: () => getDialog(MyHomePage.aadhar),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckboxListTile(
              title: Text("Do you have Voter Id"),
              value: voterId,
              onChanged: (bool value) {
                setState(() {
                  voterId = value;
                });
              },
            ),
          ),
          Visibility(
            visible: voterId,
            child: ListTile(
              title: Text("Upload Voter ID"),
              onTap: () => getDialog(MyHomePage.voter),
              trailing: Visibility(
                visible: _voterId != null,
                child: new Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: mobileNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Mobile Number",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextFormField(
              controller: mobileNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter alternative Mobile Number",
              ),
            ),
          ),
          ListTile(
            title: Text("Upload Graduation/Diploma Certificates"),
            trailing: Visibility(
              visible: _graduationCertificate != null,
              child: new Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            onTap: () => getDialog(MyHomePage.grad),
          ),
          ListTile(
            trailing: Visibility(
              visible: _signature != null,
              child: new Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            title: Text("Upload Signature"),
            onTap: () => getDialog(MyHomePage.signature),
          ),
        ],
      ),
    );
  }

  Future getImage(ImageSource source, int file) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        switch (file) {
          case MyHomePage.profilePic:
            _profilePic = File(pickedFile.path);
            break;
          case MyHomePage.aadhar:
            _aadharCard = File(pickedFile.path);
            break;
          case MyHomePage.voter:
            _voterId = File(pickedFile.path);
            break;
          case MyHomePage.grad:
            _graduationCertificate = File(pickedFile.path);
            break;
          case MyHomePage.signature:
            _signature = File(pickedFile.path);
            break;
        }
      } else {
        print('No image selected.');
      }
    });
    Navigator.pop(context);
  }

  void getDialog(int whatToSave) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Upload Profile Pic"),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => getImage(ImageSource.camera, whatToSave),
                    child: Text("Camera"),
                  ),
                  RaisedButton(
                    onPressed: () => getImage(ImageSource.gallery, whatToSave),
                    child: Text("Gallery"),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
