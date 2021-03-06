import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/mapcontrol_bloc/mapcontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/blocs/dropdown_bloc/dropdown.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class BoxListScreen extends NesteoFramedScreen {
  BoxListScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
              .screenName
              .nestingBox),
          appBarLeading: null,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<DropdownBloc>(context).add(UpdateAllEvent(
                  authBloc: BlocProvider.of<AuthenticationBloc>(context)));
              BlocProvider.of<PageControlBloc>(context).add(GoToNewBoxEvent());
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.lightGreen,
          ),
          appBarActions: <Widget>[
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                BlocProvider.of<BoxDataBloc>(context)
                    .add(ChangeSortTypeEvent());
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: () {
                BlocProvider.of<BoxDataBloc>(context)
                    .add(ChangeSortDirectionEvent());
              },
            ),
          ],
        );

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    BoxDataBloc boxDataBloc = BlocProvider.of<BoxDataBloc>(context);
    MapControlBloc mapControlBloc = BlocProvider.of<MapControlBloc>(context);

    return BlocBuilder<BoxDataBloc, BoxDataState>(
      builder: (context, state) {
        if (state is InitialBoxDataState) {
          boxDataBloc.add(GetAllBoxPreviewEvent());
          return LinearProgressIndicator();
        }
        if (state is BoxReadyState) {
          // print(boxDataBloc.nestingBoxList);
          // print(boxDataBloc.nestingBoxList.length);

          return Container(
            child: ListView.builder(
              itemCount: boxDataBloc.nestingBoxList.length,
              itemBuilder: (context, index) {
                int daysSinceLastInspection = 1;
                if (boxDataBloc.nestingBoxList[index].lastInspected != null) {
                  daysSinceLastInspection = DateTime.now()
                      .difference(
                          boxDataBloc.nestingBoxList[index].lastInspected)
                      .inDays;
                }
                return Container(
                  child: Card(
                    color: Color.lerp(
                      Colors.white,
                      Colors.red,
                      log((daysSinceLastInspection + 1) / 330),
                    ),
                    child: ListTile(
                      leading: (daysSinceLastInspection > 300)
                          ? Icon(Icons.warning,
                              size: 40,
                              color: (daysSinceLastInspection > 365)
                                  ? Colors.red
                                  : Colors.yellow)
                          : Icon(Icons.check, size: 40, color: Colors.green),
                      trailing: IconButton(
                        icon: Icon(Icons.gps_fixed),
                        onPressed: () {
                          BlocProvider.of<MapControlBloc>(context).location =
                              LatLng(
                            boxDataBloc
                                .nestingBoxList[index].coordinateLatitude,
                            boxDataBloc
                                .nestingBoxList[index].coordinateLongitude,
                          );
                          BlocProvider.of<PageControlBloc>(context)
                              .add(GoToMapEvent());
                          BlocProvider.of<MapControlBloc>(context)
                              .add(CenterMapEvent(user: false));
                        },
                      ),
                      title: Text(boxDataBloc.nestingBoxList[index]
                          .id), //create testdata for listview
                      isThreeLine: false,
                      onLongPress: () {
                        BlocProvider.of<PageControlBloc>(context)
                            .add(GoToNewInspectionEvent());
                      },
                      subtitle:
                          (boxDataBloc.nestingBoxList[index].inspectionsCount ==
                                  0)
                              ? Text(loc.inspectionList.neverInspected)
                              : Text("${loc.boxList.lastInspection}"
                                  " $daysSinceLastInspection "
                                  "${loc.boxList.daysAgo}"),
                      onTap: () {
                        // Set the box Id to this selection and add get box for the info page
                        boxDataBloc.boxId =
                            boxDataBloc.nestingBoxList[index].id;
                        BlocProvider.of<BoxDataBloc>(context)
                            .add(GetBoxEvent());
                        BlocProvider.of<PageControlBloc>(context)
                            .add(GoToBoxInfoEvent());
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
        return LinearProgressIndicator(
          backgroundColor: Colors.green,
        );
      },
    );
  }
}
