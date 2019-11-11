// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nestingboxes_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$NestingBoxesApiService extends NestingBoxesApiService {
  _$NestingBoxesApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = NestingBoxesApiService;

  Future<Response> getAllNestingBoxes([String authHeader]) {
    final $url = '/nesting-boxes';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getNestingBoxById([String id, String authHeader]) {
    final $url = '/nesting-boxes/$id';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getInspectionsByNestingBoxId(
      [String id, String authHeader]) {
    final $url = '/nesting-boxes/$id/inspections';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getInspectionPreviewsByNestingBoxId(
      [String id, String authHeader]) {
    final $url = '/nesting-boxes/$id/inspections/previews';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getAllNestingBoxPreviews([String authHeader]) {
    final $url = '/nesting-boxes/previews';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getNestingBoxPreviewById([String id, String authHeader]) {
    final $url = '/nesting-boxes/previews/$id';
    final $headers = {'Authorization': authHeader};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
