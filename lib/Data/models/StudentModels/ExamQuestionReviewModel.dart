class ExamQuestionReviewModel {
  String classNo;
  String subjectNo;
  int chapterNo;
  int seq;
  String questionType;
  String questionDesc;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String answer5;
  String rightAnswer;
  String questionLevel;
  String textQuestionRemarks;
  String isActive;
  String insTime;
  String insUser;
  String lastModify;
  String qPhoto;
  String prevQ;
  String nextQ;
  String rowNo;
  String studentAnswer;
  String canEdit;
  String canEnter;
  String textAnswer;
  String fileUrl;
  String fileName;
  String textAnswerGrade;
  String questionGrade;
  String teacherRemarks;
  String studentAnswerText;
  String rightAnswerText;
  String isRightAnswer;

  ExamQuestionReviewModel(
      {this.classNo,
      this.subjectNo,
      this.chapterNo,
      this.seq,
      this.questionType,
      this.questionDesc,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.answer5,
      this.rightAnswer,
      this.questionLevel,
      this.textQuestionRemarks,
      this.isActive,
      this.insTime,
      this.insUser,
      this.lastModify,
      this.qPhoto,
      this.prevQ,
      this.nextQ,
      this.rowNo,
      this.studentAnswer,
      this.canEdit,
      this.canEnter,
      this.textAnswer,
      this.fileUrl,
      this.fileName,
      this.textAnswerGrade,
      this.questionGrade,
      this.teacherRemarks,
      this.studentAnswerText,
      this.rightAnswerText,
      this.isRightAnswer});

  ExamQuestionReviewModel.fromJson(Map<String, dynamic> json) {
    classNo = json['Class_No'];
    subjectNo = json['Subject_No'];
    chapterNo = json['Chapter_No'];
    seq = json['Seq'];
    questionType = json['Question_Type'];
    questionDesc = json['Question_Desc'];
    answer1 = json['Answer_1'];
    answer2 = json['Answer_2'];
    answer3 = json['Answer_3'];
    answer4 = json['Answer_4'];
    answer5 = json['Answer_5'];
    rightAnswer = json['Right_Answer'];
    questionLevel = json['Question_Level'];
    textQuestionRemarks = json['Text_Question_Remarks'];
    isActive = json['Is_Active'];
    insTime = json['Ins_Time'];
    insUser = json['Ins_User'];
    lastModify = json['Last_Modify'];
    qPhoto = json['Q_Photo'];
    prevQ = json['prev_q'];
    nextQ = json['next_q'];
    rowNo = json['Row_No'];
    studentAnswer = json['Student_Answer'];
    canEdit = json['Can_Edit'];
    canEnter = json['Can_Enter'];
    textAnswer = json['Text_Answer'];
    fileUrl = json['File_Url'];
    fileName = json['File_Name'];
    textAnswerGrade = json['Text_Answer_Grade'];
    questionGrade = json['Question_Grade'];
    teacherRemarks = json['Teacher_Remarks'];
    studentAnswerText = json['Student_Answer_Text'];
    rightAnswerText = json['Right_Answer_Text'];
    isRightAnswer = json['Is_Right_Answer'];
  }


}