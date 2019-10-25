import 'dart:convert';
import 'package:nesteo_app/backend/services/nestingboxes/nestingboxes_api_service.dart';
import 'package:nesteo_app/model/nestingbox.dart';

/// Wrapper that generates and returns [NestingBox] objects from json returned by a [NestingBoxesApiService].
///
/// Supports preview and no-preview versions which contain different amounts of information to save bandwith and reduce loading times.
///
/// *Author: Simon Oyen*
class NestingBoxesRepository {
  NestingBoxesApiService nestingBoxesApi;

  NestingBoxesRepository() {
    nestingBoxesApi = NestingBoxesApiService.create();
  }

  /// Requests information about an specific NestingBox by [id] from a [NestingBoxesApiService] and converts it to a [NestingBox] object.
  ///
  /// The returned [NestingBox] is **NOT** a preview-version
  ///
  /// ```dart
  /// var nestingBoxesRepository = NestingBoxesRepository();
  /// NestingBox nestingBox = await nestingBoxesRepository.getNestingBoxById(4);
  /// nestingBox.isPreview == false;
  /// ```
  Future<NestingBox> getNestingBoxById(String id) async {
    final response = await nestingBoxesApi.getNestingBoxById(id);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return NestingBox.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all NestingBoxes in the database from a [NestingBoxesApiService] and converts it to a [List<NestingBox>].
  ///
  /// The [NestingBox] objects in the returned [List<NestingBox>] are **NOT** preview-versions
  ///
  /// ```dart
  /// var nestingBoxesRepository = NestingBoxesRepository();
  /// List<NestingBox> nestingBoxes = await nestingBoxesRepository.getAllNestingBoxes();
  /// nestingBox.isPreview == false;
  /// ```
  Future<List<NestingBox>> getAllNestingBoxes() async {
    final response = await nestingBoxesApi.getAllNestingBoxes();
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results
          .map((nestingBox) => NestingBox.fromJson(nestingBox))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about an specific NestingBox by [id] from a [NestingBoxesApiService] and converts it to a [NestingBox] object.
  ///
  /// The returned [NestingBox] **is a preview-version**
  ///
  /// ```dart
  /// var nestingBoxesRepository = NestingBoxesRepository();
  /// NestingBox nestingBox = await nestingBoxesRepository.getNestingBoxPreviewById(4);
  /// nestingBox.isPreview == true;
  /// ```
  Future<NestingBox> getNestingBoxPreviewById(String id) async {
    final response = await nestingBoxesApi.getNestingBoxPreviewById(id);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return NestingBox.previewFromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all NestingBoxes in the database from a [NestingBoxesApiService] and converts it to a [List<NestingBox>].
  ///
  /// The [NestingBox] objects in the returned [List<NestingBox>] **are preview-versions**
  ///
  /// ```dart
  /// var nestingBoxesRepository = NestingBoxesRepository();
  /// List<NestingBox> nestingBoxes = await nestingBoxesRepository.getAllNestingBoxPreviews();
  /// nestingBox.isPreview == true;
  /// ```
  Future<List<NestingBox>> getAllNestingBoxPreviews() async {
    final response = await nestingBoxesApi.getAllNestingBoxPreviews();
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results
          .map((nestingBox) => NestingBox.previewFromJson(nestingBox))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
