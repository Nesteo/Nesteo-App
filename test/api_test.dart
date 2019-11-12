import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nesteo_app/backend/repositories/auth_repository.dart';
import 'package:nesteo_app/backend/repositories/inspections_repository.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/backend/repositories/owners_repository.dart';
import 'package:nesteo_app/backend/repositories/regions_repository.dart';
import 'package:nesteo_app/backend/repositories/species_repository.dart';
import 'package:nesteo_app/backend/repositories/users_repository.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/development/dev.dart';
import 'package:nesteo_app/model/inspection.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/species.dart';
import 'package:nesteo_app/model/user.dart';

void main() {
  group('API tests', () {
    AuthenticationBloc authBloc;
    setUp(() {
      authBloc = AuthenticationBloc();
      authBloc.auth = Dev.auth;
      authBloc.domain = Dev.host;
    });
    group('Owners API tests', () {
      OwnersRepository ownersRepo;
      int ownerId;

      setUp(() {
        ownersRepo = OwnersRepository(authBloc);
      });

      test('Test /owners', () async {
        List<Owner> owners = await ownersRepo.getAllOwners();

        ownerId = owners[0].id;
        expect(owners.length > 0, true);
      });

      test('Test /owners/{id}', () async {
        Owner owner = await ownersRepo.getOwnerById(ownerId);
        expect(owner != null, true);
      });
    });
    group('Users API tests', () {
      UsersRepository usersRepo;
      String userId;

      setUp(() {
        usersRepo = UsersRepository(authBloc);
      });

      test('Test /users', () async {
        List<User> users = await usersRepo.getAllUsers();

        userId = users[0].id;
        expect(users.length > 0, true);
      });

      test('Test /users/{id}', () async {
        User user = await usersRepo.getUserById(userId);
        expect(user != null, true);
      });
    });
    group('Auth API tests', () {
      AuthRepository authRepo;

      setUp(() {
        authRepo = AuthRepository(authBloc);
      });

      test('Test /auth', () async {
        User user = await authRepo.getAuth();
        expect(user != null, true);
      });
    });
    group('Region API tests', () {
      RegionsRepository regionsRepo;
      int regionId;

      setUp(() {
        regionsRepo = RegionsRepository(authBloc);
      });

      test('Test /regions', () async {
        List<Region> regions = await regionsRepo.getAllRegions();

        regionId = regions[0].id;
        expect(regions.length > 0, true);
      });

      test('Test /regions/{id}', () async {
        Region region = await regionsRepo.getRegionById(regionId);
        expect(region != null, true);
      });
    });
    group('Species API tests', () {
      SpeciesRepository speciesRepo;
      int speciesId;

      setUp(() {
        speciesRepo = SpeciesRepository(authBloc);
      });

      test('Test /species', () async {
        List<Species> species = await speciesRepo.getAllSpecies();
        if (species[0] != null) {
          speciesId = species[0].id;
        }

        expect(species.length > 0, true);
      });

      test('Test /species/{id}', () async {
        Species species = await speciesRepo.getSpeciesById(speciesId);
        expect(species != null, true);
      });
    });
    group('NestingBox API tests', () {
      NestingBoxesRepository nestingBoxRepo;
      InspectionsRepository inspectionsRepo;
      String nestingBoxId;

      setUp(() {
        nestingBoxRepo = NestingBoxesRepository(authBloc);
        inspectionsRepo = InspectionsRepository(authBloc);
      });

      test('Test /nesting-boxes', () async {
        List<NestingBox> nestingBoxes =
            await nestingBoxRepo.getAllNestingBoxes();

        if (nestingBoxes[0] != null) {
          nestingBoxId = nestingBoxes[0].id;
        }
        expect(nestingBoxes.length > 0, true);
        expect(nestingBoxes[0].material == null, false);
      });

      test('Test /nesting-boxes/{id}', () async {
        if (nestingBoxId != null) {
          NestingBox nestingBox =
              await nestingBoxRepo.getNestingBoxById(nestingBoxId);
          expect(nestingBox != null, true);
          expect(nestingBox.material == null, false);
        }
      });

      test('Test /nesting-boxes/previews', () async {
        List<NestingBox> nestingBoxes =
            await nestingBoxRepo.getAllNestingBoxPreviews();

        if (nestingBoxes[0] != null) {
          nestingBoxId = nestingBoxes[0].id;
          expect(nestingBoxes.length > 0, true);
          expect(nestingBoxes[0].material == null, true);
        }
      });

      test('Test /nesting-boxes/previews/{id}', () async {
        if (nestingBoxId != null) {
          NestingBox nestingBox =
              await nestingBoxRepo.getNestingBoxPreviewById(nestingBoxId);
          expect(nestingBox != null, true);
          expect(nestingBox.material == null, true);
        }
      });

      test('Test /nesting-boxes/{id}/inspections', () async {
        if (nestingBoxId != null) {
          List<Inspection> inspections =
              await inspectionsRepo.getInspectionsByNestingBoxId(nestingBoxId);
          expect(inspections[0] != null, true);
          expect(inspections[0].containsEggs == null, false);
        }
      });

      test('Test /nesting-boxes/{id}/inspections/previews', () async {
        if (nestingBoxId != null) {
          List<Inspection> inspections = await inspectionsRepo
              .getInspectionPreviewsByNestingBoxId(nestingBoxId);
          expect(inspections[0] != null, true);
          expect(inspections[0].containsEggs == null, true);
        }
      });
    });
    group('Inspection API tests', () {
      InspectionsRepository inspectionRepo;
      int inspectionId;

      setUp(() {
        inspectionRepo = InspectionsRepository(authBloc);
      });

      test('Test /inspections', () async {
        List<Inspection> inspections = await inspectionRepo.getAllInspections();

        if (inspections[0] != null) {
          inspectionId = inspections[0].id;
          expect(inspections[0].containsEggs == null, false);
        }
        expect(inspections.length > 0, true);
      });

      test('Test /inspections/{id}', () async {
        Inspection inspection =
            await inspectionRepo.getInspectionById(inspectionId);
        expect(inspection != null, true);
        expect(inspection.containsEggs == null, false);
      });

      test('Test /inspections/previews', () async {
        List<Inspection> inspections =
            await inspectionRepo.getAllInspectionPreviews();

        if (inspections[0] != null) {
          inspectionId = inspections[0].id;
        }
        expect(inspections.length > 0, true);
        expect(inspections[0].containsEggs == null, true);
      });

      test('Test /inspections/previews/{id}', () async {
        Inspection inspection =
            await inspectionRepo.getInspectionPreviewById(inspectionId);
        expect(inspection != null, true);
        expect(inspection.containsEggs == null, true);
      });
    });
  });
}
