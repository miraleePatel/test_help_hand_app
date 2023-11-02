class MainInsuranceModel {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? gender;
  String? dateOfBirth;
  String? aadharNo;
  String? agentFname;
  String? agentLname;
  String? agentCode;
  String? mainFile;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<MainInsurancePersonDependenPeople>? mainInsurancePersonDependenPeople;

  MainInsuranceModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.gender,
        this.dateOfBirth,
        this.aadharNo,
        this.agentFname,
        this.agentLname,
        this.agentCode,
        this.mainFile,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.mainInsurancePersonDependenPeople});

  MainInsuranceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNumber = json['mobile_number'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    aadharNo = json['aadhar_no'];
    agentFname = json['agent_fname'];
    agentLname = json['agent_lname'];
    agentCode = json['agent_code'];
    mainFile = json['main_file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['main_insurance_person_dependen_people'] != null) {
      mainInsurancePersonDependenPeople = <MainInsurancePersonDependenPeople>[];
      json['main_insurance_person_dependen_people'].forEach((v) {
        mainInsurancePersonDependenPeople!
            .add(new MainInsurancePersonDependenPeople.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_number'] = this.mobileNumber;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['aadhar_no'] = this.aadharNo;
    data['agent_fname'] = this.agentFname;
    data['agent_lname'] = this.agentLname;
    data['agent_code'] = this.agentCode;
    data['main_file'] = this.mainFile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.mainInsurancePersonDependenPeople != null) {
      data['main_insurance_person_dependen_people'] = this
          .mainInsurancePersonDependenPeople!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class MainInsurancePersonDependenPeople {
  int? id;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? gender;
  String? dateOfBirth;
  String? aadharNo;
  String? relationCategory;
  String? relation;
  String? dependedFile;
  Null? createdAt;
  Null? updatedAt;
  Null? deletedAt;
  int? mainInsurancePersonId;

  MainInsurancePersonDependenPeople(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobileNo,
        this.gender,
        this.dateOfBirth,
        this.aadharNo,
        this.relationCategory,
        this.relation,
        this.dependedFile,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.mainInsurancePersonId});

  MainInsurancePersonDependenPeople.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    aadharNo = json['aadhar_no'];
    relationCategory = json['relation_category'];
    relation = json['relation'];
    dependedFile = json['depended_file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    mainInsurancePersonId = json['main_insurance_person_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_no'] = this.mobileNo;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['aadhar_no'] = this.aadharNo;
    data['relation_category'] = this.relationCategory;
    data['relation'] = this.relation;
    data['depended_file'] = this.dependedFile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['main_insurance_person_id'] = this.mainInsurancePersonId;
    return data;
  }
}
