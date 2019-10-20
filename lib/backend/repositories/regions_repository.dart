import 'dart:convert';
import 'package:nesteo_app/backend/services/regions/regions_api_service.dart';
import 'package:nesteo_app/model/region.dart';

class RegionsRepository {
  RegionsApiService regionsApi;

  RegionsRepository() {
    regionsApi = RegionsApiService.create();
  }

  Future<Region> getRegionById(int id) async {
    final response = await regionsApi.getRegionById(id);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return Region.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<List<Region>> getAllRegions() async {
    final response = await regionsApi.getAllRegions();
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results.map((region) => Region.fromJson(region)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
