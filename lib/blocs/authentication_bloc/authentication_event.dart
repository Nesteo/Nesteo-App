import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class CheckExistingAuthenticationEvent extends AuthenticationEvent {
  @override
  List<Object> get props => null;
}

class UsernameInputChangedEvent extends AuthenticationEvent {
  final String username;

  UsernameInputChangedEvent({this.username}) : super();

  @override
  List<Object> get props => null;
}

class PasswordInputChangedEvent extends AuthenticationEvent {
  final String password;

  PasswordInputChangedEvent({this.password}) : super();

  @override
  List<Object> get props => null;
}

class DomainInputChangedEvent extends AuthenticationEvent {
  final String domain;

  DomainInputChangedEvent({this.domain}) : super();

  @override
  List<Object> get props => null;
}

class CheckNewAuthenticationEvent extends AuthenticationEvent {
  CheckNewAuthenticationEvent() : super();

  @override
  List<Object> get props => null;
}

class CheckAuthenticationEvent extends AuthenticationEvent {
  @override
  List<Object> get props => null;
}
