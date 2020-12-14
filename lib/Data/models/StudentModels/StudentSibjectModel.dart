
class StudentSubjectsModel {
  String classNo;
  String classDesc;
  String sectionNo;
  String sectionSymbol;
  String subjectNum;
  String subjectDesc;
  String subjectDescO;
 

  StudentSubjectsModel({
    this.classNo,
    this.classDesc,
    this.sectionNo,
    this.sectionSymbol,
    this.subjectNum,
    this.subjectDesc,
    this.subjectDescO,
   
  });

  factory StudentSubjectsModel.fromJson(Map<String, dynamic> json) {
    return StudentSubjectsModel(
      classNo: json["Class_No"],
      classDesc: json["Class_Desc"],
      sectionNo: json["Section_No"],
      sectionSymbol:json["Section_Symbol_O"],
      subjectNum: json["Subject_No"],
      subjectDesc: json["Subject_Desc"],
      subjectDescO: json["Subject_Desc_O"]
    );
  }
}

