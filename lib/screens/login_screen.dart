import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: remove comment when PageControlBloc exists
    //final PageControlBloc pageControlBloc = BlocProvider.of<PageControlBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: null,
          // TODO: remove comment when PageControlBloc exists
          // onPressed: pageControlBloc.dispatch(GoToMapEvent()),
        ),
      ),
    );
  }
}
