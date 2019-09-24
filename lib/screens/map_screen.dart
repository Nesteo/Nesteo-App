import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapOnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: remove comment when PageControlBloc exists
    //final PageControlBloc pageControlBloc = BlocProvider.of<PageControlBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
        backgroundColor: Colors.green,
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
              child: Text('Go offline!'),
              onPressed: null,
              // TODO: remove comment when PageControlBloc exists and maybe rename event
              // onPressed: onlineModeBloc.dispatch(GoOfflineEvent()),
            ),
          ],
        ),
      ),
    );
  }
}

class MapOfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: remove comment when PageControlBloc exists
    //final PageControlBloc pageControlBloc = BlocProvider.of<PageControlBloc>(context);
    //final OnlineModeBloc onlineModeBloc = BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen (offline)'),
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
              onPressed: null,
              // TODO: remove comment when PageControlBloc exists and maybe rename event
              // onPressed: onlineModeBloc.dispatch(GoOnlineEvent()),
            ),
          ],
        ),
      ),
    );
  }
}
