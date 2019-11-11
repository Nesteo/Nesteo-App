import 'dart:convert';
import 'package:nesteo_app/backend/services/users/users_api_service.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/model/user.dart';

/// Wrapper that generates and returns [User] objects from json returned by a [UsersApiService].
///
/// *Author: Simon Oyen*
class UsersRepository {
  AuthenticationBloc _authBloc;

  UsersRepository(this._authBloc);

  /// Requests information about an specific User by [id] from a [UsersApiService] and converts it to a [User] object.
  ///
  /// ```dart
  /// var userRepository = UsersRepository();
  /// User user = await userRepository.getUserById(4);
  /// ```
  Future<User> getUserById(String id) async {
    UsersApiService _usersApi = UsersApiService.create(_authBloc.domain);
    final response = await _usersApi.getUserById(id, _authBloc.auth);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return User.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all Users in the database from a [UsersApiService] and converts it to a [List<User>].
  ///
  /// ```dart
  /// var userRepository = UsersRepository();
  /// List<User>  user = await userRepository.getAllUsers();
  /// ```
  Future<List<User>> getAllUsers() async {
    UsersApiService _usersApi = UsersApiService.create(_authBloc.domain);
    final response = await _usersApi.getAllUsers(_authBloc.auth);
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results.map((user) => User.fromJson(user)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
