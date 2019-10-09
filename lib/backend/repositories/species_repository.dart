import 'dart:convert';
import 'package:nesteo_app/backend/services/species/species_api_service.dart';
import 'package:nesteo_app/model/species.dart';

class SpeciesRepository {
  SpeciesApiService speciesApi;

  SpeciesRepository() {
    speciesApi = SpeciesApiService.create();
  }

  Future<Species> getSpeciesById(int id) async {
    final response = await speciesApi.getSpeciesById(id);
    if (response.statusCode == 200) {
      print(response.body);
      final Map result = json.decode(response.body);
      return Species.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<List<Species>> getAllSpecies() async {
    final response = await speciesApi.getAllSpecies();
    if (response.statusCode == 200) {
      print(response.body);
      final List results = json.decode(response.body);
      return results.map((species) => Species.fromJson(species)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
