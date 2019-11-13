import 'package:equatable/equatable.dart';

abstract class BoxSenderState extends Equatable {
  const BoxSenderState();
}

class InitialBoxSenderState extends BoxSenderState {
  @override
  List<Object> get props => [];
}
