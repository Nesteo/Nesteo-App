import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol_event.dart';
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

  /*  @override
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
    BlocProvider.of<PageControlBloc>(context).dispatch(BackbuttonEvent());
    BlocProvider.of<FrameControlBloc>(context).dispatch(DisableFrameEvent());

    return true;
  }
 */
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return ListView(
      children: <Widget>[
        CheckboxListTile(
            title: Text(loc.boxInfo.cleaned),
            value: _hasBeenCleaned,
            onChanged: (bool newValue) {
              setState(() {
                _hasBeenCleaned = newValue;
              });
            }),
        ListTile(
          title: Text(loc.boxInfo.boxCondition),
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
            title: Text(loc.boxInfo.repair),
            value: _justRepaired,
            onChanged: (bool newValue) {
              setState(() {
                _justRepaired = newValue;
              });
            }),
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
              )
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
        ListTile(
          title: TextFormField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              labelText: loc.boxInfo.specie,
            ),
          ),
        ),
        ListTile(
          title: Text(loc.boxInfo.addPhoto),
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
              labelText: loc.boxInfo.comment,
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
