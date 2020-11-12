import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:thredzit/application.dart';

class Bloc {
  static Bloc _instance;

  static const int LOADING = 1;
  static const int SUCCESS = 2;
  static const int ERROR = 3;

  static Bloc getInstance() {
    if (_instance == null) _instance = new Bloc();
    return _instance;
  }

  BehaviorSubject<int> loadingController = new BehaviorSubject<int>();

  Stream<int> get isLoading => loadingController.stream;

  Future<void> enrollNewForm(
      String name,
      String guardianName,
      String qualification,
      String occupation,
      String houseNumber,
      String street,
      String town,
      String postOffice,
      String policeStation,
      String district,
      String age,
      String primaryMobileNumber,
      String alternateMobileNumber,
      String emailId,
      String graduationCollege,
      String graduationYear,
      String gender,
      String aadhaarNumber,
      File profilePic,
      File aadharCard,
      File voterId,
      File graduationCertificate,
      File signature,
     ) async {
    updateLoading(LOADING);
    try {
      List<File> list = new List();
      list.add(profilePic);
      list.add(voterId);
      list.add(aadharCard);
      list.add(graduationCertificate);
      list.add(signature);
      List<String> urls = await uploadImages(list, aadhaarNumber, primaryMobileNumber);
      Application application = new Application(
          name,
          guardianName,
          qualification,
          occupation,
          houseNumber,
          street,
          town,
          postOffice,
          policeStation,
          district,
          age,
          primaryMobileNumber,
          alternateMobileNumber,
          emailId,
          graduationCollege,
          graduationYear,
          aadhaarNumber,
          urls.elementAt(0),
          urls.elementAt(1),
          urls.elementAt(2),
          urls.elementAt(3),
          urls.elementAt(4),
          Timestamp.now(),
          DateTime.now().millisecondsSinceEpoch.toString());
      await FirebaseFirestore.instance
          .collection("applications")
          .add(application.toMap());
      updateLoading(SUCCESS);
    } catch (error) {
      updateLoading(ERROR);
    }
  }

  Future<List<String>> uploadImages(
      List<File> imageFiles, String aadhaarNumber, String mobileNumber) async {
    List<String> _urlList = [];
    for (int i = 0; i < imageFiles.length; i++) {
      StorageReference reference = FirebaseStorage.instance
          .ref()
          .child(aadhaarNumber+"_"+mobileNumber)
          .child(getText(i));
      StorageUploadTask uploadTask = reference.putFile(imageFiles.elementAt(i));
      StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
      String _url = await downloadUrl.ref.getDownloadURL();
      _urlList.add(_url);
    }
    return _urlList;
  }

  void updateLoading(int value) {
    loadingController.add(value);
  }

  String getText(int index) {
    if(index==0){
      return "Pass_Photo";
    }else if(index==1){
      return "Voter_ID";
    }else if(index==2){
      return "Aadhaar";
    }else if(index==3){
      return "Graduation_Certificates";
    }else{
      return "Signature";
    }
  }
}
