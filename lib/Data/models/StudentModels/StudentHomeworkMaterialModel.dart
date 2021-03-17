class StudentsHomeworkMaterialModel {
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
  String highMark;
  String handDate;
  String handDate2;
  String quartNo;
  String isACTIVE;
  String insTime;
  String insUser;
  String studentFilePath;
  String studentFileDesc;
  String studentUser;
  String studentDeliverTime;
  String studentGrade;
  String homeworkFileDesc;
  String homeworkFileUrl;
  String canUpload;

  StudentsHomeworkMaterialModel({
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
    this.highMark,
    this.handDate,
    this.handDate2,
    this.quartNo,
    this.isACTIVE,
    this.insTime,
    this.insUser,
    this.studentFilePath,
    this.studentFileDesc,
    this.studentUser,
    this.studentDeliverTime,
    this.studentGrade,
    this.canUpload,
    this.homeworkFileDesc,
    this.homeworkFileUrl,
  });

  StudentsHomeworkMaterialModel.fromJson(Map<String, dynamic> json) {
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
    highMark = json['High_Mark'];
    handDate = json['Hand_Date'];
    handDate2 = json['Hand_Date_2'];
    quartNo = json['Quart_No'];
    isACTIVE = json['Is_ACTIVE'];
    insTime = json['Ins_Time'];
    insUser = json['Ins_User'];
    studentFilePath = json['Student_File_Path'];
    studentFileDesc = json['Student_File_Desc'];
    studentUser = json['Student_User'];
    studentDeliverTime = json['Student_Deliver_Time'];
    studentGrade = json['Student_Grade'];
    homeworkFileDesc = json['Homework_File_Desc'];
    homeworkFileUrl = json['Homework_File_Url'];
    canUpload = json['can_upload'];
  }
}
