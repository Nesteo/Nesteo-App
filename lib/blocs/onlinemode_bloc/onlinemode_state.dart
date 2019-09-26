import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OnlineModeState extends Equatable {
  OnlineModeState([List props = const <dynamic>[]]) : super(props);
}

class OnlineState extends OnlineModeState {}

class OfflineState extends OnlineModeState {}
