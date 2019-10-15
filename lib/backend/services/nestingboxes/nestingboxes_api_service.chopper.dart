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

  Future<Response> getAllNestingBoxes() {
    final $url = '/nesting-boxes';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getNestingBoxById(String id) {
    final $url = '/nesting-boxes/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getAllNestingBoxPreviews() {
    final $url = '/nesting-boxes/previews';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getNestingBoxPreviewById(String id) {
    final $url = '/nesting-boxes/previews/${id}';
    final $headers = {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
