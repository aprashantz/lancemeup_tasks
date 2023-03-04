import 'package:http/http.dart' as http;

class AuthDataProvider {
  final String domain = "https://sentimento.onrender.com";
  final Map<String, String> requestHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future postRequest(String endPoint, String body) async {
    final rawResponse = await http.post(
      Uri.parse("$domain$endPoint"),
      headers: requestHeader,
      body: body,
    );
    return rawResponse;
  }
}
