import 'package:equatable/equatable.dart';

abstract class BoxDataState extends Equatable {
  const BoxDataState();
}

class InitialBoxDataState extends BoxDataState {
  @override
  List<Object> get props => [];
}

class BoxReadyState extends BoxDataState {
  @override
  List<Object> get props => null;
}

class BoxChangingState extends BoxDataState {
  @override
  List<Object> get props => null;
}
