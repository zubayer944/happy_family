class DebitCreditModel {
  String? documentId;
  String? costingName;
  int? amount;
  String? debitCreditType;
  String? addedBy;

  DebitCreditModel(
      {this.documentId, this.costingName, this.amount, this.debitCreditType,this.addedBy});

  DebitCreditModel.fromJson(Map<String, dynamic> json)
      : this(
    documentId: json['documentId'],
    costingName: json['costingName'],
    amount: json['amount'],
    debitCreditType: json['debitCreditType'],
    addedBy: json['addedBy'],
  );
  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'costingName': costingName,
      'amount': amount,
      'debitCreditType': debitCreditType,
      'addedBy': addedBy,
    };
  }
  Map<String, dynamic> toCreate(){
    return {
      'costingName': costingName,
      'amount': amount,
      'debitCreditType': debitCreditType,
      'addedBy': addedBy,
    };
  }
}
