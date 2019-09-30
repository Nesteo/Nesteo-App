import 'package:flutter/material.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class NewBoxScreen extends NesteoFullScreen {
  NewBoxScreen(BuildContext context)
      : super(
          context,
          hasAppBar: true,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase).screenName.boxNew),
          appBarLeading: GoBackButton(),
          appBarActions: null,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('New Box Dialogue'),
      ),
    );
  }
}
