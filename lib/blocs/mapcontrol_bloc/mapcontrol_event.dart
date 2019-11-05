import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:nesteo_app/model/nestingbox.dart';

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
  final Set<Marker> markers;
  final List<NestingBox> nestingBoxList;

  BuildMapEvent({
    @required this.mapType,
    @required this.zoom,
    @required this.tilt,
    @required this.markers,
    @required this.nestingBoxList,
  }) : super();

  @override
  List<Object> get props => null;
}

class UpdateBoxMarkerEvent extends MapControlEvent {
  @override
  List<Object> get props => null;
}

class AddMarkerEvent extends MapControlEvent {
  final LatLng location;
  final String markerId;
  final String infoWindowText;

  AddMarkerEvent({
    @required this.location,
    @required this.markerId,
    @required this.infoWindowText,
  }) : super();

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
  final List<NestingBox> nestingBoxList;

  RebuildMapEvent({@required this.nestingBoxList}) : super();

  @override
  List<Object> get props => null;
}
