class StudentHomeworkMaterialSubmission {
  String studYear;
  int seq;
  String studentNo;
  int fileSeq;
  String homeworkFileUrl;
  String homeworkFileDesc;
  String insTime;
  String insUser;

  StudentHomeworkMaterialSubmission(
      {this.studYear,
      this.seq,
      this.studentNo,
      this.fileSeq,
      this.homeworkFileUrl,
      this.homeworkFileDesc,
      this.insTime,
      this.insUser});

  StudentHomeworkMaterialSubmission.fromJson(Map<String, dynamic> json) {
    studYear = json['Stud_Year'];
    seq = json['Seq'];
    studentNo = json['Student_No'];
    fileSeq = json['File_Seq'];
    homeworkFileUrl = json['Homework_File_Url'];
    homeworkFileDesc = json['Homework_File_Desc'];
    insTime = json['Ins_Time'];
    insUser = json['Ins_User'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Stud_Year'] = this.studYear;
    data['Seq'] = this.seq;
    data['Student_No'] = this.studentNo;
    data['File_Seq'] = this.fileSeq;
    data['Homework_File_Url'] = this.homeworkFileUrl;
    data['Homework_File_Desc'] = this.homeworkFileDesc;
    data['Ins_Time'] = this.insTime;
    data['Ins_User'] = this.insUser;
    return data;
  }
}
