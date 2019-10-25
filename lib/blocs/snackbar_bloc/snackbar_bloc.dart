import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './snackbar.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  BuildContext scaffoldContext;

  @override
  SnackbarState get initialState => InitialSnackbarState();

  @override
  Stream<SnackbarState> mapEventToState(
    SnackbarEvent event,
  ) async* {
    if (event is SetScaffoldContextEvent) {
      this.scaffoldContext = event.scaffoldContext;
      yield SnackbarReadyState();
    }
    if (event is ShowSnackbarEvent && this.state is SnackbarReadyState) {
      Scaffold.of(this.scaffoldContext).showSnackBar(
        SnackBar(
            content: Text(event.text),
            backgroundColor: event.color,
            duration: Duration(milliseconds: 750)),
      );
    }
  }
}
