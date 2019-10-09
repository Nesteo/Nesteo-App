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

    test('Going offline works', () {
      final List<LocationState> expected = [
        LocationEnabledState(),
        LocationDisabledState(),
      ];

      expectLater(
        locationBloc.state,
        emitsInOrder(expected),
      );

      locationBloc.dispatch(DisableLocationEvent());
    });

    test('Going online works', () {
      final List<LocationState> expected = [
        LocationEnabledState(),
        LocationDisabledState(),
        LocationEnabledState(),
      ];

      expectLater(
        locationBloc.state,
        emitsInOrder(expected),
      );

      locationBloc.dispatch(DisableLocationEvent());
      locationBloc.dispatch(EnableLocationEvent());
    });
  });
}
