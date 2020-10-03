class ParentChildrenModel {
  String fullName;
  String fullNameO;
  String studentNo;

  ParentChildrenModel({
    this.fullName,
    this.fullNameO,
    this.studentNo,
  });

  factory ParentChildrenModel.fromJson(Map<String, dynamic> json) {
    return ParentChildrenModel(
      fullName: json["full_name"],
      fullNameO: json["full_name_o"],
      studentNo: json["Student_No"],
    );
  }
}
