import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AbstractCounterState extends Equatable {
  final int value;

  AbstractCounterState(this.value, [List props = const []])
      : super([value]..addAll(props));
}

class CounterState extends AbstractCounterState {
  CounterState(int value) : super(value);
}
