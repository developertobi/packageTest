part of '../seam_connection.dart';

class CustomerRepository {
  final _networkService = NetworkService();

  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future<AddCustomerModel> addCustomer({
    required String fullName,
    required String email,
    required String mobileNo,
    required String homeAddress,
    required String gender,
  }) async {
    final body = {
      'fullname': fullName,
      'email': email,
      'mobile_no': mobileNo,
      'home_address': homeAddress,
      'gender': gender,
    };
    var response = await _networkService.post(
      'my/customers',
      body: body,
      headers: _headers,
    );

    return AddCustomerModel.fromJson(response);
  }

  Future<GetCustomerModel> getCustomer({
    required String bearerToken,
  }) async {
    var response = await _networkService.get(
      'my/customers',
      headers: {'Authorization': 'Bearer $bearerToken', ..._headers},
    );

    print(response.toString());
    return GetCustomerModel.fromJson(response);
  }
}
