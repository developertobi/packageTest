// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.user,
  });

  String token;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.mobileNo,
    required this.companyName,
    required this.companyAddress,
    required this.profilePix,
    required this.emailVerifiedAt,
    required this.phoneVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String fullname;
  String email;
  String mobileNo;
  dynamic companyName;
  dynamic companyAddress;
  dynamic profilePix;
  dynamic emailVerifiedAt;
  bool phoneVerified;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        mobileNo: json["mobile_no"],
        companyName: json["company_name"],
        companyAddress: json["company_address"],
        profilePix: json["profile_pix"],
        emailVerifiedAt: json["email_verified_at"],
        phoneVerified: json["phone_verified"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "mobile_no": mobileNo,
        "company_name": companyName,
        "company_address": companyAddress,
        "profile_pix": profilePix,
        "email_verified_at": emailVerifiedAt,
        "phone_verified": phoneVerified,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
