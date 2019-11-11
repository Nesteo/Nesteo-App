import 'dart:convert';
import 'package:nesteo_app/backend/services/owners/owners_api_service.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication.dart';
import 'package:nesteo_app/model/owner.dart';

/// Wrapper that generates and returns [Owner] objects from json returned by a [OwnersApiService].
///
/// *Author: Simon Oyen*
class OwnersRepository {
  AuthenticationBloc _authBloc;

  OwnersRepository(this._authBloc);

  /// Requests information about an specific Owner by [id] from a [OwnersApiService] and converts it to a [Owner] object.
  ///
  /// ```dart
  /// var ownerRepository = OwnersRepository();
  /// Owner owner = await ownerRepository.getOwnerById(4);
  /// ```
  Future<Owner> getOwnerById(int id) async {
    OwnersApiService _ownersApi = OwnersApiService.create(_authBloc.domain);
    final response = await _ownersApi.getOwnerById(id, _authBloc.auth);
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
    OwnersApiService _ownersApi = OwnersApiService.create(_authBloc.domain);
    final response = await _ownersApi.getAllOwners(_authBloc.auth);
    if (response.statusCode == 200) {
      final List results = json.decode(response.body);
      return results.map((owner) => Owner.fromJson(owner)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
