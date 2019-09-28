import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

class BoxListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineModeBloc, OnlineModeState>(
        builder: (context, state) {
      if (state is OnlineState) {
        return BoxListOnlineScreen();
      }
      if (state is OfflineState) {
        return BoxListOfflineScreen();
      }
      return null;
    });
  }
}

class BoxListOnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    // set up the sorting options
    Widget sortOptionName = SimpleDialogOption(
      child: const Text('Name'),
      onPressed: () {},
    );
    Widget sortOptionDistance = SimpleDialogOption(
      child: const Text('Distance'),
      onPressed: () {},
    );
    Widget sortOptionId = SimpleDialogOption(
      child: const Text('ID'),
      onPressed: () {},
    );

    //sorting dialog widget
    SimpleDialog sortDialog = SimpleDialog(
      title: const Text("Sort List"),
      children: <Widget>[sortOptionDistance, sortOptionName, sortOptionId],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Boxes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return sortDialog;
                },
              );
            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Title Box $index'), //create testdata for listview
            isThreeLine: true,
            subtitle: Text('subtitle last inspection $index'),
          );
        },
      ),
    );
  }
}

class BoxListOfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen (offline)'),
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
