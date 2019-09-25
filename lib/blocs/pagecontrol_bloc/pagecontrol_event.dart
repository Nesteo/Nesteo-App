import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlEvent extends Equatable {
  PageControlEvent([List props = const <dynamic>[]]) : super(props);
}

//class GoToHomeEvent extends PageControlEvent {}

//class HomeEvent extends PageControlEvent {}

class GoToMapEvent extends PageControlEvent {}

class MapEvent extends PageControlEvent {}

class GoToBoxListEvent extends PageControlEvent {}

class BoxListEvent extends PageControlEvent {}

class GoToNewBoxEvent extends PageControlEvent {}

class NewBoxEvent extends PageControlEvent {}

class GoToInfoBoxEvent extends PageControlEvent {}

class InfoBoxEvent extends PageControlEvent {}

class GoToInspectionEvent extends PageControlEvent {}

class InspectionEvent extends PageControlEvent {}
