import 'dart:convert';
import 'package:nesteo_app/backend/services/nestingboxes/nestingboxes_api_service.dart';
import 'package:nesteo_app/model/nestingbox.dart';

class NestingBoxesRepository {
  NestingBoxesApiService nestingBoxesApi;

  NestingBoxesRepository() {
    nestingBoxesApi = NestingBoxesApiService.create();
  }

  Future<NestingBox> getNestingBoxById(String id) async {
    final response = await nestingBoxesApi.getNestingBoxById(id);
    if (response.statusCode == 200) {
      print(response.body);
      final Map result = json.decode(response.body);
      return NestingBox.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<List<NestingBox>> getAllNestingBoxes() async {
    final response = await nestingBoxesApi.getAllNestingBoxes();
    if (response.statusCode == 200) {
      print(response.body);
      final List results = json.decode(response.body);
      return results
          .map((nestingBox) => NestingBox.fromJson(nestingBox))
          .toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
