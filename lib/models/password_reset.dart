// To parse this JSON data, do
//
//     final passwordResetModel = passwordResetModelFromJson(jsonString);

import 'dart:convert';

PasswordResetModel passwordResetModelFromJson(String str) =>
    PasswordResetModel.fromJson(json.decode(str));

String passwordResetModelToJson(PasswordResetModel data) =>
    json.encode(data.toJson());

class PasswordResetModel {
  PasswordResetModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory PasswordResetModel.fromJson(Map<String, dynamic> json) =>
      PasswordResetModel(
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
    required this.message,
  });

  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
