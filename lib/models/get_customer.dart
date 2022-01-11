// To parse this JSON data, do
//
//     final getCustomerModel = getCustomerModelFromJson(jsonString);

import 'dart:convert';

GetCustomerModel getCustomerModelFromJson(String str) =>
    GetCustomerModel.fromJson(json.decode(str));

String getCustomerModelToJson(GetCustomerModel data) =>
    json.encode(data.toJson());

class GetCustomerModel {
  GetCustomerModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory GetCustomerModel.fromJson(Map<String, dynamic> json) =>
      GetCustomerModel(
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
    required this.customers,
  });

  String message;
  List<Customer> customers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        customers: List<Customer>.from(
            json["customers"].map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    required this.id,
    required this.fullname,
    required this.email,
    required this.homeAddress,
    required this.gender,
    required this.mobileNo,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String fullname;
  String email;
  String homeAddress;
  String gender;
  String mobileNo;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        homeAddress: json["home_address"],
        gender: json["gender"],
        mobileNo: json["mobile_no"],
        createdBy: json["created_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "home_address": homeAddress,
        "gender": gender,
        "mobile_no": mobileNo,
        "created_by": createdBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.userId,
    required this.customerId,
    required this.createdAt,
    required this.updatedAt,
  });

  int userId;
  int customerId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        customerId: json["customer_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "customer_id": customerId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
