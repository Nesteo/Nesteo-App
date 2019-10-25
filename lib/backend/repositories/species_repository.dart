import 'dart:convert';
import 'package:nesteo_app/backend/services/species/species_api_service.dart';
import 'package:nesteo_app/model/species.dart';

/// Wrapper that generates and returns [Species] objects from json returned by a [SpeciesApiService].
///
/// *Author: Simon Oyen*
class SpeciesRepository {
  SpeciesApiService speciesApi;

  SpeciesRepository() {
    speciesApi = SpeciesApiService.create();
  }

  /// Requests information about an specific Specie by [id] from a [SpeciesApiService] and converts it to a [Species] object.
  ///
  /// ```dart
  /// var speciesRepository = SpeciesRepository();
  /// Species species = await speciesRepository.getSpecieById(4);
  /// ```
  Future<Species> getSpeciesById(int id) async {
    final response = await speciesApi.getSpeciesById(id);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return Species.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all Species in the database from a [SpeciesApiService] and converts it to a [List<Species>].
  ///
  /// ```dart
  /// var speciesRepository = SpeciesRepository();
  /// List<Species>  species = await speciesRepository.getAllSpecies();
  /// ```
  Future<List<Species>> getAllSpecies() async {
    final response = await speciesApi.getAllSpecies();
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results.map((species) => Species.fromJson(species)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
