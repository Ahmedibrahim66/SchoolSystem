class StudentPaymentModel {
  String accountNo;
  String debtFees;
  String feesAmount;
  String initAmount;
  String bussFees;
  String paidAmount;
  String exemptionAmount;
  String exemptionType;
  String bookFees;
  String insuranceFees;
  String remark;
  String balance;

  StudentPaymentModel(
      {this.accountNo,
      this.balance,
      this.feesAmount,
      this.bookFees,
      this.bussFees,
      this.debtFees,
      this.exemptionAmount,
      this.exemptionType,
      this.initAmount,
      this.insuranceFees,
      this.paidAmount,
      this.remark});

  factory StudentPaymentModel.fromJson(Map<String, dynamic> json) {
    return StudentPaymentModel(
      accountNo: json["Account_No"],
      debtFees: json["Debt_Fees"],
      feesAmount: json["Fees_Amount"],
      initAmount: json["Init_Amount"],
      bussFees: json["Buss_Fees"],
      paidAmount: json["Paid_Amount"],
      exemptionAmount: json["Exemption_Amount"],
      exemptionType: json["Exemption_Type"],
      bookFees: json["Book_Fees"],
      insuranceFees: json["Insurance_Fees"],
      remark: json["remarks"],
      balance: json["BALANCE"],
    );
  }
}
