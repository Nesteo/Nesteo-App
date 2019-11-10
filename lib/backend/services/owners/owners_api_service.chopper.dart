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

  Future<Response> getAllOwners([String authHeader]) {
    final $url = '/owners';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getOwnerById([int id, String authHeader]) {
    final $url = '/owners/$id';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
