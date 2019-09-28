import 'package:flutter/material.dart';
import 'package:nesteo_app/screens/screens.dart';

class TransitionScreen extends NesteoFramedScreen {
  TransitionScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Loading'),
          appBarActions: <Widget>[],
          floatingActionButton: null,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
