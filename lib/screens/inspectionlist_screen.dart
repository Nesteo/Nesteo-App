import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata_bloc.dart';
import 'package:nesteo_app/blocs/inspectiondata_bloc/inspectiondata.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:intl/intl.dart';

class InspectionListScreen extends NesteoFullScreen {
  InspectionListScreen(BuildContext context)
      : super(
          context,
          hasAppBar: true,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
              .screenName
              .inspectionlist),
          appBarActions: <Widget>[
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                BlocProvider.of<InspectionDataBloc>(context)
                    .add(ChangeSortTypeEvent());
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: () {
                BlocProvider.of<InspectionDataBloc>(context)
                    .add(ChangeSortDirectionEvent());
              },
            ),
          ],
          appBarLeading: GoBackButton(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<PageControlBloc>(context)
                  .add(GoToNewInspectionEvent());
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.lightGreen,
          ),
        );
  @override
  Widget build(BuildContext context) {
    InspectionDataBloc inspectionDataBloc =
        BlocProvider.of<InspectionDataBloc>(context);
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return BlocBuilder<InspectionDataBloc, InspectionDataState>(
      builder: (context, state) {
        if (state is InitialInspectionDataState) {
          inspectionDataBloc.boxId =
              BlocProvider.of<BoxDataBloc>(context).boxId;
          inspectionDataBloc.add(GetInspectionPreviewsByNestingBoxEvent());
          return LinearProgressIndicator();
        }
        if (state is InspectionReadyState) {
          return Container(
              color: Colors.lightGreen,
              child: ListView.builder(
                itemCount: inspectionDataBloc.inspectionList.length,
                itemBuilder: (context, index) {
                  String id =
                      inspectionDataBloc.inspectionList[index].id.toString();
                  return Container(
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          inspectionDataBloc.inspectionId =
                              inspectionDataBloc.inspectionList[index].id;

                          BlocProvider.of<InspectionDataBloc>(context)
                              .add(GetInspectionEvent());
                          // BlocProvider.of<InspectionDataBloc>(context)
                          //      .add(GetInspectionPreviewsByNestingBoxEvent());
                          BlocProvider.of<PageControlBloc>(context)
                              .add(GoToInspectionEvent());
                        },
                        isThreeLine: true,
                        title: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "${loc.inspectionList.inspection} $id ",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.open_in_new)
                            ],
                          ),
                        ),
                        subtitle: Container(
                          child: DefaultTextStyle(
                            style: TextStyle(fontSize: 25, color: Colors.black),
                            child: Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: ListTile(
                                          title: Text(loc.inspectionList.date),
                                          leading: Icon(Icons.date_range)),
                                    ),
                                    TableCell(
                                      child: ListTile(
                                        title: Text(
                                          DateFormat('yyyy/MM/dd - kk:mm')
                                              .format(inspectionDataBloc
                                                  .inspectionList[index]
                                                  .inspectionDate),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: ListTile(
                                          title: Text(
                                              loc.inspectionList.condition),
                                          leading:
                                              Icon(FontAwesomeIcons.tools)),
                                    ),
                                    TableCell(
                                      child: ListTile(
                                        title: Text(inspectionDataBloc
                                            .inspectionList[index].condition),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: ListTile(
                                          title: Text(
                                              loc.inspectionList.ringedChicks),
                                          leading:
                                              Icon(FontAwesomeIcons.kiwiBird)),
                                    ),
                                    TableCell(
                                      child: ListTile(
                                        title: Text(inspectionDataBloc
                                            .inspectionList[index]
                                            .ringedChickCount
                                            .toString()),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: ListTile(
                                          title:
                                              Text(loc.inspectionList.pBirdF),
                                          leading:
                                              Icon(FontAwesomeIcons.venus)),
                                    ),
                                    TableCell(
                                      child: ListTile(
                                        title: Text(inspectionDataBloc
                                            .inspectionList[index]
                                            .femaleParentBirdDiscovery),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(children: <Widget>[
                                  TableCell(
                                    child: ListTile(
                                      title: Text(loc.inspectionList.pBirdM),
                                      leading: Icon(FontAwesomeIcons.mars),
                                    ),
                                  ),
                                  TableCell(
                                    child: ListTile(
                                      title: Text(inspectionDataBloc
                                          .inspectionList[index]
                                          .femaleParentBirdDiscovery),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ));
        }
        return LinearProgressIndicator(
          backgroundColor: Colors.green,
        );
      },
    );
  }
}
