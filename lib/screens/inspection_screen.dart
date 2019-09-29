import 'package:flutter/material.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';

class InspectionScreen extends NesteoFullScreen {
  InspectionScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Inspection Info'),
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

  Widget dataSection = Container(
      child: Table(
    children: [
      TableRow(children: [Text('Nesting Box ID'), Text('abc1234')]),
      TableRow(children: [Text('Inspection Date'), Text('9/23/12')]),
      TableRow(children: [Text('User'), Text('Musterman, Max')]),
      TableRow(children: [Text('Cleaned'), Text('True/False')]),
      TableRow(children: [Text('Condition'), Text('selectable options')]),
      TableRow(children: [Text('Repaired'), Text('True/False')]),
      TableRow(children: [Text('Occupied'), Text('True/False')]),
      TableRow(children: [Text('Contais eggs'), Text('True/False')]),
      TableRow(children: [Text('Number of eggs'), Text('5')]),
      TableRow(children: [Text('Number of chicks'), Text('5')]),
      TableRow(children: [Text('Number of ringed chicks'), Text('True/False')]),
      TableRow(
          children: [Text('Female parent bird in box'), Text('True/False')]),
      TableRow(children: [Text('Male parent bird in box'), Text('True/False')]),
      TableRow(children: [Text('Age (Days)'), Text('15')]),
      TableRow(children: [Text('Species'), Text('selectable options')]),
      TableRow(children: [Text('Comments'), Text('')]),
    ],
  ));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          titleSection(context),
          dataSection,
        ]),
      ),
    );
  }
}
