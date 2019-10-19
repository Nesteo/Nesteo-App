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
      yield MapScreenState();
    }

    if (event is GoToBoxListEvent) {
      yield BoxListScreenState();
    }

    if (event is GoToNewBoxEvent) {
      yield NewBoxScreenState();
    }

    if (event is GoToBoxInfoEvent) {
      yield BoxInfoScreenState();
    }

    if (event is GoToInspectionEvent) {
      yield InspectionScreenState();
    }

    if (event is GoToNewInspectionEvent) {
      yield NewInspectionScreenState();
    }
  }
}
