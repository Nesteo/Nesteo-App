import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:nesteo_app/backend/repositories/auth_repository.dart';
import 'package:nesteo_app/backend/repositories/nestingboxes_repository.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/model/user.dart';
import './boxsender.dart';

class BoxSenderBloc extends Bloc<BoxSenderEvent, BoxSenderState> {
  @override
  BoxSenderState get initialState => InitialBoxSenderState();

  @override
  Stream<BoxSenderState> mapEventToState(
    BoxSenderEvent event,
  ) async* {
    if (event is SendBoxEvent) {
      var boxRepo = NestingBoxesRepository(event.authBloc);
      var authRepo = AuthRepository(event.authBloc);
      User user = await authRepo.getAuth();
      boxRepo.addNewNestingBox(NestingBox(
        hangUpUser: User(),
      ));
    }
  }
}
