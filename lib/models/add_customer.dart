// To parse this JSON data, do
//
//     final addCustomerModel = addCustomerModelFromJson(jsonString);

import 'dart:convert';

AddCustomerModel addCustomerModelFromJson(String str) =>
    AddCustomerModel.fromJson(json.decode(str));

String addCustomerModelToJson(AddCustomerModel data) =>
    json.encode(data.toJson());

class AddCustomerModel {
  AddCustomerModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) =>
      AddCustomerModel(
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
    required this.customer,
  });

  String message;
  Customer customer;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "customer": customer.toJson(),
      };
}

class Customer {
  Customer({
    required this.fullname,
    required this.gender,
    required this.mobileNo,
    required this.email,
    required this.homeAddress,
    required this.createdBy,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String fullname;
  String gender;
  String mobileNo;
  String email;
  String homeAddress;
  int createdBy;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        fullname: json["fullname"],
        gender: json["gender"],
        mobileNo: json["mobile_no"],
        email: json["email"],
        homeAddress: json["home_address"],
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "gender": gender,
        "mobile_no": mobileNo,
        "email": email,
        "home_address": homeAddress,
        "created_by": createdBy,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
