class StudentClassPeriodModel {
  String classPeriod;

  StudentClassPeriodModel({
    this.classPeriod,
  });

  factory StudentClassPeriodModel.fromJson(Map<String, dynamic> json) {
    return StudentClassPeriodModel(
      classPeriod: json["Class_period"],
    );
  }
}
