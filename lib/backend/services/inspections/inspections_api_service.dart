import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'inspections_api_service.chopper.dart';

// IMPORTANT: The API-Services should never be used directly, only through one of the repositories

@ChopperApi(baseUrl: '/inspections')
abstract class InspectionsApiService extends ChopperService {
  @Get(
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getAllInspections();

  @Get(
    path: '/{id}',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getInspectionById(@Path('id') int id);

  @Get(
    path: '/previews',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getAllInspectionPreviews();

  @Get(
    path: '/previews/{id}',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getInspectionPreviewById(@Path('id') int id);

  static InspectionsApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://${Dev.host}/api/v1',
      services: [
        _$InspectionsApiService(),
      ],
    );
    return _$InspectionsApiService(client);
  }
}
