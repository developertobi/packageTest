// To parse this JSON data, do
//
//     final otpVerificationModel = otpVerificationModelFromJson(jsonString);

import 'dart:convert';

OTPVerificationModel otpVerificationModelFromJson(String str) =>
    OTPVerificationModel.fromJson(json.decode(str));

String otpVerificationModelToJson(OTPVerificationModel data) =>
    json.encode(data.toJson());

class OTPVerificationModel {
  OTPVerificationModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory OTPVerificationModel.fromJson(Map<String, dynamic> json) =>
      OTPVerificationModel(
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
    required this.mobileNo,
    required this.message,
  });

  String mobileNo;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mobileNo: json["mobile_no"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "mobile_no": mobileNo,
        "message": message,
      };
}
