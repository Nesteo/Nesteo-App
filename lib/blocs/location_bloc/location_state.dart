import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationEnabledState extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationDisabledState extends LocationState {
  @override
  List<Object> get props => [];
}
