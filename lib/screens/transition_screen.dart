import 'package:flutter/material.dart';
import 'package:nesteo_app/screens/screens.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class TransitionFramedScreen extends NesteoFramedScreen {
  TransitionFramedScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase).screenName.load),
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
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase).screenName.load),
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
