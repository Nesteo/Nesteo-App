import 'package:chopper/chopper.dart';

part 'inspections_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [InspectionsRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/inspections')
abstract class InspectionsApiService extends ChopperService {
  @Get()
  Future<Response> getAllInspections([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}')
  Future<Response> getInspectionById([
    @Path('id') int id,
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/previews')
  Future<Response> getAllInspectionPreviews([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/previews/{id}')
  Future<Response> getInspectionPreviewById([
    @Path('id') int id,
    @Header('Authorization') String authHeader,
  ]);

  static InspectionsApiService create(String url) {
    final client = ChopperClient(
      baseUrl: 'https://$url/api/v1',
      services: [
        _$InspectionsApiService(),
      ],
    );
    return _$InspectionsApiService(client);
  }
}
