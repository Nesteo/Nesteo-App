import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:nesteo_app/backend/repositories/owners_repository.dart';
import 'package:nesteo_app/backend/repositories/regions_repository.dart';
import 'package:nesteo_app/backend/repositories/species_repository.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/species.dart';
import './dropdown.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  List<Owner> owners = [];
  List<Species> species = [];
  List<Region> regions = [];

  @override
  DropdownState get initialState => InitialDropdownState();

  @override
  Stream<DropdownState> mapEventToState(
    DropdownEvent event,
  ) async* {
    if (event is UpdateAllEvent) {
      this.add(UpdateOwnersEvent(authBloc: event.authBloc));
      this.add(UpdateRegionsEvent(authBloc: event.authBloc));
      this.add(UpdateSpeciesEvent(authBloc: event.authBloc));
    }

    if (event is UpdateOwnersEvent) {
      yield UpdatingDropdownState();
      var ownerRepo = OwnersRepository(event.authBloc);
      owners = await ownerRepo.getAllOwners();
      yield ReadyDropdownState();
    }

    if (event is UpdateSpeciesEvent) {
      yield UpdatingDropdownState();
      var speciesRepo = SpeciesRepository(event.authBloc);
      species = await speciesRepo.getAllSpecies();
      yield ReadyDropdownState();
    }

    if (event is UpdateRegionsEvent) {
      yield UpdatingDropdownState();
      var regionsRepo = RegionsRepository(event.authBloc);
      regions = await regionsRepo.getAllRegions();
      yield ReadyDropdownState();
    }
  }
}
