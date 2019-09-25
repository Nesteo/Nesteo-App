import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlState extends Equatable {
  PageControlState([List props = const <dynamic>[]]) : super(props);
}

class LoginScreenState extends PageControlState {}

class ToMapScreenState extends PageControlState {}

class MapScreenState extends PageControlState {}
