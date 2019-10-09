import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OnlineModeState extends Equatable {
  OnlineModeState([List props = const <dynamic>[]]);
}

class OnlineState extends OnlineModeState {
  @override
  List<Object> get props => [];
}

class OfflineState extends OnlineModeState {
  @override
  List<Object> get props => [];
}
