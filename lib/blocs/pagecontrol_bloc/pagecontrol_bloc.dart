import 'dart:async';
import 'package:bloc/bloc.dart';
import './pagecontrol.dart';

class PagecontrolBloc extends Bloc<PagecontrolEvent, PagecontrolState> {
  @override
  PagecontrolState get initialState => InitialPagecontrolState();

  @override
  Stream<PagecontrolState> mapEventToState(
    PagecontrolEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
