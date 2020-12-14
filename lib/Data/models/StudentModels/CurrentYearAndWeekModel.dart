class CurrentYearAndWeekModel {
  String weekNo;
  String year;

  CurrentYearAndWeekModel(
      {this.weekNo,
      this.year
      });

  factory CurrentYearAndWeekModel.fromJson(Map<String, dynamic> json) {
    return CurrentYearAndWeekModel(
      weekNo: json["week_no"].toString(),
      year: json["year"],
     
    );
  }
}
