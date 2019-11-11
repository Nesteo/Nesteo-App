import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageControlState extends Equatable {
  final bool navigationBarEnabled;
  PageControlState(this.navigationBarEnabled, [List props = const <dynamic>[]]);
}

class LoginScreenState extends PageControlState {
  LoginScreenState() : super(false);

  @override
  List<Object> get props => [];
}

class MapScreenState extends PageControlState {
  MapScreenState() : super(true);

  @override
  List<Object> get props => [];
}

class BoxListScreenState extends PageControlState {
  BoxListScreenState() : super(true);

  @override
  List<Object> get props => [];
}

class NewBoxScreenState extends PageControlState {
  NewBoxScreenState() : super(false);

  @override
  List<Object> get props => [];
}

class BoxInfoScreenState extends PageControlState {
  BoxInfoScreenState() : super(false);

  @override
  List<Object> get props => [];
}

class InspectionScreenState extends PageControlState {
  InspectionScreenState() : super(false);

  @override
  List<Object> get props => [];
}

class NewInspectionScreenState extends PageControlState {
  NewInspectionScreenState() : super(false);

  @override
  List<Object> get props => [];
}

class InspectionListScreenState extends PageControlState {
  InspectionListScreenState() : super(false);

  @override
  List<Object> get props => [];
}

class NewBoxConfirmationScreenState extends PageControlState {
  NewBoxConfirmationScreenState() : super(false);

  @override
  List<Object> get props => [];
}
