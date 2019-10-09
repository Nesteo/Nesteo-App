import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class EnableLocationEvent extends LocationEvent {
  @override
  List<Object> get props => [];
}

class DisableLocationEvent extends LocationEvent {
  @override
  List<Object> get props => [];
}
