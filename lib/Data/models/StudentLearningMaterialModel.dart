class StudentLearningMaterialModel {
  String studYear;
  String classNo;
  String sectionNo;
  String subjectNo;
  String employeeNo;
  int seq;
  String materialDesc;
  String linkURL;
  String filePath;
  String fileDesc;
  int groupId;
  String isActive;
  String insTime;
  String insUser;
  String insTimeDate;

  StudentLearningMaterialModel({
    this.studYear,
    this.classNo,
    this.sectionNo,
    this.seq,
    this.subjectNo,
    this.employeeNo,
    this.materialDesc,
    this.linkURL,
    this.fileDesc,
    this.filePath,
    this.groupId,
    this.insTime,
    this.insTimeDate,
    this.insUser,
    this.isActive,
  });

  factory StudentLearningMaterialModel.fromJson(Map<String, dynamic> json) {
    return StudentLearningMaterialModel(
      studYear: json["Stud_Year"],
      classNo: json["Class_No"],
      sectionNo: json["Section_No"],
      seq: json["Seq"],
      subjectNo: json["Subject_No"],
      employeeNo: json["Employee_No"],
      materialDesc: json["Material_Desc"],
      linkURL: json["Link_Url"],
      fileDesc: json["File_Desc"],
      filePath: json["File_Path"],
      groupId: json["Group_Id"],
      insTime: json["Ins_Time"],
      insTimeDate: json["Ins_Time_Date"],
      insUser: json["Ins_User"],
      isActive: json["Is_ACTIVE"],
    );
  }
}
