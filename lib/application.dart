class Application{
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
    String photoUrl;
    String voterIdUrl;
    String aadharCardUrl;
    String certificatesUrl;
    String signatureUrl;

    Map<String,dynamic> toMap(){
        Map<String,dynamic> map = new Map();
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
        map['photoUrl'] = this.photoUrl;
        map['voterIdUrl'] = this.voterIdUrl;
        map['aadharCardUrl'] = this.aadharCardUrl;
        map['certificatesUrl'] = this.certificatesUrl;
        map['signatureUrl'] = this.signatureUrl;
        return map;
    }
}