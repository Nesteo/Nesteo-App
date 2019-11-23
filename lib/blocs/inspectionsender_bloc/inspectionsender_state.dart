import 'package:equatable/equatable.dart';

abstract class InspectionSenderState extends Equatable {
  const InspectionSenderState();
}

class WaitingForSend extends InspectionSenderState {
  @override
  List<Object> get props => [];
}

class SendingInspectionState extends InspectionSenderState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InspectionSentState extends InspectionSenderState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SendErrorState extends InspectionSenderState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
