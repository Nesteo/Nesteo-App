import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

class InspectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineModeBloc, OnlineModeState>(
        builder: (context, state) {
      if (state is OnlineState) {
        return InspectionOnlineScreen();
      }
      if (state is OfflineState) {
        return InspectionOfflineScreen();
      }
      return null;
    });
  }
}

class InspectionOnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Inspection Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Go to Map'),
              onPressed: () {
                pageControlBloc.dispatch(GoToMapEvent());
              },
            ),
            RaisedButton(
              child: Text('Go to List'),
              onPressed: () {
                pageControlBloc.dispatch(GoToBoxListEvent());
              },
            ),
            RaisedButton(
              child: Text('Go to New'),
              onPressed: () {
                pageControlBloc.dispatch(GoToNewBoxEvent());
              },
            ),
            RaisedButton(
              child: Text('Go offline!'),
              onPressed: () {
                onlineModeBloc.dispatch(OfflineEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InspectionOfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Inspection Screen (offline)'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Go to Map'),
              onPressed: () {
                pageControlBloc.dispatch(GoToMapEvent());
              },
            ),
            RaisedButton(
              child: Text('Go to List'),
              onPressed: () {
                pageControlBloc.dispatch(GoToBoxListEvent());
              },
            ),
            RaisedButton(
              child: Text('Go to New '),
              onPressed: () {
                pageControlBloc.dispatch(GoToNewBoxEvent());
              },
            ),
            RaisedButton(
              child: Text('Go online!'),
              onPressed: () {
                onlineModeBloc.dispatch(OnlineEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
