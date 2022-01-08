part of '../seam_connection.dart';

class AuthenticationRepository {
  final _networkService = NetworkService();

  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future<RegisterModel> register({
    required String fullName,
    required String email,
    required String mobileNo,
    required String password,
    required String passwordConfirmation,
    required String companyName,
    required String companyAddress,
    required String longitude,
    required String latitude,
  }) async {
    final body = {
      'fullname': fullName,
      'email': email,
      'mobile_no': mobileNo,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'company_name': companyName,
      'company_address': companyAddress,
      'longitude': longitude,
      'latitude': latitude,
    };
    var response = await _networkService.post(
      'register',
      body: body,
      headers: _headers,
    );
    return RegisterModel.fromJson(response);
  }

  Future<LoginModel> login({
    required String mobileNo,
    required String password,
  }) async {
    final body = {
      'mobile_no': mobileNo,
      'password': password,
    };
    var response = await _networkService.post(
      'login',
      body: body,
      headers: _headers,
    );

    return LoginModel.fromJson(response);
  }

  Future<PasswordResetModel> resetPassword({
    required String mobileNo,
    required String password,
    required String passwordConfirmation,
  }) async {
    final body = {
      'mobile_no': mobileNo,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    var response = await _networkService.post(
      'reset-password',
      body: body,
      headers: _headers,
    );

    return PasswordResetModel.fromJson(response);
  }

  Future<OTPVerificationModel> otpVerification({
    required String mobileNo,
    required String verificationCode,
  }) async {
    final body = {
      'mobile_no': mobileNo,
      'verification_code': verificationCode,
    };
    var response = await _networkService.post(
      'otp/verification',
      body: body,
      headers: _headers,
    );

    return OTPVerificationModel.fromJson(response);
  }

  Future<PhoneVerificationModel> phoneVerification({
    required String mobileNo,
  }) async {
    final body = {
      'mobile_no': mobileNo,
    };
    var response = await _networkService.post(
      'phone/verification',
      body: body,
      headers: _headers,
    );

    return PhoneVerificationModel.fromJson(response);
  }
}

// class Generic {
//   /// If T is a List, K is the subtype of the list.
//   static T fromJson<T, K>(dynamic json) {
//     if (json is Iterable) {
//       return _fromJsonList<K>(json.toList()) as T;
//     } else if (T == RegisterModel) {
//       return RegisterModel.fromJson(json) as T;
//     } else if (T == LoginModel) {
//       return RegisterModel.fromJson(json) as T;
//     } else if (T == PasswordResetModel) {
//       return PasswordResetModel.fromJson(json) as T;
//     } else if (T == OTPVerificationModel) {
//       return OTPVerificationModel.fromJson(json) as T;
//     } else if (T == PhoneVerificationModel) {
//       return PhoneVerificationModel.fromJson(json) as T;
//     } else if (T == bool || T == String || T == int || T == double) {
//       // primitives
//       return json;
//     } else {
//       throw Exception("Unknown class");
//     }
//   }
//
//   static List<K>? _fromJsonList<K>(List<dynamic> jsonList) {
//     return jsonList.map<K>((dynamic json) => fromJson<K, void>(json)).toList();
//   }
// }
