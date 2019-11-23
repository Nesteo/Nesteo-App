import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/inspectiondata_bloc/inspectiondata.dart';
import 'package:nesteo_app/model/nestingbox.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:nesteo_app/blocs/snackbar_bloc/snackbar.dart';

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
                    inspectionDataBloc
                        .add(GetInspectionPreviewsByNestingBoxEvent());
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
                    title: Text(
                        "${nestingBox?.hangUpUser?.firstName} ${nestingBox?.hangUpUser?.lastName}"),
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
                    title: Text(
                        "${nestingBox?.hangUpDate?.month}/${nestingBox?.hangUpDate?.day}/${nestingBox?.hangUpDate?.year}"),
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
                    title: Text("${nestingBox.material}"),
                  ),
                ),
              ],
            );
            TableRow _holeSizeRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                      title: Text("Hole size:"),
                      leading: Icon(FontAwesomeIcons.ruler)),
                ),
                TableCell(
                  child: ListTile(
                    title: Text("${nestingBox.holeSize}"),
                  ),
                ),
              ],
            );
            TableRow _regionRow = TableRow(
              children: [
                TableCell(
                  child: ListTile(
                    title: Text("Region:"),
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
                    title: Text("Owner:"),
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
            return ListView(
              children: <Widget>[
                Card(
                  child: Image.asset(
                      'images/vogelhaus${Random().nextInt(4)}.jpg',
                      width: 600,
                      height: 240,
                      fit: BoxFit.cover),
                ),
                Card(
                  child: ListTile(
                    title: Text("${loc.boxInfo.boxId} ${nestingBox.id}"),
                    subtitle: Text(
                        "${loc.boxInfo.lastInspection}: $daysSinceLastInspection ${loc.boxInfo.daysAgo}"),
                    trailing: IconButton(
                      icon: Icon(Icons.gps_fixed),
                      onPressed: () {
                        BlocProvider.of<SnackbarBloc>(context).add(
                          ShowSnackbarEvent(
                            color: Colors.lightGreen,
                            text: "Currently in development",
                            scaffoldContext: context,
                          ),
                        );
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
}
