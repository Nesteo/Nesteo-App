import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SnackbarEvent extends Equatable {
  const SnackbarEvent();
}

class ShowSnackbarEvent extends SnackbarEvent {
  final String text;
  final Color color;
  final BuildContext scaffoldContext;

  ShowSnackbarEvent(
      {@required this.text,
      @required this.color,
      @required this.scaffoldContext})
      : super();

  @override
  List<Object> get props => null;
}

class SetScaffoldContextEvent extends SnackbarEvent {
  final BuildContext scaffoldContext;

  SetScaffoldContextEvent({@required this.scaffoldContext}) : super();

  @override
  List<Object> get props => null;
}
