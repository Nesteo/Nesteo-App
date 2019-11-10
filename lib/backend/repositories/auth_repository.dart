import 'dart:convert';
import 'package:nesteo_app/backend/services/auth/auth_api_service.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication.dart';
import 'package:nesteo_app/model/user.dart';

/// Wrapper that generates and returns a [User] object from json returned by a [AuthApiService].
///
/// The returned [User] represents the user that was authenticated during the request.o
///
/// ```dart
/// var authRepository = AuthRepository();
/// User authenticatedUser = await authRepository.getAuth();
/// ```
///
/// *Author: Simon Oyen*
class AuthRepository {
  AuthenticationBloc _authBloc;

  AuthRepository(this._authBloc);

  /// Requests information about the authenticated user from a [AuthApiService] and converts it to a [User] object
  Future<User> getAuth() async {
    AuthApiService _authApi = AuthApiService.create(_authBloc.domain);

    final response = await _authApi.getAuth(_authBloc.auth);
    if (response.statusCode == 200) {
      final Map data = json.decode(response.body);
      return User.fromJson(data);
    } else {
      print('Request failed');
      return null;
    }
  }
}
