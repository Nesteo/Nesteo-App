import 'dart:async';
import 'package:bloc/bloc.dart';
import './pagecontrol.dart';

class PageControlBloc extends Bloc<PageControlEvent, PageControlState> {
  List<PageControlState> history =
      new List(); //state history since starting the app
  @override
  PageControlState get initialState => LoginScreenState();

  @override
  Stream<PageControlState> mapEventToState(
    PageControlEvent event,
  ) async* {
    if (event is GoToMapEvent) {
      history.add(currentState);
      print(currentState.toString());
      yield ToMapScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield MapScreenState();
    }

    if (event is MapEvent) {
      yield MapScreenState();
    }

    if (event is GoToBoxListEvent) {
      history.add(currentState);
      print(currentState.toString());
      yield ToBoxListScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield BoxListScreenState();
    }

    if (event is BoxListEvent) {
      yield BoxListScreenState();
    }

    if (event is GoToNewBoxEvent) {
      history.add(currentState);
      print(currentState.toString());
      yield ToNewBoxScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield NewBoxScreenState();
    }

    if (event is NewBoxEvent) {
      yield NewBoxScreenState();
    }

    if (event is GoToBoxInfoEvent) {
      history.add(currentState);
      print(currentState.toString());
      yield ToBoxInfoScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield BoxInfoScreenState();
    }

    if (event is BoxInfoEvent) {
      yield BoxInfoScreenState();
    }

    if (event is GoToInspectionEvent) {
      history.add(currentState);
      print(currentState.toString());
      yield ToInspectionScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield InspectionScreenState();
    }

    if (event is InspectionEvent) {
      yield InspectionScreenState();
    }

    if (event is GoToNewInspectionEvent) {
      history.add(currentState);
      print(currentState.toString());
      yield ToNewInspectionScreenState();

      await Future.delayed(Duration(seconds: 1));
      yield NewInspectionScreenState();
    }

    if (event is NewInspectionEvent) {
      yield NewInspectionScreenState();
    }
    if (event is BackbuttonEvent) {
      if (history.isNotEmpty) {
        yield history.last;
        history.removeLast();
      }

      //TODO: define backbuttonevent
    }
    //Add the missing events / states here
  }
}
