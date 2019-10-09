import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'species_api_service.chopper.dart';

@ChopperApi(baseUrl: '/species')
abstract class SpeciesApiService extends ChopperService {
  @Get(headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getAllSpecies();

  @Get(path: '/{id}', headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='})
  Future<Response> getSpeciesById(@Path('id') int id);

  static SpeciesApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://${Dev.host}/api/v1',
      services: [
        _$SpeciesApiService(),
      ],
    );
    return _$SpeciesApiService(client);
  }
}
