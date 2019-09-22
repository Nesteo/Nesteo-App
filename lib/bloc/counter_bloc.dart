import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState(0);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterIncrease) {
      yield CounterState(currentState.value + 1);
    }
    if (event is CounterDecrease) {
      yield CounterState(currentState.value - 1);
    }
  }
}
