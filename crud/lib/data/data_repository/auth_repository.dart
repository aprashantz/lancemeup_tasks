import 'dart:convert';
import 'package:crud/data/data_provider/auth_provider.dart';

class AuthDataRepository {
  final AuthDataProvider _authDataProvider = AuthDataProvider();

  Future requestLogin(String email, String password) async {
    final String loginEndPoint = "${_authDataProvider.domain}/login/";
    final String requestBody =
        jsonEncode(<String, String>{"email": email, "password": password});
    final String loginReqResponse =
        await AuthDataProvider().postRequest(loginEndPoint, requestBody);
    return json.decode(loginReqResponse);
  }
}
