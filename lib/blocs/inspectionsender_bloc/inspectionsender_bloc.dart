import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/backend/repositories/auth_repository.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/backend/repositories/inspections_repository.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/model/inspection.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/species.dart';
import 'package:nesteo_app/model/user.dart';
import './inspectionsender.dart';

class InspectionSenderBloc
    extends Bloc<InspectionSenderEvent, InspectionSenderState> {
  @override
  InspectionSenderState get initialState => WaitingForSend();

  @override
  Stream<InspectionSenderState> mapEventToState(
    InspectionSenderEvent event,
  ) async* {
    if (event is SendInspectionEvent && state is WaitingForSend) {
      yield SendingInspectionState();
      var inspRepo = InspectionsRepository(event.authBloc);
      var authRepo = AuthRepository(event.authBloc);

      User user = await authRepo.getAuth();

      Inspection response = await inspRepo.addNewInspection(
        Inspection(
          ageInDays: event.ageInDays,
          chickCount: event.chickCount,
          comment: event.comment,
          condition: event.condition,
          containsEggs: event.containsEggs,
          eggCount: event.eggCount,
          femaleParentBirdDiscovery: event.femaleParent,
          maleParentBirdDiscovery: event.maleParent,
          hasBeenCleaned: event.cleaned,
          inspectedByUser: user,
          id: null,
          inspectionDate: event.inspectionDate,
          justRepaired: event.repaired,
          nestingBox: event.nestingBox,
          nestingBoxId: event.nestingBox.id,
          occupied: event.occupied,
          ringedChickCount: event.ringedChickCount,
          species: (event.speciesString != null)
              ? Species(id: null, name: event.speciesString)
              : event.species,
          hasImage: null,
          lastUpdated: null,
        ),
      );

      if (response != null) {
        yield InspectionSentState();
      } else {
        yield SendErrorState();
      }
    }
    if (event is NewInspectionDoneEvent) {
      yield WaitingForSend();
    }
  }
}
