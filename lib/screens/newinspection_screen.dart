import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return ListView(children: <Widget>[
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
                  value: _justRepaired,
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
                        Text(_chickCount.toString()),
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
            CheckboxListTile(
                title: Text(loc.boxInfo.femaleInBox),
                value: _femaleParent,
                onChanged: (bool newValue) {
                  setState(() {
                    _femaleParent = newValue;
                  });
                }),
            CheckboxListTile(
                title: Text(loc.boxInfo.maleInBox),
                value: _maleParent,
                onChanged: (bool newValue) {
                  setState(() {
                    _maleParent = newValue;
                  });
                }),
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
          ),
        ),
      ),
      RaisedButton(
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
    ]);
  }

  String getSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    if (value == 0) {
      sliderColor = Colors.red;
      return loc.boxInfo.boxConditionReplace;
    } else if (value == 1) {
      sliderColor = Colors.yellow;
      return loc.boxInfo.boxConditionRepair;
    } else {
      sliderColor = Colors.green;
      return loc.boxInfo.boxConditionFixed;
    }
  }
}
