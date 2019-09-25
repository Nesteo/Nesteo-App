import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CounterEvent extends Equatable {
  CounterEvent([List props = const <dynamic>[]]) : super(props);
}

class CounterIncrease extends CounterEvent {}

class CounterDecrease extends CounterEvent {}
