import 'dart:convert';
import 'package:nesteo_app/backend/services/users/users_api_service.dart';
import 'package:nesteo_app/model/user.dart';

class UsersRepository {
  UsersApiService usersApi;

  UsersRepository() {
    usersApi = UsersApiService.create();
  }

  Future<User> getUserById(String id) async {
    final response = await usersApi.getUserById(id);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return User.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<List<User>> getAllUsers() async {
    final response = await usersApi.getAllUsers();
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results.map((user) => User.fromJson(user)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
