import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'users_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [UsersRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/users')
abstract class UsersApiService extends ChopperService {
  @Get()
  Future<Response> getAllUsers([
    @Header('Authorization') String authHeader,
  ]);

  @Get(path: '/{id}')
  Future<Response> getUserById([
    @Path('id') String id,
    @Header('Authorization') String authHeader,
  ]);

  static UsersApiService create(String url) {
    final client = ChopperClient(
      baseUrl: 'https://$url/api/v1',
      services: [
        _$UsersApiService(),
      ],
    );
    return _$UsersApiService(client);
  }
}
