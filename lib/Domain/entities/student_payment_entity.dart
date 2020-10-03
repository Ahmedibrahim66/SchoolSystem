class StudentPaymentEntity {
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

  StudentPaymentEntity(
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


}
