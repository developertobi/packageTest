part of '../seam_connection.dart';

final networkService = NetworkService();

Future<String> testNetwork() async {
  var response =
      await networkService.get('https://jsonplaceholder.typicode.com/todos/1');
  return response.toString();
}

Future<void> googleLogin() async {
  var response = await networkService
      .post('https://sslag.herokuapp.com/api/auth/google', body: {
    'email': 'bunmytaj@gmail.com',
    'provider_id': '118081374358768084751'
  }, headers: {
    "Accept": "application/json",
    "Content-Type": "application/json",
  });
  print(response.toString());
  // return response.toString();
}
