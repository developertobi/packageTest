// To parse this JSON data, do
//
//     final phoneVerificationModel = phoneVerificationModelFromJson(jsonString);

import 'dart:convert';

PhoneVerificationModel phoneVerificationModelFromJson(String str) =>
    PhoneVerificationModel.fromJson(json.decode(str));

String phoneVerificationModelToJson(PhoneVerificationModel data) =>
    json.encode(data.toJson());

class PhoneVerificationModel {
  PhoneVerificationModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory PhoneVerificationModel.fromJson(Map<String, dynamic> json) =>
      PhoneVerificationModel(
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
    required this.mobileNo,
  });

  String token;
  String mobileNo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        mobileNo: json["mobile_no"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "mobile_no": mobileNo,
      };
}
