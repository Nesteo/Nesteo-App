import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

class NewBoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineModeBloc, OnlineModeState>(
        builder: (context, state) {
      if (state is OnlineState) {
        return NewBoxOnlineScreen();
      }
      if (state is OfflineState) {
        return NewBoxOfflineScreen();
      }
      return null;
    });
  }
}

class NewBoxOnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Box Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
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
    );
  }
}

class NewBoxOfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('New Box Screen (offline)'),
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
