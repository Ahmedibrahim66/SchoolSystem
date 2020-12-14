class StudentExamModel {
  String classDesc;
  String sectionSymbol;
  String subjectDesc;
  String sameDate;
  String canEnter;
  int differance;
  String examTimeInMin;
  String studYear;
  String classNo;
  String sectionNo;
  String subjectNo;
  int examSeq;
  String examDesc;
  String examDate;
  String startTime;
  String questionPeriodInS;
  String maxGrade;
  String moveToExams;
  String alterExamNo;
  String insTime;
  String insUser;
  String lastModify;
  String canEdit;
  String alterExamTime;
  String alterExamDate;
  String isDone;
  String studentGrade;
  String maxQuestionsGrade;
  String examGrade;

  StudentExamModel(
      {this.classDesc,
      this.sectionSymbol,
      this.subjectDesc,
      this.sameDate,
      this.canEnter,
      this.differance,
      this.examTimeInMin,
      this.studYear,
      this.classNo,
      this.sectionNo,
      this.subjectNo,
      this.examSeq,
      this.examDesc,
      this.examDate,
      this.startTime,
      this.questionPeriodInS,
      this.maxGrade,
      this.moveToExams,
      this.alterExamNo,
      this.insTime,
      this.insUser,
      this.lastModify,
      this.canEdit,
      this.alterExamTime,
      this.alterExamDate,
      this.isDone,
      this.studentGrade,
      this.maxQuestionsGrade,
      this.examGrade});

  StudentExamModel.fromJson(Map<String, dynamic> json) {
    classDesc = json['Class_Desc'];
    sectionSymbol = json['Section_Symbol'];
    subjectDesc = json['Subject_Desc'];
    sameDate = json['Same_Date'];
    canEnter = json['Can_Enter'];
    differance = json['Differance'];
    examTimeInMin = json['Exam_Time_In_Min'];
    studYear = json['Stud_Year'];
    classNo = json['Class_No'];
    sectionNo = json['Section_No'];
    subjectNo = json['Subject_No'];
    examSeq = json['Exam_Seq'];
    examDesc = json['Exam_Desc'];
    examDate = json['Exam_Date'];
    startTime = json['Start_Time'];
    questionPeriodInS = json['Question_Period_In_S'];
    maxGrade = json['Max_Grade'];
    moveToExams = json['Move_To_Exams'];
    alterExamNo = json['Alter_Exam_No'];
    insTime = json['Ins_Time'];
    insUser = json['Ins_User'];
    lastModify = json['Last_Modify'];
    canEdit = json['Can_Edit'];
    alterExamTime = json['Alter_Exam_Time'];
    alterExamDate = json['Alter_Exam_Date'];
    isDone = json['Is_Done'];
    studentGrade = json['Student_Grade'];
    maxQuestionsGrade = json['Max_Questions_Grade'];
    examGrade = json['Exam_Grade'];
  }

 
}