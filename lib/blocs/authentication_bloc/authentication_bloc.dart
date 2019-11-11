import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nesteo_app/backend/repositories/auth_repository.dart';
import 'package:nesteo_app/model/user.dart';
import './authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthRepository authRepository;
  FlutterSecureStorage keystore = FlutterSecureStorage();
  String inputDomain = "";
  String inputUsername = "";
  String inputPassword = "";
  String auth;
  String domain;

  AuthenticationBloc() : super() {
    authRepository = AuthRepository(this);
  }

  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is UsernameInputChangedEvent) {
      inputUsername = event.username;
    }
    if (event is PasswordInputChangedEvent) {
      inputPassword = event.password;
    }
    if (event is DomainInputChangedEvent) {
      inputDomain = event.domain;
      authRepository = AuthRepository(this);
    }
    if (event is CheckExistingAuthenticationEvent) {
      if (auth == null) {
        auth = await keystore.read(key: "nesteo_header");
        domain = await keystore.read(key: "nesteo_domain");
        authRepository = AuthRepository(this);
      }

      if (auth != null && domain != null) {
        User user = await authRepository.getAuth();
        print(user.toString());
        if (user != null) {
          print("Authenticated!");
          yield AuthenticatedState();
        } else {
          print("Not Authenticated!");
          yield NotAuthenticatedState();
          auth = null;
          domain = null;
          authRepository = AuthRepository(this);
        }
      } else {
        print("Not Authenticated");
        domain = null;
        authRepository = AuthRepository(this);
        yield NotAuthenticatedState();
      }
    }
    if (event is CheckNewAuthenticationEvent) {
      if (inputUsername != "" && inputPassword != "" && inputDomain != "") {
        yield AuthenticatingState();
        String newHeader =
            base64.encode(utf8.encode("$inputUsername:$inputPassword"));
        auth = "Basic $newHeader";
        domain = inputDomain;
        User user = null;
        try {
          user = await authRepository.getAuth();
        } catch (SocketException) {}

        if (user != null) {
          print("Writing to Keystore");
          keystore.write(key: "nesteo_header", value: auth);
          keystore.write(key: "nesteo_domain", value: domain);
          yield AuthenticatedState();
        } else {
          print("Authentication failed. Not writing to Keystore");
          auth = null;
          domain = null;
          authRepository = AuthRepository(this);
          yield NotAuthenticatedState();
        }
      } else {
        yield InitialAuthenticationState();
      }
    }
  }
}
