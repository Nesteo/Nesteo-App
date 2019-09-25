import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlEvent extends Equatable {
  PageControlEvent([List props = const <dynamic>[]]) : super(props);
}

class GoToMapEvent extends PageControlEvent {}

class MapEvent extends PageControlEvent {}

class GoToBoxListEvent extends PageControlEvent {}

class BoxListEvent extends PageControlEvent {}
