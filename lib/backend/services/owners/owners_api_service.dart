import 'package:chopper/chopper.dart';

part 'owners_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [OwnersRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/owners')
abstract class OwnersApiService extends ChopperService {
  @Get()
  Future<Response> getAllOwners([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}')
  Future<Response> getOwnerById([
    @Path('id') int id,
    @Header('Authorization') String authHeader,
  ]);

  static OwnersApiService create(String url) {
    final client = ChopperClient(
      baseUrl: 'https://$url/api/v1',
      services: [
        _$OwnersApiService(),
      ],
    );
    return _$OwnersApiService(client);
  }
}
