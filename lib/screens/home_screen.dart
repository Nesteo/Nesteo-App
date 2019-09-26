import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineModeBloc, OnlineModeState>(
        builder: (context, state) {
      if (state is OnlineState) {
        return HomeOnlineScreen();
      }
      if (state is OfflineState) {
        return HomeOfflineScreen();
      }
      return null;
    });
  }
}

class HomeOnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
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
                  // TODO remove comment when events for the list are implemented
                  pageControlBloc.dispatch(GoToBoxListEvent());
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
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 128),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    pageControlBloc.dispatch(GoToNewBoxEvent());
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    pageControlBloc.dispatch(GoToInfoBoxEvent());
                  },
                  child: Icon(Icons.help_outline),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  pageControlBloc.dispatch(GoToInspectionEvent());
                },
                child: Icon(Icons.healing),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ));
  }
}

class HomeOfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen (offline)'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Go to List'),
              onPressed: null,
              // TODO: remove comment when PageControlBloc exists and maybe rename event
              // onPressed: pageControlBloc.dispatch(GoToBoxListEvent()),
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