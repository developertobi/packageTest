part of '../seam_connection.dart';

class MeasurementRepository {
  final _networkService = NetworkService();

  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future<AddMeasurementModel> addMeasurement({
    required int customerId,
    String? neck,
    String? back,
    String? halfBack,
    String? shortSleeve,
    String? threeQuarterSleeve,
    String? longSleeve,
    String? roundSleeve,
    String? armHole,
    String? wrist,
    String? bust,
    String? nippleToNipple,
    String? roundUnderBust,
    String? breastPoint,
    String? theBody,
    String? underBust,
    String? blouseLengthHalf,
    String? blouseLength,
    String? waist,
    String? waistToHip,
    String? hip,
    String? thigh,
    String? gownLength,
    String? shirtLength,
    String? trouserLength,
    String? fullLength,
    String? head,
    String? chest,
    String? halfChest,
    String? bubaLength,
    String? bottom,
    String? skirtLength,
  }) async {
    final body = {
      'customer_id': customerId,
      'neck': neck,
      'back': back,
      'half_back': halfBack,
      'short_sleeve': shortSleeve,
      'three_quarter_sleeve': threeQuarterSleeve,
      'long_sleeve': longSleeve,
      'round_sleeve': roundSleeve,
      'arm_hole': armHole,
      'wrist': wrist,
      'bust': bust,
      'nipple_to_nipple': nippleToNipple,
      'round_under_bust': roundUnderBust,
      'breast_point': breastPoint,
      'body': theBody,
      'under_bust': underBust,
      'blouse_length_half': blouseLengthHalf,
      'blouse_length': blouseLength,
      'waist': waist,
      'waist_to_hip': waistToHip,
      'hip': hip,
      'thigh': thigh,
      'gown_length': gownLength,
      'shirt_length': shirtLength,
      'trouser_length': trouserLength,
      'full_length': fullLength,
      'head': head,
      'chest': chest,
      'half_chest': halfChest,
      'buba_length': bubaLength,
      'bottom': bottom,
      'skirt_length': skirtLength,
    };
    var response = await _networkService.post(
      'my/measurements',
      body: body,
      headers: _headers,
    );

    return AddMeasurementModel.fromJson(response);
  }

  Future<GetMeasurementModel> getMeasurement({
    required String customerId,
    required String bearerToken,
  }) async {
    var response = await _networkService.get(
      'my/customers/$customerId/measurements',
      headers: {'Authorization': 'Bearer $bearerToken', ..._headers},
    );

    print(response.toString());
    return GetMeasurementModel.fromJson(response);
  }
}
