import 'package:chopper/chopper.dart';

part 'regions_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [RegionsRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/regions')
abstract class RegionsApiService extends ChopperService {
  @Get()
  Future<Response> getAllRegions([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}')
  Future<Response> getRegionById([
    @Path('id') int id,
    @Header('Authorization') String authHeader,
  ]);

  static RegionsApiService create(String url) {
    final client = ChopperClient(
      baseUrl: 'https://$url/api/v1',
      services: [
        _$RegionsApiService(),
      ],
    );
    return _$RegionsApiService(client);
  }
}
