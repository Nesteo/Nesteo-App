import 'dart:convert';
import 'package:nesteo_app/backend/services/regions/regions_api_service.dart';
import 'package:nesteo_app/model/region.dart';

/// Wrapper that generates and returns [Region] objects from json returned by a [RegionsApiService].
///
/// *Author: Simon Oyen*
class RegionsRepository {
  RegionsApiService regionsApi;

  RegionsRepository() {
    regionsApi = RegionsApiService.create();
  }

  /// Requests information about an specific Region by [id] from a [RegionsApiService] and converts it to a [Region] object.
  ///
  /// ```dart
  /// var regionRepository = RegionsRepository();
  /// Region region = await regionRepository.getRegionById(4);
  /// ```
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

  /// Requests information about all Regions in the database from a [RegionsApiService] and converts it to a [List<Region>].
  ///
  /// ```dart
  /// var regionRepository = RegionsRepository();
  /// List<Region> regions = await regionRepository.getAllRegions();
  /// ```
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
