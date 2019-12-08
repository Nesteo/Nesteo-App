import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/inspectiondata_bloc/inspectiondata.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/dropdown_bloc/dropdown.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:nesteo_app/blocs/mapcontrol_bloc/mapcontrol.dart';

class BoxInfoScreen extends NesteoFullScreen {
  BoxInfoScreen(BuildContext context)
      : super(context,
            hasAppBar: true,
            appBarTitle: Text(
                "${Localizations.of<LocaleBase>(context, LocaleBase).screenName.boxInfo} "),
            appBarActions: null,
            appBarLeading: GoBackButton());

  @override
  Widget build(BuildContext context) {
    PageControlBloc pageControlBloc = BlocProvider.of<PageControlBloc>(context);
    BoxDataBloc boxDataBloc = BlocProvider.of<BoxDataBloc>(context);
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      color: Colors.lightGreen,
      child: BlocBuilder<BoxDataBloc, BoxDataState>(
        builder: (context, state) {
          if (state is InitialBoxDataState) {
            boxDataBloc.add(GetBoxEvent());
            return LinearProgressIndicator();
          }
          if (state is BoxChangingState) {
            return LinearProgressIndicator();
          }
          if (state is BoxReadyState) {
            NestingBox nestingBox = boxDataBloc.nestingBox;
            int daysSinceLastInspection = 1;
            if (nestingBox.lastInspected == null &&
                nestingBox.hangUpDate != null) {
              daysSinceLastInspection =
                  DateTime.now().difference(nestingBox.hangUpDate).inDays;
            } else if (nestingBox.lastInspected != null) {
              daysSinceLastInspection =
                  DateTime.now().difference(nestingBox.lastInspected).inDays;
            }
            Row _inspectionButtons = Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.add),
                  label: Text(loc.boxInfo.newInspection,
                      style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    BlocProvider.of<DropdownBloc>(context).add(
                        UpdateSpeciesEvent(
                            authBloc:
                                BlocProvider.of<AuthenticationBloc>(context)));
                    pageControlBloc.add(GoToNewInspectionEvent());
                  },
                ),
                FlatButton.icon(
                  icon: Icon(Icons.list),
                  label: Text(loc.boxInfo.showInspections,
                      style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    var inspectionDataBloc =
                        BlocProvider.of<InspectionDataBloc>(context);
                    inspectionDataBloc.boxId =
                        BlocProvider.of<BoxDataBloc>(context).boxId;
                    print(inspectionDataBloc.state);
                    inspectionDataBloc
                        .add(GetInspectionPreviewsByNestingBoxEvent());
                    print(inspectionDataBloc.boxId);
                    print(inspectionDataBloc.inspectionList[0].id);
                    pageControlBloc.add(GoToInspectionListEvent());
                  },
                ),
              ],
            );

            TableRow _hangUpUserRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                    title: Text(loc.boxInfo.hangedUpBy),
                    leading: Icon(FontAwesomeIcons.tools),
                  ),
                ),
                TableCell(
                  child: ListTile(
                    title: (nestingBox.hangUpUser != null)
                        ? Text(
                            "${nestingBox?.hangUpUser?.firstName} ${nestingBox?.hangUpUser?.lastName}")
                        : Text("-"),
                  ),
                ),
              ],
            );

            TableRow _hangUpDateRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                    title: Text(loc.boxInfo.hangupDate),
                    leading: Icon(FontAwesomeIcons.calendarAlt),
                  ),
                ),
                TableCell(
                  child: ListTile(
                    title: (nestingBox.hangUpDate != null)
                        ? Text(
                            "${nestingBox?.hangUpDate?.month}/${nestingBox?.hangUpDate?.day}/${nestingBox?.hangUpDate?.year}")
                        : Text("-"),
                  ),
                ),
              ],
            );

            TableRow _inspectionCountRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                      title: Text(loc.boxInfo.inspected),
                      leading: Icon(FontAwesomeIcons.search)),
                ),
                TableCell(
                  child: ListTile(
                    title: Text(
                        "${nestingBox.inspectionsCount} ${loc.boxInfo.times}"),
                  ),
                ),
              ],
            );

            TableRow _materialRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                      title: Text(loc.boxInfo.material),
                      leading: Icon(FontAwesomeIcons.box)),
                ),
                TableCell(
                  child: ListTile(
                    title: Text(
                        getMaterialName("${nestingBox.material}", context)),
                  ),
                ),
              ],
            );
            TableRow _holeSizeRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                      title: Text("${loc.boxNew.holeSize}:"),
                      leading: Icon(FontAwesomeIcons.ruler)),
                ),
                TableCell(
                  child: ListTile(
                    title: Text(
                        getHoleSizeName("${nestingBox.holeSize}", context)),
                  ),
                ),
              ],
            );
            TableRow _regionRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                    title: Text("${loc.boxNew.region}:"),
                    leading: Icon(FontAwesomeIcons.globe),
                  ),
                ),
                TableCell(
                  child: ListTile(
                    title: Text(nestingBox.region.name),
                  ),
                ),
              ],
            );
            TableRow _ownerRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                    title: Text("${loc.boxNew.owner}:"),
                    leading: Icon(FontAwesomeIcons.userAlt),
                  ),
                ),
                TableCell(
                  child: ListTile(
                    title: Text(nestingBox.owner.name),
                  ),
                ),
              ],
            );
            TableRow _commentRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                    title: Text(loc.boxInfo.comment),
                    leading: Icon(FontAwesomeIcons.pen),
                  ),
                ),
                TableCell(
                  child: ListTile(
                    title: Text(
                        (nestingBox.comment != null) ? nestingBox.comment : ""),
                  ),
                ),
              ],
            );

            Table _informationTable = Table(
              children: [
                _hangUpUserRow,
                _hangUpDateRow,
                _inspectionCountRow,
                _materialRow,
                _holeSizeRow,
                _regionRow,
                _ownerRow,
                _commentRow,
              ],
            );
            AuthenticationBloc authBloc =
                BlocProvider.of<AuthenticationBloc>(context);
            return ListView(
              children: <Widget>[
                Card(
                  child: boxDataBloc.nestingBox.hasImage
                      ? Image.network(
                          "https://${authBloc.domain}/api/v1/nesting-boxes/${boxDataBloc.nestingBox.id}/image",
                          width: 600,
                          height: 240,
                          headers: {"Authorization": authBloc.auth},
                          fit: BoxFit.cover)
                      : Image.network(
                          "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fbs.cyty.com%2Fmenschen%2Fe-etzold%2Farchiv%2FTV%2Ftest%2Fimg%2FFuBK-Testbild16.jpg&f=1&nofb=1",
                          width: 600,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                ),
                Card(
                  child: ListTile(
                    title: Text("${loc.boxInfo.boxId} ${nestingBox.id}"),
                    subtitle: Text(
                        "${loc.boxInfo.lastInspection}: $daysSinceLastInspection ${loc.boxInfo.daysAgo}"),
                    trailing: IconButton(
                      icon: Icon(Icons.gps_fixed),
                      onPressed: () {
                        BlocProvider.of<MapControlBloc>(context).location =
                            LatLng(
                          boxDataBloc.nestingBox.coordinateLatitude,
                          boxDataBloc.nestingBox.coordinateLongitude,
                        );
                        BlocProvider.of<PageControlBloc>(context)
                            .add(GoToMapEvent());
                        BlocProvider.of<MapControlBloc>(context)
                            .add(CenterMapEvent(user: false));
                      },
                    ),
                  ),
                ),
                Card(
                  child: _inspectionButtons,
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(loc.boxInfo.information,
                            style: TextStyle(fontSize: 18)),
                      ),
                      Container(
                        child: DefaultTextStyle(
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          child: _informationTable,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  String getMaterialName(String value, BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      "Other": loc.boxNew.otherMaterial,
      "TreatedWood": loc.boxNew.treatedWood,
      "UntreatedWood": loc.boxNew.untreatedWood,
      "WoodConcrete": loc.boxNew.concrete,
    };
    return map[value];
  }

  String getHoleSizeName(String value, BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      "Other": loc.holeSizeMapping.other,
      "Small": loc.holeSizeMapping.small,
      "Medium": loc.holeSizeMapping.medium,
      "Large": loc.holeSizeMapping.large,
      "VeryLarge": loc.holeSizeMapping.veryLarge,
      "Oval": loc.holeSizeMapping.oval,
      "OpenFronted": loc.holeSizeMapping.openFrontend,
    };
    return map[value];
  }
}
