import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';

class NewBoxConfirmationScreen extends NesteoFullScreen {
  NewBoxConfirmationScreen(BuildContext context)
      : super(context,
            hasAppBar: true,
            appBarTitle: Text("New Box confirmation"),
            appBarLeading: GoBackButton(),
            appBarActions: null);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.lightGreen,
      child: NewBoxConfirmationData(),
    );
  }
}

class NewBoxConfirmationData extends StatefulWidget {
  NewBoxConfirmationData({Key key}) : super(key: key);

  @override
  _NewBoxConfirmationDataState createState() => _NewBoxConfirmationDataState();
}

class _NewBoxConfirmationDataState extends State<NewBoxConfirmationData> {
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
      Card(
          child: Column(children: <Widget>[
        ListTile(
          title: Text("Generated ID:"),
        ),
        ListTile(
          title: FittedBox(
            fit: BoxFit.contain,
            child: Text("A00000"),
          ),
        )
      ])),
    ])));
  }
}
