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
    // if (event is GoToHomeEvent) {
    //   yield ToHomeScreenState();

    //   // TODO: This is just a way to "simulate" a delay for now!
    //   await Future.delayed(Duration(seconds: 1));
    //   yield HomeScreenState();
    // }
    // if (event is HomeEvent) {
    //   yield HomeScreenState();
    // }
    if (event is GoToMapEvent) {
      yield ToMapScreenState();

      // TODO: This is just a way to "simulate" a delay for now!
      await Future.delayed(Duration(seconds: 1));
      yield MapScreenState();
    }
    if (event is MapEvent) {
      yield MapScreenState();
    }
    if (event is GoToBoxListEvent) {
      yield ToBoxListScreenState();

      // TODO: This is just a way to "simulate" a delay for now!
      await Future.delayed(Duration(seconds: 1));
      yield BoxListScreenState();
    }
    if (event is BoxListEvent) {
      yield BoxListScreenState();
    }
    if (event is GoToNewBoxEvent) {
      yield ToNewBoxScreenState();

      // TODO: This is just a way to "simulate" a delay for now!
      await Future.delayed(Duration(seconds: 1));
      yield NewBoxScreenState();
    }
    if (event is NewBoxEvent) {
      yield NewBoxScreenState();
    }
    if (event is GoToInfoBoxEvent) {
      yield ToInfoBoxScreenState();

      // TODO: This is just a way to "simulate" a delay for now!
      await Future.delayed(Duration(seconds: 1));
      yield InfoBoxScreenState();
    }
    if (event is InfoBoxEvent) {
      yield InfoBoxScreenState();
    }
    if (event is GoToInspectionEvent) {
      yield ToInspectionScreenState();

      // TODO: This is just a way to "simulate" a delayfor now!
      await Future.delayed(Duration(seconds: 1));
      yield InspectionScreenState();
    }
    if (event is InspectionEvent) {
      yield InspectionScreenState();
    }
    // TODO: Add the missing events / states here
  }
}
