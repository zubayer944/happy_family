class BookedUsersModel {
  String? eventId;
  String? packageId;
  String? userId;
  String? trxId;
  String? bankAcc;
  String? bkashNumber;
  String? paymentStatus;

  BookedUsersModel({
    this.eventId,
    this.packageId,
    this.userId,
    this.trxId,
    this.bankAcc,
    this.bkashNumber,
    this.paymentStatus,
  });

  BookedUsersModel.fromJson(Map<String, dynamic> json)
      : this(
          eventId: json['eventId'],
          packageId: json['packageId'],
          userId: json['userId'],
          trxId: json['trxId'],
          bankAcc: json['bankAcc'],
          bkashNumber: json['bkashNumber'],
          paymentStatus: json['paymentStatus'],
        );

  Map<String, dynamic> toJson() {
    return {
      "eventId": eventId,
      "packageId": packageId,
      "userId": userId,
      "trxId": trxId,
      "bankAcc": bankAcc,
      "bkashNumber": bkashNumber,
      "paymentStatus": paymentStatus,
    };
  }
}
