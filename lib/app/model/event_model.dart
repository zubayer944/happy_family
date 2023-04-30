import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? documentId;
  String? eventName;
  DateTime? date;
  DateTime? lastBookingDate;
  String? location;
  String? nagadOrBkashNumber;
  String? bankAccNo;
  String? packageId;
  int? adultPrice;
  int? childrenPrice;
  String? belowChildren;
  double? amount;
  int? totalBookedAdultCount;
  int? totalBookedChildrenCount;
  int? totalBookedUniqueCount;
  List<BookedUserInfo>? bookedUserInfo;

  EventModel({
    this.documentId,
    this.eventName,
    this.date,
    this.lastBookingDate,
    this.belowChildren,
    this.location,
    this.bankAccNo,
    this.nagadOrBkashNumber,
    this.packageId,
    this.amount,
    this.bookedUserInfo,
    this.adultPrice,
    this.childrenPrice,
    this.totalBookedAdultCount = 0,
    this.totalBookedChildrenCount = 0,
    this.totalBookedUniqueCount = 0,
  });

  EventModel.fromJson(Map<String, dynamic> json)
      : this(
          documentId: json['documentId'],
          eventName: json['eventName'],
          date: (json['date'] as Timestamp).toDate(),
          lastBookingDate: (json['lastBookingDate'] as Timestamp).toDate(),
          location: json['location'],
          bankAccNo: json['bankAccNo'],
          nagadOrBkashNumber: json['nagadOrBkashNumber'],
          adultPrice: json['adultPrice'],
          belowChildren: json['belowChildren'],
          childrenPrice: json['childrenPrice'],
          totalBookedChildrenCount: json['totalBookedChildrenCount'],
          totalBookedUniqueCount: json['totalBookedUniqueCount'],
          totalBookedAdultCount: json['totalBookedAdultCount'],
          bookedUserInfo: json["bookedUserInfo"] == null
              ? null
              : List<BookedUserInfo>.from(json["bookedUserInfo"]!
                  .map((x) => BookedUserInfo.fromJson(x))),
        );

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'eventName': eventName,
      'date': date,
      'lastBookingDate': lastBookingDate,
      'location': location,
      'bankAccNo': bankAccNo,
      'adultPrice': adultPrice,
      'childrenPrice': childrenPrice,
      'belowChildren': belowChildren,
      'nagadOrBkashNumber': nagadOrBkashNumber,
      'totalBookedChildrenCount': totalBookedChildrenCount,
      'totalBookedUniqueCount': totalBookedUniqueCount,
      'totalBookedAdultCount': totalBookedAdultCount,
      'bookedUserInfo': bookedUserInfo == null
          ? null
          : List<Map<String, dynamic>>.from(
              bookedUserInfo!.map((x) => x.toJson())),
    };
  }

  Map<String, dynamic> create() {
    return {
      'eventName': eventName,
      'date': date,
      'lastBookingDate': lastBookingDate,
      'location': location,
      'bankAccNo': bankAccNo,
      'adultPrice': adultPrice,
      'childrenPrice': childrenPrice,
      'belowChildren': belowChildren,
      'nagadOrBkashNumber': nagadOrBkashNumber,
      'totalBookedUniqueCount': totalBookedUniqueCount,
      'totalBookedChildrenCount': totalBookedChildrenCount,
      'totalBookedAdultCount': totalBookedAdultCount,
    };
  }
}

class BookedUserInfo {
  String? userId;
  String? userName;
  int? totalAmount;
  String? bkashReferenceId;
  String? bkashNumber;
  String? bankAccNo;
  bool verifiedPayment = false;
  int? totalAdult;
  int? totalChildren;
  String? createdAt;
  String? bookedAllMemberName;

  BookedUserInfo({
    this.userId,
    this.userName,
    this.totalAmount,
    this.bankAccNo,
    this.bkashNumber,
    this.totalAdult,
    this.totalChildren,
    this.bkashReferenceId,
    required this.verifiedPayment,
    this.createdAt,
    this.bookedAllMemberName,
  });

  BookedUserInfo.fromJson(Map<String, dynamic> json)
      : this(
          userId: json['userId'],
          userName: json['userName'],
          totalAmount: json['amount'],
          bankAccNo: json['bankAccNo'],
          bkashNumber: json['bkashNumber'],
          bkashReferenceId: json['bkashReferenceId'],
          totalAdult: json['totalAdult'],
          totalChildren: json['totalChildren'],
          verifiedPayment: json['verifiedPayment'],
          createdAt: (json['createdAt']).toString(),
          bookedAllMemberName: json['bookedAllMemberName'],
        );

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "amount": totalAmount,
      "bankAccNo": bankAccNo,
      "bkashNumber": bkashNumber,
      "bkashReferenceId": bkashReferenceId,
      "totalAdult": totalAdult,
      "totalChildren": totalChildren,
      "verifiedPayment": verifiedPayment,
      "createdAt": createdAt,
      "bookedAllMemberName": bookedAllMemberName,
    };
  }

  Map<String, dynamic> toCreate() {
    return {
      "userId": userId,
      "userName": userName,
      "amount": totalAmount,
      "bankAccNo": bankAccNo,
      "bkashNumber": bkashNumber,
      "bkashReferenceId": bkashReferenceId,
      "totalAdult": totalAdult,
      "totalChildren": totalChildren,
      "verifiedPayment": verifiedPayment,
      "bookedAllMemberName": bookedAllMemberName,
    };
  }
}
