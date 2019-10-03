import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class EnableLocationEvent extends LocationEvent {}

class DisableLocationEvent extends LocationEvent {}
