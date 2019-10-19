import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlEvent extends Equatable {
  PageControlEvent([List props = const <dynamic>[]]);
}

class GoToHomeEvent extends PageControlEvent {
  @override
  List<Object> get props => [];
}

class GoToMapEvent extends PageControlEvent {
  @override
  List<Object> get props => [];
}

class GoToBoxListEvent extends PageControlEvent {
  @override
  List<Object> get props => [];
}

class GoToNewBoxEvent extends PageControlEvent {
  @override
  List<Object> get props => [];
}

class GoToBoxInfoEvent extends PageControlEvent {
  @override
  List<Object> get props => [];
}

class GoToInspectionEvent extends PageControlEvent {
  @override
  List<Object> get props => [];
}

class GoToNewInspectionEvent extends PageControlEvent {
  @override
  List<Object> get props => [];
}
