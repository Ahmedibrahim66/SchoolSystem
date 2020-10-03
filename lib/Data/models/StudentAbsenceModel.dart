class StudentAbsenceModel {
  
  String absenceSeq;
  String absenceDate;
  String absenceDesc;
  String isAccepted;
  String remarks;

  StudentAbsenceModel({this.absenceSeq, this.absenceDate, this.absenceDesc, this.isAccepted, this.remarks});

   factory StudentAbsenceModel.fromJson(Map<String, dynamic> json) {
    return StudentAbsenceModel(
      absenceSeq: json["Absence_Seq"],
      absenceDate: json["Absence_Date"],
      absenceDesc: json["Absence_Desc"],
      isAccepted: json["IS_Accepted"],
      remarks: json["Remarks"],
    );
  }
}
