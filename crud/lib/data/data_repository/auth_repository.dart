import 'dart:convert';
import 'package:crud/data/data_provider/data_provider.dart';

class AuthDataRepository {
  final DataProvider _dataProvider = DataProvider();

  Future requestLogin(String email, String password) async {
    final String loginEndPoint = "${_dataProvider.domain}/login/";
    final String requestBody =
        jsonEncode({"email": email, "password": password});
    final String loginReqResponse =
        await _dataProvider.postRequest(loginEndPoint, requestBody);
    return json.decode(loginReqResponse);
  }
}
