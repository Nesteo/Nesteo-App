import 'package:flutter_test/flutter_test.dart';
import 'package:nesteo_app/backend/repositories/auth_repository.dart';
import 'package:nesteo_app/backend/repositories/inspections_repository.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/backend/repositories/owners_repository.dart';
import 'package:nesteo_app/backend/repositories/regions_repository.dart';
import 'package:nesteo_app/backend/repositories/species_repository.dart';
import 'package:nesteo_app/backend/repositories/users_repository.dart';
import 'package:nesteo_app/model/inspection.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/species.dart';
import 'package:nesteo_app/model/user.dart';

void main() {
  group('API tests', () {
    group('Owners API tests', () {
      OwnersRepository ownersRepo;

      setUp(() {
        ownersRepo = OwnersRepository();
      });

      test('Test /owners', () async {
        List<Owner> owners = await ownersRepo.getAllOwners();
        print(owners.toString());
        expect(owners.length > 0, true);
      });

      test('Test /owners/{id}', () async {
        Owner owner = await ownersRepo.getOwnerById(0);
        if (owner != null) {
          print(owner.toString());
        }
      });
    });
    group('Users API tests', () {
      UsersRepository usersRepo;

      setUp(() {
        usersRepo = UsersRepository();
      });

      test('Test /users', () async {
        List<User> users = await usersRepo.getAllUsers();
        print(users.toString());
        expect(users.length > 0, true);
      });

      test('Test /users/{id}', () async {
        User user =
            await usersRepo.getUserById("f80d95df-9e94-4646-9cbb-b4c7be679ce1");
        if (user != null) {
          print(user.toString());
        }
      });
    });
    group('Auth API tests', () {
      AuthRepository authRepo;

      setUp(() {
        authRepo = AuthRepository();
      });

      test('Test /auth', () async {
        User user = await authRepo.getAuth();
        print(user.toString());
      });
    });
    group('Region API tests', () {
      RegionsRepository regionsRepo;

      setUp(() {
        regionsRepo = RegionsRepository();
      });

      test('Test /regions', () async {
        List<Region> regions = await regionsRepo.getAllRegions();
        print(regions.toString());
        expect(regions.length > 0, true);
      });

      test('Test /regions/{id}', () async {
        Region region = await regionsRepo.getRegionById(0);
        if (region != null) {
          print(region.toString());
        }
      });
    });
    group('Species API tests', () {
      SpeciesRepository speciesRepo;

      setUp(() {
        speciesRepo = SpeciesRepository();
      });

      test('Test /species', () async {
        List<Species> species = await speciesRepo.getAllSpecies();
        print(species.toString());
        expect(species.length > 0, true);
      });

      test('Test /species/{id}', () async {
        Species species = await speciesRepo.getSpeciesById(0);
        if (species != null) {
          print(species.toString());
        }
      });
    });
    group('NestingBox API tests', () {
      NestingBoxesRepository nestingBoxRepo;

      setUp(() {
        nestingBoxRepo = NestingBoxesRepository();
      });

      test('Test /nesting-boxes', () async {
        List<NestingBox> nestingBoxes =
            await nestingBoxRepo.getAllNestingBoxes();
        print(nestingBoxes.toString());
        expect(nestingBoxes.length > 0, true);
      });

      test('Test /nesting-boxes/{id}', () async {
        NestingBox nestingBox =
            await nestingBoxRepo.getNestingBoxById("F000001");
        if (nestingBox != null) {
          print(nestingBox.toString());
        }
      });
    });
    group('Inspection API tests', () {
      InspectionsRepository inspectionRepo;

      setUp(() {
        inspectionRepo = InspectionsRepository();
      });

      test('Test /inspections', () async {
        List<Inspection> inspectiones =
            await inspectionRepo.getAllInspections();
        print(inspectiones.toString());
        expect(inspectiones.length > 0, true);
      });

      test('Test /inspections/{id}', () async {
        Inspection inspection = await inspectionRepo.getInspectionById(0);
        if (inspection != null) {
          print(inspection.toString());
        }
      });
    });
  });
}
