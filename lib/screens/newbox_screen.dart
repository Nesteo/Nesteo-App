import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/boxsender_bloc/boxsender.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
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

  LatLng position;

  String _dropDownMaterial;
  double _slideHoleSize = 1;

  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);

    return GestureDetector(
      child: BlocProvider<BoxSenderBloc>(
        builder: (BuildContext context) => BoxSenderBloc(),
        child: BlocBuilder<BoxSenderBloc, BoxSenderState>(
          builder: (context, state) {
            if (state is WaitingForSend) {
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
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
                          subtitle: Column(
                            children: <Widget>[
                              Container(
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
                              Container(
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
                              Container(
                                padding: EdgeInsets.all(7),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      labelText: "foreign ID - optional",
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                          child: ListTile(
                              title: Row(children: <Widget>[
                                Icon(FontAwesomeIcons.calendarAlt),
                                Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 20, 10, 10)),
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
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                            ])),
                      ),
                      Card(
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.globeAmericas),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text("Position")),
                            ],
                          ),
                          subtitle: Column(
                            children: <Widget>[
                              TextFormField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText:
                                      "Latitude ${(position == null) ? "" : position.latitude}",
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                readOnly: true,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  labelText:
                                      "Longitude ${(position == null) ? "" : position.longitude}",
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: (Text("Add GPS Data"))),
                                    IconButton(
                                      icon: Icon(Icons.gps_fixed),
                                      onPressed: () async {
                                        if (await Geolocator()
                                            .isLocationServiceEnabled()) {
                                          Position currentPosition =
                                              await Geolocator()
                                                  .getCurrentPosition(
                                                      desiredAccuracy:
                                                          LocationAccuracy
                                                              .high);

                                          setState(() {
                                            position = LatLng(
                                                currentPosition.latitude,
                                                currentPosition.longitude);
                                          });
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                        onPressed: () {
                          BlocProvider.of<BoxSenderBloc>(context).add(
                            SendBoxEvent(
                              authBloc:
                                  BlocProvider.of<AuthenticationBloc>(context),
                              material: _dropDownMaterial,
                              hangUpDate: (hangUpDate != null)
                                  ? hangUpDate
                                  : DateTime.now(),
                              oldId: oldId,
                              holeSize: getSliderLabel(_slideHoleSize),
                              comment: null,
                              coordinates: position,
                              foreignId: null,
                              ownerString: null,
                              regionIdPrefixString: null,
                              regionString: null,
                            ),
                          );
                        },
                        child: Text(
                          "Create new Nesting Box",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is BoxSentState) {
              BlocProvider.of<PageControlBloc>(context)
                  .add(GoToNewBoxConfirmationEvent());
              BlocProvider.of<BoxDataBloc>(context)
                  .add(GetAllBoxPreviewEvent());
            }
          },
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

  Widget _createRegionIdSelection(BuildContext context) {
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
