import 'package:nesteo_app/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Basic BLoC-Counter Tests', () {
    CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test('Initial value is 0', () {
      expect(counterBloc.initialState.value, 0);
    });

    test('Value changes accordingly (+)', () {
      final List<CounterState> expected = [
        CounterState(0),
        CounterState(1),
        CounterState(2),
        CounterState(3)
      ];

      expectLater(
        counterBloc.state,
        emitsInOrder(expected),
      );

      counterBloc.dispatch(CounterIncrease());
      counterBloc.dispatch(CounterIncrease());
      counterBloc.dispatch(CounterIncrease());
    });

    test('Value changes accordingly (-)', () {
      final List<CounterState> expected = [
        CounterState(0),
        CounterState(-1),
        CounterState(-2),
        CounterState(-3)
      ];

      expectLater(
        counterBloc.state,
        emitsInOrder(expected),
      );

      counterBloc.dispatch(CounterDecrease());
      counterBloc.dispatch(CounterDecrease());
      counterBloc.dispatch(CounterDecrease());
    });
  });
}
