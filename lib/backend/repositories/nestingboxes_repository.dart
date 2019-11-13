import 'dart:convert';
import 'package:nesteo_app/backend/services/nestingboxes/nestingboxes_api_service.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication.dart';
import 'package:nesteo_app/model/nestingbox.dart';

/// Wrapper that generates and returns [NestingBox] objects from json returned by a [NestingBoxesApiService].
///
/// Supports preview and no-preview versions which contain different amounts of information to save bandwith and reduce loading times.
///
/// *Author: Simon Oyen*
class NestingBoxesRepository {
  AuthenticationBloc _authBloc;

  NestingBoxesRepository(this._authBloc);

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
    NestingBoxesApiService _nestingBoxesApi =
        NestingBoxesApiService.create(_authBloc.domain);
    final response =
        await _nestingBoxesApi.getNestingBoxById(id, _authBloc.auth);
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
    NestingBoxesApiService _nestingBoxesApi =
        NestingBoxesApiService.create(_authBloc.domain);
    final response = await _nestingBoxesApi.getAllNestingBoxes(_authBloc.auth);
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
    NestingBoxesApiService _nestingBoxesApi =
        NestingBoxesApiService.create(_authBloc.domain);
    final response =
        await _nestingBoxesApi.getNestingBoxPreviewById(id, _authBloc.auth);
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
  /// The [NestingBox] objects in the returned [List<NestingBox>] **are preview-versions**
  ///
  /// ```dart
  /// var nestingBoxesRepository = NestingBoxesRepository();
  /// List<NestingBox> nestingBoxes = await nestingBoxesRepository.getAllNestingBoxPreviews();
  /// nestingBox.isPreview == true;
  /// ```
  Future<List<NestingBox>> getAllNestingBoxPreviews() async {
    NestingBoxesApiService _nestingBoxesApi =
        NestingBoxesApiService.create(_authBloc.domain);
    final response =
        await _nestingBoxesApi.getAllNestingBoxPreviews(_authBloc.auth);
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

  Future<NestingBox> addNewNestingBox(NestingBox nestingBox) async {
    NestingBoxesApiService _nestingBoxesApi =
        NestingBoxesApiService.create(_authBloc.domain);
    var nestingBoxString = json.encode(nestingBox);
    print(nestingBoxString);
    final response = await _nestingBoxesApi.postNewNestingBox(
        nestingBoxString, _authBloc.auth);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      final Map result = json.decode(response.body);
      return NestingBox.fromJson(result);
    } else {
      return null;
    }
  }
}
