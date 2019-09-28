import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/onlinemode_bloc/onlinemode.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

class InfoBoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnlineModeBloc, OnlineModeState>(
        builder: (context, state) {
      if (state is OnlineState) {
        return InfoBoxOnlineScreen();
      }
      if (state is OfflineState) {
        return InfoBoxOfflineScreen();
      }
      return null;
    });
  }
}

class InfoBoxOnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Box Info Screen'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        // child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            imageSection,
            titleSection,
            buttonSection,
            //descSection,
            Expanded(
                child:
                    listSection) // SingleChildScrollView & listSection dont work together yet
          ],
        ),
        // ),
      ),
    );
  }

  Widget imageSection = Container(
    child: Image.asset('images/testImage.jpg',
        width: 600, height: 240, fit: BoxFit.fill),
  );

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Box 1',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'another thing about Box 1',
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );

  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(Colors.blue, Icons.add, 'New Inspection'),
        _buildButtonColumn(Colors.blue, Icons.add_a_photo, 'Add Photo'),
        _buildButtonColumn(Colors.blue, Icons.settings, 'Change Data')
      ],
    ),
  );

  Widget descSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Things about the Box or whateveeerr '
      'Things about the Box or whateveeerr '
      'Things about the Box or whateveeerr'
      'hlorem ipsum',
      softWrap: true,
    ),
  );

  Widget listSection = Container(
      child: ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.photo),
        title: Text('Inspection 1'),
      ),
      ListTile(
        leading: Icon(Icons.photo),
        title: Text('Inspection 2'),
      ),
      ListTile(
        leading: Icon(Icons.photo),
        title: Text('Inspection 3'),
      ),
      ListTile(
        leading: Icon(Icons.photo),
        title: Text('Inspection 5'),
      ),
    ],
  ));
}

class InfoBoxOfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControlBloc pageControlBloc =
        BlocProvider.of<PageControlBloc>(context);
    final OnlineModeBloc onlineModeBloc =
        BlocProvider.of<OnlineModeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Box Info Screen (offline)'),
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

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
