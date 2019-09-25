import 'dart:async';
import 'package:bloc/bloc.dart';
import './pagecontrol.dart';

class PageControlBloc extends Bloc<PageControlEvent, PageControlState> {
  @override
  PageControlState get initialState => InitialPagecontrolState();

  @override
  Stream<PageControlState> mapEventToState(
    PageControlEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
