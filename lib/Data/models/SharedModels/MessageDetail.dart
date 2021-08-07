class MessageDetail {
  String studentNo;
  int msgNo;
  String msgSubject;
  String msgBody;
  String msgFrom;
  String msgDate;
  String isRead;
  String employeeNo;
  String parentOnly;
  String studYear;
  String subjectNo;

  MessageDetail(
      {this.studentNo,
      this.msgNo,
      this.msgSubject,
      this.msgBody,
      this.msgFrom,
      this.msgDate,
      this.isRead,
      this.employeeNo,
      this.parentOnly,
      this.studYear,
      this.subjectNo});

  MessageDetail.fromJson(Map<String, dynamic> json) {
    studentNo = json['Student_No'];
    msgNo = json['Msg_No'];
    msgSubject = json['Msg_Subject'];
    msgBody = json['Msg_Body'];
    msgFrom = json['Msg_From'];
    msgDate = json['Msg_Date'];
    isRead = json['IsRead'];
    employeeNo = json['Employee_No'];
    parentOnly = json['Parent_Only'];
    studYear = json['Stud_Year'];
    subjectNo = json['Subject_No'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Student_No'] = this.studentNo;
    data['Msg_No'] = this.msgNo;
    data['Msg_Subject'] = this.msgSubject;
    data['Msg_Body'] = this.msgBody;
    data['Msg_From'] = this.msgFrom;
    data['Msg_Date'] = this.msgDate;
    data['IsRead'] = this.isRead;
    data['Employee_No'] = this.employeeNo;
    data['Parent_Only'] = this.parentOnly;
    data['Stud_Year'] = this.studYear;
    data['Subject_No'] = this.subjectNo;
    return data;
  }
}
