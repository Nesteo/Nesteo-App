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

  Future<Response> getAuth() {
    final $url = '/auth';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
