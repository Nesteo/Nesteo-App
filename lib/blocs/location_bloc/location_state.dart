import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationEnabledState extends LocationState {}

class LocationDisabledState extends LocationState {}
