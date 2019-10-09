import 'dart:convert';
import 'package:nesteo_app/backend/services/owners/owners_api_service.dart';
import 'package:nesteo_app/model/owner.dart';

class OwnersRepository {
  OwnersApiService ownersApi;

  OwnersRepository() {
    ownersApi = OwnersApiService.create();
  }

  Future<Owner> getOwnerById(int id) async {
    final response = await ownersApi.getOwnerById(id);
    if (response.statusCode == 200) {
      print(response.body);
      final Map result = json.decode(response.body);
      return Owner.fromJson(result);
    } else {
      print('Request failed');
      return null;
    }
  }

  Future<List<Owner>> getAllOwners() async {
    final response = await ownersApi.getAllOwners();
    if (response.statusCode == 200) {
      print(response.body);
      final List results = json.decode(response.body);
      return results.map((owner) => Owner.fromJson(owner)).toList();
    } else {
      print('Request failed');
      return null;
    }
  }
}
