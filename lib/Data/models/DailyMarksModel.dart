import 'package:mustafa0_1/Data/models/ExamDateModel.dart';

class DailyMarksModel {
  String examNo;
  String examDesc;
  ExamDateModel dateModel;
  String maxGrade;
  String grade;
  String remarks;
  String subjectDesc;
 

  DailyMarksModel({
    this.examNo,
    this.examDesc,
    this.dateModel,
    this.maxGrade,
    this.grade,
    this.remarks,
    this.subjectDesc
  });

  factory DailyMarksModel.fromJson(Map<String, dynamic> json) {
    return DailyMarksModel(
      examNo: json["Exam_No"].toString(),
      examDesc: json["Exam_Desc"],
      dateModel: ExamDateModel.fromJson(json["Exam_Date"]),
      maxGrade: json["Max_Grade"].toString(),
      grade: json["Grade"].toString(),
      remarks: json["Remarks"],
      subjectDesc: json["Subject_Desc"],
    );
  }
}

