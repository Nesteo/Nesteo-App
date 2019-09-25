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

      // TODO: This is just a way to "simulate" a delay between login and map screen for now!
      await Future.delayed(Duration(seconds: 1));
      yield MapScreenState();
    }
    if (event is MapEvent) {
      yield MapScreenState();
    } 
    if (event is GoToBoxListEvent) {
      yield ToBoxListScreenState();
      // TODO: This is just a way to "simulate" a delay between login and map screen for now!
      await Future.delayed(Duration(seconds: 1));
      yield BoxListScreenState();
    }
    if (event is BoxListEvent) {
      yield BoxListScreenState();
    }

    // TODO: Add the missing events / states here
  }
}
