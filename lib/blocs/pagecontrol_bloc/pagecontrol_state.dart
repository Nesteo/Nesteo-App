import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PagecontrolState extends Equatable {
  PagecontrolState([List props = const <dynamic>[]]) : super(props);
}

class InitialPagecontrolState extends PagecontrolState {}
