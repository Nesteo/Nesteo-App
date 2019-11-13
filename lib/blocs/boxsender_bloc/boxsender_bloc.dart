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

      int response = await boxRepo.addNewNestingBox(
        NestingBox(
          hangUpUser: user,
          coordinateLatitude: event.coordinates.latitude,
          coordinateLongitude: event.coordinates.longitude,
          hangUpDate: event.hangUpDate,
          region: Region(
            id: null,
            name: "${event?.regionString}",
            nestingBoxIdPrefix: (event.regionIdPrefixString == null)
                ? "X"
                : event.regionIdPrefixString,
          ),
          owner: Owner(id: null, name: "${event.ownerString}"),
          material: event.material,
          holeSize: event.holeSize,
          comment: event.comment,
          foreignId: event.foreignId,
          oldId: event.oldId,
        ),
      );

      if (response == 201) {
        yield BoxSentState();
        yield WaitingForSend();
      } else {
        yield SendErrorState();
      }
    }
  }
}
