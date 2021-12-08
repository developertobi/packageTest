part of '../seam_connection.dart';

Future<String> testNetwork() async {
  Uri uri = Uri.https('jsonplaceholder.typicode.com', 'todos/1');

  var response = await http.get(uri);
  return response.body;
}
