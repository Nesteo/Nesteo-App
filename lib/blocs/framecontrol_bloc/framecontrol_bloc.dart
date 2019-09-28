import 'dart:async';
import 'package:bloc/bloc.dart';
import './framecontrol.dart';

class FrameControlBloc extends Bloc<FrameControlEvent, FrameControlState> {
  @override
  FrameControlState get initialState => FrameDisabledState();

  @override
  Stream<FrameControlState> mapEventToState(
    FrameControlEvent event,
  ) async* {
    if (event is EnableFrameEvent) {
      yield FrameEnabledState();
    }
    if (event is DisableFrameEvent) {
      yield FrameDisabledState();
    }
  }
}
