import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:thredzit/bloc.dart';

class NewEnrollment extends StatefulWidget {


  @override
  _NewEnrollmentState createState() => _NewEnrollmentState();
}

class _NewEnrollmentState extends State<NewEnrollment> {
  final _formKey = GlobalKey<FormState>();
  Bloc bloc = Bloc.getInstance();

  File _profilePic;
  File _aadharCard;
  File _voterId;
  File _graduationCertificate;
  File _signature;

  static const int NAME = 1;
  static const int GUARDIAN_NAME = 2;
  static const int QUALIFICATION = 3;
  static const int AADHAAR = 4;
  static const int OCCUPATION = 5;
  static const int HOUSE_NUMBER = 6;
  static const int STREET = 7;
  static const int TOWN = 8;
  static const int DISTRICT = 9;
  static const int PIN_CODE = 10;
  static const int POLICE_STATION = 11;
  static const int AGE = 12;
  static const int PHONE_NUMBER = 13;
  static const int ALTERNATE_PHONE_NUMBER = 14;
  static const int EMAIL = 15;
  static const int COLLEGE = 16;
  static const int YEAR = 17;

  static const String PROFILE_PIC = "profile";
  static const String AADHAAR_COPY = "aadhaar";
  static const String VOTER_ID = "voterId";
  static const String GRADUATION_CERTIFICATE = "graduationCertificate";
  static const String SIGNATURE = "signature";

  final picker = ImagePicker();

  bool voterId = true;
  TextEditingController nameController = new TextEditingController();
  TextEditingController guardianNameController = new TextEditingController();
  TextEditingController aadhaarController = new TextEditingController();
  TextEditingController qualificationController = new TextEditingController();
  TextEditingController occupationController = new TextEditingController();
  TextEditingController houseNumberController = new TextEditingController();
  TextEditingController streetController = new TextEditingController();
  TextEditingController townController = new TextEditingController();
  TextEditingController districtController = new TextEditingController();
  TextEditingController postalCodeController = new TextEditingController();
  TextEditingController policeStationController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController contactNumberController = new TextEditingController();
  TextEditingController alternateNumberController = new TextEditingController();
  TextEditingController emailIdController = new TextEditingController();
  TextEditingController collegeController = new TextEditingController();
  TextEditingController graduationYear = new TextEditingController();

  bool checkedValue = false;

  var gender = "Male";

  var graduationType = "Degree";

  bool enrolled = false;

  /*TextEditingController mobileNumberController = new TextEditingController();
  TextEditingController alternativeMobileNumberController =
      new TextEditingController();*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Enrollment"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              getPersonalDetails(),
              getAddressDetails(),
              getContactDetails(),
              getGraduationType(),
              getCollegeDetails(),
              getDivider(),
              getScannedCopies(),
              getDivider(),
              getCheckBox(),
              getDivider(),
              getEnrollButton(),
              getDivider()
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(ImageSource source, String imageType) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        switch (imageType) {
          case PROFILE_PIC:
            _profilePic = File(pickedFile.path);
            break;
          case AADHAAR_COPY:
            _aadharCard = File(pickedFile.path);
            break;
          case VOTER_ID:
            _voterId = File(pickedFile.path);
            break;
          case GRADUATION_CERTIFICATE:
            _graduationCertificate = File(pickedFile.path);
            break;
          case SIGNATURE:
            _signature = File(pickedFile.path);
            break;
        }
      } else {
        print('No image selected.');
      }
    });
    Navigator.pop(context);
  }

  void getDialog(String imageType) {
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
                    onPressed: () => getImage(ImageSource.camera, imageType),
                    child: Text("Camera"),
                  ),
                  RaisedButton(
                    onPressed: () => getImage(ImageSource.gallery, imageType),
                    child: Text("Gallery"),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Widget getTextField(String labelText, String hintText,
      TextEditingController controller, TextInputType type,
      {int maxLength}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: new TextFormField(
        keyboardType: type,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15.0, color: Colors.black45),
        ),
        validator: (value) {
          if (labelText == "Email") {
            if (value.isEmpty)
              return null;
            else {
              if (!isValidEmail(value)) return "Enter valid email";
            }
          } else if (labelText == "Phone Number") {
            return validateMobile(value);
          } else if (labelText == "Alternate Phone Number") {
            return null;
          } else {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
          }
          return null;
        },
        controller: controller,
      ),
    );
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String getLabelText(int value) {
    switch (value) {
      case 1:
        {
          return "Full Name";
        }
      case 2:
        {
          return "Father's/Mother's/Husband's name";
        }
      case 3:
        {
          return "Qualification";
        }
      case 4:
        {
          return "Aadhaar Number";
        }
      case 5:
        {
          return "Occupation";
        }
      case 6:
        {
          return "House Number";
        }
      case 7:
        {
          return "Street";
        }
      case 8:
        {
          return "Town/Village";
        }
      case 9:
        {
          return "District";
        }
      case 10:
        {
          return "Postal Pin Code";
        }
      case 11:
        {
          return "Police Station/Tehsil/Taluka/Mouza";
        }
      case 12:
        {
          return "Age";
        }
      case 13:
        {
          return "Phone Number";
        }
      case 14:
        {
          return "Alternate Phone Number";
        }
      case 15:
        {
          return "Email";
        }
      case 16:
        {
          return "Graduation College";
        }
      case 17:
        {
          return "Graduation Year";
        }
      default:
        {
          return null;
        }
    }
  }

  bool isValidEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  Widget getDivider() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(),
    );
  }

  Widget getButtonAndImage(
      String buttonTitle, String textTitle, String imageType, File file) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow, width: 5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            file == null
                ? Container(
                    height: 150,
                    child: Center(child: Text(textTitle)),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.file(
                        File(
                          file.path,
                        ),
                        height: 150,
                      ),
                    ),
                  ),
            FlatButton(
              color: Colors.yellow,
              child: Text(buttonTitle),
              onPressed: () {
                getDialog(imageType);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget getCheckBox() {
    return Row(
      children: <Widget>[
        Checkbox(
          checkColor: Colors.black,
          value: checkedValue,
          onChanged: (bool value) {
            setState(() {
              checkedValue = value;
            });
          },
        ),
        Expanded(
          child: Text(
              "I declare that I am a citizen of India and that all the particulars given above are true to the best of my knowledge."),
        )
      ],
    );
  }

  void showAlertDialogForResubmission(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning!"),
      content: Text("Already enrolled with this details!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning!"),
      content: Text("Upload all the Certificates"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget getEnrollButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          color: Colors.yellow,
          onPressed: !checkedValue
              ? null
              : () {
                  if (_formKey.currentState.validate()) {
                    if (_profilePic != null &&
                        _voterId != null &&
                        _graduationCertificate != null &&
                        _aadharCard != null &&
                        _signature != null) {
                      if (enrolled) {
                        showAlertDialogForResubmission(context);
                        return;
                      }
                      enrolled = true;
                      showLoading(context);
                      bloc.enrollNewForm(
                          nameController.text,
                          guardianNameController.text,
                          qualificationController.text,
                          occupationController.text,
                          houseNumberController.text,
                          streetController.text,
                          townController.text,
                          postalCodeController.text,
                          policeStationController.text,
                          districtController.text,
                          ageController.text,
                          contactNumberController.text,
                          alternateNumberController.text,
                          emailIdController.text,
                          graduationType,
                          graduationYear.text,
                          gender,
                          aadhaarController.text,
                          _profilePic,
                          _aadharCard,
                          _voterId,
                          _graduationCertificate,
                          _signature);
                    } else {
                      showAlertDialog(context);
                    }
                  }
                },
          child: Text(
            "Enroll",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget getGender() {
    return Row(
      children: <Widget>[
        Text(
          "Gender",
          style: TextStyle(fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            getGenders("Male"),
            getGenders("Female"),
          ],
        )
      ],
    );
  }

  Row getGenders(String value) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
        ),
        Text(value)
      ],
    );
  }

  Widget getGraduationType() {
    return Row(
      children: <Widget>[
        Text(
          "Graduation Type",
          style: TextStyle(fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            graduationTypes("Degree"),
            graduationTypes("Diploma"),
          ],
        )
      ],
    );
  }

  Row graduationTypes(String value) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          groupValue: graduationType,
          onChanged: (value) {
            setState(() {
              graduationType = value;
            });
          },
        ),
        Text(value)
      ],
    );
  }

  Widget getPersonalDetails() {
    return Column(
      children: <Widget>[
        getTextField(
            getLabelText(NAME), "", nameController, TextInputType.text),
        getGender(),
        getTextField(getLabelText(GUARDIAN_NAME), "", guardianNameController,
            TextInputType.text),
        getTextField(
            getLabelText(AADHAAR), "", aadhaarController, TextInputType.number,
            maxLength: 12),
        getTextField(getLabelText(QUALIFICATION), "", qualificationController,
            TextInputType.text),
        getTextField(getLabelText(OCCUPATION), "", occupationController,
            TextInputType.text)
      ],
    );
  }

  Widget getAddressDetails() {
    return Column(
      children: <Widget>[
        getTextField(getLabelText(HOUSE_NUMBER), "", houseNumberController,
            TextInputType.phone),
        getTextField(
            getLabelText(STREET), "", streetController, TextInputType.text),
        getTextField(
            getLabelText(TOWN), "", townController, TextInputType.text),
        getTextField(
            getLabelText(DISTRICT), "", districtController, TextInputType.text),
        getTextField(getLabelText(PIN_CODE), "", postalCodeController,
            TextInputType.number,
            maxLength: 6),
        getTextField(getLabelText(POLICE_STATION), "", policeStationController,
            TextInputType.text),
      ],
    );
  }

  Widget getContactDetails() {
    return Column(
      children: <Widget>[
        getTextField(
            getLabelText(AGE), "", ageController, TextInputType.number),
        getTextField(getLabelText(PHONE_NUMBER), "", contactNumberController,
            TextInputType.phone,
            maxLength: 10),
        getTextField(getLabelText(ALTERNATE_PHONE_NUMBER), "",
            alternateNumberController, TextInputType.phone,
            maxLength: 10),
        getTextField(getLabelText(EMAIL), "", emailIdController,
            TextInputType.emailAddress),
      ],
    );
  }

  Widget getCollegeDetails() {
    return Column(
      children: <Widget>[
        getTextField(
            getLabelText(COLLEGE), "", collegeController, TextInputType.text),
        getTextField(
            getLabelText(YEAR), "", graduationYear, TextInputType.number),
      ],
    );
  }

  Widget getScannedCopies() {
    return Column(
      children: <Widget>[
        getButtonAndImage("Upload Passport Size Photo",
            "Upload Passport Size Photo Only!", PROFILE_PIC, _profilePic),
        getDivider(),
        getButtonAndImage("Upload Aadhaar", "Upload Aadhaar Scanned Copy",
            AADHAAR_COPY, _aadharCard),
        getDivider(),
        getButtonAndImage("Upload Voter ID", "Upload Voter Id Scanned Copy",
            VOTER_ID, _voterId),
        getDivider(),
        getButtonAndImage(
            "Upload Graduation Certificate",
            "Upload Graduation Certificate Scanned Copy",
            GRADUATION_CERTIFICATE,
            _graduationCertificate),
        getDivider(),
        getButtonAndImage(
            "Upload Signature", "Upload Your Signature", SIGNATURE, _signature),
      ],
    );
  }

  void showLoading(BuildContext context) async {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<bool>(
            stream: bloc.isLoading,
            initialData: true,
            builder: (context, snapshot) {
              return snapshot.data
                  ? Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Updating..."),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Updated Successfully"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Colors.yellow,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Ok",
                              style: TextStyle(),
                            ),
                          ),
                        )
                      ],
                    );
            }),
      ],
    ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
