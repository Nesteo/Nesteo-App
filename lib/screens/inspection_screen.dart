import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
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
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
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
            InspectionDataBloc inspectionDataBloc =
                BlocProvider.of<InspectionDataBloc>(context);
            AuthenticationBloc authBloc =
                BlocProvider.of<AuthenticationBloc>(context);
            return ListView(children: <Widget>[
              Card(
                child: inspectionDataBloc.inspection.hasImage
                    ? Image.network(
                        "https://${authBloc.domain}/api/v1/inspections/${inspectionDataBloc.inspection.id}/image",
                        width: 600,
                        height: 240,
                        headers: {"Authorization": authBloc.auth},
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fbs.cyty.com%2Fmenschen%2Fe-etzold%2Farchiv%2FTV%2Ftest%2Fimg%2FFuBK-Testbild16.jpg&f=1&nofb=1",
                        width: 600,
                        height: 240,
                        fit: BoxFit.cover,
                      ),
              ),
              Card(
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: (inspectionDataBloc.inspection != null &&
                            !inspectionDataBloc.inspection.hasImage)
                        ? () async {
                            var image = await ImagePicker.pickImage(
                                source: ImageSource.camera, imageQuality: 50);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.lightGreen,
                                  title: new Text(
                                    "Foto",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: (image != null)
                                      ? Image.file(image)
                                      : Text("Error"),
                                  actions: <Widget>[
                                    new FlatButton(
                                        child: new Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                    new FlatButton(
                                      child: new Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        if (image != null) {
                                          inspectionDataBloc.add(AddImageEvent(
                                              inspectionDataBloc.inspection.id,
                                              image));
                                          inspectionDataBloc
                                              .add(GetInspectionEvent());
                                          Navigator.of(context).pop();
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        : null,
                  ),
                  title: Text(
                      "${loc.inspectionList.inspectionId}: ${inspectionDataBloc.inspection.id.toString()}"),
                  subtitle: Text(
                      "${loc.boxInfo.lastInspection}: ${inspectionDataBloc.inspection.inspectionDate.month}/${inspectionDataBloc.inspection.inspectionDate.day}/${inspectionDataBloc.inspection.inspectionDate.year}"),
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
                                  title: Text(loc.inspectionList.cleaned),
                                ),
                              ),
                              TableCell(
                                  child: ListTile(
                                title: Text(
                                  getTrueFalseValueNames(
                                      inspectionDataBloc
                                          .inspection.hasBeenCleaned,
                                      context),
                                ),
                              )),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text(loc.inspectionList.condition),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(getConditionValueName(
                                      inspectionDataBloc.inspection.condition,
                                      context)),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text(loc.inspectionList.repaired),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(
                                    getTrueFalseValueNames(
                                        inspectionDataBloc
                                            .inspection.justRepaired,
                                        context),
                                  ),
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
                                  title: Text(loc.inspectionList.containsEggs),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(getTrueFalseValueNames(
                                      inspectionDataBloc
                                          .inspection.containsEggs,
                                      context)),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text(loc.inspectionList.numberOfEggs),
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
                                  title: Text(loc.inspectionList.ringedChicks),
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
                                  title:
                                      Text(loc.inspectionList.numberOfChicks),
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
                                  title: Text(loc.inspectionList.pBirdM),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(getParentBirdDiscoveryValueName(
                                      inspectionDataBloc
                                          .inspection.maleParentBirdDiscovery,
                                      context)),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text(loc.inspectionList.pBirdF),
                                ),
                              ),
                              TableCell(
                                child: ListTile(
                                  title: Text(getParentBirdDiscoveryValueName(
                                      inspectionDataBloc
                                          .inspection.femaleParentBirdDiscovery,
                                      context)),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: ListTile(
                                  title: Text(loc.boxInfo.specie),
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

  String getTrueFalseValueNames(bool value, BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      false: loc.inspectionList.falseId,
      true: loc.inspectionList.trueId,
    };
    return map[value];
  }

  String getConditionValueName(String value, BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      "Good": loc.inspectionList.good,
      "NeedsRepair": loc.inspectionList.needsRepair,
      "NeedsReplacement": loc.inspectionList.needsReplacement,
    };
    return map[value];
  }

  String getParentBirdDiscoveryValueName(String value, BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      "None": loc.inspectionList.none,
      "NotRinged": loc.inspectionList.notRinged,
      "AlreadyRinged": loc.inspectionList.alreadyRinged,
      "NewlyRinged": loc.inspectionList.newlyRinged,
    };
    return map[value];
  }
}
