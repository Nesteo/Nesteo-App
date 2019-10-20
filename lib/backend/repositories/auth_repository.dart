import 'dart:convert';
import 'package:nesteo_app/backend/services/auth/auth_api_service.dart';
import 'package:nesteo_app/model/user.dart';

class AuthRepository {
  AuthApiService authApi;

  AuthRepository() {
    authApi = AuthApiService.create();
  }

  Future<User> getAuth() async {
    final response = await authApi.getAuth();
    if (response.statusCode == 200) {
      final Map data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      print('Request failed');
      return null;
    }
  }
}
