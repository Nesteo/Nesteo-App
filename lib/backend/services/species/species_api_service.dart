import 'package:chopper/chopper.dart';

part 'species_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [SpeciesRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/species')
abstract class SpeciesApiService extends ChopperService {
  @Get()
  Future<Response> getAllSpecies([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}')
  Future<Response> getSpeciesById([
    @Path('id') int id,
    @Header('Authorization') String authHeader,
  ]);

  static SpeciesApiService create(String url) {
    final client = ChopperClient(
      baseUrl: 'https://$url/api/v1',
      services: [
        _$SpeciesApiService(),
      ],
    );
    return _$SpeciesApiService(client);
  }
}
