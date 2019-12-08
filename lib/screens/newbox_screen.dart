import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/boxsender_bloc/boxsender.dart';
import 'package:nesteo_app/blocs/dropdown_bloc/dropdown_bloc.dart';
import 'package:nesteo_app/blocs/dropdown_bloc/dropdown_event.dart';
import 'package:nesteo_app/blocs/dropdown_bloc/dropdown_state.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/model/owner.dart';
import 'package:nesteo_app/model/region.dart';
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
  LatLng _position;
  String _id;
  String _oldId;
  String _foreignId;
  DateTime _hangUpDate;
  String _regionIdPrefix;
  String _regionName;
  String _owner;
  String _comment;
  String _dropDownMaterial = "Other";
  double _slideHoleSize = 1;
  Region _dropDownRegion;
  Owner _dropDownOwner;

  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    final dropdownBloc = BlocProvider.of<DropdownBloc>(context);

    return GestureDetector(
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
                                child: Text(loc.boxNew.ids))
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
                                    labelText: loc.boxNew.idOptional,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _id = value;
                                    });
                                  },
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
                                    labelText: loc.boxNew.oldIdOptional,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _oldId = value;
                                    });
                                  },
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
                                    labelText: loc.boxNew.foreignIdOptional,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  onChanged: (String value) {
                                    setState(() {
                                      _foreignId = value;
                                    });
                                  },
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
                                  padding: EdgeInsets.fromLTRB(0, 20, 10, 10)),
                              Text(loc.boxNew.date),
                            ]),
                            subtitle: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: DateTimePickerFormField(
                                decoration: InputDecoration(
                                  labelText: loc.boxNew.selectDate,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                inputType: InputType.date,
                                format: DateFormat("yyyy-MM-dd"),
                                initialDate: DateTime.now(),
                                editable: false,
                                onChanged: (dt) {
                                  setState(() => _hangUpDate = dt);
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
                                child: Text(loc.boxNew.box))
                          ],
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: Text(loc.boxNew.material)),
                                    _createMaterialSelection(context),
                                  ],
                                )),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(loc.boxNew.holeSize),
                                ),
                                _createHoleSizeSlider()
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.globe),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(loc.boxNew.region)),
                          ],
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            BlocBuilder<DropdownBloc, DropdownState>(
                              builder: (context, state) {
                                if (state is ReadyDropdownState) {
                                  if (_dropDownRegion == null)
                                    _dropDownRegion = dropdownBloc.regions[0];
                                  return DropdownButton<String>(
                                    isExpanded: true,
                                    value: (_dropDownRegion != null)
                                        ? dropdownBloc.regions
                                            .indexOf(_dropDownRegion)
                                            .toString()
                                        : "0",
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        print(newValue);
                                        _dropDownRegion = dropdownBloc
                                            .regions[int.parse(newValue)];
                                      });
                                    },
                                    items: dropdownBloc.regions
                                        .map<DropdownMenuItem<String>>(
                                      (Region value) {
                                        return DropdownMenuItem<String>(
                                          value: dropdownBloc.regions
                                              .indexOf(value)
                                              .toString(),
                                          child: Text(
                                              "${value.nestingBoxIdPrefix} - ${value.name}"),
                                        );
                                      },
                                    ).toList(),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                            TextFormField(
                              maxLines: 1,
                              maxLength: 1,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                labelText: loc.boxNew.newRegionIdPrefix,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _regionIdPrefix = value;
                                });
                              },
                            ),
                            TextFormField(
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                labelText: loc.boxNew.newRegionName,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _regionName = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.globeAmericas),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(loc.boxNew.position),
                            )
                          ],
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  child: Text(loc.boxNew.addGpsData,
                                      style: TextStyle(fontSize: 16)),
                                  padding: EdgeInsets.only(left: 10),
                                ),
                                IconButton(
                                  icon: Icon(Icons.gps_fixed),
                                  onPressed: () async {
                                    if (await Geolocator()
                                        .isLocationServiceEnabled()) {
                                      Position currentPosition =
                                          await Geolocator().getCurrentPosition(
                                              desiredAccuracy:
                                                  LocationAccuracy.high);

                                      setState(() {
                                        _position = LatLng(
                                            currentPosition.latitude,
                                            currentPosition.longitude);
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText:
                                    "${loc.boxNew.latitude} ${(_position == null) ? "" : _position.latitude}",
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
                                    "${loc.boxNew.longitude} ${(_position == null) ? "" : _position.longitude}",
                                filled: true,
                                fillColor: Colors.white,
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
                                child: Text(loc.boxNew.owner)),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            BlocBuilder<DropdownBloc, DropdownState>(
                              builder: (context, state) {
                                if (state is ReadyDropdownState) {
                                  if (_dropDownOwner == null)
                                    _dropDownOwner = dropdownBloc.owners[0];
                                  return DropdownButton<String>(
                                    isExpanded: true,
                                    value: (_dropDownOwner != null)
                                        ? dropdownBloc.owners
                                            .indexOf(_dropDownOwner)
                                            .toString()
                                        : "0",
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        print(newValue);
                                        _dropDownOwner = dropdownBloc
                                            .owners[int.parse(newValue)];
                                      });
                                    },
                                    items: dropdownBloc.owners
                                        .map<DropdownMenuItem<String>>(
                                      (Owner value) {
                                        return DropdownMenuItem<String>(
                                          value: dropdownBloc.owners
                                              .indexOf(value)
                                              .toString(),
                                          child: Text("${value.name}"),
                                        );
                                      },
                                    ).toList(),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                            TextFormField(
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                labelText: loc.boxNew.newOwnerName,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _owner = value;
                                });
                              },
                            ),
                          ],
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
                                child: Text(loc.boxNew.comment))
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
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        BlocProvider.of<BoxSenderBloc>(context).add(
                          SendBoxEvent(
                            authBloc:
                                BlocProvider.of<AuthenticationBloc>(context),
                            boxDataBloc: BlocProvider.of<BoxDataBloc>(context),
                            id: _id,
                            material: _dropDownMaterial,
                            hangUpDate: (_hangUpDate != null)
                                ? _hangUpDate
                                : DateTime.now(),
                            oldId: _oldId,
                            holeSize: getSliderLabel(_slideHoleSize),
                            comment: _comment,
                            coordinates:
                                (_position != null) ? _position : LatLng(0, 0),
                            foreignId: _foreignId,
                            ownerString: _owner,
                            regionIdPrefixString:
                                _regionIdPrefix?.toUpperCase(),
                            regionString: _regionName,
                            region: _dropDownRegion,
                            owner: _dropDownOwner,
                          ),
                        );
                      },
                      child: Text(
                        loc.boxNew.addBox,
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
            var boxDataBloc = BlocProvider.of<BoxDataBloc>(context);
            boxDataBloc.add(GetAllBoxPreviewEvent());
            BlocProvider.of<PageControlBloc>(context)
                .add(GoToNewBoxConfirmationEvent(boxDataBloc));
            return LinearProgressIndicator();
          }
          if (state is SendingBoxState) {
            return LinearProgressIndicator(
              backgroundColor: Colors.green,
            );
          }
        },
      ),
    );
  }

  Widget _createMaterialSelection(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      child: DropdownButton<String>(
        value:
            (_dropDownMaterial != null) ? _dropDownMaterial : "UntreatedWood",
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        onChanged: (String newValue) {
          setState(() {
            _dropDownMaterial = newValue;
          });
        },
        items: <String>[
          "UntreatedWood",
          "TreatedWood",
          "WoodConcrete",
          "Other",
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(getDropDownTexts(value)),
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
        max: 5,
        divisions: 5,
        label: getLocalizedSliderLabel(_slideHoleSize),
        onChanged: (double newValue) {
          setState(() {
            _slideHoleSize = newValue;
          });
        },
      ),
    );
  }

  String getDropDownTexts(String value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      "UntreatedWood": loc.boxNew.untreatedWood,
      "TreatedWood": loc.boxNew.treatedWood,
      "WoodConcrete": loc.boxNew.concrete,
      "Other": loc.boxNew.otherMaterial,
    };
    return map[value];
  }

  String getSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var sizeMap = {
      0: "Small",
      1: "Medium",
      2: "Large",
      3: "VeryLarge",
      4: "Oval",
      5: "OpenFronted",
    };
    return sizeMap[value];
  }

  String getLocalizedSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var sizeMap = {
      0: loc.boxNew.small,
      1: loc.boxNew.medium,
      2: loc.boxNew.large,
      3: loc.boxNew.veryLarge,
      4: loc.boxNew.oval,
      5: loc.boxNew.openFronted,
    };
    return sizeMap[value];
  }
}
