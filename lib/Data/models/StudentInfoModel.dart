class StudentInfoModel {
  String studnetNo;
  String fullName;
  String fullNameO;
  String parentName;
  String motherName;
  String idCardNo;
  String currentStudYear;
  String currentClass;
  String birthDate;
  String gender;
  String studentHomeTel;
  String parentMobile;
  String motherPhone;
  String parentEmail;
  String motherEmail;
  String studEmail;
  String studentMobile;
  String remarks;

  StudentInfoModel(
      {this.studnetNo,
      this.fullName,
      this.fullNameO,
      this.parentName,
      this.motherName,
      this.idCardNo,
      this.currentStudYear,
      this.birthDate,
      this.gender,
      this.studentHomeTel,
      this.parentMobile,
      this.motherPhone,
      this.parentEmail,
      this.motherEmail,
      this.studEmail,
      this.studentMobile,
      this.remarks,
      this.currentClass});

  factory StudentInfoModel.fromJson(Map<String, dynamic> json) {
    return StudentInfoModel(
      studnetNo: json["student_no"],
      fullName: json["full_name"],
      fullNameO: json["full_name_o"],
      parentName: json["parent_name"],
      motherName: json["mother_name"],
      idCardNo: json["idcard_no"],
      currentStudYear: json["current_stud_year"],
      birthDate: json["birth_date"],
      gender: json["gender"],
      currentClass: json["Class"],
      studentHomeTel: json["student_home_tel"],
      parentMobile: json["Parent_Mobile"],
      motherPhone: json["Mother_Phone"],
      parentEmail: json["Parent_email"],
      motherEmail: json["mother_Email"],
      studEmail: json["stud_email"],
      studentMobile: json["student_mobile"],
      remarks: json["remarks"],
    );
  }
}
