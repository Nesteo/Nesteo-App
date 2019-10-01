import 'package:flutter/material.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class NewBoxScreen extends NesteoFullScreen {
  NewBoxScreen(BuildContext context)
      : super(
          context,
          hasAppBar: true,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
              .screenName
              .boxNew),
          appBarLeading: GoBackButton(),
          appBarActions: null,
        );

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    String dropdownValue = 'One';
    return Container(
      color: Colors.lightGreen,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _createTextinput(loc.boxNew.id),
            _createTextinput(loc.boxNew.oldid),
            _createTextinput(loc.boxNew.hangDate),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {},
                child: Text(loc.boxNew.addBox),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTextinput(String labelText) {
    return Container(
      padding: EdgeInsets.all(7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
