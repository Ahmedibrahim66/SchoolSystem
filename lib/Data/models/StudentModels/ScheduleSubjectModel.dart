

class ScheduleSubjectModel {
  String subjectDesc;
  String dayDesc;
  String studYear;
  String classNo;
  String sectionNo;
  String schDay;
  String classPeriod;
  String subjectNo;
  String employeeNo;
  String semester;
  String remarks;
  String isACTIVE;
  String insTime;
  String insUser;

  ScheduleSubjectModel({
    this.subjectDesc,
    this.dayDesc,
    this.studYear,
    this.classNo,
    this.sectionNo,
    this.schDay,
    this.classPeriod,
    this.subjectNo,
    this.employeeNo,
    this.semester,
    this.remarks,
    this.isACTIVE,
    this.insTime,
    this.insUser,
  });

  factory ScheduleSubjectModel.fromJson(Map<String, dynamic> json) {
    return ScheduleSubjectModel(
      subjectDesc: json["Subject_Desc"],
      dayDesc: json["Day_Desc"],
      studYear: json["Stud_Year"],
      classNo: json["Class_No"],
      sectionNo: json["Section_No"],
      schDay: json["Sch_Day"],
      classPeriod: json["Class_period"],
      subjectNo: json["Subject_No"],
      employeeNo: json["Employee_No"],
      semester: json["Semester"],
      remarks: json["Remarks"],
      isACTIVE: json["Is_ACTIVE"],
      insTime: json["Ins_Time"],
      insUser: json["Ins_User"],
    );
  }
}
