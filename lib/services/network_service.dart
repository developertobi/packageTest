import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  static const API_BASE_URL = 'https://getseam-v1.herokuapp.com/api/v1';

  void throwExceptionOnFail(http.Response response) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      print('response.body ${response.body}');
      print('response.statusCode ${response.statusCode}');
      throw NetworkException(
        jsonDecode(response.body)['message'],
        statusCode: response.statusCode,
      );
    }
  }

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      print('$API_BASE_URL/$url');
      var response = await http.get(
        Uri.parse('$API_BASE_URL/$url'),
        headers: headers,
      );
      print('response root: ${response.body}');

      throwExceptionOnFail(response);
      return jsonDecode(response.body);
    } on SocketException {
      throw NetworkException('There is no internet');
    } on HttpException {
      throw NetworkException('There is an http exception');
    } on FormatException {
      throw NetworkException('There is a format exception');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.post(
        Uri.parse('$API_BASE_URL/$url'),
        // Uri.parse('https://sslag.herokuapp.com/api/auth/google'),
        body: jsonEncode(body),
        headers: headers,
      );

      // throwExceptionOnFail(response);

      return response;
      // return jsonDecode(response.body);
    } on SocketException {
      throw NetworkException('There is no internet');
    } on HttpException {
      throw NetworkException('There is an http exception');
    } on FormatException {
      throw NetworkException('There is a format exception');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postMultipart(
    String url, {
    Map<String, dynamic>? files,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse('$API_BASE_URL/$url'));

      request.headers.addAll(headers!);

      if (body != null) {
        for (var data in body.entries) {
          // if (data.value.runtimeType == int) {
          //   data.value.toString();
          //   // print('${data.key} ######## ${data.value}');
          //   // request.fields[data.key] = data.value;
          // }
          print('${data.key} ######## ${data.value}');
          request.fields[data.key] = data.value.toString();
        }
      }

      if (files != null) {
        for (var data in files.entries) {
          if (data.value != null) {
            print('${data.key} ######## ${data.value}');
            request.files.add(await http.MultipartFile.fromPath(
              data.key,
              data.value,
              // contentType: new MediaType('application', 'x-tar'),
            ));
          }
        }
      }

      final http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print('Response status code ${response.statusCode}');
      throwExceptionOnFail(response);
      print('Response status code ${response.statusCode}');
      return jsonDecode(response.body);
    } on SocketException {
      throw NetworkException('There is no internet');
    } on HttpException {
      throw NetworkException('There is an http exception');
    } on FormatException {
      throw NetworkException('There is a format exception');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.delete(
        Uri.parse('$API_BASE_URL/$url'),
        body: jsonEncode(body),
        headers: headers,
      );

      throwExceptionOnFail(response);

      return jsonDecode(response.body);
    } on SocketException {
      throw NetworkException('There is no internet');
    } on HttpException {
      throw NetworkException('There is an http exception');
    } on FormatException {
      throw NetworkException('There is a format exception');
    } catch (e) {
      rethrow;
    }
  }
}

class NetworkException {
  final int? statusCode;
  final String message;

  NetworkException(this.message, {this.statusCode});
}
