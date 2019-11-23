import 'package:equatable/equatable.dart';
import 'package:nesteo_app/blocs/authentication_bloc/authentication_bloc.dart';

abstract class DropdownEvent extends Equatable {
  const DropdownEvent();
}

class UpdateOwnersEvent extends DropdownEvent {
  final AuthenticationBloc authBloc;

  UpdateOwnersEvent({this.authBloc}) : super();

  @override
  List<Object> get props => null;
}

class UpdateRegionsEvent extends DropdownEvent {
  final AuthenticationBloc authBloc;

  UpdateRegionsEvent({this.authBloc}) : super();

  @override
  List<Object> get props => null;
}

class UpdateSpeciesEvent extends DropdownEvent {
  final AuthenticationBloc authBloc;

  UpdateSpeciesEvent({this.authBloc}) : super();

  @override
  List<Object> get props => null;
}

class UpdateAllEvent extends DropdownEvent {
  final AuthenticationBloc authBloc;

  UpdateAllEvent({this.authBloc}) : super();

  @override
  List<Object> get props => null;
}
