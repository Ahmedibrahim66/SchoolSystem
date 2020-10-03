class StudentHomeworkAndExams {
  String subjectDesc;
  String jobDescription;
  String materialType;

  StudentHomeworkAndExams(
      {this.subjectDesc,
      this.jobDescription,
      this.materialType,
      });

  factory StudentHomeworkAndExams.fromJson(Map<String, dynamic> json) {
    return StudentHomeworkAndExams(
      subjectDesc: json["Subject_Desc"],
      jobDescription:  json["Job_Desc"],
      materialType: json["Material_Type"],
     
    );
  }
}
