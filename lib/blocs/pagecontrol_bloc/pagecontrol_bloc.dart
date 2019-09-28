import 'dart:async';
import 'package:bloc/bloc.dart';
import './pagecontrol.dart';

class PageControlBloc extends Bloc<PageControlEvent, PageControlState> {
  @override
  PageControlState get initialState => LoginScreenState();

  @override
  Stream<PageControlState> mapEventToState(
    PageControlEvent event,
  ) async* {
    if (event is GoToMapEvent) {
      yield ToMapScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield MapScreenState();
    }

    if (event is MapEvent) {
      yield MapScreenState();
    }

    if (event is GoToBoxListEvent) {
      yield ToBoxListScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield BoxListScreenState();
    }

    if (event is BoxListEvent) {
      yield BoxListScreenState();
    }

    if (event is GoToNewBoxEvent) {
      yield ToNewBoxScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield NewBoxScreenState();
    }

    if (event is NewBoxEvent) {
      yield NewBoxScreenState();
    }

    if (event is GoToBoxInfoEvent) {
      yield ToBoxInfoScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield BoxInfoScreenState();
    }

    if (event is BoxInfoEvent) {
      yield BoxInfoScreenState();
    }

    if (event is GoToInspectionEvent) {
      yield ToInspectionScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield InspectionScreenState();
    }

    if (event is InspectionEvent) {
      yield InspectionScreenState();
    }
    // TODO: Add the missing events / states here
  }
}
