import 'dart:convert';
import 'package:nesteo_app/backend/services/owners/owners_api_service.dart';
import 'package:nesteo_app/model/owner.dart';

/// Wrapper that generates and returns [Owner] objects from json returned by a [OwnersApiService].
///
/// *Author: Simon Oyen*
class OwnersRepository {
  OwnersApiService ownersApi;

  OwnersRepository() {
    ownersApi = OwnersApiService.create();
  }

  /// Requests information about an specific Owner by [id] from a [OwnersApiService] and converts it to a [Owner] object.
  ///
  /// ```dart
  /// var ownerRepository = OwnersRepository();
  /// Owner owner = await ownerRepository.getOwnerById(4);
  /// ```
  Future<Owner> getOwnerById(int id) async {
    final response = await ownersApi.getOwnerById(id);
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);
      return Owner.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  /// Requests information about all Owners in the database from a [OwnersApiService] and converts it to a [List<Owner>].
  ///
  /// ```dart
  /// var ownerRepository = OwnersRepository();
  /// List<Owner>  owners = await ownerRepository.getAllOwners();
  /// ```
  Future<List<Owner>> getAllOwners() async {
    final response = await ownersApi.getAllOwners();
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results.map((owner) => Owner.fromJson(owner)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
