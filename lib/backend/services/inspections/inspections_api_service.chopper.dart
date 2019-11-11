// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspections_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$InspectionsApiService extends InspectionsApiService {
  _$InspectionsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = InspectionsApiService;

  Future<Response> getAllInspections([String authHeader]) {
    final $url = '/inspections';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getInspectionById([int id, String authHeader]) {
    final $url = '/inspections/$id';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getAllInspectionPreviews([String authHeader]) {
    final $url = '/inspections/previews';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getInspectionPreviewById([int id, String authHeader]) {
    final $url = '/inspections/previews/$id';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
