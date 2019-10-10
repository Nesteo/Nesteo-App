import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:nesteo_app/screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends NesteoFullScreen {
  LoginScreen(BuildContext context)
      : super(context, hasAppBar: false, floatingActionButton: null);

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.lightGreen,
      child: LoginScreenData(),
    );
  }
}

class LoginScreenData extends StatefulWidget {
  LoginScreenData({Key key}) : super(key: key);

  @override
  _LoginScreenDataState createState() => _LoginScreenDataState();
}

class _LoginScreenDataState extends State<LoginScreenData> {
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 80),
                child: Icon(
                  FontAwesomeIcons.kiwiBird,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              Text(
                'Nesteo',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 100),
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: loc.login.domain,
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon:
                          Icon(Icons.location_city, color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: loc.login.username,
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person, color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: loc.login.password,
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock, color: Colors.green),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              Container(
                width: 250,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      BlocProvider.of<PageControlBloc>(context)
                          .dispatch(GoToMapEvent());
                      BlocProvider.of<FrameControlBloc>(context)
                          .dispatch(EnableFrameEvent());
                    },
                    child: Text(
                      loc.login.logInButton,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
