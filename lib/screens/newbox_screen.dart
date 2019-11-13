import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

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
  String id;
  String oldId;
  DateTime hangUpDate;
  String material;

  String _dropDownMaterial;
  double _slideHoleSize = 1;

  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);

    return GestureDetector(
      child: Container(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Card(
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.hashtag),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text("IDs"))
                  ],
                ),
                subtitle: ListTile(
                  title: Container(
                    padding: EdgeInsets.all(7),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: "ID - optional",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.all(7),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          labelText: "old ID - optional",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                          setState(() => hangUpDate = dt);
                        },
                      ),
                    ))),
            Card(
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.box),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text("Box"))
                  ],
                ),
                subtitle: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text("Material:")),
                          _createMaterialSelection(context),
                        ],
                      )),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Hole size:"),
                      ),
                      _createHoleSizeSlider()
                    ],
                  )
                ]),
              ),
            ),
            Card(
              child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.globe),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text("Region")),
                    ],
                  ),
                  subtitle: Column(children: <Widget>[
                    TextFormField(
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        labelText: "Region ID",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    TextFormField(
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        labelText: "Region Name",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                            child: (Text("Add GPS Data"))),
                        IconButton(
                          icon: Icon(Icons.gps_fixed),
                          onPressed: () {},
                        )
                      ],
                    )
                  ])),
            ),
            Card(
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.userAlt),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text("Owner")),
                  ],
                ),
                subtitle: TextFormField(
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    labelText: "Owner",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
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
          ]),
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

  Widget _createRegionIdSlection(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      child: DropdownButton<String>(
        value: (_dropDownMaterial != null)
            ? _dropDownMaterial
            : loc.boxNew.untreatedWood,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
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
