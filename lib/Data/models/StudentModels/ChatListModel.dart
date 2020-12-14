class ChatListModel {
  String teacherName,
      classDesc,
      sectionSymbol,
      subjectDesc,
      chatName,
      classNo,
      subjectNo,
      sectionNo,
      dateCreated,
      isActive,
      chatRoomId;

  ChatListModel(
      {this.teacherName,
      this.classDesc,
      this.sectionSymbol,
      this.subjectDesc,
      this.chatName,
      this.classNo,
      this.subjectNo,
      this.sectionNo,
      this.dateCreated,
      this.isActive,
      this.chatRoomId});

  factory ChatListModel.fromJson(Map<String, dynamic> json) {
    return ChatListModel(
      teacherName: json["Teacher_Name"],
      classDesc: json["Class_Desc"],
      sectionSymbol: json["Section_Symbol"],
      subjectDesc: json["Subject_Desc"],
      chatName: json["Chat_Name"],
      subjectNo: json["Subject_No"],
      sectionNo: json["Section_No"],
      dateCreated: json["Date_Created"],
      isActive: json["is_active"],
      chatRoomId: json["Chat_Room_Id"],
      classNo: json["Class_No"],

    );
  }
}
