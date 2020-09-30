import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Bloc {
  static Bloc _instance;

  static Bloc getInstance() {
    if (_instance == null) _instance = new Bloc();
    return _instance;
  }

  void enrollNewForm(
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
      File signature) {
    List<File> list = new List();
    list.add(profilePic);
    list.add(aadharCard);
    list.add(voterId);
    list.add(graduationCertificate);
    list.add(signature);
    uploadImages(list);

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
}
