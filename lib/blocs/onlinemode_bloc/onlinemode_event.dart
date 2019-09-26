import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OnlineModeEvent extends Equatable {
  OnlineModeEvent([List props = const <dynamic>[]]) : super(props);
}

class OfflineEvent extends OnlineModeEvent {}

class OnlineEvent extends OnlineModeEvent {}
