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
  bool _hasBeenCleaned = false;
  bool _justRepaired = false;
  bool _occupied = false;
  bool _containsEggs = false;
  bool _femaleParent = false;
  bool _maleParent = false;
  int _eggCount = 0;
  int _chickCount = 0;
  int _ringedChickCount = 0;
  int _ageInDays = 0;
  double _sliderCondition = 0;
  Color sliderColor;
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return ListView(
      children: <Widget>[
        CheckboxListTile(
            title: Text('Gereinigt'),
            value: _hasBeenCleaned,
            onChanged: (bool newValue) {
              setState(() {
                _hasBeenCleaned = newValue;
              });
            }),
        ListTile(
          title: Text('Zustand'),
          subtitle: Slider(
            value: _sliderCondition,
            label: getSliderLabel(_sliderCondition),
            activeColor: sliderColor,
            min: 0,
            max: 2,
            divisions: 2,
            onChanged: (double newValue) {
              setState(() {
                _sliderCondition = newValue;
              });
            },
          ),
        ),
        CheckboxListTile(
            title: Text('Repariert'),
            value: _justRepaired,
            onChanged: (bool newValue) {
              setState(() {
                _justRepaired = newValue;
              });
            }),
        CheckboxListTile(
            title: Text('Besetzt'),
            value: _occupied,
            onChanged: (bool newValue) {
              setState(() {
                _occupied = newValue;
              });
            }),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Beringte Jungvögel'),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: (_ringedChickCount > 0)
                        ? () => setState(() => _ringedChickCount--)
                        : null,
                  ),
                  Text(_ringedChickCount.toString()),
                  IconButton(
                      icon: new Icon(Icons.add),
                      onPressed: () => setState(() => _ringedChickCount++))
                ],
              ),
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Jungvögel'),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: (_chickCount > 0)
                        ? () => setState(() => _chickCount--)
                        : null,
                  ),
                  Text(_chickCount.toString()),
                  IconButton(
                      icon: new Icon(Icons.add),
                      onPressed: () => setState(() => _chickCount++))
                ],
              ),
            ],
          ),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Alter in Tagen'),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: (_ageInDays > 0)
                        ? () => setState(() => _ageInDays--)
                        : null,
                  ),
                  Text(_ageInDays.toString()),
                  IconButton(
                      icon: new Icon(Icons.add),
                      onPressed: () => setState(() => _ageInDays++))
                ],
              ),
            ],
          ),
        ),
        CheckboxListTile(
            title: Text('Eier drin'),
            value: _containsEggs,
            onChanged: (bool newValue) {
              setState(() {
                _containsEggs = newValue;
              });
            }),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Anzahl Eier'),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: new Icon(Icons.remove),
                    onPressed: (_eggCount > 0)
                        ? () => setState(() => _eggCount--)
                        : null,
                  ),
                  Text(_eggCount.toString()),
                  IconButton(
                      icon: new Icon(Icons.add),
                      onPressed: () => setState(() => _eggCount++))
                ],
              )
            ],
          ),
        ),
        CheckboxListTile(
            title: Text('Weiblicher Elternvogel'),
            value: _femaleParent,
            onChanged: (bool newValue) {
              setState(() {
                _femaleParent = newValue;
              });
            }),
        CheckboxListTile(
            title: Text('Männlicher Elternvogel'),
            value: _maleParent,
            onChanged: (bool newValue) {
              setState(() {
                _maleParent = newValue;
              });
            }),
        ListTile(
          title: TextFormField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              labelText: 'Vogelart',
            ),
          ),
        ),
        ListTile(
          title: Text('Foto hinzufügen'),
          subtitle: IconButton(
            icon: Icon(Icons.camera_alt),
            tooltip: loc.boxNew.addImage,
            onPressed: () {},
          ),
        ),
        ListTile(
          title: TextFormField(
            maxLines: 5,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              labelText: 'Kommentar',
            ),
          ),
        ),
      ],
    );
  }

  String getSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    if (value == 0) {
      sliderColor = Colors.red;
      return 'Ersetzen';
    } else if (value == 1) {
      sliderColor = Colors.yellow;
      return 'Reparieren';
    } else {
      sliderColor = Colors.green;
      return 'Heile';
    }
  }
}
