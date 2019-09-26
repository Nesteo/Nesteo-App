import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nesteo',
      // This MultiBlocProvider provides the PageControlBloc and the OnlineModeBloc to the Widget tree
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PageControlBloc>(
            builder: (BuildContext context) => PageControlBloc(),
          ),
          BlocProvider<OnlineModeBloc>(
            builder: (BuildContext context) => OnlineModeBloc(),
          ),
        ],
        child: BlocBuilder<PageControlBloc, PageControlState>(
          // This Builder basically controls which page is currently displayed, based on the PageControlState
          // I think we don't have to worry about any routes here, because we can control that in the Bloc instead of here
          builder: (context, state) {
            if (state is LoginScreenState) {
              return LoginScreen();
            }
            if (state is ToHomeScreenState) {
              return TransitionScreen();
            }
            if (state is HomeScreenState) {
              return HomeScreen();
            }
            if (state is ToMapScreenState) {
              return TransitionScreen();
            }
            if (state is MapScreenState) {
              return MapScreen();
            }
            if (state is ToBoxListScreenState) {
              return TransitionScreen();
            }
            if (state is BoxListScreenState) {
              return BoxListScreen();
            }
            if (state is ToNewBoxScreenState) {
              return TransitionScreen();
            }
            if (state is NewBoxScreenState) {
              return NewBoxScreen();
            }
            if (state is ToInfoBoxScreenState) {
              return TransitionScreen();
            }
            if (state is InfoBoxScreenState) {
              return InfoBoxScreen();
            }
            if (state is ToInspectionScreenState) {
              return TransitionScreen();
            }
            if (state is InspectionScreenState) {
              return InspectionScreen();
            }
            return null;
          },
        ),
      ),
    );
  }
}
