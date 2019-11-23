import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:nesteo_app/backend/repositories/auth_repository.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
import 'package:nesteo_app/model/user.dart';
import './boxsender.dart';

class BoxSenderBloc extends Bloc<BoxSenderEvent, BoxSenderState> {
  NestingBox lastNewBox;
  @override
  BoxSenderState get initialState => WaitingForSend();

  @override
  Stream<BoxSenderState> mapEventToState(
    BoxSenderEvent event,
  ) async* {
    if (event is SendBoxEvent && state is WaitingForSend) {
      yield SendingBoxState();
      var boxRepo = NestingBoxesRepository(event.authBloc);
      var authRepo = AuthRepository(event.authBloc);
      User user = await authRepo.getAuth();

      NestingBox response = await boxRepo.addNewNestingBox(
        NestingBox(
          hangUpUser: user,
          coordinateLatitude: event.coordinates.latitude,
          coordinateLongitude: event.coordinates.longitude,
          hangUpDate: event.hangUpDate,
          region:
              (event.regionIdPrefixString == null || event.regionString == null)
                  ? event.region
                  : Region(
                      id: null,
                      name: "${event?.regionString}",
                      nestingBoxIdPrefix: event.regionIdPrefixString,
                    ),
          owner: (event.ownerString == null)
              ? event.owner
              : Owner(
                  id: null,
                  name: "${event?.ownerString}",
                ),
          material: event.material,
          holeSize: event.holeSize,
          comment: event.comment,
          foreignId: event.foreignId,
          oldId: event.oldId,
        ),
      );

      if (response != null) {
        lastNewBox = response;
        yield BoxSentState();
      } else {
        yield SendErrorState();
      }
    }
    if (event is NewBoxDoneEvent) {
      yield WaitingForSend();
    }
  }
}
