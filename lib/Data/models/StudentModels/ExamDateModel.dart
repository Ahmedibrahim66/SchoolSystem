class ExamDateModel {
  String date;
  int timeZoneType;
  String timezone;

  ExamDateModel({
    this.date,
    this.timeZoneType,
    this.timezone,
  });

  factory ExamDateModel.fromJson(Map<String, dynamic> json) {
    print("decoding this to json");
    return ExamDateModel(
      date: json["date"],
      timeZoneType: json["timezone_type"],
      timezone: json["timezone"],
    );
  }
}
