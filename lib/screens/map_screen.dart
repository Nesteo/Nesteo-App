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
import 'package:nesteo_app/location_model.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:scoped_model/scoped_model.dart';

class MapScreen extends NesteoFramedScreen {
  static LocationModel locationModel = new LocationModel();
  MapScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(
              Localizations.of<LocaleBase>(context, LocaleBase).screenName.map),
          appBarActions: <Widget>[
            OnlineModeButton(),
              // Get location coordinates. Prompts for permission if not granted yet
              // Reloads page.
              RaisedButton(
            onPressed: () async {
              Position position = await Geolocator()
                  .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              print(position.latitude);
              print(position.longitude);
              locationModel.updateLocation(
                  LatLng(position.latitude, position.longitude));
              BlocProvider.of<PageControlBloc>(context).dispatch(GoToMapEvent());
            },
            child: Icon(Icons.location_on),
          ),
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
    print(locationModel.location);
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: locationModel.location,
          zoom: 16,
          tilt: 20,
        ),
        mapType: MapType.normal,
      ),
    );
  }
}
