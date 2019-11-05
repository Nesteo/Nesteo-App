import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import './mapcontrol.dart';

typedef Marker MarkerUpdateAction(Marker marker);

class MapControlBloc extends Bloc<MapControlEvent, MapControlState> {
  GoogleMapController controller;
  GoogleMap googleMap;
  Set<Marker> markers;
  LatLng location = LatLng(52.3537269, 9.724127);
  MapType mapType = MapType.normal;
  double zoom = 16;
  double tilt = 20;
  List<NestingBox> nestingBoxList;
  LatLngBounds bounds;
  bool created = false;

  @override
  MapControlState get initialState => InitialMapControlState();

  @override
  Stream<MapControlState> mapEventToState(
    MapControlEvent event,
  ) async* {
    if (event is RebuildMapEvent) {
      this.add(
        BuildMapEvent(
          mapType: this.mapType,
          tilt: this.tilt,
          zoom: this.zoom,
          markers: this.markers,
          nestingBoxList: event.nestingBoxList,
        ),
      );
    }

    if (event is BuildMapEvent) {
      if (this.state is! InitialMapControlState) {
        yield MapChangingState();
      }
      location = this.location;
      mapType = event.mapType;
      nestingBoxList = event.nestingBoxList;

      this.googleMap = GoogleMap(
        initialCameraPosition: CameraPosition(
          target: this.location,
          zoom: event.zoom,
          tilt: event.tilt,
        ),
        mapType: this.mapType,
        onMapCreated: (GoogleMapController newController) async {
          this.controller = newController;
          this.bounds = await controller.getVisibleRegion();

          if (await Geolocator().isLocationServiceEnabled()) {
            this.add(CenterMapEvent());
          }
          created = true;
        },
        markers: this.markers,
        mapToolbarEnabled: false,
        onCameraIdle: () async {
          if (created) {
            LatLngBounds newBounds = await controller.getVisibleRegion();
            bool changed =
                newBounds.northeast.latitude != bounds.northeast.latitude;
            print("${DateTime.now()} $changed");
            if (changed) {
              bounds = newBounds;
              print("${DateTime.now()} Sending Event");
              this.add(UpdateBoxMarkerEvent());
            }
          }
        },
      );
      if (nestingBoxList.length == 0) {
        yield MapBuiltState();
      } else {
        yield MapReadyState();
      }
    }

    if (event is CenterMapEvent) {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      this.location = LatLng(position.latitude, position.longitude);

      this.add(
        AddMarkerEvent(
            location: this.location,
            infoWindowText: "You are here!",
            markerId: "user"),
      );

      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: this.location,
            zoom: this.zoom,
            tilt: this.tilt,
          ),
        ),
      );
    }

    if (event is AddMarkerEvent) {
      final Marker newMarker = Marker(
        markerId: MarkerId(event.markerId),
        position: event.location,
        infoWindow: InfoWindow(title: event.infoWindowText),
        onTap: () {},
      );

      if (this.markers == null) {
        this.markers = Set<Marker>();
      }

      this.markers.removeWhere((marker) {
        return marker.markerId.value == event.markerId;
      });
      this.markers.add(newMarker);
      this.add(RebuildMapEvent(nestingBoxList: nestingBoxList));
    }

    if (event is UpdateBoxMarkerEvent && bounds != null) {
      print("${DateTime.now()} Receiving event (${nestingBoxList.length})");
      Set<Marker> boxMarkers = Set<Marker>();
      this.location = LatLng(
          bounds.northeast.latitude -
              (bounds.northeast.latitude - bounds.southwest.latitude) / 2,
          bounds.northeast.longitude -
              (bounds.northeast.longitude - bounds.southwest.longitude) / 2);

      for (NestingBox box in this.nestingBoxList) {
        LatLng boxLoc = LatLng(box.coordinateLatitude, box.coordinateLongitude);
        if (bounds.contains(boxLoc)) {
          boxMarkers.add(
            Marker(
              markerId: MarkerId(box.id),
              position: LatLng(box.coordinateLatitude, box.coordinateLongitude),
              infoWindow: InfoWindow(title: box.id),
              onTap: () {},
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
            ),
          );
        }
      }

      if (this.markers == null) {
        this.markers = Set<Marker>();
      } else {
        this.markers.retainWhere((marker) {
          return marker.markerId.value == "user";
        });
      }

      this.markers.addAll(boxMarkers);

      this.add(RebuildMapEvent(nestingBoxList: nestingBoxList));
    }
  }
}
