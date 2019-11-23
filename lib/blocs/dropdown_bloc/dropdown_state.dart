import 'package:equatable/equatable.dart';

abstract class DropdownState extends Equatable {
  const DropdownState();
}

class InitialDropdownState extends DropdownState {
  @override
  List<Object> get props => [];
}

class UpdatingDropdownState extends DropdownState {
  @override
  List<Object> get props => [];
}

class ReadyDropdownState extends DropdownState {
  @override
  List<Object> get props => [];
}
