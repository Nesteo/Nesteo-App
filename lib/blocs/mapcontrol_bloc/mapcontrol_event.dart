import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

abstract class MapControlEvent extends Equatable {
  const MapControlEvent();
}

class CenterMapEvent extends MapControlEvent {
  @override
  List<Object> get props => null;
}

class BuildMapEvent extends MapControlEvent {
  final MapType mapType;
  final double zoom;
  final double tilt;

  BuildMapEvent({
    @required this.mapType,
    @required this.zoom,
    @required this.tilt,
  }) : super();

  @override
  List<Object> get props => null;
}

typedef Marker MarkerUpdateAction(Marker marker);

class AddMarkerEvent extends MapControlEvent {
  final Marker marker;

  AddMarkerEvent({@required this.marker}) : super();

  @override
  List<Object> get props => null;
}

class ChangeMapTypeEvent extends MapControlEvent {
  final GoogleMap map;

  ChangeMapTypeEvent({@required this.map}) : super();

  @override
  List<Object> get props => null;
}

class RebuildMapEvent extends MapControlEvent {
  @override
  List<Object> get props => null;
}
