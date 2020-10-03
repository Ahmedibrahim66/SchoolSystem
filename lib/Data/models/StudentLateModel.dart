class StudentLateModel {
  
  String lateSeq;
  String lateDate;
  String lateDesc;
  String isAccepted;
  String remarks;

  StudentLateModel({this.lateSeq, this.lateDate, this.lateDesc, this.isAccepted, this.remarks});

   factory StudentLateModel.fromJson(Map<String, dynamic> json) {
    return StudentLateModel(
      lateSeq: json["Late_Seq"],
      lateDate: json["Late_Date"],
      lateDesc: json["Late_Desc"],
      isAccepted: json["IS_Accepted"],
      remarks: json["Remarks"],
    );
  }
}
