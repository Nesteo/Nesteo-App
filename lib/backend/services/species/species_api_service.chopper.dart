// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SpeciesApiService extends SpeciesApiService {
  _$SpeciesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = SpeciesApiService;

  Future<Response> getAllSpecies([String authHeader]) {
    final $url = '/species';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getSpeciesById([int id, String authHeader]) {
    final $url = '/species/$id';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
