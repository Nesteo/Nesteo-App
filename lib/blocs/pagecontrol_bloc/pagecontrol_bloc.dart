import 'dart:async';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:bloc/bloc.dart';
import './pagecontrol.dart';

/// BLoC that handles page control and transitioning.
///
/// *Author: Simon Oyen*
class PageControlBloc extends Bloc<PageControlEvent, PageControlState> {
  bool navigationBarEnabled = false;
  List<PageControlState> history = new List();
  final Map<Type, PageControlState> eventStateMap = {
    GoToMapEvent: MapScreenState(),
    GoToBoxListEvent: BoxListScreenState(),
    GoToBoxInfoEvent: BoxInfoScreenState(),
    GoToInspectionEvent: InspectionScreenState(),
    GoToNewInspectionEvent: NewInspectionScreenState(),
    GoToNewBoxEvent: NewBoxScreenState(),
    GoToInspectionListEvent: InspectionListScreenState(),
    GoToNewBoxConfirmationEvent: NewBoxConfirmationScreenState(),
  };

  PageControlBloc() : super() {
    BackButtonInterceptor.add(interceptFunc);
  }

  /// Is called when the hardware backbutton is pressed
  ///
  /// Returns true when the normal backbutton behaviour should be blocked.
  bool interceptFunc(bool stopDefaultButtonEvent) {
    this.add(BackButtonEvent());
    return true;
  }

  /// Returns the BLoCs initial state, [LoginScreenState]
  @override
  PageControlState get initialState => LoginScreenState();

  /// Maps received events to corresponding states and handles the navigationbar
  @override
  Stream<PageControlState> mapEventToState(
    PageControlEvent event,
  ) async* {
    if (event is! BackButtonEvent) {
      if (state != LoginScreenState()) {
        history.add(state);
      }
      navigationBarEnabled =
          (event is GoToMapEvent || event is GoToBoxListEvent);
    }

    PageControlState nextState = eventStateMap[event.runtimeType];

    if (nextState != null) {
      yield nextState;
    }

    if (event is BackButtonEvent) {
      if (history.isNotEmpty) {
        yield history.last;
        history.removeLast();
      }
    }
  }
}
