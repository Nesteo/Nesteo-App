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

  Future<Response> getAllSpecies() {
    final $url = '/species';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getSpeciesById(int id) {
    final $url = '/species/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
