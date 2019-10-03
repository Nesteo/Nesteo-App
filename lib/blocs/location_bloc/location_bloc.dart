import 'dart:async';
import 'package:bloc/bloc.dart';
import 'location.dart';


class LocationBloc extends Bloc<LocationEvent, LocationState> {
  @override
  LocationState get initialState => LocationDisabledState();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is EnableLocationEvent) {
      yield LocationEnabledState();
    }
    if (event is DisableLocationEvent) {
      yield LocationDisabledState();
    }
  }
}
