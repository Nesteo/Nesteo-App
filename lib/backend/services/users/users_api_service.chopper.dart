// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$UsersApiService extends UsersApiService {
  _$UsersApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = UsersApiService;

  Future<Response> getAllUsers([String authHeader]) {
    final $url = '/users';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getUserById([String id, String authHeader]) {
    final $url = '/users/$id';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
