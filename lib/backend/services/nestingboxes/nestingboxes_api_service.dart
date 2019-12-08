import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';

part 'nestingboxes_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [NestingBoxesRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/nesting-boxes')
abstract class NestingBoxesApiService extends ChopperService {
  @Get()
  Future<Response> getAllNestingBoxes([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}')
  Future<Response> getNestingBoxById([
    @Path('id') String id,
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}/inspections')
  Future<Response> getInspectionsByNestingBoxId([
    @Path('id') String id,
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}/inspections/previews')
  Future<Response> getInspectionPreviewsByNestingBoxId([
    @Path('id') String id,
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/previews')
  Future<Response> getAllNestingBoxPreviews([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/previews/{id}')
  Future<Response> getNestingBoxPreviewById([
    @Path('id') String id,
    @Header('Authorization') String authHeader,
  ]);

  @Post(headers: {'Content-Type': 'application/json'})
  Future<Response> postNewNestingBox(
    @Body() String nestingBox,
    @Header('Authorization') String authHeader,
  );

  @Post(
      headers: {'Content-Type': 'multipart/form-data'},
      path: '/{id}/upload-image')
  @multipart
  Future<Response> postNestingBoxImage(
    @Path('id') String id,
    @Header('Authorization') String authHeader,
    @PartFile('image') String image,
    @Header('Content-Disposition') String filename,
  );

  static NestingBoxesApiService create(String url) {
    final client = ChopperClient(
      baseUrl: 'https://$url/api/v1',
      services: [
        _$NestingBoxesApiService(),
      ],
    );
    return _$NestingBoxesApiService(client);
  }
}
