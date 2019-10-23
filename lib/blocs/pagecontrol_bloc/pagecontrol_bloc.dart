import 'dart:async';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bloc/bloc.dart';
import './pagecontrol.dart';

class PageControlBloc extends Bloc<PageControlEvent, PageControlState> {
  PageControlBloc() : super() {
    //TODO interceptor
    BackButtonInterceptor.add(myInterceptor);
  }
  bool myInterceptor(bool stopDefaultButtonEvent) {
    this.add(BackButtonEvent());
    return true;
  }

  bool navigationBarEnabled = false;
  List<PageControlState> history =
      new List(); //state history since starting the app
  @override
  PageControlState get initialState => LoginScreenState();

  @override
  Stream<PageControlState> mapEventToState(
    PageControlEvent event,
  ) async* {
    if (event is! BackButtonEvent && state != LoginScreenState()) {
      history.add(state);
    }

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
    if (event is BackButtonEvent) {
      if (history.isNotEmpty) {
        yield history.last;
        history.removeLast();
      }
    }
  }
}
