import 'package:flutter/material.dart';
import 'package:nesteo_app/screens/screens.dart';

class TransitionFramedScreen extends NesteoFramedScreen {
  TransitionFramedScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Loading'),
          appBarActions: <Widget>[],
          floatingActionButton: null,
          appBarLeading: null,
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

class TransitionFullScreen extends NesteoFullScreen {
  TransitionFullScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Loading'),
          appBarActions: <Widget>[],
          hasAppBar: true,
          floatingActionButton: null,
          appBarLeading: null,
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
