class Message {
  int msgNo;
  String msgFrom;
  String msgSubject;
  String subjectDesc;
  String msgDate;

  Message(
      {this.msgNo,
      this.msgFrom,
      this.msgSubject,
      this.subjectDesc,
      this.msgDate});

  Message.fromJson(Map<String, dynamic> json) {
    msgNo = json['Msg_No'];
    msgFrom = json['Msg_From'];
    msgSubject = json['Msg_Subject'];
    subjectDesc = json['Subject_Desc'];
    msgDate = json['Msg_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Msg_No'] = this.msgNo;
    data['Msg_From'] = this.msgFrom;
    data['Msg_Subject'] = this.msgSubject;
    data['Subject_Desc'] = this.subjectDesc;
    data['Msg_Date'] = this.msgDate;
    return data;
  }
}
