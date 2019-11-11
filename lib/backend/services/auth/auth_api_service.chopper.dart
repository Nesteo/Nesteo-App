// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$AuthApiService extends AuthApiService {
  _$AuthApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = AuthApiService;

  Future<Response> getAuth([String authHeader]) {
    final $url = '/auth';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
