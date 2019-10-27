import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata_bloc.dart';
import 'package:nesteo_app/blocs/mapcontrol_bloc/mapcontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/blocs/snackbar_bloc/snackbar.dart';
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
                if (await Geolocator().isLocationServiceEnabled()) {
                  mapControlBloc.add(CenterMapEvent());
                  //mapControlBloc.add(RebuildMapEvent());
                } else {
                  BlocProvider.of<SnackbarBloc>(context).add(
                    ShowSnackbarEvent(
                        color: Colors.red,
                        text: "Location Services disabled",
                        scaffoldContext: context),
                  );
                }
              },
              icon: Icon(Icons.gps_fixed),
            ),
            IconButton(
              onPressed: () async {
                MapControlBloc mapControlBloc =
                    BlocProvider.of<MapControlBloc>(context);
                mapControlBloc.add(
                  BuildMapEvent(
                    mapType: (mapControlBloc.mapType == MapType.normal)
                        ? MapType.hybrid
                        : MapType.normal,
                    tilt: mapControlBloc.tilt,
                    zoom: mapControlBloc.zoom,
                    markers: mapControlBloc.markers,
                    nestingBoxList: mapControlBloc.nestingBoxList,
                  ),
                );
              },
              icon: Icon(Icons.layers),
            ),
          ],
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              BlocProvider.of<PageControlBloc>(context).add(GoToNewBoxEvent());
            },
            icon: Icon(Icons.add),
            label: Text(Localizations.of<LocaleBase>(context, LocaleBase)
                .screenName
                .boxNew),
            backgroundColor: Colors.lightGreen,
          ),
        );

  @override
  Widget build(BuildContext context) {
    MapControlBloc mapControlBloc = BlocProvider.of<MapControlBloc>(context);
    BoxDataBloc boxDataBloc = BlocProvider.of<BoxDataBloc>(context);

    return Container(
      child: BlocBuilder<MapControlBloc, MapControlState>(
        condition: (previousState, state) =>
            state.runtimeType != previousState.runtimeType,
        builder: (context, mapState) {
          if (mapState is InitialMapControlState) {
            boxDataBloc.add(GetAllBoxPreviewEvent());
            mapControlBloc.add(
              BuildMapEvent(
                mapType: MapType.normal,
                zoom: 16,
                tilt: 20,
                markers: null,
                nestingBoxList: [],
              ),
            );
          }

          if (mapState is MapReadyState || mapState is MapBuiltState) {
            return BlocBuilder<BoxDataBloc, BoxDataState>(
              builder: (context, boxState) {
                if (boxState is BoxReadyState) {
                  if (mapState is MapBuiltState) {
                    mapControlBloc.add(RebuildMapEvent(
                        nestingBoxList: boxDataBloc.nestingBoxList));
                  }
                }
                return mapControlBloc.googleMap;
              },
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
