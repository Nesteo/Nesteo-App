import 'package:equatable/equatable.dart';

abstract class MapControlState extends Equatable {
  const MapControlState();
}

class InitialMapControlState extends MapControlState {
  @override
  List<Object> get props => [];
}

class MapBuiltState extends MapControlState {
  @override
  List<Object> get props => [];
}

class MapReadyState extends MapControlState {
  @override
  List<Object> get props => null;
}

class MapChangingState extends MapControlState {
  @override
  List<Object> get props => null;
}
