class StudentBehaviourModel {
  String behSeq,
      studYear,
      studentNo,
      alertDesc,
      procDesc,
      behDate,
      behDesc,
      points,
      semester,
      remarks;

  StudentBehaviourModel(
      {this.behSeq,
      this.studYear,
      this.studentNo,
      this.alertDesc,
      this.procDesc,
      this.behDate,
      this.behDesc,
      this.points,
      this.semester,
      this.remarks});

  factory StudentBehaviourModel.fromJson(Map<String, dynamic> json) {
    return StudentBehaviourModel(
      behSeq: json["beh_Seq"],
      studYear: json["Stud_Year"],
      studentNo: json["Student_No"],
      alertDesc: json["alert_desc"],
      procDesc: json["proc_desc"],
      semester: json["Semester"],
      behDate: json["Beh_Date"],
      behDesc: json["Beh_Desc"],
      points: json["Points"],
      remarks: json["Remarks"],
    );
  }
}
