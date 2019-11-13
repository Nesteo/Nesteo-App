import 'package:equatable/equatable.dart';

abstract class BoxSenderState extends Equatable {
  const BoxSenderState();
}

class WaitingForSend extends BoxSenderState {
  @override
  List<Object> get props => [];
}

class SendingBoxState extends BoxSenderState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class BoxSentState extends BoxSenderState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SendErrorState extends BoxSenderState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
