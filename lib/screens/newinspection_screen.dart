import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';

class NewInspectionScreen extends NesteoFullScreen {
  NewInspectionScreen(BuildContext context)
      : super(
          context,
          hasAppBar: true,
          appBarTitle: Text(Localizations.of<LocaleBase>(context, LocaleBase)
              .screenName
              .inspectionNew),
          appBarLeading: GoBackButton(),
          appBarActions: null,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1920,
      color: Colors.lightGreen,
      child: NewInspectionData(),
    );
  }
}

class NewInspectionData extends StatefulWidget {
  NewInspectionData({Key key}) : super(key: key);
  @override
  _NewInspectionDataState createState() => _NewInspectionDataState();
}

class _NewInspectionDataState extends State<NewInspectionData> {
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[Checkbox()],
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
