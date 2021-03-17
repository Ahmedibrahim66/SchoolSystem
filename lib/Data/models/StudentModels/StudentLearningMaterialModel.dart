class StudentLearningMaterialModel {
  String teacherName;
  String classDesc;
  String sectionSymbol;
  String subjectDesc;
  String studYear;
  String classNo;
  String sectionNo;
  String subjectNo;
  String employeeNo;
  int seq;
  String materialDesc;
  String linkUrl;
  String filePath;
  String fileDesc;
  int groupId;
  String isACTIVE;
  String insTime;
  String insUser;
  String insTimeDate;

  StudentLearningMaterialModel({
    this.teacherName,
    this.classDesc,
    this.sectionSymbol,
    this.subjectDesc,
    this.studYear,
    this.classNo,
    this.sectionNo,
    this.subjectNo,
    this.employeeNo,
    this.seq,
    this.materialDesc,
    this.linkUrl,
    this.filePath,
    this.fileDesc,
    this.groupId,
    this.isACTIVE,
    this.insTime,
    this.insUser,
    this.insTimeDate,
  });

  StudentLearningMaterialModel.fromJson(Map<String, dynamic> json) {
    teacherName = json['Teacher_Name'];
    classDesc = json['Class_Desc'];
    sectionSymbol = json['Section_Symbol'];
    subjectDesc = json['Subject_Desc'];
    studYear = json['Stud_Year'];
    classNo = json['Class_No'];
    sectionNo = json['Section_No'];
    subjectNo = json['Subject_No'];
    employeeNo = json['Employee_No'];
    seq = json['Seq'];
    materialDesc = json['Material_Desc'];
    linkUrl = json['Link_Url'];
    filePath = json['File_Path'];
    fileDesc = json['File_Desc'];
    groupId = json['Group_Id'];
    isACTIVE = json['Is_ACTIVE'];
    insTime = json['Ins_Time'];
    insUser = json['Ins_User'];
    insTimeDate = json['Ins_Time_Date'];
  }
}
