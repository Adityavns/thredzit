import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:thredzit/application.dart';

class Bloc {
  static Bloc _instance;

  bool loading;

  static Bloc getInstance() {
    if (_instance == null) _instance = new Bloc();
    return _instance;
  }

  BehaviorSubject<bool> loadingController = new BehaviorSubject<bool>();

  Stream<bool> get isLoading => loadingController.stream;

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
      File profilePic,
      File aadharCard,
      File voterId,
      File graduationCertificate,
      File signature) async {
    updateLoading(true);
    List<File> list = new List();
    list.add(profilePic);
    list.add(voterId);
    list.add(aadharCard);
    list.add(graduationCertificate);
    list.add(signature);
    List<String> urls = await uploadImages(list);
    Application application =  new Application(name, guardianName, qualification,
        occupation, houseNumber, street, town, postOffice, policeStation, district, age, primaryMobileNumber,
        alternateMobileNumber, emailId, graduationCollege, graduationYear,
        urls.elementAt(0), urls.elementAt(1), urls.elementAt(2), urls.elementAt(3), urls.elementAt(4),Timestamp.now(),DateTime.now().millisecondsSinceEpoch.toString());
        await FirebaseFirestore.instance.collection("applications").add(application.toMap());
        updateLoading(false);
  }


  Future<List<String>> uploadImages(List<File> imageFiles) async {
    int time = new DateTime.now().millisecondsSinceEpoch;
    List<String> _urlList = [];
    for(int i=0;i<imageFiles.length;i++){
      StorageReference reference =
      FirebaseStorage.instance.ref().child(time.toString()).child(i.toString());
      StorageUploadTask uploadTask = reference.putFile(imageFiles.elementAt(i));
      StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
      String _url = await downloadUrl.ref.getDownloadURL();
      _urlList.add(_url);
    }
    return _urlList;
  }

  void updateLoading(bool value) {
    loadingController.add(value);
  }
}
