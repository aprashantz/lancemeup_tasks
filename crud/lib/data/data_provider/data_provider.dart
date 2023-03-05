import 'dart:io';

import 'package:http/http.dart' as http;

// making singleton class for DataProvider because it can be used for multiple api services
class DataProvider {
  final String domain = "https://sentimento.onrender.com";
  final String movieDomain = "https://jsonplaceholder.typicode.com/posts/";
  final Map<String, String> requestHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  static final DataProvider _singleton = DataProvider._internal();

  factory DataProvider() {
    return _singleton;
  }

  DataProvider._internal();

  Future<String> postRequest(String endPoint, String body) async {
    final rawResponse = await http.post(
      Uri.parse(endPoint),
      headers: requestHeader,
      body: body,
    );
    return rawResponse.body;
  }

  Future<String> getRequest() async {
    final rawResponse = await http.get(Uri.parse(movieDomain));
    return rawResponse.body;
  }

  Future<String> patchRequest(int movieId, String body) async {
    final rawResponse = await http.patch(Uri.parse("$movieDomain$movieId"),
        headers: requestHeader, body: body);
    return rawResponse.body;
  }

  Future<http.Response> deleterequest(int movieId) async {
    final rawResponse = await http.delete(Uri.parse("$movieDomain$movieId"));
    return rawResponse;
  }
}
