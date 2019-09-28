import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/framecontrol_bloc/framecontrol.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';

class MapScreen extends NesteoFramedScreen {
  MapScreen(BuildContext context)
      : super(
          context,
          appBarTitle: Text('Map'),
          appBarActions: <Widget>[
            OnlineModeButton(),
          ],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<PageControlBloc>(context)
                  .dispatch(GoToNewBoxEvent());
              BlocProvider.of<FrameControlBloc>(context)
                  .dispatch(DisableFrameEvent());
            },
            child: Icon(Icons.add),
            backgroundColor: (BlocProvider.of<OnlineModeBloc>(context)
                    .currentState is OnlineState)
                ? Colors.green
                : Colors.red,
          ),
        );

  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Container(
      child: Center(
        child: Text('Here is a map!'),
      ),
    );
  }
}
