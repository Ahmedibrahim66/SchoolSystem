

class ChatModel {
  String chatId,
      useId,
      chatRoomId,
      userType,
      message,
      date,
      messageType,
      chaterName;


  ChatModel(
      {this.chatId,
      this.useId,
      this.chatRoomId,
      this.userType,
      this.message,
      this.date,
      this.messageType,
      this.chaterName});


  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json["Chat_Id"],
      useId: json["User_Id"],
      chatRoomId: json["Chat_Room_Id"],
      userType: json["User_Type"],
      message: json["Message"],
      date: json["Chat_Date"],
      messageType: json["Message_Type"],
      chaterName: json["Chater_Name"],
    );
  }
}
