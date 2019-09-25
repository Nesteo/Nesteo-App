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
        // ToHomeScreenState(),
        // HomeScreenState(),
        ToMapScreenState(),
        MapScreenState(),
        ToBoxListScreenState(),
        BoxListScreenState(),
        ToNewBoxScreenState(),
        NewBoxScreenState(),
        ToInfoBoxScreenState(),
        InfoBoxScreenState(),
        ToInspectionScreenState(),
        InspectionScreenState(),
      ];

      expectLater(
        pageControlBloc.state,
        emitsInOrder(expected),
      );

      // pageControlBloc.dispatch(GoToHomeEvent());
      pageControlBloc.dispatch(GoToMapEvent());
      pageControlBloc.dispatch(GoToBoxListEvent());
      pageControlBloc.dispatch(GoToNewBoxEvent());
      pageControlBloc.dispatch(GoToInfoBoxEvent());
      pageControlBloc.dispatch(GoToInspectionEvent());
    });
  });
}
