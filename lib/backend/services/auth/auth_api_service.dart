import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'auth_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [AuthRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/auth')
abstract class AuthApiService extends ChopperService {
  @Get(headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getAuth();

  static AuthApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://${Dev.host}/api/v1',
      services: [
        _$AuthApiService(),
      ],
    );
    return _$AuthApiService(client);
  }
}
