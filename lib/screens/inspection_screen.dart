import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return ListView(children: <Widget>[
      Card(
        child: Image.asset('images/vogelhaus${Random().nextInt(4)}.jpg',
            width: 600, height: 240, fit: BoxFit.cover),
      ),
      Card(
        child: Container(
          child: Column(
            children: [
              ListTile(
                title: Row(children: [
                  Icon(FontAwesomeIcons.home),
                  Text(""),
                ]),
              ),
              Container(
                child: Table(
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: ListTile(
                          title: Text("Inspection ID:"),
                        ),
                      ),
                      TableCell(
                        child: ListTile(
                          title: Text("1"),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      TableCell(
                        child: ListTile(
                          title: Text("Inspection date:"),
                        ),
                      ),
                      TableCell(
                        child: ListTile(
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
                          title: Text("1"),
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
}
