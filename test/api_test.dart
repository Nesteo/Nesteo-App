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
      int ownerId;

      setUp(() {
        ownersRepo = OwnersRepository();
      });

      test('Test /owners', () async {
        List<Owner> owners = await ownersRepo.getAllOwners();
        print(owners.toString());
        ownerId = owners[0].id;
        expect(owners.length > 0, true);
      });

      test('Test /owners/{id}', () async {
        Owner owner = await ownersRepo.getOwnerById(ownerId);
        if (owner != null) {
          print(owner.toString());
        }
      });
    });
    group('Users API tests', () {
      UsersRepository usersRepo;
      String userId;

      setUp(() {
        usersRepo = UsersRepository();
      });

      test('Test /users', () async {
        List<User> users = await usersRepo.getAllUsers();
        print(users.toString());
        userId = users[0].id;
        expect(users.length > 0, true);
      });

      test('Test /users/{id}', () async {
        User user = await usersRepo.getUserById(userId);
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
      int regionId;

      setUp(() {
        regionsRepo = RegionsRepository();
      });

      test('Test /regions', () async {
        List<Region> regions = await regionsRepo.getAllRegions();
        print(regions.toString());
        regionId = regions[0].id;
        expect(regions.length > 0, true);
      });

      test('Test /regions/{id}', () async {
        Region region = await regionsRepo.getRegionById(regionId);
        if (region != null) {
          print(region.toString());
        }
      });
    });
    group('Species API tests', () {
      SpeciesRepository speciesRepo;
      int speciesId;

      setUp(() {
        speciesRepo = SpeciesRepository();
      });

      test('Test /species', () async {
        List<Species> species = await speciesRepo.getAllSpecies();
        if (species[0] != null) {
          speciesId = species[0].id;
        }
        print(species.toString());
        expect(species.length > 0, true);
      });

      test('Test /species/{id}', () async {
        Species species = await speciesRepo.getSpeciesById(speciesId);
        if (species != null) {
          print(species.toString());
        }
      });
    });
    group('NestingBox API tests', () {
      NestingBoxesRepository nestingBoxRepo;
      String nestingBoxId;

      setUp(() {
        nestingBoxRepo = NestingBoxesRepository();
      });

      test('Test /nesting-boxes', () async {
        List<NestingBox> nestingBoxes =
            await nestingBoxRepo.getAllNestingBoxes();
        print(nestingBoxes.toString());
        if (nestingBoxes[0] != null) {
          nestingBoxId = nestingBoxes[0].id;
        }
        expect(nestingBoxes.length > 0, true);
        expect(nestingBoxes[0].isPreview, false);
      });

      test('Test /nesting-boxes/{id}', () async {
        if (nestingBoxId != null) {
          NestingBox nestingBox =
              await nestingBoxRepo.getNestingBoxById(nestingBoxId);
          if (nestingBox != null) {
            print(nestingBox.toString());
          }
        }
      });

      test('Test /nesting-boxes/previews', () async {
        List<NestingBox> nestingBoxes =
            await nestingBoxRepo.getAllNestingBoxPreviews();
        print(nestingBoxes.toString());
        if (nestingBoxes[0] != null) {
          nestingBoxId = nestingBoxes[0].id;
          expect(nestingBoxes.length > 0, true);
          expect(nestingBoxes[0].isPreview, true);
        }
      });

      test('Test /nesting-boxes/previews/{id}', () async {
        if (nestingBoxId != null) {
          NestingBox nestingBox =
              await nestingBoxRepo.getNestingBoxPreviewById(nestingBoxId);
          if (nestingBox != null) {
            print(nestingBox.toString());
            expect(nestingBox.isPreview, true);
          }
        }
      });
    });
    group('Inspection API tests', () {
      InspectionsRepository inspectionRepo;
      int inspectionId;

      setUp(() {
        inspectionRepo = InspectionsRepository();
      });

      test('Test /inspections', () async {
        List<Inspection> inspections = await inspectionRepo.getAllInspections();
        print(inspections.toString());
        if (inspections[0] != null) {
          inspectionId = inspections[0].id;
          expect(inspections[0].isPreview, false);
        }
        expect(inspections.length > 0, true);
      });

      test('Test /inspections/{id}', () async {
        Inspection inspection =
            await inspectionRepo.getInspectionById(inspectionId);
        if (inspection != null) {
          print(inspection.toString());
          expect(inspection.isPreview, false);
        }
      });

      test('Test /inspections/previews', () async {
        List<Inspection> inspections =
            await inspectionRepo.getAllInspectionPreviews();
        print(inspections.toString());
        if (inspections[0] != null) {
          inspectionId = inspections[0].id;
        }
        expect(inspections.length > 0, true);
        expect(inspections[0].isPreview, true);
      });

      test('Test /inspections/previews/{id}', () async {
        Inspection inspection =
            await inspectionRepo.getInspectionPreviewById(inspectionId);
        if (inspection != null) {
          print(inspection.toString());
        }
        expect(inspection.isPreview, true);
      });
    });
  });
}
