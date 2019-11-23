import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
  DateTime _inspectionDate;
  bool _hasBeenCleaned = false;
  bool _justRepaired = false;
  String _condition;
  bool _occupied = false;
  bool _containsEggs = false;
  String _femaleParent = "None";
  String _maleParent = "None";
  int _eggCount = 0;
  int _chickCount = 0;
  int _ringedChickCount = 0;
  int _ageInDays = 0;
  String _comment;
  double _sliderCondition = 2;
  Color sliderColor;

  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);

    return ListView(children: <Widget>[
      Card(
        child: ListTile(
          title: Row(children: <Widget>[
            Icon(FontAwesomeIcons.calendarAlt),
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 10, 10)),
            Text("Date"),
          ]),
          subtitle: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: DateTimePickerFormField(
              decoration: InputDecoration(
                labelText: "select Day",
                filled: true,
                fillColor: Colors.white,
              ),
              inputType: InputType.date,
              format: DateFormat("yyyy-MM-dd"),
              initialDate: DateTime.now(),
              editable: false,
              onChanged: (dt) {
                setState(() => _inspectionDate = dt);
              },
            ),
          ),
        ),
      ),
      Card(
        child: Container(
          child: Column(
            children: [
              ListTile(
                title: Row(children: [
                  Icon(FontAwesomeIcons.tools),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text("Box")),
                ]),
              ),
              CheckboxListTile(
                  title: Text(loc.boxInfo.cleaned),
                  value: _hasBeenCleaned,
                  onChanged: (bool newValue) {
                    setState(() {
                      _hasBeenCleaned = newValue;
                    });
                  }),
              CheckboxListTile(
                  title: Text(loc.boxInfo.repair),
                  value: _justRepaired,
                  onChanged: (bool newValue) {
                    setState(() {
                      _justRepaired = newValue;
                    });
                  }),
              ListTile(
                  title: Row(
                children: <Widget>[
                  Expanded(child: Text(loc.boxInfo.boxCondition)),
                  Slider(
                    value: _sliderCondition,
                    label: getSliderLabel(_sliderCondition),
                    activeColor: sliderColor,
                    min: 0,
                    max: 2,
                    divisions: 2,
                    onChanged: (double newValue) {
                      setState(() {
                        _sliderCondition = newValue;
                        _condition = getSliderLabel(_sliderCondition);
                      });
                    },
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
      Card(
        child: Container(
          child: Column(
            children: [
              ListTile(
                title: Row(children: [
                  Icon(FontAwesomeIcons.egg),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("Eggs"),
                  )
                ]),
              ),
              CheckboxListTile(
                  title: Text(loc.boxInfo.containsEggs),
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
                    Text(loc.boxInfo.eggCount),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        child: Container(
          child: Column(children: [
            ListTile(
              title: Row(children: [
                Icon(FontAwesomeIcons.kiwiBird),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text("Birds"),
                )
              ]),
            ),
            CheckboxListTile(
                title: Text(loc.boxInfo.occupied),
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
                  Text(loc.boxInfo.chickCount),
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
                  Text(loc.boxInfo.ringed),
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
                  Text(loc.boxInfo.chickAge),
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
            ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(loc.boxInfo.femaleInBox),
                  ),
                  _createFemaleParentBirdSelection(context)
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(loc.boxInfo.femaleInBox),
                  ),
                  _createMaleParentBirdSelection(context)
                ],
              ),
            ),
            ListTile(
              title: Text(loc.boxInfo.specie),
              subtitle: Column(
                children: <Widget>[
                  TextFormField(
                    maxLines: 1,
                    maxLength: 1,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      labelText: "New Species",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      Card(
        child: ListTile(
          title: Row(
            children: <Widget>[
              Icon(FontAwesomeIcons.comment),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text("Comment"))
            ],
          ),
          subtitle: TextFormField(
            maxLines: 3,
            textAlign: TextAlign.left,
            onChanged: (String value) {
              setState(() {
                _comment = value;
              });
            },
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
        child: RaisedButton(
          color: Colors.blue,
          onPressed: () {},
          child: Text(
            "Send",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }

  String getSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    if (value == 0) {
      sliderColor = Colors.red;
      return "NeedsReplacement";
    } else if (value == 1) {
      sliderColor = Colors.yellow;
      return "NeedsRepair";
    } else {
      sliderColor = Colors.green;
      return "Good";
    }
  }

  Widget _createFemaleParentBirdSelection(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      child: DropdownButton<String>(
        value: (_femaleParent != null) ? _femaleParent : "None",
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        onChanged: (String newValue) {
          setState(() {
            _femaleParent = newValue;
          });
        },
        items: <String>[
          "None",
          "NotRinged",
          "AlreadyRinged",
          "NewlyRinged",
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _createMaleParentBirdSelection(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      child: DropdownButton<String>(
        value: (_maleParent != null) ? _maleParent : "None",
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        onChanged: (String newValue) {
          setState(() {
            _maleParent = newValue;
          });
        },
        items: <String>[
          "None",
          "NotRinged",
          "AlreadyRinged",
          "NewlyRinged",
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
