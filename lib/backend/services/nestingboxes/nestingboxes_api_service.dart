import 'package:chopper/chopper.dart';
import 'package:nesteo_app/development/dev.dart';

part 'nestingboxes_api_service.chopper.dart';

/// **IMPORTANT**: The API-Service should never be used directly, only through a [NestingBoxesRepository]
///
/// *Author: Simon Oyen*
@ChopperApi(baseUrl: '/nesting-boxes')
abstract class NestingBoxesApiService extends ChopperService {
  @Get(
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getAllNestingBoxes();

  @Get(
    path: '/{id}',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getNestingBoxById(@Path('id') String id);

  @Get(
    path: '/{id}/inspections',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getInspectionsByNestingBoxId(@Path('id') String id);

  @Get(
    path: '/{id}/inspections/previews',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getInspectionPreviewsByNestingBoxId(@Path('id') String id);

  @Get(
    path: '/previews',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getAllNestingBoxPreviews();

  @Get(
    path: '/previews/{id}',
    headers: {'Authorization': 'Basic QWRtaW46QWRtaW4xMjM='},
  )
  Future<Response> getNestingBoxPreviewById(@Path('id') String id);

  static NestingBoxesApiService create() {
    final client = ChopperClient(
      baseUrl: 'http://${Dev.host}/api/v1',
      services: [
        _$NestingBoxesApiService(),
      ],
    );
    return _$NestingBoxesApiService(client);
  }
}
