import 'package:flutter/material.dart';
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
  Widget titleSection(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Inspection 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Inspection Date',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: Icon(Icons.photo),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //sorting dialog widget
                      SimpleDialog sortDialog = SimpleDialog(
                        title: const Text("Image of Inspection"),
                        children: <Widget>[
                          Image.asset('images/testImage.jpg',
                              width: 600, height: 240, fit: BoxFit.fitWidth),
                        ],
                      );
                      return sortDialog;
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }

  Widget dataSection(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
        child: Table(
      children: [
        TableRow(children: [Text(loc.boxInfo.boxNumber), Text('abc1234')]),
        TableRow(children: [Text(loc.boxInfo.date), Text('9/23/12')]),
        TableRow(children: [Text(loc.boxInfo.user), Text('Musterman, Max')]),
        TableRow(children: [Text(loc.boxInfo.cleaned), Text('True/False')]),
        TableRow(children: [Text(loc.boxInfo.boxCondition), Text('selectable options')]),
        TableRow(children: [Text(loc.boxInfo.repair), Text('True/False')]),
        TableRow(children: [Text(loc.boxInfo.occupied), Text('True/False')]),
        TableRow(children: [Text(loc.boxInfo.containsEggs), Text('True/False')]),
        TableRow(children: [Text(loc.boxInfo.eggCount), Text('5')]),
        TableRow(children: [Text(loc.boxInfo.chickCount), Text('5')]),
        TableRow(children: [Text(loc.boxInfo.ringed), Text('True/False')]),
        TableRow(
            children: [Text(loc.boxInfo.femaleInBox), Text('True/False')]),
        TableRow(
            children: [Text(loc.boxInfo.maleInBox), Text('True/False')]),
        TableRow(children: [Text(loc.boxInfo.chickCount), Text('15')]),
        TableRow(children: [Text(loc.boxInfo.specie), Text('selectable options')]),
        TableRow(children: [Text(loc.boxInfo.comments), Text('')]),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          titleSection(context),
          dataSection(context),
        ]),
      ),
    );
  }
}
