import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test of the basic OnlineModeBloc', () {
    OnlineModeBloc onlineModeBloc;

    setUp(() {
      onlineModeBloc = OnlineModeBloc();
    });

    test('Initial state is OnlineState', () {
      expect(onlineModeBloc.initialState, OnlineState());
    });

    test('Going offline works', () {
      final List<OnlineModeState> expected = [
        OnlineState(),
        OfflineState(),
      ];

      expectLater(
        onlineModeBloc.state,
        emitsInOrder(expected),
      );

      onlineModeBloc.dispatch(OfflineEvent());
    });

    test('Going online works', () {
      final List<OnlineModeState> expected = [
        OnlineState(),
        OfflineState(),
        OnlineState(),
      ];

      expectLater(
        onlineModeBloc.state,
        emitsInOrder(expected),
      );

      onlineModeBloc.dispatch(OfflineEvent());
      onlineModeBloc.dispatch(OnlineEvent());
    });
  });
}
