import 'package:equatable/equatable.dart';

abstract class SnackbarState extends Equatable {
  const SnackbarState();
}

class InitialSnackbarState extends SnackbarState {
  @override
  List<Object> get props => [];
}

class SnackbarReadyState extends SnackbarState {
  @override
  List<Object> get props => null;
}
