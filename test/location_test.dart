import 'package:nesteo_app/blocs/location_bloc/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test of the basic locationBloc', () {
    LocationBloc locationBloc;

    setUp(() {
      locationBloc = LocationBloc();
    });

    test('Initial state is LocationDisabledState', () {
      expect(locationBloc.initialState, LocationDisabledState());
    });

    test('Going online works', () {
      final List<LocationState> expected = [
        LocationDisabledState(),
        LocationEnabledState(),
      ];

      expectLater(
        locationBloc.state,
        emitsInOrder(expected),
      );

      locationBloc.dispatch(EnableLocationEvent());
    });

    test('Going offline works', () {
      final List<LocationState> expected = [
        LocationDisabledState(),
        LocationEnabledState(),
        LocationDisabledState(),
      ];

      expectLater(
        locationBloc.state,
        emitsInOrder(expected),
      );

      locationBloc.dispatch(EnableLocationEvent());
      locationBloc.dispatch(DisableLocationEvent());
    });
  });
}
