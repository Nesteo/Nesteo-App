import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nesteo_app/blocs/inspectiondata_bloc/inspectiondata.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol_bloc.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class InspectionScreen extends NesteoFullScreen {
  InspectionScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
              .screenName
              .inspectionInfo),
          appBarLeading: GoBackButton(),
          appBarActions: null,
          hasAppBar: true,
        );

  @override
  Widget build(BuildContext context) {
    PageControlBloc pageControlBloc = BlocProvider.of<PageControlBloc>(context);
    InspectionDataBloc inspectionDataBloc =
        BlocProvider.of<InspectionDataBloc>(context);
    return Container(
      color: Colors.lightGreen,
      child: BlocBuilder<InspectionDataBloc, InspectionDataState>(
        builder: (context, state) {
          if (state is InitialInspectionDataState) {
            inspectionDataBloc.add(GetInspectionEvent());
            return LinearProgressIndicator();
          }
          if (state is InspectionChangingState) {
            return LinearProgressIndicator();
          }
          if (state is InspectionReadyState) {
            return ListView(children: <Widget>[
              Card(
                child: Image.asset('images/vogelhaus${Random().nextInt(4)}.jpg',
                    width: 600, height: 240, fit: BoxFit.cover),
              ),
              Card(
                child: ListTile(
                  title: Text(
                      "Inspection ID: ${inspectionDataBloc.inspection.id.toString()}"),
                  subtitle: Text(
                      "Last Inspection: ${inspectionDataBloc.inspection.inspectionDate.month}/${inspectionDataBloc.inspection.inspectionDate.day}/${inspectionDataBloc.inspection.inspectionDate.year}"),
                ),
              ),
              Card(
                child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(children: [
                          Icon(FontAwesomeIcons.tools),
                          Text(""),
                        ]),
                      ),
                      Container(
                        child: Table(
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Cleaned:"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.hasBeenCleaned
                                      .toString()),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Condition:"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(
                                      inspectionDataBloc.inspection.condition),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Repaired:"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.justRepaired
                                      .toString()),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(children: [
                          Icon(FontAwesomeIcons.egg),
                          Text(""),
                        ]),
                      ),
                      Container(
                        child: Table(
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Contains eggs::"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.containsEggs
                                      .toString()),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Number of eggs:"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.eggCount
                                      .toString()),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(children: [
                          Icon(FontAwesomeIcons.kiwiBird),
                          Text(""),
                        ]),
                      ),
                      Container(
                        child: Table(
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Banded Chicks:"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.ringedChickCount
                                      .toString()),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Number of chicks:"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.chickCount
                                      .toString()),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Male parent"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.maleParentBirdDiscovery),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Female parent:"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.femaleParentBirdDiscovery),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text("Species"),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(inspectionDataBloc
                                      .inspection.species
                                      .toString()),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          }
        },
      ),
    );
  }
}
