class StudentHealthModel {
  
  String healthSeq;
  String studYear;
  String healthDate;
  String hlActionDesc;
  String remarks;
  String healthDesc;


  StudentHealthModel({this.healthSeq, this.studYear, this.healthDate, this.hlActionDesc, this.remarks , this.healthDesc});

   factory StudentHealthModel.fromJson(Map<String, dynamic> json) {
    return StudentHealthModel(
      healthSeq: json["Health_Seq"],
      studYear: json["Stud_Year"],
      healthDate: json["Health_Date"],
      hlActionDesc: json["HL_Action_Desc_O"],
      remarks: json["Remarks"],
      healthDesc: json["Health_Desc"]
    );
  }
}
