import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol_bloc.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';

class PlaceholderMapScreen extends NesteoFramedScreen {
  PlaceholderMapScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Placeholder Map Screen'),
          appBarActions: <Widget>[],
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.lightbulb_outline),
            onPressed: () {},
            backgroundColor: (BlocProvider.of<OnlineModeBloc>(context)
                    .currentState is OnlineState)
                ? Colors.green
                : Colors.red,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Placeholder Map Body'),
      ),
    );
  }
}

class PlaceholderListScreen extends NesteoFramedScreen {
  PlaceholderListScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Placeholder List Screen'),
          appBarActions: <Widget>[
            IconButton(
              icon: (BlocProvider.of<OnlineModeBloc>(context).currentState
                      is OnlineState)
                  ? Icon(Icons.signal_wifi_off)
                  : Icon(Icons.signal_wifi_4_bar),
              onPressed: () {
                OnlineModeBloc mode = BlocProvider.of<OnlineModeBloc>(context);
                mode.dispatch((mode.currentState is OnlineState)
                    ? OfflineEvent()
                    : OnlineEvent());
              },
            ),
          ],
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Placeholder List Body'),
      ),
    );
  }
}
