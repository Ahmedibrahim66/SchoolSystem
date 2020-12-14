class DaysOfWeekModel {
  String dayDesc;
  String date;

  DaysOfWeekModel({
    this.dayDesc,
    this.date,
  });

  factory DaysOfWeekModel.fromJson(Map<String, dynamic> json) {
    return DaysOfWeekModel(
      dayDesc: json["Day_Desc"],
      date: json["Date"],
    );
  }
}
