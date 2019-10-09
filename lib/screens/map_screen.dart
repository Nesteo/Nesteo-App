import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/mapcontrol_bloc/mapcontrol.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class MapScreen extends NesteoFramedScreen {
  MapScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(
              Localizations.of<LocaleBase>(context, LocaleBase).screenName.map),
          appBarActions: <Widget>[
            // Get location coordinates. Prompts for permission if not granted yet
            // Reloads page.
            IconButton(
              onPressed: () async {
                MapControlBloc mapControlBloc =
                    BlocProvider.of<MapControlBloc>(context);
                mapControlBloc.dispatch(CenterMapEvent());
              },
              icon: Icon(Icons.gps_fixed),
            ),
            IconButton(
              onPressed: () async {
                MapControlBloc mapControlBloc =
                    BlocProvider.of<MapControlBloc>(context);
                mapControlBloc.dispatch(
                  BuildMapEvent(
                    mapType: (mapControlBloc.mapType == MapType.normal)
                        ? MapType.hybrid
                        : MapType.normal,
                    tilt: mapControlBloc.tilt,
                    zoom: mapControlBloc.zoom,
                  ),
                );
              },
              icon: Icon(Icons.layers),
            ),
            //OnlineModeButton(),
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
    MapControlBloc mapControlBloc = BlocProvider.of<MapControlBloc>(context);
    return Container(
      child: BlocBuilder<MapControlBloc, MapControlState>(
        builder: (context, state) {
          if (state is InitialMapControlState) {
            print('Constructing Map');
            mapControlBloc.dispatch(
              BuildMapEvent(
                mapType: MapType.normal,
                zoom: 16,
                tilt: 20,
              ),
            );
            return CircularProgressIndicator();
          }
          if (state is MapReadyState) {
            return mapControlBloc.map;
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
