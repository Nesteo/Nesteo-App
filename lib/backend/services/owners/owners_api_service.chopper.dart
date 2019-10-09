// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owners_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$OwnersApiService extends OwnersApiService {
  _$OwnersApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = OwnersApiService;

  Future<Response> getAllOwners() {
    final $url = '/owners';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getOwnerById(int id) {
    final $url = '/owners/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
