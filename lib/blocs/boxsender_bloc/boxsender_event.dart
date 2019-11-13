import 'package:equatable/equatable.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';

abstract class BoxSenderEvent extends Equatable {
  const BoxSenderEvent();
}

class SendBoxEvent extends BoxSenderEvent {
  final AuthenticationBloc authBloc;

  SendBoxEvent({this.authBloc}) : super();

  @override
  List<Object> get props => null;
}
