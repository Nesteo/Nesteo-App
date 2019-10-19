import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test of the basic PageControlBloc', () {
    PageControlBloc pageControlBloc;

    setUp(() {
      pageControlBloc = PageControlBloc();
    });

    test('Initial state is LoginScreenState', () {
      expect(pageControlBloc.initialState, LoginScreenState());
    });

    test('Login to Transition to Map States working', () {
      final List<PageControlState> expected = [
        LoginScreenState(),
        ToMapScreenState(),
        MapScreenState(),
        ToBoxListScreenState(),
        BoxListScreenState(),
        ToNewBoxScreenState(),
        NewBoxScreenState(),
        ToBoxInfoScreenState(),
        BoxInfoScreenState(),
        ToInspectionScreenState(),
        InspectionScreenState(),
      ];

      expectLater(
        pageControlBloc,
        emitsInOrder(expected),
      );

      pageControlBloc.add(GoToHomeEvent());
      pageControlBloc.add(GoToMapEvent());
      pageControlBloc.add(GoToBoxListEvent());
      pageControlBloc.add(GoToNewBoxEvent());
      pageControlBloc.add(GoToBoxInfoEvent());
      pageControlBloc.add(GoToInspectionEvent());
    });
  });
}
