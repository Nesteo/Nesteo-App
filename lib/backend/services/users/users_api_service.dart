import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'users_api_service.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class UsersApiService extends ChopperService {
  @Get(headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getAllUsers();

  @Get(path: '/{id}', headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getUserById(@Path('id') String id);

  static UsersApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://${Dev.host}/api/v1',
      services: [
        _$UsersApiService(),
      ],
    );
    return _$UsersApiService(client);
  }
}
