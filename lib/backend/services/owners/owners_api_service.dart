import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'owners_api_service.chopper.dart';

// IMPORTANT: The API-Services should never be used directly, only through one of the repositories

@ChopperApi(baseUrl: '/owners')
abstract class OwnersApiService extends ChopperService {
  @Get(headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getAllOwners();

  @Get(path: '/{id}', headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getOwnerById(@Path('id') int id);

  static OwnersApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://${Dev.host}/api/v1',
      services: [
        _$OwnersApiService(),
      ],
    );
    return _$OwnersApiService(client);
  }
}
