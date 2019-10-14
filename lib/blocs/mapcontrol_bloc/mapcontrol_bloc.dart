import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './mapcontrol.dart';

class MapControlBloc extends Bloc<MapControlEvent, MapControlState> {
  GoogleMapController controller;
  GoogleMap map;
  LatLng location = LatLng(52.3537269, 9.724127);
  MapType mapType = MapType.normal;
  double zoom = 16;
  double tilt = 20;

  @override
  MapControlState get initialState => InitialMapControlState();

  @override
  Stream<MapControlState> mapEventToState(
    MapControlEvent event,
  ) async* {
    print(event.toString());
    if (event is RebuildMapEvent) {
      this.dispatch(
        BuildMapEvent(
          mapType: this.mapType,
          markers: this.map.markers,
          tilt: this.tilt,
          zoom: this.zoom,
        ),
      );
    }
    if (event is BuildMapEvent) {
      if (this.currentState is! InitialMapControlState) {
        yield MapChangingState();
      }
      print('BuildMapEvent');
      location = this.location;
      mapType = event.mapType;

      this.map = GoogleMap(
        initialCameraPosition: CameraPosition(
          target: this.location,
          zoom: event.zoom,
          tilt: event.tilt,
        ),
        markers: event.markers,
        mapType: this.mapType,
        onMapCreated: (GoogleMapController newController) {
          this.controller = newController;
        },
      );
      yield MapReadyState();
    }
    if (event is CenterMapEvent) {
      print('Centering');
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      print('${position.latitude}, ${position.longitude}');
      this.location = LatLng(position.latitude, position.longitude);
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: this.location,
        zoom: this.zoom,
        tilt: this.tilt,
      )));
      print('Animation finished');
    }
  }
}
