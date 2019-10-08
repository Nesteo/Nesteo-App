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

  Future<Response> getAllUsers() {
    final $url = '/users';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getUserById(String id) {
    final $url = '/users/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
