import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/generated/locale_base.dart';
import 'package:nesteo_app/screens/screens.dart';

class LoginScreen extends NesteoFullScreen {
  LoginScreen(BuildContext context)
      : super(context, hasAppBar: false, floatingActionButton: null);

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Container(
      color: Colors.lightGreen,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SplashScreen(),
              padding: EdgeInsets.only(bottom: 40),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: loc.login.domain,
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.location_city, color: Colors.green),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: loc.login.username,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person, color: Colors.green),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: loc.login.password,
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
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.location_on,
            size: 100,
            color: Colors.green,
          ),
          Text(
            'Nesteo',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
