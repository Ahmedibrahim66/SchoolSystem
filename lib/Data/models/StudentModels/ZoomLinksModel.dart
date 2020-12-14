class ZoomLinkModel {
  String classDesc;
  String sectionSymbol;
  String subjectDesc;
  String studYear;
  String classNo;
  String sectionNo;
  String subjectNo;
  int meetingSeq;
  String meetingDesc;
  String meetingLink;
  String videoLink;
  String meetingDate;
  String startTime;
  String meetingVideo;
  String uploadTime;
  String insTime;
  String insUser;

  ZoomLinkModel(
      {this.classDesc,
      this.sectionSymbol,
      this.subjectDesc,
      this.studYear,
      this.classNo,
      this.sectionNo,
      this.subjectNo,
      this.meetingSeq,
      this.meetingDesc,
      this.meetingLink,
      this.videoLink,
      this.meetingDate,
      this.startTime,
      this.meetingVideo,
      this.uploadTime,
      this.insTime,
      this.insUser});

  ZoomLinkModel.fromJson(Map<String, dynamic> json) {
    classDesc = json['Class_Desc'];
    sectionSymbol = json['Section_Symbol'];
    subjectDesc = json['Subject_Desc'];
    studYear = json['Stud_Year'];
    classNo = json['Class_No'];
    sectionNo = json['Section_No'];
    subjectNo = json['Subject_No'];
    meetingSeq = json['Meeting_Seq'];
    meetingDesc = json['Meeting_Desc'];
    meetingLink = json['Meeting_Link'];
    videoLink = json['Video_Link'];
    meetingDate = json['Meeting_Date'];
    startTime = json['Start_Time'];
    meetingVideo = json['Meeting_Video'];
    uploadTime = json['Upload Time'];
    insTime = json['Ins_Time'];
    insUser = json['Ins_User'];
  }

 
}