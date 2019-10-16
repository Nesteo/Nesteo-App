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

  Future<Response> getAllInspections() {
    final $url = '/inspections';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getInspectionById(int id) {
    final $url = '/inspections/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getAllInspectionPreviews() {
    final $url = '/inspections/previews';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getInspectionPreviewById(int id) {
    final $url = '/inspections/previews/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
