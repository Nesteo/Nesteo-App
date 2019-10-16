import 'dart:convert';
import 'package:nesteo_app/backend/services/inspections/inspections_api_service.dart';
import 'package:nesteo_app/model/inspection.dart';

class InspectionsRepository {
  InspectionsApiService inspectionsApi;

  InspectionsRepository() {
    inspectionsApi = InspectionsApiService.create();
  }

  Future<Inspection> getInspectionById(int id) async {
    final response = await inspectionsApi.getInspectionById(id);
    if (response.statusCode == 200) {
      print(response.body);
      final Map result = json.decode(response.body);
      return Inspection.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<List<Inspection>> getAllInspections() async {
    final response = await inspectionsApi.getAllInspections();
    if (response.statusCode == 200) {
      print(response.body);
      final List results = json.decode(response.body);
      return results
          .map((inspection) => Inspection.fromJson(inspection))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<Inspection> getInspectionPreviewById(int id) async {
    final response = await inspectionsApi.getInspectionPreviewById(id);
    if (response.statusCode == 200) {
      print(response.body);
      final Map result = json.decode(response.body);
      return Inspection.previewFromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<List<Inspection>> getAllInspectionPreviews() async {
    final response = await inspectionsApi.getAllInspections();
    if (response.statusCode == 200) {
      print(response.body);
      final List results = json.decode(response.body);
      return results
          .map((inspection) => Inspection.previewFromJson(inspection))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
