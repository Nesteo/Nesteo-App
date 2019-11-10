import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class NotAuthenticatedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticatingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
