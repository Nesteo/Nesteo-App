import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesteo_app/blocs/boxsender_bloc/boxsender.dart';
import 'package:nesteo_app/screens/nesteo_screen.dart';
import 'package:nesteo_app/blocs/pagecontrol_bloc/pagecontrol.dart';

class NewBoxConfirmationScreen extends NesteoFullScreen {
  NewBoxConfirmationScreen(BuildContext context)
      : super(context,
            hasAppBar: true,
            appBarTitle: Text("Write this ID on your new box:"),
            appBarLeading: null,
            appBarActions: null);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.lightGreen,
      child: NewBoxConfirmationData(),
    );
  }
}

class NewBoxConfirmationData extends StatefulWidget {
  NewBoxConfirmationData({Key key}) : super(key: key);

  @override
  _NewBoxConfirmationDataState createState() => _NewBoxConfirmationDataState();
}

class _NewBoxConfirmationDataState extends State<NewBoxConfirmationData> {
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              BlocProvider.of<BoxSenderBloc>(context).lastNewBox.id,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            RaisedButton(
              onPressed: () {
                BlocProvider.of<BoxSenderBloc>(context).add(NewBoxDoneEvent());
                BlocProvider.of<PageControlBloc>(context)
                    .add(GoToBoxListEvent());
              },
              child: Text("Back to the List"),
            ),
          ],
        ),
      ),
    );
  }
}
