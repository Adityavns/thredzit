import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  String name;
  String guardianName;
  String qualification;
  String occupation;
  String houseNumber;
  String street;
  String town;
  String postOffice;
  String policeStation;
  String district;
  String age;
  String primaryMobileNumber;
  String alternateMobileNumber;
  String emailId;
  String graduationCollege;
  String graduationYear;
  String aadhaarNumber;
  String photoUrl;
  String voterIdUrl;
  String aadharCardUrl;
  String certificatesUrl;
  String signatureUrl;
  Timestamp registeredOn;
  String applicationID;

  Application(
      this.name,
      this.guardianName,
      this.qualification,
      this.occupation,
      this.houseNumber,
      this.street,
      this.town,
      this.postOffice,
      this.policeStation,
      this.district,
      this.age,
      this.primaryMobileNumber,
      this.alternateMobileNumber,
      this.emailId,
      this.graduationCollege,
      this.graduationYear,
      this.aadhaarNumber,
      this.photoUrl,
      this.voterIdUrl,
      this.aadharCardUrl,
      this.certificatesUrl,
      this.signatureUrl,
      this.registeredOn,
      this.applicationID);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map['name'] = this.name;
    map['guardianName'] = this.guardianName;
    map['qualification'] = this.qualification;
    map['occupation'] = this.occupation;
    map['houseNumber'] = this.houseNumber;
    map['street'] = this.street;
    map['town'] = this.town;
    map['postOffice'] = this.postOffice;
    map['policeStation'] = this.policeStation;
    map['district'] = this.district;
    map['age'] = this.age;
    map['primaryMobileNumber'] = this.primaryMobileNumber;
    map['alternateMobileNumber'] = this.alternateMobileNumber;
    map['emailId'] = this.emailId;
    map['graduationCollege'] = this.graduationCollege;
    map['graduationYear'] = this.graduationYear;
    map['aadhaarNumber'] = this.aadhaarNumber;
    map['photoUrl'] = this.photoUrl;
    map['voterIdUrl'] = this.voterIdUrl;
    map['aadharCardUrl'] = this.aadharCardUrl;
    map['certificatesUrl'] = this.certificatesUrl;
    map['signatureUrl'] = this.signatureUrl;
    map['applicationID'] = this.applicationID;
    map['registeredOn'] = this.registeredOn;
    return map;
  }

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  @override
  String toString() {
    return 'Application{name: $name, guardianName: $guardianName, qualification: $qualification, occupation: $occupation, houseNumber: $houseNumber, street: $street, town: $town, postOffice: $postOffice, policeStation: $policeStation, district: $district, age: $age, primaryMobileNumber: $primaryMobileNumber, alternateMobileNumber: $alternateMobileNumber, emailId: $emailId, graduationCollege: $graduationCollege, graduationYear: $graduationYear, aadhaarNumber: $aadhaarNumber, photoUrl: $photoUrl, voterIdUrl: $voterIdUrl, aadharCardUrl: $aadharCardUrl, certificatesUrl: $certificatesUrl, signatureUrl: $signatureUrl, registeredOn: $registeredOn, applicationID: $applicationID}';
  }

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
