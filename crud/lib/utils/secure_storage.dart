import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Making a singleton class so that same instance can be used everywhere.
class UserAuth {
  static final UserAuth _singleton = UserAuth._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  factory UserAuth() {
    return _singleton;
  }

  UserAuth._internal();

  Future<bool> isLoggedIn() async {
    String? token = await _secureStorage.read(key: 'access-token');
    return token != null ? true : false;
  }

  // will call this method to save access token received from API
  Future<void> saveAccessToken(String accessToken) async {
    await _secureStorage.write(key: 'access-token', value: accessToken);
  }

  // will call this method to delete access token when user wants to logout
  Future<void> deleteAccessToken() async {
    await _secureStorage.deleteAll();
  }
}
