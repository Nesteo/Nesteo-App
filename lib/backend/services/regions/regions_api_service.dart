import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'regions_api_service.chopper.dart';

@ChopperApi(baseUrl: '/regions')
abstract class RegionsApiService extends ChopperService {
  @Get(headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getAllRegions();

  @Get(path: '/{id}', headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getRegionById(@Path('id') int id);

  static RegionsApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://${Dev.host}/api/v1',
      services: [
        _$RegionsApiService(),
      ],
    );
    return _$RegionsApiService(client);
  }
}
