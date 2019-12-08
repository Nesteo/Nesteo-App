import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:nesteo_app/blocs/boxdata_bloc/boxdata.dart';
import 'package:nesteo_app/blocs/dropdown_bloc/dropdown.dart';
import 'package:nesteo_app/blocs/inspectiondata_bloc/inspectiondata.dart';
import 'package:nesteo_app/blocs/inspectionsender_bloc/inspectionsender.dart';
import 'package:nesteo_app/blocs/inspectionsender_bloc/inspectionsender_bloc.dart';
import 'package:nesteo_app/blocs/inspectionsender_bloc/inspectionsender_event.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/model/inspection.dart';
import 'package:nesteo_app/model/species.dart';
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
  String _condition = "Good";
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
  Color sliderColor = Colors.green;
  String _speciesString;
  Species _species;

  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    final dropdownBloc = BlocProvider.of<DropdownBloc>(context);

    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Row(children: <Widget>[
              Icon(FontAwesomeIcons.calendarAlt),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 10, 10)),
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
                        child: Text(loc.boxNew.box)),
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
                      label: getLocalizedSliderLabel(_sliderCondition),
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
                      child: Text(loc.inspectionList.eggs),
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
                    child: Text(loc.inspectionList.birds),
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
                            onPressed: () =>
                                setState(() => _ringedChickCount++))
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
                      child: Text(loc.boxInfo.maleInBox),
                    ),
                    _createMaleParentBirdSelection(context)
                  ],
                ),
              ),
              ListTile(
                subtitle: Column(
                  children: <Widget>[
                    BlocBuilder<DropdownBloc, DropdownState>(
                      builder: (context, state) {
                        if (state is ReadyDropdownState) {
                          if (_species == null)
                            _species = dropdownBloc.species[0];
                          return DropdownButton<String>(
                            isExpanded: true,
                            value: (_species != null)
                                ? dropdownBloc.species
                                    .indexOf(_species)
                                    .toString()
                                : "0",
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            onChanged: (String newValue) {
                              setState(() {
                                print(newValue);
                                _species =
                                    dropdownBloc.species[int.parse(newValue)];
                              });
                            },
                            items: dropdownBloc.species
                                .map<DropdownMenuItem<String>>(
                              (Species value) {
                                return DropdownMenuItem<String>(
                                  value: dropdownBloc.species
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
                      maxLength: 1,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        labelText: loc.inspectionList.newSpecies,
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
        Padding(
          padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
          child: BlocBuilder<InspectionSenderBloc, InspectionSenderState>(
            builder: (context, state) {
              if (state is WaitingForSend) {
                return RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    BlocProvider.of<InspectionSenderBloc>(context).add(
                      SendInspectionEvent(
                        ageInDays: _ageInDays,
                        nestingBox:
                            BlocProvider.of<BoxDataBloc>(context).nestingBox,
                        authBloc: BlocProvider.of<AuthenticationBloc>(context),
                        chickCount: _chickCount,
                        cleaned: _hasBeenCleaned,
                        comment: _comment,
                        condition: _condition,
                        containsEggs: _containsEggs,
                        eggCount: _eggCount,
                        femaleParent: _femaleParent,
                        maleParent: _maleParent,
                        id: null,
                        inspectionDate: (_inspectionDate == null)
                            ? DateTime.now()
                            : _inspectionDate,
                        occupied: _occupied,
                        repaired: _justRepaired,
                        ringedChickCount: _ringedChickCount,
                        species: _species,
                        speciesString: _speciesString,
                      ),
                    );
                  },
                  child: Text(
                    loc.inspectionList.addInspection,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                );
              }
              if (state is InspectionSentState) {
                BlocProvider.of<InspectionDataBloc>(context).boxId =
                    BlocProvider.of<BoxDataBloc>(context).boxId;
                BlocProvider.of<InspectionDataBloc>(context)
                    .add(GetInspectionPreviewsByNestingBoxEvent());
                BlocProvider.of<BoxDataBloc>(context).add(GetBoxEvent());
                BlocProvider.of<InspectionSenderBloc>(context)
                    .add(NewInspectionDoneEvent());
                BlocProvider.of<PageControlBloc>(context)
                    .add(BackButtonEvent());
                BlocProvider.of<PageControlBloc>(context)
                    .add(GoToInspectionListEvent());
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }

  String getSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    if (value == 0) {
      sliderColor = Colors.red;
      return "NeedsReplacement";
    } else if (value == 1) {
      sliderColor = Colors.orange;
      return "NeedsRepair";
    } else {
      sliderColor = Colors.green;
      return "Good";
    }
  }

  String getLocalizedSliderLabel(double value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      0: loc.inspectionList.needsReplacement,
      1: loc.inspectionList.needsRepair,
      2: loc.inspectionList.good,
    };
    return map[value];
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
            child: Text(getParentBirdDropDownNames(value)),
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
            child: Text(getParentBirdDropDownNames(value)),
          );
        }).toList(),
      ),
    );
  }

  String getParentBirdDropDownNames(String value) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    var map = {
      "None": loc.inspectionList.none,
      "NotRinged": loc.inspectionList.notRinged,
      "AlreadyRinged": loc.inspectionList.alreadyRinged,
      "NewlyRinged": loc.inspectionList.newlyRinged,
    };
    return map[value];
  }
}
