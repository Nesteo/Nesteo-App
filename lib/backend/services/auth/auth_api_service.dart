import 'package:chopper/chopper.dart';

part 'auth_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [AuthRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/auth')
abstract class AuthApiService extends ChopperService {
  @Get()
  Future<Response> getAuth([
    @Header('Authorization') String authHeader,
  ]);

  static AuthApiService create(String url) {
    final client = ChopperClient(
      baseUrl: 'https://$url/api/v1',
      services: [
        _$AuthApiService(),
      ],
    );
    return _$AuthApiService(client);
  }
}
