import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locationPackage;
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/location/location_service.dart';
import 'package:nesteo_app/location/user_location.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:provider/provider.dart';

class MapScreen extends NesteoFramedScreen {
  MapScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(
              Localizations.of<LocaleBase>(context, LocaleBase).screenName.map),
          appBarActions: <Widget>[
            OnlineModeButton(),
          ],
          floatingActionButton: FloatingActionButton(
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
        );

  @override
  Widget build(BuildContext context) {
    // locationPackage.Location _locationService = new locationPackage.location();
    // bool _permission = false;
    // var userLocation = Provider.of<UserLocation>(context);
    // print(userLocation.latitude);
    // print(userLocation.longitude);
    // Location location = new Location();
    // var currentLocation = location.getLocation();
    // double latitude = 43.0;
    // double longitude = -86.0;
    // print(currentLocation.toString());
    // location.onLocationChanged().listen((LocationData currentLocation) {
    //   const LatLng device = LatLng(currentLocation.latitude, longitude);
    //   print(currentLocation.latitude);
    //   print(currentLocation.longitude);
    //   // latitude = currentLocation.latitude;
    //   // longitude = currentLocation.longitude;
    // });
    const LatLng gvsuPosition = LatLng(42.9639, -85.8889);
    // const LatLng hshPosition = LatLng(52.3537269, 9.724127);

    return Container(
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: gvsuPosition,
          zoom: 13,
          tilt: 20,
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
