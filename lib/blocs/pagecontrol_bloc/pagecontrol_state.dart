import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlState extends Equatable {
  PageControlState([List props = const <dynamic>[]]);
}

class LoginScreenState extends PageControlState {
  @override
  List<Object> get props => [];
}

class MapScreenState extends PageControlState {
  @override
  List<Object> get props => [];
}

class BoxListScreenState extends PageControlState {
  @override
  List<Object> get props => [];
}

class NewBoxScreenState extends PageControlState {
  @override
  List<Object> get props => [];
}

class BoxInfoScreenState extends PageControlState {
  @override
  List<Object> get props => [];
}

class InspectionScreenState extends PageControlState {
  @override
  List<Object> get props => [];
}

class NewInspectionScreenState extends PageControlState {
  @override
  List<Object> get props => [];
}
