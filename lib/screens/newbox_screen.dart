import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

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
//TODO add screeenstate to history here??
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.lightGreen,
      child: NewBoxData(),
    );
  }
}

class NewBoxData extends StatefulWidget {
  NewBoxData({Key key}) : super(key: key);

  @override
  _NewBoxDataState createState() => _NewBoxDataState();
}

class _NewBoxDataState extends State<NewBoxData> {
  String _dropDownMaterial;
  double _slideHoleSize = 1;

/*   @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!");

    BlocProvider.of<PageControlBloc>(context).dispatch(BackbuttonEvent());
    BlocProvider.of<FrameControlBloc>(context).dispatch(EnableFrameEvent());
    return true;
  } */

  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);

    return GestureDetector(
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _createTextinput(loc.boxNew.id),
              _createTextinput(loc.boxNew.oldid),
              _createTextinput(loc.boxNew.hangDate),
              _createHoleSizeSlider(),
              _createMaterialSelection(context),
              IconButton(
                icon: Icon(Icons.camera_alt),
                tooltip: loc.boxNew.addImage,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.gps_fixed),
                tooltip: loc.boxNew.getPosition,
                onPressed: () {},
              ),
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

  Widget _createMaterialSelection(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      child: DropdownButton<String>(
        value: (_dropDownMaterial != null)
            ? _dropDownMaterial
            : loc.boxNew.untreatedWood,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (String newValue) {
          setState(() {
            _dropDownMaterial = newValue;
          });
        },
        items: <String>[
          loc.boxNew.untreatedWood,
          loc.boxNew.treatedWood,
          loc.boxNew.concrete
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _createHoleSizeSlider() {
    return Container(
      child: Slider(
        value: _slideHoleSize,
        min: 0,
        max: 2,
        divisions: 2,
        label: getSliderLabel(_slideHoleSize),
        onChanged: (double newValue) {
          setState(() {
            _slideHoleSize = newValue;
          });
        },
      ),
    );
  }

  String getSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    if (value == 0) {
      return loc.boxNew.small;
    } else if (value == 1) {
      return loc.boxNew.medium;
    } else {
      return loc.boxNew.big;
    }
  }
}
