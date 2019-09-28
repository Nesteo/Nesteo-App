import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlState extends Equatable {
  PageControlState([List props = const <dynamic>[]]) : super(props);
}

class LoginScreenState extends PageControlState {}

class ToHomeScreenState extends PageControlState {}

class HomeScreenState extends PageControlState {}

class ToMapScreenState extends PageControlState {}

class MapScreenState extends PageControlState {}

class ToBoxListScreenState extends PageControlState {}

class BoxListScreenState extends PageControlState {}

class ToNewBoxScreenState extends PageControlState {}

class NewBoxScreenState extends PageControlState {}

class ToBoxInfoScreenState extends PageControlState {}

class BoxInfoScreenState extends PageControlState {}

class ToInspectionScreenState extends PageControlState {}

class InspectionScreenState extends PageControlState {}
