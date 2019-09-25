import 'dart:async';
import 'package:bloc/bloc.dart';
import './onlinemode.dart';

class OnlineModeBloc extends Bloc<OnlineModeEvent, OnlineModeState> {
  @override
  OnlineModeState get initialState => OnlineState();

  @override
  Stream<OnlineModeState> mapEventToState(
    OnlineModeEvent event,
  ) async* {
    if (event is OnlineEvent) {
      yield OnlineState();
    }
    if (event is OfflineEvent) {
      yield OfflineState();
    }
  }
}
