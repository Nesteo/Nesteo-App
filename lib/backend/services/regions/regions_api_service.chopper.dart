// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regions_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RegionsApiService extends RegionsApiService {
  _$RegionsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RegionsApiService;

  Future<Response> getAllRegions() {
    final $url = '/regions';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getRegionById(int id) {
    final $url = '/regions/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
