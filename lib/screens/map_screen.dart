import 'dart:ffi';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class MapScreen extends NesteoFramedScreen {
  MapScreen(BuildContext context)
      : super(context,
            appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
                .screenName
                .map),
            appBarActions: <Widget>[
              OnlineModeButton(),
            ],
            floatingActionButton: 
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<PageControlBloc>(context)
                      .dispatch(GoToNewBoxEvent());
                  BlocProvider.of<FrameControlBloc>(context)
                      .dispatch(DisableFrameEvent());
                },
                child: Icon(Icons.add),
                backgroundColor: (BlocProvider.of<OnlineModeBloc>(context)
                        .currentState is OnlineState)
                    ? Colors.lightGreen
                    : Colors.red,
              ),
            raisedButton:

              RaisedButton(
                onPressed: () async {
                  Position position = await Geolocator().getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  print(position.latitude);
                  print(position.longitude);
                },
                child: Icon(Icons.location_on),
              ),
            );

  @override
  Widget build(BuildContext context) {
    LatLng gpsCoord = LatLng(52.3537269, 9.724127);
    Geolocator geolocator = new Geolocator();
    GeolocationStatus geolocationStatus = GeolocationStatus.denied;
    Position coordinates;

    geolocator.checkGeolocationPermissionStatus().then((status) {
      geolocationStatus = status;
      if (geolocationStatus == GeolocationStatus.granted) {
        geolocator
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
            .then((position) {
          coordinates = position;
          print(coordinates.latitude);
          print(coordinates.longitude);
          gpsCoord = LatLng(coordinates.latitude, coordinates.longitude);
          return Container(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: gpsCoord,
                zoom: 16,
                tilt: 20,
              ),
              mapType: MapType.normal,
            ),
          );
        });
      }
    });
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: gpsCoord,
          zoom: 16,
          tilt: 20,
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
