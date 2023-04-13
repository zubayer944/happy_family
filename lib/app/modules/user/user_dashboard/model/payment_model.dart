class PaymentModel {
  String? name;
  String? paymentId;
  String? referenceId;
  String? amount;
  String? bkashAccNumber;
  String? bankAccNo;
  bool? status;
  bool? isActive;
  String? createdAt;

  // String? createdBy;

  PaymentModel({
    this.name,
    this.paymentId,
    this.referenceId,
    this.amount,
    this.bkashAccNumber,
    this.bankAccNo,
    this.status,
    this.isActive,
    this.createdAt,
    // this.createdBy,
  });

  PaymentModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          paymentId: json['paymentId'],
          referenceId: json['trxId'],
          bkashAccNumber: json['phoneNumber'],
          amount: json['amount'],
          bankAccNo: json['bankAccNo'],
          status: json['status'],
          isActive: json['isActive'],
          createdAt: json['createdAt'],
          // createdBy: json['createdBy'],
        );

  Map<String, dynamic> toJson() {
    return {
      "name" : name,
      "paymentId": paymentId,
      "trxId": referenceId,
      "amount": amount,
      "phoneNumber": bkashAccNumber,
      'bankAccNo': bankAccNo,
      "status": status,
      "isActive": isActive,
      "createdAt": createdAt,
      // "createdBy": createdBy,
    };
  }
}
