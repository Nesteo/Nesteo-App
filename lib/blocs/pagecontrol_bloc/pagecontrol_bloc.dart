import 'dart:async';
import 'package:bloc/bloc.dart';
import './pagecontrol.dart';

class PageControlBloc extends Bloc<PageControlEvent, PageControlState> {
  bool navigationBarEnabled = false;

  @override
  PageControlState get initialState => LoginScreenState();

  @override
  Stream<PageControlState> mapEventToState(
    PageControlEvent event,
  ) async* {
    if (event is GoToMapEvent) {
      navigationBarEnabled = true;
      yield MapScreenState();
    }

    if (event is GoToBoxListEvent) {
      navigationBarEnabled = true;
      yield BoxListScreenState();
    }

    if (event is GoToNewBoxEvent) {
      navigationBarEnabled = false;
      yield NewBoxScreenState();
    }

    if (event is GoToBoxInfoEvent) {
      navigationBarEnabled = false;
      yield BoxInfoScreenState();
    }

    if (event is GoToInspectionEvent) {
      navigationBarEnabled = false;
      yield InspectionScreenState();
    }

    if (event is GoToNewInspectionEvent) {
      navigationBarEnabled = false;
      yield NewInspectionScreenState();
    }
  }
}
