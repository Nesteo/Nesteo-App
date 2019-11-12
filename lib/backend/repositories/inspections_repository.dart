import 'dart:convert';
import 'package:nesteo_app/backend/services/inspections/inspections_api_service.dart';
import 'package:nesteo_app/backend/services/nestingboxes/nestingboxes_api_service.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/model/inspection.dart';

/// Wrapper that generates and returns [Inspection] objects from json returned by a [InspectionsApiService].
///
/// Supports preview and no-preview versions which contain different amounts of information to save bandwith and reduce loading times.
///
/// *Author: Simon Oyen*
class InspectionsRepository {
  AuthenticationBloc _authBloc;

  InspectionsRepository(this._authBloc);

  /// Requests information about an specific Inspection by [id] from a [InspectionsApiService] and converts it to a [Inspection] object.
  ///
  /// The returned [Inspection] is **NOT** a preview-version
  ///
  /// ```dart
  /// var inspectionsRepository = InspectionsRepository();
  /// Inspection inspection = await inspectionsRepository.getInspectionById(4);
  /// inspection.isPreview == false;
  /// ```
  Future<Inspection> getInspectionById(int id) async {
    InspectionsApiService _inspectionsApi =
        InspectionsApiService.create(_authBloc.domain);
    final response =
        await _inspectionsApi.getInspectionById(id, _authBloc.auth);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return Inspection.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all Inspections in the database from a [InspectionsApiService] and converts it to a [List<Inspection>].
  ///
  /// The [Inspection] objects in the returned [List<Inspection>] are **NOT** preview-versions
  ///
  /// ```dart
  /// var inspectionsRepository = InspectionsRepository();
  /// List<Inspection> inspections = await inspectionsRepository.getAllInspections();
  /// inspections[0].isPreview == false;
  /// ```
  Future<List<Inspection>> getAllInspections() async {
    InspectionsApiService _inspectionsApi =
        InspectionsApiService.create(_authBloc.domain);
    final response = await _inspectionsApi.getAllInspections(_authBloc.auth);
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results
          .map((inspection) => Inspection.fromJson(inspection))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about an specific Inspection by [id] from a [InspectionsApiService] and converts it to a [Inspection] object.
  ///
  /// The returned [Inspection] **is a preview-version**
  ///
  /// ```dart
  /// var inspectionsRepository = InspectionsRepository();
  /// Inspection inspection = await inspectionsRepository.getInspectionPreviewById(4);
  /// inspection.isPreview == true;
  /// ```
  Future<Inspection> getInspectionPreviewById(int id) async {
    InspectionsApiService _inspectionsApi =
        InspectionsApiService.create(_authBloc.domain);
    final response =
        await _inspectionsApi.getInspectionPreviewById(id, _authBloc.auth);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return Inspection.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all Inspections in the database from a [InspectionsApiService] and converts it to a [List<Inspection>].
  ///
  /// The [Inspection] objects in the returned [List<Inspection>] **are preview-versions**
  ///
  /// ```dart
  /// var inspectionsRepository = InspectionsRepository();
  /// List<Inspection> inspections = await inspectionsRepository.getAllInspectionPreviews();
  /// inspections[0].isPreview == true;
  /// ```
  Future<List<Inspection>> getAllInspectionPreviews() async {
    InspectionsApiService _inspectionsApi =
        InspectionsApiService.create(_authBloc.domain);
    final response =
        await _inspectionsApi.getAllInspectionPreviews(_authBloc.auth);
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results
          .map((inspection) => Inspection.fromJson(inspection))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all Inspections for a NestingBox with [id] from a [NestingBoxesApiService] and converts it to a [List<Inspection>].
  ///
  /// The [Inspection] objects in the returned [List<Inspection>] **are preview-versions**
  ///
  /// ```dart
  /// var inspectionsRepository = InspectionsRepository();
  /// List<Inspection> inspections = await inspectionsRepository.getInspectionPreviewsByNestingBoxId();
  /// inspections[0].isPreview == true;
  /// ```
  Future<List<Inspection>> getInspectionPreviewsByNestingBoxId(
      String id) async {
    NestingBoxesApiService _nestingBoxesApi =
        NestingBoxesApiService.create(_authBloc.domain);
    final response = await _nestingBoxesApi.getInspectionPreviewsByNestingBoxId(
        id, _authBloc.auth);
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results
          .map((inspection) => Inspection.fromJson(inspection))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all Inspections for a NestingBox with [id] from a [NestingBoxesApiService] and converts it to a [List<Inspection>].
  ///
  /// The [Inspection] objects in the returned [List<Inspection>] are **NOT** preview-versions.
  ///
  /// ```dart
  /// var inspectionsRepository = InspectionsRepository();
  /// List<Inspection> inspections = await inspectionsRepository.getInspectionsByNestingBoxId();
  /// inspections[0].isPreview == true;
  /// ```
  Future<List<Inspection>> getInspectionsByNestingBoxId(String id) async {
    NestingBoxesApiService _nestingBoxesApi =
        NestingBoxesApiService.create(_authBloc.domain);
    final response =
        await _nestingBoxesApi.getInspectionsByNestingBoxId(id, _authBloc.auth);
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results
          .map((inspection) => Inspection.fromJson(inspection))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
