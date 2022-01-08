// To parse this JSON data, do
//
//     final addMeasurementModel = addMeasurementModelFromJson(jsonString);

import 'dart:convert';

AddMeasurementModel addMeasurementModelFromJson(String str) =>
    AddMeasurementModel.fromJson(json.decode(str));

String addMeasurementModelToJson(AddMeasurementModel data) =>
    json.encode(data.toJson());

class AddMeasurementModel {
  AddMeasurementModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory AddMeasurementModel.fromJson(Map<String, dynamic> json) =>
      AddMeasurementModel(
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
    required this.measurement,
  });

  String message;
  Measurement measurement;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        measurement: Measurement.fromJson(json["measurement"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "measurement": measurement.toJson(),
      };
}

class Measurement {
  Measurement({
    required this.id,
    required this.customerId,
    required this.neck,
    required this.back,
    required this.halfBack,
    required this.shortSleeve,
    required this.threeQuarterSleeve,
    required this.longSleeve,
    required this.roundSleeve,
    required this.armHole,
    required this.wrist,
    required this.bust,
    required this.nippleToNipple,
    required this.roundUnderBust,
    required this.breastPoint,
    required this.body,
    required this.underBust,
    required this.blouseLengthHalf,
    required this.blouseLength,
    required this.waist,
    required this.waistToHip,
    required this.hip,
    required this.thigh,
    required this.gownLength,
    required this.shirtLength,
    required this.trouserLength,
    required this.fullLength,
    required this.head,
    required this.chest,
    required this.halfChest,
    required this.bubaLength,
    required this.bottom,
    required this.skirtLength,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int customerId;
  String neck;
  String back;
  String halfBack;
  String shortSleeve;
  String threeQuarterSleeve;
  String longSleeve;
  String roundSleeve;
  String armHole;
  String wrist;
  String bust;
  String nippleToNipple;
  String roundUnderBust;
  String breastPoint;
  String body;
  String underBust;
  String blouseLengthHalf;
  String blouseLength;
  String waist;
  String waistToHip;
  String hip;
  String thigh;
  String gownLength;
  String shirtLength;
  String trouserLength;
  String fullLength;
  String head;
  String chest;
  String halfChest;
  String bubaLength;
  String bottom;
  String skirtLength;
  DateTime createdAt;
  DateTime updatedAt;

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        id: json["id"],
        customerId: json["customer_id"],
        neck: json["neck"],
        back: json["back"],
        halfBack: json["half_back"],
        shortSleeve: json["short_sleeve"],
        threeQuarterSleeve: json["three_quarter_sleeve"],
        longSleeve: json["long_sleeve"],
        roundSleeve: json["round_sleeve"],
        armHole: json["arm_hole"],
        wrist: json["wrist"],
        bust: json["bust"],
        nippleToNipple: json["nipple_to_nipple"],
        roundUnderBust: json["round_under_bust"],
        breastPoint: json["breast_point"],
        body: json["body"],
        underBust: json["under_bust"],
        blouseLengthHalf: json["blouse_length_half"],
        blouseLength: json["blouse_length"],
        waist: json["waist"],
        waistToHip: json["waist_to_hip"],
        hip: json["hip"],
        thigh: json["thigh"],
        gownLength: json["gown_length"],
        shirtLength: json["shirt_length"],
        trouserLength: json["trouser_length"],
        fullLength: json["full_length"],
        head: json["head"],
        chest: json["chest"],
        halfChest: json["half_chest"],
        bubaLength: json["buba_length"],
        bottom: json["bottom"],
        skirtLength: json["skirt_length"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "neck": neck,
        "back": back,
        "half_back": halfBack,
        "short_sleeve": shortSleeve,
        "three_quarter_sleeve": threeQuarterSleeve,
        "long_sleeve": longSleeve,
        "round_sleeve": roundSleeve,
        "arm_hole": armHole,
        "wrist": wrist,
        "bust": bust,
        "nipple_to_nipple": nippleToNipple,
        "round_under_bust": roundUnderBust,
        "breast_point": breastPoint,
        "body": body,
        "under_bust": underBust,
        "blouse_length_half": blouseLengthHalf,
        "blouse_length": blouseLength,
        "waist": waist,
        "waist_to_hip": waistToHip,
        "hip": hip,
        "thigh": thigh,
        "gown_length": gownLength,
        "shirt_length": shirtLength,
        "trouser_length": trouserLength,
        "full_length": fullLength,
        "head": head,
        "chest": chest,
        "half_chest": halfChest,
        "buba_length": bubaLength,
        "bottom": bottom,
        "skirt_length": skirtLength,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
