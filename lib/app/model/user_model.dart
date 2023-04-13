import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? userId;
  String? name;
  String? phoneNumber;
  String? password;
  Timestamp? createdAt;
  bool? isOnline;
  String? role;
  bool? active;

  UserModel({
    this.userId,
    this.name,
    this.phoneNumber,
    this.password,
    this.createdAt,
    this.isOnline,
    this.role,
    this.active,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          userId: json['userId'],
          name: json['name'],
          phoneNumber: json['phoneNumber'],
          password: json['password'],
          createdAt: json['createdAt'] as Timestamp,
          isOnline: json['isOnline'],
          role: json['role'],
          active: json['active'],
        );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'phoneNumber': phoneNumber,
      'password': password,
      'createdAt': createdAt,
      'isOnline': isOnline,
      'role': role,
      'active': active,
    };
  }
}
